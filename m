Return-Path: <linux-media+bounces-51203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKq2IM+acGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:22:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C05449A
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 10:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 781EF408E19
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0C2477E38;
	Wed, 21 Jan 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPb8xBa4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOJuT5bS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB1407594
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986750; cv=none; b=M3o3AUqGVCczRDWj3unUrMmkEctz0KNZ1MjQgZmWCFrSZRmMuD1c0mW+orawoNk42SYmFOS5KT3iDr4+JLyAvJuCM9eccWa0z1Uqo8RnPNi5llgTYYhAHXcQ3YLk/kfoIRApijohGxeAsphMr8GNVSktF9mjVnnyaqGPtm0OuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986750; c=relaxed/simple;
	bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ac1sad+DH9rBC2uHf8nKKkZDLMv5Gg9yeG9l0LoGzt6pUqngwaH5bMB/+HArl5a+xxQYKge2OZEFn38xTwM/Ixv3i0bCv15Cx+3MGPKzA3PJ4+p3Wld/UlsjsMQbTLzcrIgXi9l0zdzq2VXlH9aXjQJN55aj0T2UNLQnounwPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPb8xBa4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOJuT5bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L3BmFd824834
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=; b=KPb8xBa46LZmKcLD
	Que/rE+e/xWLx4AjIU234QZ+NJyYC5QukY2telXYA04W6J3qjm3Z1pqAg+k3t8B5
	SSau3WSNBgVO3UgJoW6FnxX4gmCMooTct6MeVtj7TYgr9LWJ2Uy9vTuy8aD0LQWP
	rChrjWW0H1qnM+ezRHRHj6ZSApTam6JyX6po+OBVT5ZszGjE6xcIvdt4AsObi6/I
	OpaJCdqHPtXtq7nFiIBG50y42CC9tVhXUePGlxHlPoVvYCEMY3NVyoVjI5lEprs5
	mDFU/hspoHYiTAq+kfaD7dkGcRC1+iKJZ2BM1yZBbQemcgjpCjsPgYtaJ6EiVa5q
	5d3plA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e329s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 09:12:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a5bc8c43so1420206585a.2
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 01:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768986746; x=1769591546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=WOJuT5bSt+I6G10W5oD3BwsbBOeBNGfoXWlpTKi1FEfgutONFOXGWlzasNDp2DL3Vj
         tDkCM3BfHQ7lVJzk7r9q1sJro7xXYedhm8J3AMHrPsiJZwJXAga4/4OWT4YSSPg3ABpr
         h3SMulRneSQzA8zC9Ud9BpK+0VLPc+42TOEyktFkf4C+gYLacVRmPbK13H8HzJ54Ir6T
         yAHx0OuVaYnA4w79QaS/RnNl7eO+NIF1KCnLabw+/V1/doM3JvqYNTHGWkpmGUhToVY9
         nbycTzHYxkkyTC88C/d4JQ26rYpRImL8WsX3/fNt5XmlEaxsmseIBg4p4hw0jKS3vRva
         c6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768986746; x=1769591546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWUB0NgRiAW6U/jzL5ONydUkBfp3Msj5lZ71bXeOJ1M=;
        b=Jdn8TabQLgDk5qWMno8iDR65fC16I1ZTjjClEAyHFj3GoC85Ao5ySjgBTpsloAFao8
         FrEriWbOWK5j+veTITbiQ0uWS9Iz2W93t+/Znxud+mYgk3M6HAXLmZbMZUdNMJkOiVmU
         5mzNC7wtBk6bT41s4f0SiWNGVYlsU7zgBPv2vtWHlqSSDhs0pkwdvQs8vUQ4y3CS46hV
         2LES+Mn82iWv4llirft9/Lrp3yp7zyOmIuBJkCjjMYNtr9HMrFyHUEZsZI6QOAveVUnO
         ExNiRmOYGhmNrHHh/uCFo4KLFsh5iqsakJuAXkp/W4m7GmhNY6Zwt4n0dBJlaLT7eKF0
         3WXA==
X-Gm-Message-State: AOJu0YyB6axHsL6d/Vb3Yah1uKD3fZ0q36HUqoMQSirVcjWZi+WKKng2
	kRVOnLZhjTTQO1PODb4N5+y69FiQgkLYQj0a3A00Zyzo/4bsj39NeZbrW+KyHNp/AWupw1LeMZr
	HjeY58AuYfamWT3hHAZfWrAhGmE3x7RbPVz94QagctlhtEKM5TOrOHz/TQaWQQCbhLQ==
X-Gm-Gg: AZuq6aJHomypa6502+TuyYzaXl/zwhpkWcliePSpk6fAfh8LC4cOzk0yPmpE8W9I/TZ
	uup+f0f1RsMzc68x2lL6z7Ca+43Db1eHfZzP2jAXZlvUqEZ9DqZTvjB3Mdu3NE/VdV08fiQC+CR
	YnQrnoSsfmyi+9hSCy/bmvZ3bKbM2195r/ciKqQh7AEwvxmg10JudlIztDN2pcah3t21Q7p2PPV
	01bk9X6N5Ey9HjKYQXJU8bRCiH+YtgD436Y9BNoyPGKM+B70yauaFzQNYc6K7cgnN48tSDgF9qQ
	6kArXbUpN7cyV0GlFzev0aEVRj6R2qT77ezBwUu8zX99GFsilU2lrKv+vF3l0fQ756XVOgn1EZp
	20VGRDmzDZ0OJLXzddFfBHQ1Ckvd+FXtD0QFfcUj6hRbtWwsB87UmRVpi60Fw/g6C+XSdjfgnsT
	85
X-Received: by 2002:a05:620a:3910:b0:892:5eda:1a8 with SMTP id af79cd13be357-8c6a67a11d3mr2290358085a.73.1768986745822;
        Wed, 21 Jan 2026 01:12:25 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:892:5eda:1a8 with SMTP id af79cd13be357-8c6a67a11d3mr2290356285a.73.1768986745431;
        Wed, 21 Jan 2026 01:12:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72639fesm1221031885a.44.2026.01.21.01.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:12:24 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 17:12:14 +0800
Subject: [PATCH v5 1/2] media: i2c: imx412: Assert reset GPIO during probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx412-v5-1-be67654a4afe@oss.qualcomm.com>
References: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
In-Reply-To: <20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768986738; l=940;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4kB6E3tvuYvahXcXz4FyDub5VQRkkUF0xqd2WnZKWC0=;
 b=q6l4RUtJ2w/A3XkHljape/yruDNLh/q/Tq90UZ9mOGQtzfjad24aC9OjnYzt2ymLvyBXQjC6A
 yfhID1Tnco7BFfiUbj5nFiaxiZ4raO1D1ZmMspbDDhgMzS4+SMJINq+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970987a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0H48pH_jBQDuRi9pSjwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vLVlRFh95VlzsdTxJN4fvSGLDd0v3xW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3NiBTYWx0ZWRfXxR6QGNPFlAYU
 WU6JwKtaMkuIvNcz+InHoAsXdMVwgL6D+C9OqQ2uJ3XM8pzMSyvWEaOYyzUajvMHt6C/ztKEAQk
 anrrxhxBysLNqkjkAuz1NRE1sCp3ocsjAU1IvWaykVwbEHS72CPcypeOjz+rOQxKhTicA/pJaZL
 1VC/Ex2R9+KC+37d8OLZI3QzJlcCZAjatOTIxipwLRHCB5yeZtZbP29IDWrUQtXBZAGHUqpYzY1
 iY102Qo1gIH2+h1os0plsgPu6nRlqWhStjN/bZGL03MbQdZLDI1tcHxPZqeIGmkEvaHsYSi4m1k
 oUVfPavzz1j/dbWZ0oY0qIQiyD8cI6Wue0HPkNO8PviVCevACktyErBuSvEury3lnt8M5BHR+A3
 ri3MoS/7wWKC3sKICbBcNoUzswt+X4JtGBODDJ0QiI+xdNvdGZMHyecQ+Z1Nm+TEA1qSNQ9iVQP
 xg56oY6TYvbLEs3B2VA==
X-Proofpoint-GUID: vLVlRFh95VlzsdTxJN4fvSGLDd0v3xW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210076
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51203-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 310C05449A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


