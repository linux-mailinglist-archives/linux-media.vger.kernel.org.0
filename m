Return-Path: <linux-media+bounces-66642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q/aAHc20SmrjGQEAu9opvQ
	(envelope-from <linux-media+bounces-66642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:47:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7670B1A7
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 21:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PVhvB4ar;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X+jJCCQ4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66642-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66642-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67A99304CE97
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 19:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0073A718D;
	Sun,  5 Jul 2026 19:41:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66D3A6B89
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 19:41:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280481; cv=none; b=GBo8EsxZyHrI4QzWkLg3BketANS9fR4Mwn/tRxJptFJrewI3gVX8Ogpmdp9mBfDba1T/W03N9G+mS4x1WbYyVspQw6K6Q1sKmsrEwgi0kErJEVshCTXw6kzqqwrpW1gdaTp/XA/IlwcmaA39VDGwYhvCx6jl3zI7BGKsOrYOssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280481; c=relaxed/simple;
	bh=OCsNVf+w7PW5jkH9T0VzU3MYi5Wxwjk0gfKFHah6WG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tXW/jCNZsnCgKuvsUC+cYngH19v+FCH7SwgDf18neZEaZzMUs0qagh6TIUDwjRAmXj9wsHl2GEsFj+d1uQHifepQpJNjZRMF46l1WgqEBgSH3wghOgQCJiYzDRDjjGHkYazku0DFDNuHTfPffmvMVtUpQ5XS/e8OeMvpSrj8HwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVhvB4ar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+jJCCQ4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665JTKMC2537335
	for <linux-media@vger.kernel.org>; Sun, 5 Jul 2026 19:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso41674615ad.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=X+jJCCQ4rZNaH2QZPG0tZitzpUKqRrCOmuWF8J6cmnJ3Nezh1CbmYLLK3XFP/GW9Z1
         NZDdKt/HmKptEKSYSuSDjjeeCqArYdiH9LH5ds5rIZGHZqQcIDd7ilrT2+NMj0H2pQNc
         YXGiMP11RX308CqgyQ9qahuXGTw35xLR9bY8jQ6vV3UPasFMOeEz4Bn6i8n3vv8oXC+v
         8/q9SY35tZd5ymgEIzC38hWwU7FPnfggW/aRH/c+Nk0ZD/ocJvFlWX1+Gqcv8vZkZav1
         l+1xsS9fA6P9cv6WvY+n+8ZjiCX7ulw0dGUd152yINSkzYgwat5NwxLIITzc5E3CrlEk
         kUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=ZO79fuWnmRwgQaHDhiJ0/2QwXfBsoTtJeRk7z7IU4m/fc/qC1tjPb62KHCYmEoBa31
         5PAwFiBeZ8KtTC3PGwX81hy6PhWUFCw+CNgzxi0tFOPTTvAb95Td5B1cvQANYy8s4lQM
         7zo6w/N573sCsmzdjH727+p4sNJstDkGIcBlgmSs6wELYVAePy5syeLeqCDrjr309Ff5
         GtVdcWuvjNK2UJjnqqoEs5I9XX6xSLI1b9uR0taIkPKgSrMFe1Y1C0Ee7QaXU5I3J6wp
         vMWi6ThKuASK2wct9nqvxla+TWKgt3UStRVHJp2z1EsfuB9DWPgLqy4U62RPFobIhegK
         5C9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Lx0izZW4t9k1zyqg4fJPTAR1jwevMFvgXQrO+Rean2zlESU0Wba1HJa1VoJWtK7e5fiym0Fe5hTsCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxclQ+KDF3zhVzak8y0BZFCJujWasuuGEzaXZ4QpWHAhW/2pYPi
	Z5B56KW2bJr5CTW23jS5C19GcLN6srGkvM44z+UyvTtBMHY6EYQ1CI9j6juuQVNxRiye/ZN1IJF
	65EAuZFh4jeTpBJoaHSQ/QhWdlqu8SgH0w5csNfeT/G4I8IVc6TDIPikA0du3aTFdKw==
X-Gm-Gg: AfdE7cn+KR55bx9i7oFzVKgQrM7iEBKctBEwnZwzC7JW9b4D7i6bPThkNVJHA2ewMo1
	uZpuYnbanwkYKU7eV2BzS6HywKb8s9JOw+xUQFiHDX9YPlgy2oOBALN3ZiSOvaMYvDaGNlghX8X
	61RlDJ1kST19w5qw6jXfVnPfEXb2hFuvQJKPiKG/Tm3oFhLo1fYYN1rryqOAiEqvO1qUdxRmpsE
	g+dfzww1C9xTZdc7kyOTnFiyTcv7a4NF/lBkVbt8/DYVrAa+Meb2cNQithVU6EjXbvnIsqJ15mr
	LJPo1t83RCuURaPls7HJQ+rcwbGijihxsrdaez2lp9879FMap0qlqBIkb+zICCeQ8+tQl/z3NtM
	5Y7ySzZbRyK8QAA6hLg/534svzWsn1+h9RfQydQ==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826155ad.34.1783280478039;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PjfUzZZs-_JDYDUwj-G_OiiquY_JLI6e
X-Proofpoint-GUID: PjfUzZZs-_JDYDUwj-G_OiiquY_JLI6e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXy5ma/mbElwdd
 lTqgMnbaXTFQ9qCJ2eztT/DwX4CioWNxw8MQOUvw1l/kkl1OfmgQFhqtzcif5rDGE6VHfDVpYPC
 Ax3b5d3zW8ph39JPY6yGWan0jI1lhek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxhrcYsOY/oAf
 lJejTIkAph4Qvz09QBlv4qahnaVckGgHd/JEofm4UkR71XS5aJu9PHpMKhe3GsTgzXbMhD+ZUon
 SEfMo8/XmoAtaeI/hR9Xf79YHVALWKlb1YsoXNbirUchi6Qpa+n+8qT7fyHHkhxEOjT1wc0SDcZ
 kEWsXOpwo9vOW9+0XppvWSMYhPBZC25nDW5ChycOAyvyFzNafG09auXjEZbo4aV5DrSoGs9wH1z
 N+6bfmRsCBZUHxUcR2NpyBf16AHSjmqEGgocBAq8uMAnfs54pzyMGjqYXs4pSOmmAiAC41TqIQj
 4pCeh7utbge4AiJ71xlXWyXdtSb48WScXxevQdShAqN/1nV/0WagBCcOtYeQjZoi3GCLoJTuily
 oaqIrHMrZOxbsCC4cNoUvssdutB3yv8vxNhBilRN7CVoxuvumELupgeqD4S4VtamdPP85YoTkxm
 kBqUFgbHDTpNdLM1zoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-66642-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5D7670B1A7

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0


