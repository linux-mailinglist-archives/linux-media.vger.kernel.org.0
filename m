Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51BA3774A6
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 02:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhEIADl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 20:03:41 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:45813 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIADl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 20:03:41 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 9F63FC0332
        for <linux-media@vger.kernel.org>; Sat,  8 May 2021 23:53:11 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 21290FF80B;
        Sat,  8 May 2021 23:52:48 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH 4/4] staging: media: atomisp: Fix line continuation style issue in sh_css.c
Date:   Sat,  8 May 2021 19:56:22 -0400
Message-Id: <20210508235622.300394-5-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508235622.300394-1-vrzh@vrzh.net>
References: <20210508235622.300394-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix logical continuation style issue and adjacent line splits.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index b8dd817616e8..5dac4a506b00 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3224,24 +3224,22 @@ init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
 
 #ifdef ISP2401
 static unsigned int
-get_crop_lines_for_bayer_order(
-    const struct ia_css_stream_config *config)
+get_crop_lines_for_bayer_order(const struct ia_css_stream_config *config)
 {
 	assert(config);
-	if ((config->input_config.bayer_order == IA_CSS_BAYER_ORDER_BGGR)
-	    || (config->input_config.bayer_order == IA_CSS_BAYER_ORDER_GBRG))
+	if ((config->input_config.bayer_order == IA_CSS_BAYER_ORDER_BGGR) ||
+	    (config->input_config.bayer_order == IA_CSS_BAYER_ORDER_GBRG))
 		return 1;
 
 	return 0;
 }
 
 static unsigned int
-get_crop_columns_for_bayer_order(
-    const struct ia_css_stream_config *config)
+get_crop_columns_for_bayer_order(const struct ia_css_stream_config *config)
 {
 	assert(config);
-	if ((config->input_config.bayer_order == IA_CSS_BAYER_ORDER_RGGB)
-	    || (config->input_config.bayer_order == IA_CSS_BAYER_ORDER_GBRG))
+	if ((config->input_config.bayer_order == IA_CSS_BAYER_ORDER_RGGB) ||
+	    (config->input_config.bayer_order == IA_CSS_BAYER_ORDER_GBRG))
 		return 1;
 
 	return 0;
-- 
2.31.1

