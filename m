Return-Path: <linux-media+bounces-60536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CnlBzT7+mmHVAMAu9opvQ
	(envelope-from <linux-media+bounces-60536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:26:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2B4D7D31
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 068A8302E40B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFA43E1233;
	Wed,  6 May 2026 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zlqa4rHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGwUeiJP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A28393DEB
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055740; cv=none; b=Lk8+3gQEdiwTfJkhDNvawlkbHi1HyhzciLMFs7d0kpqlLk86dPdLzTVJ2LZLTcaiuQc6g0kZ58vbKkRzPQhdMsG8gDBjwCe26zGu4kwJfhPKfYXgeBNV10+vbS9/5FHd4YxOXsbOLU2KZAVhzUx71UKgWmxgc/gP/mpxHd9wopU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055740; c=relaxed/simple;
	bh=aOJXbL8PdmMvAgrzQ7lX1vxnia8DMoCEMVAxkVhnrb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qH2oGXloEzy8sa+GmDOFC/Ir8eJieuEh4t84YUcj27Yi7jgI3tqUD/C9BqqGDxY6YOStj/x0hTZOHq+ZPtXTam7VYgR+QrUnJ5a2zzqGjrWBZolPIXwiKhfoBdIfzAhmHjDC4vIghhslz9jtZr6Z5/TuyrzOOul7fQiT11q4Jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zlqa4rHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGwUeiJP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CfOk1527930
	for <linux-media@vger.kernel.org>; Wed, 6 May 2026 08:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhn
	wOPUBW6g=; b=Zlqa4rHsC7B5t9FTi+ErcgOetTZcRvvqhqsd20N+wnhnVfkr4+m
	Bkik8fRfNOK1hQRzsVWeZ9RzqvRi8LOuNTU2dNhkMpRVTZwG0BfW4K7ksGmzbwNC
	4hoBnjKzb+a8Qj25U/hTxIwFA5C88RFanfqpHdyi+iNqB4uxw6S3WqwDBEsO6MI6
	h9fnHHSyhguQrIYUY7GqJGsVIDc358fXnYkFGbT8quDehk07vEzuvIovpylwONpw
	aEpMi2X/FbQXAIgvUoB3Uh4Jeuedq5pJyq1oyhGjbBH7ymf2AEQhilGGmq/hMXXg
	+xWfZFrac947oEeY9+oCF8AHEV7bWtg7EOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288adx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 May 2026 08:22:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so82786431cf.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778055737; x=1778660537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhnwOPUBW6g=;
        b=HGwUeiJPw+0ubMz9IKPR+43VT6DGlEgSrt+PzgCUhylKweHZM+OUEaqFlZjAccrjHH
         yzjEXIwP3B5S9WStpC1r3PLY8Caf1KNi1CEj5NPq1ce+Z92sjxTaQMyihW//7Z6+oVuF
         5HtbJA+nDWNCtDImrf/Lc54X8UnZr7GZ+GvQi7oEo6+wxEN7dPj1Qe4paw+g0VpzTBcy
         RpUsKyfIkOSAI0/B1FN+vBPeGZsFDTF3QDyQB7BnOhGTXB9UhKt02FN8wPTTretryVWj
         WVzWbQvFrhKnmBGeqLwmluPx6Yb6cXGEBjfDwqlKWI8RdwkSR4QhodjOX/jnnRVnmYgN
         tkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778055737; x=1778660537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24mfRUTMgD447Rs1aFKzyz9TYhEvs5V8rhnwOPUBW6g=;
        b=mapJDEDqTvM7VdUKo3l/dZDo9XN3oRkJxFw6WQQgejXnxZ0799exDmIGhhr3ByCGx8
         5kaFyNwq9BwPzQ+W3sh6vEGHo5pms2oFEapru/eAuHIOCjCK0f4AN51HXTeXrBULRUXD
         1dlmeoz5s8X+EygQH72ahDpDF6G4QmqcdS5er+wIgTwNhZJQFQoiORxGLix48nXKIP6W
         8XTaInUtIQMuhfwaSk+CLGETb6f6EaLiH4JzwbVKKmhqi61xiA1pVkJ7tPDQ+WIPdQyK
         vD0s90lNxYaROb07RcJgvl/MLqu3MVc5Eh78bNLPhGvt3dYp+ZH7D5AGXbAVqpzx+CCc
         wJ9g==
X-Forwarded-Encrypted: i=1; AFNElJ9sW39H5gstCHarNQo2+qTol5X8ia9UQYw+0Sb5r/ZBG+Tp0CyQjs7ee5NFW/Dlk15N9Jg8lZRfXlC++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxasRYEYudAxbOKiab48UbnHgXM/HhBxZ5KLaAQup2RiW4VY71A
	CfheQ2DN3d5ej8/rcQmIQGG+rdivRaiNyhSojEBfcgdUge9fYWefjELlcP6HYyXJRqu44yltAu7
	9zfS9HhyZ9Of5n48OgwP1mdQbmU9N+3e7O96JJsABTN1P8SSAmZA+V2C6zMBVQn/OAQ==
X-Gm-Gg: AeBDiev/HBFOENRKbUvY9KWaIBhmMP06G1BdHJt6MMsfQzGIMb/jFdTa1XchxtFKbe6
	jUez3C8MjIZ0kp+hPVjAMQsZ8T9hc6JN3njT8BBJsdOioGKS+sH9xKt6Fk5wJ4aKJxYJB2qgwZC
	Ltlsoj9Imz29jma3NnEx97dw6ObiAH+q/cOmy4ioEJ/666ro67luorqRP5LntGbbJV/0ire05S5
	tQTIBPp3E1M9SgWQPYadHsOJckcUUF4VKdkqifxJB7dkPHELXFubommE7r533nmwtsznHiSVtxb
	ifNq++f2xy/0B6ze1dol2x7ZRMWxFFxkYRiCmpErzpPEvWu/hD8jGI7lPHPkeFR/lKMg3NduZbP
	J93K2vLNhcM4yeMR4FAKk8HJDfGZjn3E9s/gQZcJbp4aZSI6OjEg0kejPdESp
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr33989641cf.44.1778055736939;
        Wed, 06 May 2026 01:22:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8e:b0:50f:ade2:2da with SMTP id d75a77b69052e-51461fcdddamr33989441cf.44.1778055736511;
        Wed, 06 May 2026 01:22:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1cd7:fa68:b1e1:a93e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm10220520f8f.18.2026.05.06.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:22:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: brgl@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
Date: Wed,  6 May 2026 10:22:11 +0200
Message-ID: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SEilGTsfgOEJdzxiN9X9wQEtIOB8_smx
X-Proofpoint-ORIG-GUID: SEilGTsfgOEJdzxiN9X9wQEtIOB8_smx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4MSBTYWx0ZWRfXyBMpe77caytD
 VgBcCEKv08CnlGCehzQXoi+QrtagdkEoYthbgFOacNblraaO/HfoXrscRGJUPE3lZSRWIMdxAHE
 nYVdWCVJbsrlRPTcLTmvbHxNYmHopDSZ/j30T3tEAx9vy62BzuL9SWHO99sbt1K0yvrCjIRnLDu
 ripoqib2yhzZOVzXz/Kde34kzAcRY97IiacjTWgGexU0nrfpVZ7/yIGqUEGWZzx775jaR08IJMo
 g2KASHCFZxhXa9MzV0KyMta1a+pupw9zxGLToZKevsC6KVJHkiov7Evh/KLQBfnah430Qwz8fPp
 S8aamltLSBUEGCL+767tzQWl7PGhHm0fNkBkzO+olrHX+Fok94MynAfLTugdL9nDbXnLEzbuujq
 e/S5F8e1PnW2fKPmwoVKEY/UrETE6KssuAYxTN6/3RBOHSN+NGYWXbvdw7Njnn2f+0wWL6oYb5d
 EuaYf7Z3r2FT5OvuIGQ==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fafa39 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=anDPzXTbJAMmVASavyMA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060081
X-Rspamd-Queue-Id: B2A2B4D7D31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60536-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

OF_GPIO is selected automatically on all OF systems. Any symbols it
controls also provide stubs and are private to GPIOLIB anyway so there's
really no reason to select it explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Send the staging patch separately so that it can be picked up for v7.2
- Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com

Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

 drivers/staging/media/max96712/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index 117fadf81bd0..93a2d583e90d 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -2,7 +2,6 @@
 config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
-	depends on OF_GPIO
 	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.47.3


