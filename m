Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849DA29ADE3
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 14:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752785AbgJ0Nur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 09:50:47 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60639 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbgJ0Ntw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 09:49:52 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mci@pengutronix.de>)
        id 1kXPMF-0006ZY-5J; Tue, 27 Oct 2020 14:49:51 +0100
Received: from mci by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mci@pengutronix.de>)
        id 1kXPME-0007xu-Rr; Tue, 27 Oct 2020 14:49:50 +0100
From:   Marian Cichy <m.cichy@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Marian Cichy <m.cichy@pengutronix.de>
Subject: [PATCH 2/2] media-ctl: add v4l2-ycbcr-enc-func field in help description
Date:   Tue, 27 Oct 2020 14:49:22 +0100
Message-Id: <20201027134922.30321-2-m.cichy@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027134922.30321-1-m.cichy@pengutronix.de>
References: <20201027134922.30321-1-m.cichy@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mci@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

the help-description of media-ctl shows the possible values
for v4l2-colorspace, v4l2-xfer-func anf v4l2-quant, but misses
to show them for v4l2-ycbcr-enc-func, eveb though they are
perfectly defined in the source code like for the other fields.
Lets print them too in the help description.

Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
---
 utils/media-ctl/options.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index fe79af10..ca8106ba 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -103,23 +103,29 @@ static void usage(const char *argv0)
 		printf("\t                %s\n",
 		       v4l2_subdev_field_to_string(i));
 
-	printf("\tv4l2-colorspace One of the following:\n");
+	printf("\tv4l2-colorspace     One of the following:\n");
 
 	for (i = V4L2_COLORSPACE_DEFAULT; i <= V4L2_COLORSPACE_DCI_P3; i++)
 		printf("\t                %s\n",
 		       v4l2_subdev_colorspace_to_string(i));
 
-	printf("\tv4l2-xfer-func  One of the following:\n");
+	printf("\tv4l2-xfer-func      One of the following:\n");
 
 	for (i = V4L2_XFER_FUNC_DEFAULT; i <= V4L2_XFER_FUNC_SMPTE2084; i++)
 		printf("\t                %s\n",
 		       v4l2_subdev_xfer_func_to_string(i));
 
-	printf("\tv4l2-quant      One of the following:\n");
+	printf("\tv4l2-quant          One of the following:\n");
 
 	for (i = V4L2_QUANTIZATION_DEFAULT; i <= V4L2_QUANTIZATION_LIM_RANGE; i++)
 		printf("\t                %s\n",
 		       v4l2_subdev_quantization_to_string(i));
+
+	printf("\tv4l2-ycbcr-enc-func One of the following:\n");
+
+	for (i = V4L2_YCBCR_ENC_DEFAULT; i <= V4L2_YCBCR_ENC_SMPTE240M; i++)
+		printf("\t                %s\n",
+		       v4l2_subdev_ycbcr_encoding_to_string(i));
 }
 
 #define OPT_PRINT_DOT			256
-- 
2.20.1

