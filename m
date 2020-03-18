Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E545A18A716
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 22:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbgCRVb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 17:31:27 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:54721 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727163AbgCRVb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 17:31:27 -0400
X-Halon-ID: bdf2c9eb-695f-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bdf2c9eb-695f-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 22:30:52 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] media-ctl: Print media graph completes if available
Date:   Wed, 18 Mar 2020 22:31:15 +0100
Message-Id: <20200318213115.3201107-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318213115.3201107-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318213115.3201107-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of the flags filed in media_device_info and display the graphs
completes, if the information is available.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 utils/media-ctl/media-ctl.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
index 6661b487d73ca7cd..5187258e0625eb56 100644
--- a/utils/media-ctl/media-ctl.c
+++ b/utils/media-ctl/media-ctl.c
@@ -563,6 +563,14 @@ int main(int argc, char **argv)
 
 	if (media_opts.print) {
 		const struct media_device_info *info = media_get_info(media);
+		const char *complete = "";
+
+		if (info->flags) {
+			if (info->flags & MEDIA_INFO_FLAG_INCOMPLETE)
+				complete = "graph status:   incomplete\n";
+			else if (info->flags & MEDIA_INFO_FLAG_COMPLETE)
+				complete = "graph status:   complete\n";
+		}
 
 		printf("Media controller API version %u.%u.%u\n\n",
 		       (info->media_version >> 16) & 0xff,
@@ -575,13 +583,16 @@ int main(int argc, char **argv)
 		       "serial          %s\n"
 		       "bus info        %s\n"
 		       "hw revision     0x%x\n"
-		       "driver version  %u.%u.%u\n\n",
+		       "driver version  %u.%u.%u\n"
+		       "%s\n",
 		       info->driver, info->model,
 		       info->serial, info->bus_info,
 		       info->hw_revision,
 		       (info->driver_version >> 16) & 0xff,
 		       (info->driver_version >> 8) & 0xff,
-		       (info->driver_version >> 0) & 0xff);
+		       (info->driver_version >> 0) & 0xff,
+		       complete);
+
 	}
 
 	if (media_opts.entity) {
-- 
2.25.0

