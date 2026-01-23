Return-Path: <linux-media+bounces-51406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKpAJZ49c2kztgAAu9opvQ
	(envelope-from <linux-media+bounces-51406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:21:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41521732BB
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B0E93032DEA
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC6934107A;
	Fri, 23 Jan 2026 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IODHIwfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cB9L6SnN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5BB31690E
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160008; cv=none; b=rlnRTAlHvwydrflg/V62rLNeCZA7ieCESLnilX/XEO/Sgk3vG+wx3ie/2KArwq9UT8SrVwzM/qqbnY7Ep5t4LR+kBZToCqqlZq+vc11lYJCm1SahTYyZA9X+/m7hM4gp7rw3RMcU7QmstgZfwyd9OEhTR/yMapJ35ci4tFLFku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160008; c=relaxed/simple;
	bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cj1JPbA7iHgyXamvaEUrCj8khbWvosukoHfimKsb9F6fRsVzo9ll0KaVPsySlFyE9nkHDPjxzjTcdZGYdfgzAdyi4l17NdT7ACS3v2RJCEsEoJVL84RWH3jSZ8nATPndqlKvMN+CQkLH4Pl0LRCyF10JMVia6jiJ1I+hgozgGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IODHIwfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cB9L6SnN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6rfZW1324771
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=; b=IODHIwfp8lTOwLWD
	6r0FcWYoeXnpd/cpOAfe1l+31Hm5RKA0CIu0SgzWaczncJTFznbBn28o4nCi6USL
	+nCUUEAyyLSihhcdP07wUwuLKM/o2MBjC9ly51zbRylqLdUmPREIq50WXnfR+QKy
	CskaJRi3wKJuigvxEMFJVn166Bqa450w7RLk6lQlBKGf2D1AlAQK7YflCpJ622yM
	wcFk2xxfV4rdlMknK32u9BlBBmwMc8W4jP00T4gl0lNnZTYze6i/63o2MH7HAYYa
	AMt8A49UTwx1rX9qX8yTJv+kKrEBTSId8ze4GiCo6grbn3mGrBLzisO/Xvnl6Aix
	/lMHfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv44c8gs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5014c9ee70bso49683371cf.1
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 01:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769160004; x=1769764804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=cB9L6SnN+QyE++/OlGYSGDABCoxiyND/FU1uZ1EQFPAt24bciidMUriaNVvhgvr/RQ
         iayiu/zaO49Q/lLpXRRbktiroNTO1AibU0aVsJLn+9kymvjEOhM020EEOEayEsvBapnc
         1tc0jnUavgVTPrE0MAY6n9KbN97BLlIt9/sNGVm7TovwbaUyTTPVUONehS2S/+kshz9j
         XVBhfBgIyyQWZEEQM49MnaxcsNZUGhvbOHvNrZhULf9qPbmZ/4xNgoz1zHJCRIJwnVO5
         drGbpls1JLo4E46WNTa9RPdpKU88CbivridtzT5kXVWHYtBTqceIJV+jKaUqiVxNFb3s
         /8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160004; x=1769764804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=pQBg7x5Et9cqJaegXz6nsivaqkkI0Ls3a2rizv7XnLs1K0Cuh5IcVVsrqMQ4ENvea/
         dUcB7eQoY4wNVic5uBSrNIomwC3aUJvFjoKRokyR2N+wMDEnbHgxYd4tyL3ElYwNOYEV
         375stJ179Cresqbg0D8oLWoWXuuWlBECrvQVPi7JisklKDKznu7JchT5R7OZaBASTCNo
         wKk0I/swwDKy2RgvdrlB3sBYLgCo0qp/8sxXY4cjHe4TdVJjzfDUSEeC6mndTtMxHF4z
         GyY8P/RRXXSLt6fWhQ5R4wDOkkNlq9NtukywfQLIrRmKkBfEEbOHaDg6WwO1TQPv8vXz
         ZiZQ==
X-Gm-Message-State: AOJu0YyvAkknXAOlqlMCAsBvY8tD/42qBG9+bc9Gj1C0CM3qIQn27MkH
	aItUMFG9W8sqbNhYqLulDNXSI6GJu8DyvKIxOxBcLEIKCCTLmMqxMgNt3IDnP44SyRGBfWCsOEV
	FjLG/IHDejCyE0B5ZRs/+kF9NF/v7WQ1OiZZLCd8M4X0DeSOf58EHFcuQnhkMoETUjg==
X-Gm-Gg: AZuq6aJI/n6LABOQv+n3PqpmJy3hv1Kx7FwEKpP/N3/+H+SHdds4ldxzN227Oz+ceUp
	IHu4CnMNrxL19TXsz1I7kq4qvhQv0r64izDi8PYMdx7W7NA8C9RpJz0DnRxiK4ji7x+LNVzwzqe
	ylxdiPlo+Qr2rPkwtI8sqVPyoNFIYYIzxQKz8SwUrd64ohFKXHDFW2QAM9m4EMio25pVFZkB9nN
	3WTv4em4AgZIVY8R8NtbW6/c9gxowKxcTZmOkJjTXFvXzjMRbjnUun03UqAqCRyREQJN+TDA6LY
	Req30p2ouQzo4m0RIG0R1TXJRqvtIfcJr8GjUaxBLu0bYt8Aicb7ULgLc9hXIXZGJws02Blv25F
	RXci+0djSqMHigtUHXwCJZHjqukliAJWRq0IzvquKUc+OGoeRUIvFkATOKCfCofIKnQhVk/Qdnk
	H7
X-Received: by 2002:ac8:7d86:0:b0:502:f0fd:1838 with SMTP id d75a77b69052e-502f78246f7mr28248031cf.83.1769160004525;
        Fri, 23 Jan 2026 01:20:04 -0800 (PST)
X-Received: by 2002:ac8:7d86:0:b0:502:f0fd:1838 with SMTP id d75a77b69052e-502f78246f7mr28247901cf.83.1769160004130;
        Fri, 23 Jan 2026 01:20:04 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8949182443esm13111066d6.11.2026.01.23.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:20:03 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 17:19:55 +0800
Subject: [PATCH v7 1/2] media: i2c: imx412: Assert reset GPIO during probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-imx412-v7-1-e58303f2b76b@oss.qualcomm.com>
References: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
In-Reply-To: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769159998; l=940;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
 b=RG6m72iRi3lZPfiv7TFImb2kxC34Ws4bFimfVvyHuPmIWzTm86f6L1r3ltaaD4aPrndoRU+9g
 pEJvqCfsAksDFm/wNvp9bJnVOCxRmSzFcwiHwyN4q6yONxrRGi47zI7
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=TLdIilla c=1 sm=1 tr=0 ts=69733d45 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0H48pH_jBQDuRi9pSjwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ieNR1he0Xa5igKt0lwoEKdV3-2wEZYsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3MyBTYWx0ZWRfX/l8vOZXMHjUr
 5GDPFqhr68XvMY1vnzWhQKBfXODVXKVezbCrCGwPsxTdFu9/NHA7dwhUh2U8jWg+5Uj2byqDe8R
 yqPiXpmh1vvvvAghLNd/NisLbpZfYgYbT4yWHsgw48EXWm/Em7ojZa5OvUH4Q1qsEdOitkw6oyf
 uzs0kFWCRUKRpDxtYLTeL8aRJIBxwrPtGvWZIZF7+HXyJcpWqVCM+Rre8/+gclfCuoanXqzDnQG
 uclctlrTzLVUGF+vPrcZDM/Swd82lDOuaBEa4NmRnn3dAK1/rUh60Q9vrbHduVTC+peJQOjcm90
 spuycI+X0OW1qATj9K/ntPrGPuVGpjg53NdTqTBJnbH9sYvMNaY3Kywk9d5U0XUVDm60ALo12eu
 7RLQRR/sooaYvS+1argHS3sHC8ZMko+p2J2mCYu9EGAJMT0XWq/xUeetPWBD1eyKkL1e3svvhQ4
 vekti5xXiXSHmvZZzaQ==
X-Proofpoint-ORIG-GUID: ieNR1he0Xa5igKt0lwoEKdV3-2wEZYsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51406-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41521732BB
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


