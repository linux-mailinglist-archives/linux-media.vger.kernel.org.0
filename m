Return-Path: <linux-media+bounces-67699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3VYQMIWWV2osXgAAu9opvQ
	(envelope-from <linux-media+bounces-67699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:17:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7675F433
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:17:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XR4554go;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QQJ7KHkg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67699-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67699-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 708B13050379
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDA5448D03;
	Wed, 15 Jul 2026 14:11:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B72542BC29
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124686; cv=none; b=nmtnNAS98N1G/z2PdG99FOmNdZgzpTjbyq85Ps0R+p8t0RfeHeIaqjDmuNdntJh1dxzxSvltXsrOezQlhldAQ9HjhGgy/95LDNBGM/BuxU+cYepo3qKnXSi0myFuqeZPA1wmWzqASt7ebg6zR4dFQJBZO7CjDhHbAZvmvz99y6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124686; c=relaxed/simple;
	bh=Os8dAYcamOJnzmJwoFzvqrtNqrNmAEwuEyi9dkHQWvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTtyiT3zIe0+USu3pNETSOsXYd6kAZhzNBFMqQLBOLTyusmoZh28XY/dj/cFYJ1DRjgvl0aWkV+6W3QfaUFvnYUUA08P7yOFQmXJzXmtUfatdgnB559G16pL9/sxIZh7PdmwzEvcBBOfGZ5U7gxNP5amSWt1YvEk0Nws96t0qNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XR4554go; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQJ7KHkg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Vao4097282
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=; b=XR4554gozXNl4XXk
	0h60A5r8VAJ9hknUhtKQVwaY0r4thiDXypH+ok0OXpm/+RlCkphTBJLdu7N/hAf4
	ZDfk4awK3vwNBErdsGXRJJX192OahlGUyrUgCaUi7FlyRHayrpBPh6IY7jpLWX43
	Nq13s2PE5ZmR0RIRbV8smpOFqc4Eq3mrR3BJktCmuor6xK8wrHDLKOvI/6Uufyb6
	ZRLPjn9pSek6eR+u/gBiFDvEGBggqEI06u8wYEvbYXV1hcMItrGEWy6AawmiEc7E
	j8MUcigUPr/sGOzE2lnoWdkohxf5OeopJzEy7f4BB1QOXaE3rTXb8EFSsbqDmaQQ
	lYL6tA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558yjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so102743595ad.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124684; x=1784729484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=;
        b=QQJ7KHkgT9Y9iyVvM28RP4Q1dsDEw2m3s+1RNoJzo+FC5p6XL4iSpjMhL3/Zu/5cmQ
         mKu7b/q9pljfsA2MXgKYQlNo12qPI7nY3cM3k05K9CVtgKXBdmFgCg6ufCI4nQS3spxH
         mTxahFHz4EFl0p0PPFWy2lx30l/R6rZqHCRCRofGUjwwYdf4zM8D/ZLen1VSD1GjVv97
         5RTJ8IyLKYX1DMTPDaJIVHawsrsfv55T5/k22grQO894q2pnrBovGFEIp8Hl5x7D0LMJ
         yMj/yp/IVBHWQQ/Mj6nW/5PjfEx2vwdJUCK2/fFUNv0MwwNWm+jwjlZGXbrcCDDDbT8C
         h3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124684; x=1784729484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEG8f3Kfr2qhIFwiOsUL7RgFXaPXEOjds0oQ+2XH17o=;
        b=BHUWR+DbUHA9LvKGNK+drz1ZFlvjk6cOWd9a7h1H1pGwYRWfhrIOYiycHrqeiouFgs
         0wtC22J/NkjorxcGd72ICGutQgcvGLoCO9Sf6rqovfS0CLmHzIhX31hCWcGUJdktEIwJ
         YESQNM5AmqZI8GkMC7k6n0tdL6iObVfoPaJRxT1Pw3SKxxK0GqlmbdPO9ZUtTzzbZmK3
         B9jC+SkJ63NufyOkzpA15K/8aokwubeWUhoUi5Slyiuq2MMsnl6nnptzKf/R6ONXe9AN
         2KRSvs0v9/OTQsmVxuxQRuHwW9RAUhLGTn3ORQtWn49xrrYZSl9gUd9lJ5jmJ0zTYAOp
         2V8g==
X-Forwarded-Encrypted: i=1; AHgh+Rp1c4ldzCWfvD8HnkjH+1RzLk16JdSpbxbfmgK/BLs1Nf4SmH7wAauZA6SsYAtGSwPllx8QInZDxoy+wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOf1eu7zVTO56fjP2PTO66Bmx7265Gh+Cgtn4oqjKkyZgFZw+
	yyDFcsBFr56aTav4IKs49kS8p/XMptf9gIFDB/uxD6TaMKQIQ+E5/P/NegqwRRyWr5KWfYJIkY+
	3X0sRKIanGCzrQykyd92Cejtwh0ajwz0sUsvjsKIJFOYXpEg1Ltof4HYqK/S20jsPNg==
X-Gm-Gg: AfdE7ckIumYhQQPC2RgceMbi8VckoLDjGZj1fkeRhukavIS2QwWMP+q/PIHwjPX5CTS
	TglrKpgI2tYBv0QPLg0QJ1LnsspYTqqGWmytLZLsCNOTievTQmgjvIT7ah4gVoQwHPJdpDjFOz4
	mWU5aVNZUZmljx2wARKjp6oUnGHJfLfa/HW3fWKQ+88LyWDwtRe6UQKFdpD7owm7QWFdl/1Q/2J
	pa+FyWRujZOH611vnAWgmEOlTuiwn4jl7fLhqnt90o+R0y0S+TlH/y8RuREfcCyYqtMl188G17/
	ACqMZ5k0IjT+4/vACjeabUOOymZean4rU0c30QYU3QXbV/9EA/P3FEXCuYx0AAQE1zzu3zzzVUI
	EWkhdA4KvWiSPZbr5/9aWNSwHoXcKpY4Lg5SCyCKX/tEZ
X-Received: by 2002:a17:903:32c8:b0:2cc:9179:325 with SMTP id d9443c01a7336-2cf03c10898mr26403775ad.13.1784124684095;
        Wed, 15 Jul 2026 07:11:24 -0700 (PDT)
X-Received: by 2002:a17:903:32c8:b0:2cc:9179:325 with SMTP id d9443c01a7336-2cf03c10898mr26403205ad.13.1784124683532;
        Wed, 15 Jul 2026 07:11:23 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:23 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:05 +0530
Subject: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=2481;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=eGnX+6v9T5zpKul/tvLceKVXAucGjQ/Ox0wKkhH16hE=;
 b=XTUm0A5+WBQQvrJ7bH3a7F4TVZFJ1E+maaDXdHezHIWQ8ibMU6bR/hhxP9jrLE6Vv74l9t2oQ
 1tAzf8XbjHrCLajDgBrdQEjQDPrTzAVmlzxoiPx2PFNIOZfVNEss1iS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: g72-vaFtWm83AvK-uS_OH73dcMvczJz6
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a57950c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=Ysd7Cdeu6pd1DDnCSN4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXy9DVJipa1xfj
 0a3JreDNBTLD8h+FyL1ce0cp7o92sGdO5IN2ti5oupGf9sRUhAC3fLikWq/uOLKnqpLjrb6N9Y4
 wmgK32o5XfbJxGOFfFLi0kGyAPi48PJLiP38VBUoVY9neauBhQbf58SYtQF4iExoqSgZ6Eiqjjx
 IoRBqSpoa8IITKSOyKNOfJT6/gCodbrMtSblLdexSTVNC59bgXdLD/TeOjIv2GSnwi8Wgl59Qm/
 HT9nUWhT3weYecDFY/J86FYaiqeKc8wmY+YS/JC7UwJFr3IHtdJVV2vQGOp0wJDzyi9pYBQLEzw
 qRlx2WWXssQGxEheFVNES3OG8gn9uY1kI1jQvA2rN1etdzyvO+m1oSMEAuhasR1xZ7hGqA5gA8/
 XD65838TgLZIUfeHfHIajVNSK9BvEnxnXoxAfL8avo5lBQ1obo+l0YYwZ8AjcPBs+/0FgokWs6O
 yEJwZU9/iYzUzbHO24Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX8tdMRxnP0NrG
 t+G3kGq09zWSc4xe6wAF8eCmAEpxUwoSuyV1XKJEGvlO2nwBGgZpPGG/UYltHW6xNkzoVYJra/Q
 CzP8bFOO/OzrODSLPovaU+ypgsxffVM=
X-Proofpoint-ORIG-GUID: g72-vaFtWm83AvK-uS_OH73dcMvczJz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67699-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:daniel@quora.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,quora.org:email,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BF7675F433
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Iris platforms use separate context-bank devices for the pixel, non-pixel
firmware domains. Add platform hooks to create and destroy those
subdevices, and wire them up for the affected platforms.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 48 +++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 97563bf89939..7d9d67baf22a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -399,6 +399,52 @@ static u64 iris_vpu36_get_required_freq(struct iris_inst *inst)
 	return max(vcodec0_freq, vcodec1_freq);
 }
 
+static int iris_vpu3x_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	dev = iris_create_cb_dev(core, "firmware");
+	if (IS_ERR(dev))
+		goto unreg_p_dev;
+
+	core->fw_dev = dev;
+
+	return 0;
+
+unreg_p_dev:
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	core->p_dev = NULL;
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->fw_dev)
+		platform_device_unregister(to_platform_device(core->fw_dev));
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -437,4 +483,6 @@ const struct vpu_ops iris_vpu36_ops = {
 	.set_hwmode = iris_vpu36_set_hwmode,
 	.check_core_load = iris_vpu36_check_core_load,
 	.get_required_freq = iris_vpu36_get_required_freq,
+	.init_cb_devs = iris_vpu3x_init_cb_devs,
+	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
 };

-- 
2.34.1


