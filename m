Return-Path: <linux-media+bounces-51329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPV+I7rwcWlKZwAAu9opvQ
	(envelope-from <linux-media+bounces-51329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:41:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA464AE1
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFD4460CDC3
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4673B8BA8;
	Thu, 22 Jan 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/LkZGnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsebkbyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE83ACF17
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074289; cv=none; b=pynOt35Myd1pAU6ZcZTF73Q2LnfVQL5ASF2ci87QOrZ2EnejERKaZge95vsyLLOM8Vd27paWt/WOHdxk6KA5IIhsTvIh9j6aVNfJwq6ptFRsht65qGm77Fg86dgeBXR7ouQJZOZdAQPQ7X1LVMqvLPLbCkdGMtkBKWm6djAKFvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074289; c=relaxed/simple;
	bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwEHjmwc/xzHB+3hZepFixJeIbeMxoHkysWzXKyY6ECT/gyPsUJqRxZg5BqZ5h8qvYZJunr3eKb8hRF+6En6MNCCbHoFAE/0V9u7agshS8+W3IFXOZ1L303rNeCCQCS+MTaRlt/UX92zcXk0S20Fiwqc0LHPLe30AA5JKgu6W9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/LkZGnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsebkbyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M963LP3463701
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=; b=e/LkZGnuC8QyxXyV
	Wx/lc/MT9NHNBOz7nvpK48ELWntbyYItMzTZEm5Lc7csQMu7retcoem1ZGV5PdIa
	CUHbsLvI73OwSIo1eO6E3fKRbWckNnuwBvzCmbVmTkyQbaEykDqVo/73gAxc0NQN
	eRK7zqQcVGXn9YrEvga3+V8OCgkx+tBg6QaZmk0SOmojGrpE1pVX4gAnRjqiYwLL
	U9qGRBpv90EKkbzWmRi7cKcnGirSgdwgROoK2FeXed/S5G8EZQ5YiJxoW4tC7FLa
	ntToSqfpGiI+Ss8CXdiqsK+bM7lolvANwFFvGeGV/V7kGdkUx3LkYUPGKLXGv8z5
	hdrMoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653a81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 09:31:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502a341e0e3so16440831cf.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074286; x=1769679086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=GsebkbyZKpSD801zT0Hxr3Cv77GPScrFSKCcs7XZISjxT5+hLMqDzo6PzbIGV/3ZZ/
         g69hxbG+nJar+SlELL0dsWRuqkLIgJGas9yTmc39A8UmSwWCOXyIpm3/kqVhQoaFVri9
         4EP/lQmHWmTPmiF+GwylB8tZclTB0GL+30Oa1FDxEsga7rTRsBtriML1x5Va+pkwAMtZ
         vgxf+FkAaTO1hQQEittQusYD8Omh+c0+2avA/4d0ZA13C8z1+qtBI0ey5zC6E0N9CPu3
         0/G9Jz+ErF8nZe42CDUDtHISqHKOSmoX01dV4U+TpqYxixLkfrRhdCkDWtlRsYSwFdPa
         3oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074286; x=1769679086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=e23vw+QRCVo5eLP8fdsnO+nmMfEbJeqsw5X6nPofXyg23stDaoCK2oYiDHXhTVhMe+
         133KmweywJld9hcUvoAnIBDfodWGYDTfzZZySejpVvTCFvXdNVHPDQJC2cgINHr3eQlZ
         DmiHiPclFE/ikAcQbC7vK2rABVF7gA7ip6JObExBOZPKKx6TuF3CPxt8ha4/j7gDbFi2
         67q2IGuGhs0TDNO/gpgClfUhSSZIPpIZLD0bRq/8YlPgy6RhBUUV27Lv07gGs33iOsfa
         XAYCCWOYFmezl5aAvbvffmEycer0+r1ibNP1QGAf9/8tAavCz664mUVxzyXacLkFcBG0
         i6WQ==
X-Gm-Message-State: AOJu0YyC65OMQ0gObGdnm0yjTYVNW9Ss+/TG82n0dR7V40WVsoHctscA
	O3WMX+6jLSPc80YaeJfx6hSPE8yTY+j29ezzKQ+cOcF8oS44PYSd+faN8StBBIpe4ALvmuPam2s
	6xEqMnsCVEVCb7tqp/5ckiqUYsVFCcUmzXl/1lOOtw6+H81i7ZhWVJ2GgTZdaHgWKhQ==
X-Gm-Gg: AZuq6aKaP+HA7/uN2SqcbI0aWwBfGRA3cMj2b0AmghUpck7V0TLutepc8PB+ZfNwpp6
	7x8ZGnjcIymHBJT6oVlm+TqvYLda5Ve2ERfcEDOeR9yq2K1ynpjc/5vkr62HMuAmxWyudKxCB+r
	iBQQbbTKWzQlDerPFnIBFb9TUXxnK31Elc8zIrgfneQQVQeJhRhIVMikJpquTfwH28atK2JCXT/
	D7H3SHEqwDTSD1eFqVXKUNl5vXfyktN1l8Xst7+dUQRYtG1ydpx8miA0+Ss5aCEcUG6FZoFrrWs
	NySiHBaMJXi6jINDX3H4fv/K3RmKjWn15nXDkqLD7PrgYv17RYPcYSxmPUoyKyT1VhCbil5qRCu
	L3MgTTs3Pq2LCNDKMvIqc5sOAaIBQtpD4yX8ChfCFn596V4vlzC6dg+YnbZh2T+L2wH2RWPLOf2
	td
X-Received: by 2002:ac8:7f56:0:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-502a16c1bcbmr273288401cf.37.1769074286183;
        Thu, 22 Jan 2026 01:31:26 -0800 (PST)
X-Received: by 2002:ac8:7f56:0:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-502a16c1bcbmr273288171cf.37.1769074285693;
        Thu, 22 Jan 2026 01:31:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d87b1sm139601576d6.53.2026.01.22.01.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:31:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 17:31:18 +0800
Subject: [PATCH v6 1/2] media: i2c: imx412: Assert reset GPIO during probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-imx412-v6-1-2c0b54594c2a@oss.qualcomm.com>
References: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
In-Reply-To: <20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769074280; l=940;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
 b=gh5Kgat4BjYAzeh6PDu3Lupe4l4Zrk+FKoBWXvW4iTGp8FdnenDhF0YW3VVkYjdsv+xULa3vS
 7NJ0EVokVjTBK6MH1nDRmOFW6cH1BnRrIp/yPqjjEThbOKJGTyRV+gQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971ee6e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0H48pH_jBQDuRi9pSjwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rtqneVQIiRvw0d25r5KqQFlIiq1pIdZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NSBTYWx0ZWRfX5rtgsCsBDe/3
 l4dRZq13cXWm1VsU8L6yeA4u3WuNyMm9AppJzsBpcN8YwhSgFTuLO4Qs5UzXR3Vaax1DK7C75Pi
 HKyoke2COsJt9KsjKK3cxs0hc+VC+ryPx5Ratc/NcsxeFO1CYD2jtKLzGxWTTUD5F7vzbLHRpxT
 dXbAblvVykik+5erm4Mun5KZsmBpSmIlNDpn0+tn74EJcaI5+g5kmUuqaNv2UFjHRXsCWKisv5r
 kr1tiLMDxDnSQRJ9lOd0ahF4s+wCWgkBTyWbaN7YOXvCB/GCSpOrbD5+T82dwY1dZ0VgppfffhY
 DI8GYEwgHrzEVRKeb7fX/olJijafKQGDQ/flaskdLh8aju8OBQKDn/HYY/+7r43Np0qenhWu/o5
 doHzTN2Gwaa7Y5ostyDLgwJjU1r3kFmUtPizYyyxjN8oWZn8IDD0cTgF1cp3HginAAdPFI7XQNZ
 MlkW2l0c110OoMcasKw==
X-Proofpoint-GUID: rtqneVQIiRvw0d25r5KqQFlIiq1pIdZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51329-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FAA464AE1
X-Rspamd-Action: no action

Assert the reset GPIO before first power up. This avoids a mismatch where
the first power up (when the reset GPIO defaults deasserted) differs from
subsequent cycles.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index b3826f80354703b17b416dc233854da3f5736e38..aa63dfc349181bf9c180ffd566b0317d05b410c1 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -925,7 +925,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 
 	/* Request optional reset pin */
 	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(imx412->reset_gpio)) {
 		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
 			imx412->reset_gpio);

-- 
2.34.1


