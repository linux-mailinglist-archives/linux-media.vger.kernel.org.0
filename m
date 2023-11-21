Return-Path: <linux-media+bounces-685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5467F3923
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 23:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D361C21003
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 22:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3110756750;
	Tue, 21 Nov 2023 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="RDVtHjuV"
X-Original-To: linux-media@vger.kernel.org
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE8E113
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 14:29:44 -0800 (PST)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id 5X9brkbp6hqFd5ZFYrm67r; Tue, 21 Nov 2023 22:29:44 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id 5ZFXrgOqA8vT05ZFXrY6Te; Tue, 21 Nov 2023 22:29:44 +0000
X-Authority-Analysis: v=2.4 cv=ffi+dmcF c=1 sm=1 tr=0 ts=655d2f58
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=BNY50KLci1gA:10 a=6kiSLZGAxYIA:10 a=wXneSEFuAAAA:8 a=VC_xR60dxTVBsFwuytIA:9
 a=YVKGGmaMxpnpCiYzuRtG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PUrOPhMI0C22u5bm2K9bKF41FZZi4GKEWRO52jvI60g=; b=RDVtHjuVBhEsjBWN0RJhXmcjyh
	PX+TVvvhhYM8nPWHYoZCRRdrwsokz2uJrYrwW5yR2sVKaopC9E9gl4+BBOahXZEcOYx3ehkmzruC9
	Cz0sKymnXsZRw87eejO2vapZilouSOYmkV8vsP/d5h25HsmSY1ln4sAdwS5ZpXCZjiDE=;
Received: from [50.126.89.90] (port=45404 helo=localhost.localdomain)
	by gator3086.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1r5ZFX-000mGr-31;
	Tue, 21 Nov 2023 16:29:43 -0600
From: Dean Anderson <dean@sensoray.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: linux-dev@sensoray.com,
	Dean Anderson <dean@sensoray.com>
Subject: [PATCH] media: usb: s2255: endian fix
Date: Tue, 21 Nov 2023 14:29:59 -0800
Message-Id: <20231121222959.473403-1-dean@sensoray.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.126.89.90
X-Source-L: No
X-Exim-ID: 1r5ZFX-000mGr-31
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (localhost.localdomain) [50.126.89.90]:45404
X-Source-Auth: dean@sensoray.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJtG2T3QjdHzEvFLpuesaQFPJ7iYqGGCqfa7NEimc/qHDGeMLdwPsduatQedvU9BhGGGkKP6LtWMN0SE8devepPIoex8nELPZDmXmr0DHHsx4iChogwl
 oM2fUIur0s3PwxxGd34I8b8p0sYkVC77Exaz624W4GNr7NKYF0iD9qVd2u6PDDN++KaN4le/T6PEXl2uUv7diMs6Txz/egQLOGQ=

Magic number fix, endian fix, and comment style change.
This patch depends on "PATCH] media: usb: s2255: custom V4L2_CIDs"

Signed-off-by: Dean Anderson <dean@sensoray.com>

---
 drivers/media/usb/s2255/s2255drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 1c7cb1d37353..ce6fb6c4481c 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -60,6 +60,7 @@
 #define S2255_MIN_BUFS          2
 #define S2255_SETMODE_TIMEOUT   500
 #define S2255_VIDSTATUS_TIMEOUT 350
+#define S2255_MARKER_FIRMWARE	cpu_to_le32(0xDDCCBBAAL)
 #define S2255_MARKER_FRAME	cpu_to_le32(0x2255DA4AL)
 #define S2255_MARKER_RESPONSE	cpu_to_le32(0x2255ACACL)
 #define S2255_RESPONSE_SETMODE  cpu_to_le32(0x01)
@@ -1276,8 +1277,8 @@ static int s2255_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		kfree(outbuf);
 		return rc;
 	}
-	// verify marker code
-	if (*(unsigned int *)outbuf != 0xddccbbaa) {
+	/* verify marker code */
+	if (*(__le32 *)outbuf != S2255_MARKER_FIRMWARE) {
 		kfree(outbuf);
 		return -EFAULT;
 	}
-- 
2.30.2


