Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D63ED31A
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 12:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfKCLYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 06:24:49 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:36275 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727503AbfKCLYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Nov 2019 06:24:48 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDzviydbGTzKrRDzzigkL5; Sun, 03 Nov 2019 12:24:47 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 6/8] ti-vpe: fix smatch error
Date:   Sun,  3 Nov 2019 12:23:36 +0100
Message-Id: <20191103112338.22569-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
References: <20191103112338.22569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNNAn3hofzIq14hM2fVcja2yCx3Ix9gAlypF/SDzL7S+scT4oo/G226iEDwO2OgHb1x6yIF1Ox8NT6od6rUkbAc7G/5Ql0B8pO3Z1Io5u88Cs7usu2zZ
 DNZwglDg295YarYtdK7IzyCRvu+5zDEnXNyL7iZCCUn5XFsQ8it820wHPuIfoucKArYnY161S9Gryt2Gg2mdHGiurcSnUygf0jaoefjhulLErTl/7Y9Qcodk
 s/7tM/Fxw3znSE2j6VjGwQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes this error:

drivers/media/platform/ti-vpe/vpdma.c:767 dump_dtd() error: '%pad' expects argument of type 'dma_addr_t*', argument 2 has type 'uint*'

dtd->start_addr is a u32, so no need for %pad.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma.c b/drivers/media/platform/ti-vpe/vpdma.c
index 817d287c8138..2e5148ae7a0f 100644
--- a/drivers/media/platform/ti-vpe/vpdma.c
+++ b/drivers/media/platform/ti-vpe/vpdma.c
@@ -764,7 +764,7 @@ static void dump_dtd(struct vpdma_dtd *dtd)
 		pr_debug("word1: line_length = %d, xfer_height = %d\n",
 			dtd_get_line_length(dtd), dtd_get_xfer_height(dtd));
 
-	pr_debug("word2: start_addr = %pad\n", &dtd->start_addr);
+	pr_debug("word2: start_addr = %x\n", dtd->start_addr);
 
 	pr_debug("word3: pkt_type = %d, mode = %d, dir = %d, chan = %d, pri = %d, next_chan = %d\n",
 		 dtd_get_pkt_type(dtd),
-- 
2.23.0

