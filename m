Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0741035FF10
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 02:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhDOAtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 20:49:51 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60303 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhDOAtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 20:49:50 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DC26920002;
        Thu, 15 Apr 2021 00:49:26 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: [1/2] Remove redundant assertions in sh_css.c
Date:   Wed, 14 Apr 2021 20:51:05 -0400
Message-Id: <20210415005106.530914-9-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415005106.530914-1-vrzh@vrzh.net>
References: <20210415005106.530914-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove assert() in places where the condition is already handled.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4e3ef68014ec..aebecf650967 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -413,7 +413,6 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 static void
 sh_css_pipe_free_shading_table(struct ia_css_pipe *pipe)
 {
-	assert(pipe);
 	if (!pipe) {
 		IA_CSS_ERROR("NULL input parameter");
 		return;
@@ -1080,7 +1079,6 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 		}
 	}
 
-	assert(pipe);
 	if (!pipe)
 		return -EINVAL;
 
@@ -1382,10 +1380,11 @@ start_copy_on_sp(struct ia_css_pipe *pipe,
 		 struct ia_css_frame *out_frame)
 {
 	(void)out_frame;
-	assert(pipe);
-	assert(pipe->stream);
 
-	if ((!pipe) || (!pipe->stream))
+	if (!pipe)
+		return -EINVAL;
+
+	if (!pipe->stream)
 		return -EINVAL;
 
 #if !defined(ISP2401)
-- 
2.31.1

