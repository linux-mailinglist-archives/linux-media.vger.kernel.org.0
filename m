Return-Path: <linux-media+bounces-60095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC04Cw5U82mLzgEAu9opvQ
	(envelope-from <linux-media+bounces-60095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 15:07:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9A4A32A7
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 15:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A14A7303DF72
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 13:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E33410D29;
	Thu, 30 Apr 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bggSavM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8j44QSz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96E240F8DF
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554231; cv=none; b=YG0Dz/XDr4GbsS7pmetDqA0vTIoU7zUBw9BQOKKXGnDF+uLFgkNdnB1NmnRW4kDPcPDnqP9aZmIRpni+xlfxfAGX15riWC6xunlBjhox7Q7eR+8QW24pG7qioed5sM+I97qA2j/pFvGzEFaVojCtHqrQ/uupVIP802CLu98vCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554231; c=relaxed/simple;
	bh=Ctg6LkilLFlHdXvONyS+dpAs1kcD7FhbiOXHGB3y2eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrLWWVszZZtgnXYpgBEkG7x4uvEEYHh8o1sEvy1v2IYiFoUZgmXZ//D3ACix3wgUSY3ZuuPayoekGbCGQ2RPuJc3/aAiSO4he/Obx5MZvwEmzsgP01KTGkW43qFbLhKxwh6b8iTPSPN3Hlx6eniCuG7UxJ4Nzl3iEN4uciZ4dRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bggSavM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8j44QSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UA7tFZ3730096
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 13:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6GvWf7X5H7/ceNtzVDfEAhi6Bk/Koqz92Wq
	zdyUrhPg=; b=bggSavM+iuPqOrzRDu6+sGdqHOBq8OzIG360b7PR+zajnbmiSfp
	854P2hve3F1dZ6jzvts6Ss8ftnWXHxD42qvi5AsuwqQX3QOl6Kf3kcFHieYwLtFT
	LGh+aeCemApK/cvdJombsMRHcHAHFixBOKf7NRn7VV5O/6PVhEJgUIAYNWRJDkUC
	+NkO+2CAGrFH4WkLamXYQzDkeUfOjGQRbpMkHN/dU51NPZoki24czCBDVZnYYvng
	OldUzsNyyjADG1lnjbMSYNrsrk5F9ytpwUuHIDWk5w9JjoAhV1efkT/dDUTsjL/p
	BqxhlUXPXs9fRwTspRymCMb+/Mq+vfyel+Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1waa9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 13:03:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3594620fe97so2084633a91.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777554228; x=1778159028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GvWf7X5H7/ceNtzVDfEAhi6Bk/Koqz92WqzdyUrhPg=;
        b=H8j44QSz4frmZ4X6NL2AY3zazmMP6UG3xFMsAVSDKrvsgsZ/7qQZVvxlHvYC+mpWKy
         rxQBFuKWg35wZn7Qf+2FyVgo9gdAnW5n4WpG6HbwTAes6aSI0XMy7Pii4SCTYQw5spRg
         Y5xgXVR149TO4PI9zs8Y6nyHZnJZa+/2eIROjQ5PZ/O6cX8ZeI5WbaVU9bXOvJPikcwO
         Vsg79S/sQsnQN/n+xsPmc8qktDv/jFt0bkR49ZCMaAjGoNduFq8jRgNd6lLNX3UESl5d
         fliAWlreMCgfKc1zp4MQ9ISnzOuu/CrmoSVSDURbz6zL42wddwskMC2Zvb8l4DQ37Mft
         CQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554228; x=1778159028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GvWf7X5H7/ceNtzVDfEAhi6Bk/Koqz92WqzdyUrhPg=;
        b=YKOlLVHvD2bhBAByzQ6qE/opBfVVE3Lqn12s7xdTCCDd+6vEU3jqTIzpoBhFbqN5/q
         5l8JpaDL+NjE0Xx+f27ySIZxelcrubk5q956wBpvOV6Fo6i8yUr29hbcs3mR4jybV5hU
         ZXrUoIRyAGPgnp6J0DGhINSXuotqcDYP5MgIT5AJnVb1cG4TSrgLiEIAjHL1XhuYwfGi
         EZWT230pcueUuIYNzaISZv+frza9dl4L6mgVYEnqQgq9EzwCO5y5w0h4RSCXmqxOOLFM
         M5T9sR9ILMqHEOt/Xa9csSLEiPt/e4acQOBiW2jPx1Sme16ECnzic/K6VeJSaRPbvvfY
         y3GA==
X-Gm-Message-State: AOJu0YzorjY5Z4LudwI/E5ZQx7w0ip6QgSVvn+bzepeh65ocMuFtJv4/
	jPwF/EYhtgbleaG9pWVEBE41nPvWYP7YYyGnACDE9IMlXdSz0wyKBclBBTwM772oJ9tbTB3Ala2
	yC0+ywZhQsjPr65XWeh+aUosyBUettlSZaHPLdS/QJ1p4k/OLTiggn6Kn0psFv/XnGQ==
X-Gm-Gg: AeBDievKGViaGE0a+go3P5DS2ZT6V89/FC5VIgETZtnZZvgyZ+BumcGXsfZxElDylnl
	9ULUt1bXRrGoqZc5PBki0o4kG7QLmC3zzGF3YPrLApjq/JuXw1mst++gYNw7jkIKyB6+YgydFl9
	EHlQVOXkH8HDEtVSMqnuWmwOR3BJr1HJt6+NXP1EC6KH8PgTa9bC2S6fUClL+WOUGKxgnB+Xb50
	aE7rgo8NnjIIN4C68l0PGZfEGH7C1f+mHbVeqEKkMYm3+l6NYgXnNDp2sKwp9sHvfbDwRf8Vzte
	LRJoml6eOWQQq4KihYBHHV1PTqcNx0X+oOFnQ4KjqmkEqdYSDaCEtR+ffiM2hFdNzF3me0doei2
	j9RU/GxsC90RBclLbLmXwG74lh+2haWPvqakXiNhHl0XLn9sht0ePWMWDKaMo
X-Received: by 2002:a17:90b:1a90:b0:35f:b953:2445 with SMTP id 98e67ed59e1d1-364c306406emr2802435a91.16.1777554226818;
        Thu, 30 Apr 2026 06:03:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:35f:b953:2445 with SMTP id 98e67ed59e1d1-364c306406emr2802068a91.16.1777554223832;
        Thu, 30 Apr 2026 06:03:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:85ad:7a05:49a6:88be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216dedsm14395452f8f.13.2026.04.30.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:03:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Xiaolei Wang <xiaolei.wang@windriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Kate Hsuan <hpa@redhat.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>, brgl@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3] media: i2c: drop unneeded dependencies on OF_GPIO
Date: Thu, 30 Apr 2026 15:03:36 +0200
Message-ID: <20260430130336.103541-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SFt5WmH0NsXaUvVed7TnD_ow_tHbKVne
X-Proofpoint-ORIG-GUID: SFt5WmH0NsXaUvVed7TnD_ow_tHbKVne
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f35335 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=jH2LZSAcktARuhmwcr4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEzMiBTYWx0ZWRfX0dtkKQWfafJc
 xbIVWlcbywvLaguvNcqzZH4tJtkL4pyHWALpNulRkJSoMhDOu/9J3g4ODZtXG6GdrmSa4S5PEe7
 A8ONjulfmSUuw+kkLGOXUAtSHZIpoiCdAV6pZP8OMReVq3C9UqZtr7CKWWNvAd+KSzBj/Oyof/4
 o/BbO1dROcbpJ4+AF/lVswagFdnmA/Cneqh4ay2TmDcWgfmquWgdSmlxaEZC9dt+YmXtV+t199N
 U09BSpqRB6RoVI/B/2cEUk1/nFp8eRfhsKRh2ATOgHTgK6NWH2JBmRyB24o91FC/82yPBcNgMz1
 5HJx7Xa/qEJympFml3RVln3b80U5lrrEHYuTM60YSbFgTw5BHSwhhfvk5mP+PEH1KRvN4X9R3HT
 sgRHmoP05rOApjrqRFOSkJJ2cbBV8OkcjfmGI42uf8uMTTVGLNKj6jt2OElV5MjO0+9cCxImnnn
 yeFGh+Qg9P6PlV7MIrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300132
X-Rspamd-Queue-Id: 88C9A4A32A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60095-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs so there's really no reason to select it
explicitly. For Kconfig entries that have no other dependencies: convert
it to requiring OF to avoid new symbols popping up for everyone in make
config, for others just drop it altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Send the media patch separately so that it can be picked up
- Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com

Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

 drivers/media/i2c/Kconfig | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8f2ba4121586e..a3ab48607dcf0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -237,7 +237,7 @@ config VIDEO_IMX319
 
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -248,7 +248,7 @@ config VIDEO_IMX334
 
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -268,7 +268,7 @@ config VIDEO_IMX355
 
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
@@ -278,7 +278,7 @@ config VIDEO_IMX412
 
 config VIDEO_IMX415
 	tristate "Sony IMX415 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -703,7 +703,7 @@ config VIDEO_OV8865
 
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
-	depends on OF_GPIO
+	depends on OF
 	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1271,7 +1271,6 @@ config VIDEO_BT866
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
 	depends on VIDEO_DEV && I2C
-	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1309,7 +1308,6 @@ config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
 	depends on VIDEO_DEV
-	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
-- 
2.47.3


