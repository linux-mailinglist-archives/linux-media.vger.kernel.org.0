Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660D91005F5
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 13:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKRMz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 07:55:59 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54768 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfKRMz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 07:55:59 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8B35E28F546
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        dafna3@gmail.com, helen.koike@collabora.com, ezequiel@collabora.com
Subject: [PATCH v4l-utils] libmediactl: bug fix in memory allocation for links enumeration
Date:   Mon, 18 Nov 2019 13:55:51 +0100
Message-Id: <20191118125551.20096-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the function media_enum_links, the links and pads pointers
should be allocated according to number of pads and links of
the entity. Currently they are allocated to only one element.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 utils/media-ctl/libmediactl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
index 1fd6525b..d9a30b01 100644
--- a/utils/media-ctl/libmediactl.c
+++ b/utils/media-ctl/libmediactl.c
@@ -325,11 +325,15 @@ static int media_enum_links(struct media_device *media)
 	for (id = 1; id <= media->entities_count; id++) {
 		struct media_entity *entity = &media->entities[id - 1];
 		struct media_links_enum links = { 0 };
+		unsigned int pads_num = entity->info.pads;
+		unsigned int links_num = entity->info.links;
 		unsigned int i;
 
 		links.entity = entity->info.id;
-		links.pads = calloc(entity->info.pads, sizeof(struct media_pad_desc));
-		links.links = calloc(entity->info.links, sizeof(struct media_link_desc));
+		links.pads = calloc(entity->info.pads,
+				    pads_num * sizeof(struct media_pad_desc));
+		links.links = calloc(entity->info.links,
+				     links_num * sizeof(struct media_link_desc));
 
 		if (ioctl(media->fd, MEDIA_IOC_ENUM_LINKS, &links) < 0) {
 			ret = -errno;
@@ -341,13 +345,13 @@ static int media_enum_links(struct media_device *media)
 			return ret;
 		}
 
-		for (i = 0; i < entity->info.pads; ++i) {
+		for (i = 0; i < pads_num; ++i) {
 			entity->pads[i].entity = entity;
 			entity->pads[i].index = links.pads[i].index;
 			entity->pads[i].flags = links.pads[i].flags;
 		}
 
-		for (i = 0; i < entity->info.links; ++i) {
+		for (i = 0; i < links_num; ++i) {
 			struct media_link_desc *link = &links.links[i];
 			struct media_link *fwdlink;
 			struct media_link *backlink;
-- 
2.20.1

