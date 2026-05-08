Return-Path: <linux-media+bounces-60955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF1QK+sz/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCA4FAE8E
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6CE7304873E
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD71421F0C;
	Fri,  8 May 2026 19:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoiccdI/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in/Xikor"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD83FCB3D
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266962; cv=none; b=tTV/Kcik+WyIZVMPCNNz5nvXJlfyO1dACFX2Sc03pHKDuq7HuiNnbbd7bExck80WAeoA47Wfe3y1YZ/RbiMWurgsCjeIOPLbI4eKvQvDEYQ98WENSwH3ozIja5MT2rShIM6EC9JTBsg3DG758clzJ+iMOE6NwxRlpMj/1VReMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266962; c=relaxed/simple;
	bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O444wrqKYGT+bVXkHlC1l3264RSEUZHxx3fdb7Q3LdGWD63ENzAJrs0pgzUbwKMZmqQB3k6bgD/x9tfg9a9PyR2qr7LooArsAvdZPyDcG4aqJqsAsJ/9eWSYO0tSYnfbsfWXQ6SC8+zTl1/bmvAs4rAU2ShVvA9ES4yeIJvQ9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoiccdI/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in/Xikor; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CRIVx1174218
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=; b=ZoiccdI/+SBIEzg9
	A2Az9oCQElFc7yNejZdEsCIJ00/VCbC7tpKnJV0Iph/neJL79RUcIET/iB/z1FFC
	ryIiON5IuNMqTQZe3IOdbdtZeuZ1pxS1I7edrAyL/ltzeUrtXcrfvX8iBJGOIvsI
	XbHA9tbvoCTcZbjPjYEEsc5YtkbhaALxMmqeefIiRNNEttS0lFHY6UlsMX/Aoo27
	rwBMj/u9a0RhVm0wFO98NckbhQfOYEShTpKQCh8wJH5UQTHfRCODU9rwhCc7O7o0
	J1JbuBNuEKNxXepUA0CPJgqQf+c3TheZw8YTSDpOig/F7/Q3swqji/aYYwv4W/D3
	NZRmUw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132hccwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:02:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so2325325b3a.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266959; x=1778871759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=in/XikorPuEIbIwV7jJuXpYHMVykYDCJO10aZCs3pehZtuXYavWgA52epmMgNxgsvo
         cNduCpsKMKPJaXhbntrcl/psrvoWE0rFjTaLw+iIgFyd35Cz26oB00P348owCic3xadp
         U/x1azZlow8VWmRuMdz3IhefmjbkjFXAI1zxqq21R0Oq6ta45HGB1gCA3XQGSbd9rChT
         j3HAXzkIN6B8ydjm/mHoii1QtUVRzvMLADZE3QfYJert4URKhcSQUpzU/SP2OSuTvBkL
         MLAvDTg15d//JXrmhckTsuDlyiFIOSIGW+ldeDnHrh14QWAR6Sn1MlWMX9jUGgdQ0fTO
         vyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266959; x=1778871759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VUfpAIf6lAkbIZyifhFThrqlqNv+nw276Cn0YLBJZDc=;
        b=D/c0L4Kymoc7k8Ec7nki1Rdz9L9OqCGX309l038t8atnrfiummzyVDiXtxbJaD2d88
         PPtMrGH06TaUq0zd6I+PNauLBoGEbqjeSo748Zmr+nAtKqEHyfSS05991W/nJk0MRblw
         tp21+eaWwaK0gJSw3SKJi34FQy0tYh4KHvRTyf9FBNaCvXX5eFd5xFGuNVL7ZXUkMlyO
         JJoP/RmQE/WAMLFSR/QFG5MKbiAxtljzGukYm9ig+ubmO0hjz4KaTwsX40nvObV5gYUj
         z67r3nCfryd0ciRKUouDDzpDj6Cq/d43dVIajdcAfN3QO/gtabLFKrl5OndifP6OzTOv
         9k3Q==
X-Forwarded-Encrypted: i=1; AFNElJ903KL5W/4O4RU3TB2WD8EQlqpKAwfK3u65fE2g/NLgSUegKpii8ni5+UTTVjcNjwzAGD5NXLCxQ3i7+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7UEF7z/yTyPO/2w7Kn7U4jjwsSxFnVVrFOjmD3d9KaxKog92P
	bpiwNv6TaIaWzvQ9SKmSQuaxZSAEWxd29ECCEx5lIYv3NARr/lIFiu/Qch5zXCZZ1yzwlb8LR7e
	fmWAhzxLvbWCC0I/p/ZvjefwSFhBGiLto/Px5RxB1rB5HxSPD549CIE+flUBiYEeFsDO8U+a14A
	==
X-Gm-Gg: AeBDiettaV54J4IpKNgDWLC4z7JRxFI10GtCpCKgMsHW+xNj3nni0dfvrQwYrzBGu4R
	ORiIMRVUvVrGqpo/BaTndHRRiC45eUYpv8zSa072vZ7JeqTGtOrnswLQDbqXPTJf1h3jdQ1ysnl
	Qj3hJTlwZyBYKoAZulOvW9DVZtUIUSpc36slKZAmkaDb++P+9NMSur9T//JfNti0ueAKnoaWPz/
	hVJDdHkJQixpBALSHNw7ZInXuB5217WZRdDjNLVSwiODNZDunIGax62th1HkhURc6Sk4oY24mdH
	8Kr0POnLpeypSfE6NtEHlSGlfqMtyfsZGVhiAq4ih7q3Td6pu5KgdK96otWgGZgRqemlqDDfjGi
	JSIduFnb4D7bg19Y+kjgAOTP0RvupgVPx8T2ADjnhzmeFqBWmNmgJOsw=
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466873b3a.6.1778266958773;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b05:b0:838:af72:fb2f with SMTP id d2e1a72fcca58-83a5badbd3emr13466823b3a.6.1778266958288;
        Fri, 08 May 2026 12:02:38 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:02:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:30:03 +0530
Subject: [PATCH v5 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-14-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=761;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=DDN57pej0y3Ltf0ub6QCqNvBebv6aWZer0W3ArGFCCk=;
 b=43GoEfeonHscvF5G4ZYHZZNfYPeq/aygoPj0v3/hqMHX2/+nPmJQ3WoIzvOBrug9x+yhhPKtc
 JFr/KTQrnkQACNGBhNoUj3l1N0rXNSwZa/klt7wlr+TtOon2nDNgQDS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX4w4zqNv8OyWC
 sGvuSp9ulZc4q5pyetEctlDMAFi2VVKRNcPkPBgolAv81SKKxldm1VViomkb5q1q9CoD6U2j+oT
 6KubS6mleRpkSjqM4hPBZRGWAdPiq2g0X08kAgMu0glCZ9/LVsPRzQEaf3HXWpWPxl5p7di22/N
 HkHlN0CqCzk3mJKZiYJ0QV5/MxZyXD3v4Pa+PMGMnX3stElXfL+KrwarvvMdq3ucUbyHL31gheV
 JSJwQs+XMIW15bVM5JVPLbZy4JtNvVqCwCdIqjBuxqjFo6YZn2bMejUAvsw34wVjvRDPXxYsJkf
 W7i7xhfKaf02NueOJuj6+3Q9lhzZqXnonP+6bczNowpT9K8t58jGIcs9KGyXr3UJ5MdOEHnwh4e
 biNMvWq9tMAQO+/k5tgxr1dHzTVum5K1Qlk+7+/Kaco8zrwO/NRxcbawrLm6/QMTOxpqxlrjOZ+
 zoFzMRR0fY6YGTO8b3w==
X-Proofpoint-ORIG-GUID: _VC4-1sPJwdHOppEwUB12qyi_S1kIKK_
X-Proofpoint-GUID: _VC4-1sPJwdHOppEwUB12qyi_S1kIKK_
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fe334f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080190
X-Rspamd-Queue-Id: 8DFCA4FAE8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60955-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1


