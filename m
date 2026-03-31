Return-Path: <linux-media+bounces-57702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BkHKK5Py2khGAYAu9opvQ
	(envelope-from <linux-media+bounces-57702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:38:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D0363E58
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7197C304D247
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 04:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77912D7814;
	Tue, 31 Mar 2026 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL0+ptLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="go+JMFx4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3703188CC9
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931858; cv=none; b=AhLHNiit7l2tnRV7vF64Bx/zpa+hQk8CxTKicogdDU15aWCLM7f/ssOEOEJgfL+9MJwO5HSjA8LJbm/AoC9rpLy2ATZVMahpBMtKbMNwc0SQ/cgH1r0u4iWPqPOzTilKc7cosOvC6Cd90tSR7+e9nbocC6S3bET4Jg5nvp5l33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931858; c=relaxed/simple;
	bh=gDov89BBbPRYhiaVINrL4cMYiWCvPYgcp7NVxB9m0o0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kmQGPLHS9iy+ED+YSL43u7ZV+hAsMcCQqYC0dmsORagWe/w+loSFwK9bd+xxFMjvv3aAXyrKxCKPFzytOxDiy9z9QaJNPD1E9CA3eiW/kuZYKMlcF1TZvvvw7emcrpT8FYi4debfThhxnJ/BUWeIyjpKJ9rFQJXV3YWg9xdQj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL0+ptLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=go+JMFx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKqgnw1091578
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/jGpmvrt4uHd1gKXAsXHCd
	yNv5ern/gFP9gSgas3l6Q=; b=mL0+ptLG0Vu0HULMJ3lqPqWOKjfHx04quR5+QL
	CJBsS3nF8eWTreHnc8yBWulc1dXVLGTN/4S6EkhilU4HCcfCewwwM4cty4ouSO3H
	wTzSSl3ahysfPP+E5zUIDjIB7wjwB5WlutOfuosvqSISB0ptyc9XlDyPmlYkhXGh
	DNajiT/ANeL3CBUj5L/2wbZh6KzXvua5CfOyuc4jYP7ZGZwX46t32QEfAZYAc5eE
	hVpvylr3SsehYr8B9wi49Km2mUD7pcOS8P9ZgW3MZyaQX9zUmvfF2dCNuCqv3H1/
	GHAuoWrlneZRZL7ufjKwaqXhxv5gOl+xVcEhH7px4k1W56Xw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd2u2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c7130f88e3so10201877eec.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 21:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774931854; x=1775536654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jGpmvrt4uHd1gKXAsXHCdyNv5ern/gFP9gSgas3l6Q=;
        b=go+JMFx4LLRKpgMr2AGjim5de3aRv4gOHk8MglztJ5BfBU/IeD10tiGBDTORFkUIaO
         e8SY4DvlnGa6wta7kUKgZiqOx75bJwbxI8s/KT61BaQ/4NRlo7FD3zmsSybOOpj+aBJi
         TpkyqeOXj0ICUlVNcBsSkW33qV0+H2PUOf86CFeGPsLS9pAAnruIeY3zi3yDOq/QjAA0
         MqKGY9H+rqnF55Ym52QMxSrzAE69k8k/KoT7Kn5CsE+xCcUVTLNk5A7oI2/t9sQ4l3ni
         K9rUiE7ci4qj9liKbAU+lVt+hUhqFm3xQqzKFHyKoOAuWDFkrRCBXfPTA983CI8gZL8T
         hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931854; x=1775536654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jGpmvrt4uHd1gKXAsXHCdyNv5ern/gFP9gSgas3l6Q=;
        b=bGGPURGcG9XMcRykf76YCrWGlAYIPDO6Xrf71WCJ8y4tUT7ewYy6xeqLlIm0bIU+gU
         cWOWUoU/1O2kmCPuWkdhi9a5pReNbqlG0zc0Wa4pRAf2j7fRGV8TIgQZbAxLh5wAeISS
         vI1LJexBV21Ee34EQ/kvmFjfxcYEat+YZdWSPJpDL75Kw5jIdtjL6cnRM1bpYj3+i3h8
         Eeiady/gvw0eal/CeZrIYKwzJ/sGeHY/Qsjn0RkimhDfemIYAEgXUb/IjLzfgroVubpZ
         ARmJPS46AXWuN+N7Y7s6Y79lDoBhU9cif3vjqjE2NfYbtpHIDfF3FguOyImNM3W1eadx
         JpDg==
X-Forwarded-Encrypted: i=1; AJvYcCUr7yU7ZqDOT1TErqzAEnqAPr0FzaGR0SwjkHLMHqiRS3LENEAcbGdfD6tGjqCj1IiItx1Uk9udwlOvpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/ZB1u1uVUcbJh+gTCpFUABQ5A7Md7h+Ot7PmUmE4kBRPOfZH
	zwIVtj9PnoQGy9HYp/uw+a/pXFL6cI9unJbkNNrLlZ7W+0O4+s0JE9fticpu5IIIudpc+eh7/Pc
	pkx2S8sqnfW2APGtSJ/4E6iwxEN0MHuYc87gQsT859IjvEHCMTR7ClgwLT1LCfIsBkA==
X-Gm-Gg: ATEYQzwMIyYsHQr/Ok18V5j/MkYbabGc2fv8wUQwZkv5KMZhk1HaLLD1zU8NYGQp55V
	GwT49ncSDDrCOSQdgPycG48OaBHk9k/4LyW9+TxhC1RSt4uhAVc3PGDfLj5jP2bGrmFw+A6641a
	z6M2qvf6qlgweqzJbHv1UeAD4rPgHEgsqyB7e+D1M/72t8I5X0XkANyzI3vl0+RtO+dJMO5yvUb
	gCrAyCS2SZmf/QKfhG/8QMC/STt2xxB9sMwOVNwu9939Vv7zp4Sq0VABjHLbqMN28Qgib+zFWxl
	IiKuZ4m+MXOPFg+5mwohA04m0i+3/GqyJqxVqFiim6xIa0w/7RXpPAyA9/C1U+UZSViKF4jHpzS
	oQTRF0ZRXQU8jMHGNriMs3tGiy0HNziERDcezQSsGeo/6tIbYo1ho
X-Received: by 2002:a05:7301:1694:b0:2c5:347:e63b with SMTP id 5a478bee46e88-2c50347e9bemr4539302eec.25.1774931854196;
        Mon, 30 Mar 2026 21:37:34 -0700 (PDT)
X-Received: by 2002:a05:7301:1694:b0:2c5:347:e63b with SMTP id 5a478bee46e88-2c50347e9bemr4539292eec.25.1774931853669;
        Mon, 30 Mar 2026 21:37:33 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm9252248eec.4.2026.03.30.21.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:37:31 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Subject: [PATCH 0/3] media: venus: fix NV12 buffer sizing and incorrect
 capability alignment
Date: Tue, 31 Mar 2026 10:07:06 +0530
Message-Id: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJPy2kC/yWMTQ6DIBgFr2K+dUkE/MOrNMYAPiwLtQUxTYx3L
 6nLeXkzJ0UEj0h9cVLA4aPf1gz8UZB96XUG81NmEqVoSik5c/47HlhTHE2aRx9jAoMSRk+w4A6
 UzXdAvv2rz+HmgE/K8f0eyegIZrdl8XtfSFPW3cQ1AOdEq1vRqVooW6mqEoo3XBrZVFA0XNcP9
 GPGMbEAAAA=
X-Change-ID: 20260331-fix_venus_bug_issue-e92badece1fe
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774931842; l=1165;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=gDov89BBbPRYhiaVINrL4cMYiWCvPYgcp7NVxB9m0o0=;
 b=sJ9VIF8g2V31cjJDF4XOkNNywYMWjC9YTbt5Msj043ykQkGV1rNrRRpoZ/7WP7BheDWinORsd
 CXddwx5Up5DDBWaxW9eDIWYq1qfwAdtseqCkComElXmboGx7M/I18AL
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-GUID: rP06z2ks28iUYBdy4IT6824arMxFJar5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0MSBTYWx0ZWRfX4/jzd4gIWsKy
 MYx05/22vX/iEQrg46vZjRJnbZLGFzoKmuNVzOTgv2CoCYGhntStFU2gNv2i24f1A9B8Y5jrkEh
 VKf6WUgi1YgM4wL20TVgjocylRqOLfg1gxcbb9Kj/BCAwuuEzQdwJSI4bOdiAyrPotbKLMWn9fk
 hPpKCKcH23DD7PqO/pMczjK981PwAS7MBOk2yT4uOCzr5wn1/9opIceGeOJw9B9a65IMc2kxcgZ
 JPli9ec5j+n+N2qMa87Cio4YVb5q+hue5fLMoLJOpXUVjppQ1hK2i7ku+QjplhRnitNXLov0Qjd
 IcgUSkifBZ3PN/FwY3be+qOt2RVyIOmoeeA9LFOoF6KmrYMRuR6IZRvsLaTOoZqYdCY4JIUK2+5
 kgVFytsWnemULXFKQI24Z7wurTrmnUR2aQSzmChvxg3zvNBYhkv0xpRA7Ou9GduRRYnzlOn5h4U
 bVjtVTRQqfufCdIs+jw==
X-Proofpoint-ORIG-GUID: rP06z2ks28iUYBdy4IT6824arMxFJar5
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb4f8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57702-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjiang.han@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 195D0363E58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The NV12 frame size calculation adds unnecessary 4K/8K padding, leading
to buffer overallocation. The redundant padding is removed while keeping
final 4K alignment. In addition, HFI platform capabilities advertise an
overly strict 16-pixel alignment for frame and blur dimensions, which
can reject valid userspace configurations. The alignment step is relaxed
to 1 without changing min/max limits.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
Renjiang Han (3):
      media: qcom: venus: drop extra padding in NV12 raw size calculation
      media: qcom: venus: relax encoder frame/blur dimension steps on v4
      media: qcom: venus: relax encoder frame/blur step size on v6

 drivers/media/platform/qcom/venus/helpers.c         |  4 ++--
 drivers/media/platform/qcom/venus/hfi_platform_v4.c | 20 ++++++++++----------
 drivers/media/platform/qcom/venus/hfi_platform_v6.c | 16 ++++++++--------
 3 files changed, 20 insertions(+), 20 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260331-fix_venus_bug_issue-e92badece1fe

Best regards,
-- 
Renjiang Han <renjiang.han@oss.qualcomm.com>


