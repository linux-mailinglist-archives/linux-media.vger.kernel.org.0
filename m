Return-Path: <linux-media+bounces-67460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kAlkKFe7VGr5qAMAu9opvQ
	(envelope-from <linux-media+bounces-67460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:17:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C6B749B33
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:17:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xy+/TcMK";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NnXzO8eK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67460-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67460-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F8D2302B820
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B3C3E7BB2;
	Mon, 13 Jul 2026 10:17:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6E3DDDBB
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937863; cv=none; b=W77wVBDWKANP4dCyqBlbSSLktgc15ZSZsy27nPi8w9Rr7pwxCY8uPt77WE8lhlSeXyLm2teKzg5a1lGCFU0oRHZM6lLaZVU0XmobCm8FcJUxOyi1e7xgtBQ3HMjEDKlgWiZZGryJ2a2c2H9UDqYwEeo7N0I09AnhmfkFkU32TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937863; c=relaxed/simple;
	bh=Q35tEmThwDSV8taN1j3v6V0IvMdnGpuJ/m0IFsZUv1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPb4a0sUKyhpzNfaDa5kFv2+yc3aM0LavDTQqUPzOGS1PDBpZnwU2CYLj9U78Z0g02qXGuCYAsZcNYS+iLdsJ9IJmqJCfpL1xdqzyoo2DgMWIzJhStuTPui5QJsigNiejML5SszwxYV0zRrhpmBM9t/bFFj0ASTjm3oGpfkFr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy+/TcMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnXzO8eK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Njx2732111
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=; b=Xy+/TcMK7ol+A7M3
	qMktBs9rkfFhwtCQrphp4smiNpJNf2de94cDRESBRfifVjtrkr/YQVrrWOZmojen
	8GMLYoqhlh8M9wfm9v9w25KFnlQPPxge9CRtd4YG5aC5dAWLtudzxStl05Z/vIBm
	xZerU8oVDmNZX/c5QPZ/UE9VqJCRl8wQCZxMU2F1XIpV+e3Zi8lFU9+g3Pmtfeku
	/jVei1ndAFIszEIZeIHQ+oje77KWpUOQ3Jtsf4ID3M1jvkUeQRCZQfCYT5tlE7Yx
	qCAZqdFrMaQvq6Htt8XN01zvC1UY9+rWWRH8Ur5em2Pi8oan2OQI7xMtee1DOYTt
	OHlfBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a1j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso40731775ad.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937860; x=1784542660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=;
        b=NnXzO8eKTWHnV2H6DpUIh13vS1l78wQWSS92/JK7wUsWAAubsOQ9IJ/E6P8R/r1R57
         l4zy6NjyQnvmV3nEECJKA/rhrKpADl9HCSQCORuXFi5ubwP2uyfGECAcsytQfH/4Wocx
         p9LeE9Gh6w5DixLBxgLH9h/MW8nqu3pxkSv6UEE6co9nLoiEYVfqEH1SRV3boGxE2Aoh
         5w0rR9UCbmRlLwkomeFw28TIXi791uyvlDc8vrYMPlP+JmYEZxDuEy7gLGCBqm2AfStT
         Nm+k2HEJ+K825q1eo0H4n0Fuct1UV0TEpzqxnF0GhuuaSC+H3Ik6+dvVEmZ4EIXMeWpf
         UGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937860; x=1784542660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bz8i/lXrRxz8iYZk60vWniuTpNMwRglaoZ3pHR7JnzQ=;
        b=KkFFaW0o5yiIU+gMb8mWQJ1pyHnWR+MT4YEXZOWcBCJgJekWUVNlaV6PnrfqdNbQVy
         pWvLWqz592hD+Idp/9jXrWBe2a1deC0XNrHfobNSBv7rAd7xiSYDdBkBr8VEkibiigzO
         lpWRI+f7oEw/WxjzFMen+qsEgzV/mD0kSs0dGy7CRgj8ohtu+hcJp8UrtR+RJXnmYpzs
         qk2CNimHzKLCsal8aEwwMCqY/p6VytXCJqkszcqW8/CmgYOxuLlIC+nhh3x97uNRYFYs
         pRCQt6rEDO77JnsTdC4D+w6m16/ll+sY1jRiFztVVcP/zXC1KmRv/ytfRyjElRO1sqvn
         pK0w==
X-Gm-Message-State: AOJu0YwldndsvcATtBrOv+oUFn8/9v/dDrO5P5BPijoRBZ7GBjq0Da5W
	BJSKvdKyX2BQ0KhQdkuwCMD2MvRDnsy4SFbezd1ZMpv/nt9VaP9d1MdFdZnDq+OrS24DNYCgaSK
	NQy9IcSZIrR4e/c8ER90Ld0I+LTtViJN2NdF2TgGktcH+ZYpbIXkyb9ikVXTCv9n0bQ==
X-Gm-Gg: AfdE7ckXs8tFH5TmvG9Iu19KWptpJSbV+Fht1WtlJ09BRzi67JmfgYYlQp6Ga2UJ1wt
	UdUhOBHpzYUKHx9jAH+3e9ZkeooO4FWkD3lIcF1yq6Dgi2JtTVyU+2kxN6IwYdjkOHqNSla1P/s
	P3+Wm51itrhAE+nRVZPPeitbVSflnZPX4BC93RlABBBkJllWREILUnjWA4/Nj0ltYJIUD5v73f2
	FSqXY4N8jaxT5P+Ey1Bu1qR+OoGk92LRU9QABNh8hm2TbQxDupFHqnGANX3lBJEwbUu8I5P9GSP
	1VbxZr81rek6nmLuDQyGMEoWRFj7VyZ8TFoDRO9/NEAUKLsCB+xJc4WPkA0VkKay/CWZnlAOLxn
	UvcJYNpHwMt0s+LcYq7bDLDWXcoKm6owqy+7ETNmoaMz91GPNoqtYproDDBWQTgHTj+MvRf4sn8
	zGQfBrEs8gRA==
X-Received: by 2002:a17:903:2445:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2ce9e5a5525mr79206165ad.1.1783937860456;
        Mon, 13 Jul 2026 03:17:40 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2ce9e5a5525mr79205845ad.1.1783937860033;
        Mon, 13 Jul 2026 03:17:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:39 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:17:26 +0800
Subject: [PATCH v9 1/2] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-enable_iris_on_purwa-v9-1-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Q35tEmThwDSV8taN1j3v6V0IvMdnGpuJ/m0IFsZUv1Q=;
 b=wo72HXRncoBTvwUm1vYaME8z6ZUOKoFYm1OTG881Gpn5++x948dEwwppHAh0XjwszTKHOEgXn
 VdYqApBPrx4Aj7lm8FLDNNAIN5zvwSXPdhO3g0j+zA3l0TlbnOwnbGN
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX0uaYOMGS17m2
 Ot17Ow4W8fqulOUFr+ZcOQlHfflqSYZY91iZeIOo9gfaIBX28wWyuv0La4XUxiR3ykZ3Bqiaw+9
 0iRYXVYkwpqG1G2j61zv89Y1RBpW8wUZoyk7+/1gOM8GlUjCGRIAZSSXvWKEnEyyyzjZ/hDaxyy
 ++4yREDtemQnMUcZFn6Phn1n0HHT2d2Nhsh8WThGikO3h3uBGYovqJuDI2dxF1xyTyN2hs5g0Tt
 6bXa7ABHWfjoDXVgN2vRL3e2z3UDAEBOgCP543syEKpEfVycWdIY230YXD9GePVM0P8O4vbtgNE
 mCVW+FoLEXw7Hyk+5JpXtOZCiH0fKVKBjIaJvcsZGq6dSs0g8Y3hob3c+g6LIEHhBqO/w3L7ygX
 jrpWQjsyzejZVNEgeh0h13Yqg6avKp3VNuhUNcTFEdnBwpQBtpAYKtRl2snfG1/EqTeVc6oXYS9
 jgQK8jN0OKkq1Tvv7JA==
X-Proofpoint-ORIG-GUID: AJxwjBwAmnKtU9Uvc1Wt_zxW-08qPxGf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfXxnfSNNKLsaFW
 3vKlli953wGZz7Zuvju+1psG1XO7CnrdB8/d275bxSf0jf68mnDix/tQspTlwSdJzpewxcVvCXb
 wZYspxjW+B8VJ/iw8r+FOynYGG2SAZw=
X-Proofpoint-GUID: AJxwjBwAmnKtU9Uvc1Wt_zxW-08qPxGf
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54bb45 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67460-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19C6B749B33

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 3d73d1211cd0b31799a5c0ae0faf799d85495a3f..c698e6cb2543ca31e230cec3d5a8b7553a9cce29 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
+/delete-node/ &iris_opp_table;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_aoss3;
 /delete-node/ &thermal_cpu2_0_btm;
@@ -165,6 +166,55 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0


