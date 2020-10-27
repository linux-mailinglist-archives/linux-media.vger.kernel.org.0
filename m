Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEAD29ADD3
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 14:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752561AbgJ0Ntp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Oct 2020 09:49:45 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45273 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752556AbgJ0Ntp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Oct 2020 09:49:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mci@pengutronix.de>)
        id 1kXPM8-0006YF-8G; Tue, 27 Oct 2020 14:49:44 +0100
Received: from mci by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mci@pengutronix.de>)
        id 1kXPM7-0007uO-W0; Tue, 27 Oct 2020 14:49:43 +0100
From:   Marian Cichy <m.cichy@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Marian Cichy <m.cichy@pengutronix.de>
Subject: [PATCH 1/2] media-ctl: fix ycbcr property in help description
Date:   Tue, 27 Oct 2020 14:49:21 +0100
Message-Id: <20201027134922.30321-1-m.cichy@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mci@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

the help description in media-ctl claims that the
ycbcr property in v4l2-mbusfmt is called 'ycbcr-enc',
which will lead to an EINVAL when used as the property
is actually called 'ycbcr'.

Signed-off-by: Marian Cichy <m.cichy@pengutronix.de>
---
 utils/media-ctl/options.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index fb923775..fe79af10 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -78,7 +78,7 @@ static void usage(const char *argv0)
 	printf("\tv4l2-property   = v4l2-mbusfmt | v4l2-crop | v4l2-interval\n");
 	printf("\t                | v4l2-compose | v4l2-interval ;\n");
 	printf("\tv4l2-mbusfmt    = 'fmt:' fcc '/' size ; { 'field:' v4l2-field ; } { 'colorspace:' v4l2-colorspace ; }\n");
-	printf("\t                   { 'xfer:' v4l2-xfer-func ; } { 'ycbcr-enc:' v4l2-ycbcr-enc-func ; }\n");
+	printf("\t                   { 'xfer:' v4l2-xfer-func ; } { 'ycbcr:' v4l2-ycbcr-enc-func ; }\n");
 	printf("\t                   { 'quantization:' v4l2-quant ; }\n");
 	printf("\tv4l2-crop       = 'crop:' rectangle ;\n");
 	printf("\tv4l2-compose    = 'compose:' rectangle ;\n");
-- 
2.20.1

