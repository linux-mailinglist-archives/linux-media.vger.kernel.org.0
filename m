Return-Path: <linux-media+bounces-53164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHdDEDQYnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E11737A6
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC5E304226D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFBE34E745;
	Mon, 23 Feb 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSRJZgRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/5a/C7p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EBE346A1F
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837214; cv=none; b=U+PyV6qfEODTb0EcADN/WyBp64ePV7GNCyHOf4YplFgvcZOkHsu6ps3nIuh13BdhUUEfRzQhj9GBxOjvr1GaF/SN2qM5yVYDMY3C0d1aBFYT9bSSv+qOSKA2Ajq2Dr9w4KYi7gdii9YSquuCLC5YuHvjEzw51EH9zeRRc/g5I+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837214; c=relaxed/simple;
	bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKtbPElK/rOSTs/qUTutMy1THWXMlCvEElMP4kHoViciBU4iAJrSYEyp3CBDq7S/p9uZccBujzh5MdtONCkR1BU0xOXzp1NnyVF3UJ9OHQGS2tyugrmOJ8ZXCFMQ97y5xZTITwQaaNWOLOQX98JwNuGog8b46UYa6tmMvD22RmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSRJZgRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/5a/C7p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMNgkk2211942
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=; b=PSRJZgRv7ZFbB8fJ
	Ct2ywslvEODZYZD0Dteb/AtL1psfjK7xJSxCfYTywYJyUj64Py+RsIS4jn2Sz3wg
	SrvlcHpwdObHdk+hcFJmGMb+OeDJ/dRXBm1yqjE3G0dX9n7lwbQadBpiEgKTxSQ4
	Y27JqAhe3EVd56Q1Uov6c0DP0GJoDT66dNRd/1/L3bxGBd9MzNc/PSO1pYizrJqU
	1gipxi8xP9ya49/xGglniiT0N7PADwozdAJ29h4itJooEMm0obJDAcCpYuzck7RZ
	h7WdCL2Oi0JtixPv+YwAa3Y5wpxBCjZ+Voi4T291wstbp6U3XXSOHLMBBp3dS0vx
	n4jQwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v0vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506bf83258bso582364311cf.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837211; x=1772442011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=Z/5a/C7pGSGoCEh7ULQhIejsqYgYj7R/TICAfq6bcFscxwvAzHQkTc1f6PljYbLA7P
         9DiRdKNOBzdY4Gs/3oZ5OL+HJA0XBfSZ5gqWr4bxcaijhFaKXFD+HnEJ+C7OEltHgQc6
         QbjL6oiKT9Eacf1bsbXNcxu1MG84mfg/ThauX5AYVJoDP3sficGRl0M9vbT7jO7ruAE0
         scRAh5bRimsH9ISov9MAiq/JtZY5qOLjqCchrbpsxKuQG4kf7V/dEWe3lVDAm2qTMMBj
         mZSnHfW93A6boZOG2ee+gbXvf+OnRFx2g2Vh8fq5zDRWGGr8JLC9g48ylD54rNKNGVBW
         1knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837211; x=1772442011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=eZvsCLRHavbzDcl7+uVKlDlq87D1Ah++TOaQ0e2zAQeW6ywo8ZdpJYCD9pivkTaXmU
         uZlm/h3h2Y1fvibwjFKZIRG/tPxjvxH4O+xpQjKs5Aal9waK/nvYG09iIWxnpMe+ozIL
         lJ9lp0TF2uHqlbNalY2ye1JDC7TO9jVmcPsjIu4o9Gd6XeU2QmMZEDVQJzo+OSaxdB8R
         nGfCfAgsHYCwqrmkFRc0VR4XowE0+60+aPlzcJc+yN/wrO8zNVIJzYjOCte21sflcHrS
         GpbCths19HK5qMJdNWOL/J5uN+AnuTJxF81o00CHZZ6IuVZZoLIW6sfkPen+WRluRAgG
         dugw==
X-Forwarded-Encrypted: i=1; AJvYcCXbp6rrG+MsPos0EYma8cjqSisauOCLqiLwJ19ejxglCxfzWE3XhiBrdsD1Hcf0AHRB1QejqnypqouMqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfGnxxld6GhrKCvpgXLUG2ob6CWqh0iAA7QgebpMI0xNp8jhJ
	0KAMsBocsumTbS++5c0M+8kc7/K1xRnIPbIYGF0uibHj7OJX9fi0R+5TNZym9odSRtOFrBxlmPk
	B5lPuyVuJp11bB4k//2QgWLHNOL59xeooXDaSgNED0JFvPkkXOw7pEmTgKQaawMdzzg==
X-Gm-Gg: AZuq6aJGDvvgX9/5XoeN+56wlC+aDmNujItiobVeO43IlXIVTvQqVO8Gs6mDk2C10rY
	/6MslFeAxMnTvFtoF51eNnbZ5Mda3y2jMb8PL4Jz5tWy1cH8roEF0nmEQdZXTJ9LRQtA4pAs7ef
	jlOpqcKNGA9FEOgFB7IGy2PbAAJ4wrNJCo2hh2DBAY5YMhbqsPCP43tdnepXCqnrxD11amY2QQP
	7XD0DTtmSzNXbR16S7e8wE93+/5euCMjQwH21mcEfcq6ELPxkl7x9sJ0Du+WB4NSoYUDQyqJGc0
	EVy7vuts8uqJDsI8OLTsJYimvaP7RehMx9keY/nnBsGFSgBNo/se4+xDhqqAv7+l9RCb/2EIJut
	l0HuTiA5bPtiuzNXMqkhf0s0cagZoMuIrr6Kw9DV6tYdvfjY89mnG
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847883185a.64.1771837211315;
        Mon, 23 Feb 2026 01:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847877485a.64.1771837210797;
        Mon, 23 Feb 2026 01:00:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:36 +0100
Subject: [PATCH v2 07/13] i2c: scmi: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-7-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcDzdqpQoO1qrBXLMBTaUorlyf28sbZOZqxK
 AmDe0QuUlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAwAKCRAFnS7L/zaE
 wyA4D/417EoyqI0QBn4m++bexsMnLKIhOgaSKHUlCRm4WI0kBCH7GfKNgK0l6z9SvrOC1PZnQbB
 2l0PDir3Gnpx+UNskCvlxw9rjF3lBGssYYGa3MKV4RYggkAOwBTogDaLDyeI0bJw0LvXF9X5UMi
 V+vzvRzs/8vJXCcpVokzUI94EnTskk137bVDQDWWd94SiFlx30X/cS4x1o9Vz/UwklHpX7qi46E
 yMNQqgYnvg4PEPqi10LUKV10mU+2YEQR9/ooqGMteOJjbvRfb1VP00k9n8PzFzPUzWD9ZLCwHEY
 nnc2ULdIYR8Bcbu+AeD4P6PMQ1BpbGYQESpx7GVIKOdNcQrjnrLJefyJKvRpOuJd8rRujB/CwtA
 wnEutW4GlXh/yMXgnpqnOTzrQfU6hC7HMIhpMXf1sk/2idyYqgV/SqJMfZ+BMajPVIuVxTYglj2
 5euD/Mz1ZAtyF2XuBVL2mdeg3jqXPc9fJfgH6XfViUmnaKHN04uOJXrBeB8PvGFLzomwfyC3lCt
 FyF09qqotF/WPjhL+Xivo9wdFdqRe5pK/YtFHMyqtcZN9lpVIjE5exOQA6Kzr0tFqg05+J4v6xn
 caKJHWeVbnZdXH6hqq7ZJwglqDcAazl9a4qgg++XzUMrHK0w9pnYrkW1ldDjKXJF68OF0Uwgty8
 OqHs2gqY3dCK8tA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c171b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=iZeLIxs0cxVxcBwrIEAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aM2N4zt-bU4pnWLgzALCdj0L17GXfdn5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX8WAS9RJRBkHw
 RPOMK5lVZf3JNVIMZE+dndiBoRI8v1q2sLfhtHsWZm+hJBSxEEVWQrjScz6IWP1/QP44sijHqFi
 Ou53zeii3dbu0AEkdmQ/3XBDsykpOFkswBDadmIHqoc6F9dG5ZpgHMmObAC9LXVRlKxQkjNmvBr
 89RswbZ4A5Np2FQ5swUdRCYwSxRqA9LScW3x5UNG+ZgVkpQW54e7E5TwBwXolP2ZcjkS1Lvhwpq
 6/bpZXxaWNHME0NS5eCKrtxEmk7LvkqIzB9X9KVag+byDKzd0pLIRmf9qH6qoq44BKeJnLFQ6mL
 kXAl/NsQsbc7PAvWkrJnuR66yESUl+s+WTwPQ+ni1aLIzLO0MjZ6Ha2rfbHyZnqfwTt/tQ8EUU+
 XkTfEHwkJM2k9KLNtt5TIyLUjSUkK1YKRCL63A46drJ/mlneBhALujKzsRUNJW0GXS1aiRw4OcN
 9uj39DDOdtj37tM2DmQ==
X-Proofpoint-GUID: aM2N4zt-bU4pnWLgzALCdj0L17GXfdn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53164-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 960E11737A6
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 324a63efa1ab90027854646f84142f052a966537..57b8175f0fa8da52dd74c5bf8e3059358c033a37 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


