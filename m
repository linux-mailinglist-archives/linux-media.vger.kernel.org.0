Return-Path: <linux-media+bounces-67175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id caZqGAipT2r3mAIAu9opvQ
	(envelope-from <linux-media+bounces-67175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3B731E23
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=otmnpyCY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AmgC83Yb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67175-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67175-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B31F7308B9A0
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0CB367B82;
	Thu,  9 Jul 2026 13:42:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3C365A02
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604555; cv=none; b=XKxhNCHZPEenZ3bVZwW3bS+/vQR+GX/id/S0eY1Oke8Asb4O40BVme2N/oCV38r0ucWr4NKtYx7hPKysxnRw/N+EIyoK1tjgRKvJdmT6dvXWJnonxfhpVCHaTHYf0S1cSdkPMVyeJVG9eTrFx+8pNHCsfSlahjYqOrIfYCWHYUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604555; c=relaxed/simple;
	bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCnAXQw2qJe7MFOuSCkpg1lfoVKSXW1soy4/LmGIm4tZUUn56SYjj0YH/e3TJRuf/Jg0CskeUDUX7767d1z9mAeALqq+WRwESsNpnJwXAXvGv0BhEAJCkmpjj34u1Ac/c6mM1JDh7Q+Q2XbO1lVR0nXWRMg3knQUFS+8mzladS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otmnpyCY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmgC83Yb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNB5l1575371
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=; b=otmnpyCYOfBJKbl0
	z7n2usOVEwLwZ6958xMWU5D1jMAfSRPny4abQvHPvee5P3lmbI9zw1y5P67YBF+R
	UjxB/PdhZSrgfmDFSofTxEohiWZ44aUaJfsAuX3Y4k/HvMd9KROf+/xl7hLJWm7y
	wKshkTGKubl4K0xR2ZdIsjU8x01tCGB2YntI9ozyXoIGW5dZhm1dsOZ1VZqScXCz
	OCSpBpzLkCICA4AHicVgk5iH3E9lc9eSCCbOaICWy9MRa7nHOWGnoPHPiWMkJyv5
	LfAckI09cRUEP8nKL7teczcDtOtkMC8YuqaARQJMMZNgkr2hMBRAWDslkzQxEdcF
	m2/Ncw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcfwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744dc532943so762605137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604552; x=1784209352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=AmgC83YbzdHRz1TQCfTG2V03MFDzXFsXA6YYZN5P0YujpwOaUjHvo8Cj5BHC6LH+Oe
         Gp5LYvIUX4XH4CyDAWBxkWTqLF155vX+SA8D8NNix6hXoNPuC5SefLDv6sOTjq7JvsqZ
         9g1PG96bx0Rw64WtXv0gtGGIFYeXaG0/Vl81eo4J4EZVBVeKKFvb0PsjHStuNTUGyajh
         OIHCLknDTX90TtyQL4rSjEMFPoJm8uOcpeJLdVbJ+6i9sufzZgFZ/GIQ9i3TwVgD0P+R
         FZ7GMbzVb1v+sAHFCcVGYViqvVy2e6x3Cf31hkjxRcp9Ml+/7jYACCasj9eqz0Ez21i2
         SxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604552; x=1784209352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=KRVnz4x/+xNEx8FXsPZEhgdezXGLZPmxhTOSIzuZM24XPYhrmOyRAgRrY+Lod4nSOn
         OwlvnXYYWqIMvRualBUZaG+bbkccJ7TCw7gCk0puGMizcsQJ41WJcyoIjWZalu7mIj5L
         uJqOVt7HKDfkJn4vvwctF/fgoke5oFdHIgeIHgEl5aOvXlIH/UCsAo6hBlSud7Uxxf6h
         IsE+9qxbAI2aWq1QIzPjDaN2hnGGbWTG1x3ynTC1L0KohZjKUpAjJjJ8D4tKIH5rdoLW
         qMTErgR1CGvnDGb0dDowWN33yXwoRLV/7G8qxLXy01VFuzVEYf9Rpc91uAGUhrPNIMAq
         3h+Q==
X-Gm-Message-State: AOJu0YypgX6VCFxSSokYkAMKnk/WUvjF0CnDN/ZWNf44gseCltMnqSkT
	Q7xEe3Nbee6Xl+SomWZk75aUJIcs12qKJb3TOEahCDhICBd2PTwHSvI6171VyrYcvGfnNXgMdpf
	Lcm8YOvRbS/ZqjtdSivo7VQy/95S739ogLfEEE630vu/bGlL50zFkNgT0ZB7AF4gccQ==
X-Gm-Gg: AfdE7cm3wUvc5kSL/JsdQ2Cnz1XoD1j3Ady8Z9DKi/KpqBkkRPgo9K322Plf35S088H
	LEYkgb3KEjdYOsFwX8N87iQR3Sxtau9uQFuNPqwhljQkF+D3WTFHCpPXVjqLb9kAAR7Yy7/lK/e
	3eS5Cnl3WWZMhTJiE96+A/2sLBbq94XHmKWepbqdcbJBXwTRJR/KH9OiPGiansqoSbdxkygBp4Z
	JYmMahtWKMpTLGQZNLltpENC50wylsCCbZOuiUosJs3q+vZz1KKQBwU0tw4bm7V91C+2T3fI8KM
	dtkHitgUFfLC5H/d/PFFxOekA6KzuFXmGK3n8s9mH0585K4yIW0FhZ5emrFuWOUOr/JrdZ36aC6
	m4Qcqp95I7vzScfsCIQRj1zL5M1GZ+y2geTCWAsBXatZJiIKYKfz7nrdmEwxMlNjPPmleEIzrbQ
	wnlARU9pkQbSdmyy3xqI8Ca66S
X-Received: by 2002:a05:6102:534f:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-744dfff50e4mr4386720137.27.1783604552500;
        Thu, 09 Jul 2026 06:42:32 -0700 (PDT)
X-Received: by 2002:a05:6102:534f:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-744dfff50e4mr4386707137.27.1783604552100;
        Thu, 09 Jul 2026 06:42:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:04 +0300
Subject: [PATCH v7 13/18] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-13-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Ul42N8FvrM17uOk+9VPC4UpAAhYdz9Ooezo
 0jOUO4z7wyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1dQOB/9zGjTXk2clJR8LiscFgcpZtP+4allG1X5iZDXKrvnjA92BGXdorLL/aFTQQAiNYl5DdPE
 scTBDB6czY2l/iJZolV5m8+sooVomFMyNqCEI1yKHHKdO6tU4Y9TG/vKJLNIgbKf8KZGWu69LBP
 2iHBaDE4h3B85AtsahADQQIyeti9Ggvdo66vtBQViKgVj2oz6kBXDxHLQmGRim504meMkBkbAbI
 jgvoj8Ei5N0+pVRg/emfNLhzO3byaaqltq6pyGkYUiGtY546qZvyOAdd5z2QLL11yTMRBgYGLOf
 K7XiKusMDx7dD5Xtc9mxNb/7+I7jL8ef2MCZ/HeVCOkz2GNo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX4sb1WtLaskco
 7QB9lQ11vcqrD10P5L6IJS7aypwF2VblRF4l1ZY04lQGIFuRJBG8YlCRrjZBfuWuEuLGCUdGw4p
 CVSKvglifo9371/SmKkPkRvxP5BYsc+pz3+Dx5D03eYOxkc9j9K8e9gHOETaXBmacydlGKhE/pA
 xw0PWpaf83lNHMIpPZH3PIdpVAtvrHxPnzziJnPhncxag6wXpvlOYgLbzTxpZu8YuL5Vtg0lctG
 Ekh+DOiKDghsfc/1xhnnIAQj1mYF7G0ByHJES6CU0t4UXGVYR2NX5fG0pbjw6aaKBmYejXhjbP+
 dMf/U3aw9VwOAclgb72MAxKjEdU18IOM9XBEL5T5zgSUdFQxER7TKiZEOmI0oyZr/H1IRtjoov9
 ye66r8X0xLNmndt/ZsyiyjzkyOC5FGVrRiKDiuIstw+sSkfHxLnMwGRRZusgP3H//50RYDNAbat
 aAKFMnyEpDA/m0bK1Dg==
X-Proofpoint-GUID: WtmMUU3hIZeBlUfTTwfW0qUvWs-a4ZHu
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa549 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: WtmMUU3hIZeBlUfTTwfW0qUvWs-a4ZHu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX05dE+TGhlKC+
 KVnfG1CUNNobQqyN6uWNvxUbHia8ykL61xdBJ2Te9C2/XqLY/Z8LVlhphrYRWzlpkwlineOkTbP
 2x1JNhSKHXsGcHY0ddEOgXjEfUbblRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67175-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41E3B731E23

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 76 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..7ad6f0bb4677 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,80 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return BUF_TYPE_MAX;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == BUF_TYPE_MAX)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (pkt->num_properties != 1) {
+		dev_warn_ratelimited(inst->core->dev, "%s: expected 1 property, got %u\n",
+				     __func__, pkt->num_properties);
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


