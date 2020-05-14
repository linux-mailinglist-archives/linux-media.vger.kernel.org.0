Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E020D1D2C09
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 12:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgENKAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 06:00:50 -0400
Received: from ni.piap.pl ([195.187.100.5]:41226 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbgENKAu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 06:00:50 -0400
X-Greylist: delayed 354 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 May 2020 06:00:49 EDT
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 075DB443374;
        Thu, 14 May 2020 12:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 075DB443374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1589450448; bh=IpIn7rvXiUUmueTGaFVy1ewR1sxzr4Sc92LqcaVGpkc=;
        h=From:To:Cc:Subject:Date:From;
        b=g5AXUNcVWl1uGMrsXdQocI5powh5isGyp5DLV4Tk3YOpkgbHFDjj+4VTJUVGYhqsc
         ZLtA77FxXjzrd5OGhY2mhBlDPtz/NLC6rylgZGpvurx/asOI7OsjQhCw85C3QWMJws
         QytjwCvl4FzsgFRZJC9dU+S6lHoKpFnht0W2HU4A=
From:   khalasa@piap.pl (Krzysztof =?utf-8?Q?Ha=C5=82asa?=)
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] MEDIA-STAGING: Remove unneeded geometry restrictions from i.MX CSI driver
Date:   Thu, 14 May 2020 12:00:47 +0200
Message-ID: <m31rnmx2cw.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server, version 8.0.1.721, not scanned, whitelist
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I don't know what minimal image dimensions are, but 32x32 appears to
be ok according to the docs.
This is needed for small sensors like 80x80 thermal imagers.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media=
/imx/imx-ic-prp.c
index 2a4f77e83ed3..622a52c46229 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -26,8 +26,8 @@
 /*
  * Min/Max supported width and heights.
  */
-#define MIN_W       176
-#define MIN_H       144
+#define MIN_W        32
+#define MIN_H        32
 #define MAX_W      4096
 #define MAX_H      4096
 #define W_ALIGN    4 /* multiple of 16 pixels */
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/=
media/imx/imx-ic-prpencvf.c
index 09c4e3f33807..cb46455a1a36 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -35,8 +35,8 @@
  * has not requested a planar format, we should allow 8 pixel
  * alignment at the source pad.
  */
-#define MIN_W_SINK  176
-#define MIN_H_SINK  144
+#define MIN_W_SINK   32
+#define MIN_H_SINK   32
 #define MAX_W_SINK 4096
 #define MAX_H_SINK 4096
 #define W_ALIGN_SINK  3 /* multiple of 8 pixels */
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/me=
dia/imx/imx-media-csi.c
index e76a6a85baa3..d9e5388ffeb5 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -33,8 +33,8 @@
  * has not requested planar formats, we should allow 8 pixel
  * alignment.
  */
-#define MIN_W       176
-#define MIN_H       144
+#define MIN_W       32
+#define MIN_H       32
 #define MAX_W      4096
 #define MAX_H      4096
 #define W_ALIGN    1 /* multiple of 2 pixels */
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/m=
edia/imx/imx-media-vdic.c
index 0d83c2c41606..ee71b70d3544 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -49,8 +49,8 @@ struct vdic_pipeline_ops {
 /*
  * Min/Max supported width and heights.
  */
-#define MIN_W       176
-#define MIN_H       144
+#define MIN_W        32
+#define MIN_H        32
 #define MAX_W_VDIC  968
 #define MAX_H_VDIC 2048
 #define W_ALIGN    4 /* multiple of 16 pixels */

--=20
Krzysztof Halasa

=C5=81UKASIEWICZ Research Network
Industrial Research Institute for Automation and Measurements PIAP
Al. Jerozolimskie 202, 02-486 Warsaw, Poland
