Return-Path: <linux-media+bounces-60876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FxWXMLUY/WmcXgAAu9opvQ
	(envelope-from <linux-media+bounces-60876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:56:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4C4F004A
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6023E30BD165
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3113DA7CC;
	Thu,  7 May 2026 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQngIrc/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nsma7KOR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D033DA5CD
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194250; cv=none; b=TgWVKl9TPtnCjXytudHICb7MrL7zK3O21VFc2mrW2S0jqvME9dwKJiq8huVdYa+yI4xam2q9N04fF0n/26XL3Bnw1wcs5cMclMqjcGmskMBpiE0mOYdRA7fQVZq4RSNDWRxh/2AIomNcOo1OSQNaW1MX03xjpBorBTR8g0ZzLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194250; c=relaxed/simple;
	bh=LHNi+12cboraoNbCzpt/W6iWtyjIVws+K21hs0+sClI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kd8FmcCeGj82nPrB/VrTK3OaOrrhcNMh3X/K3q1n3h0yNvIcDp/Sq6AnDwgDq5V8No4l4pZNxGYJPbGzvaoT8Eko3UrnUiH1C1D6Fr+Jclz9jgQdn7CJkfYw0X21E3UunaLgptzbabHwe1AydZqpBU6U1eKwi0nFGDwMZloNYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQngIrc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nsma7KOR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647G315x2384213
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=; b=HQngIrc/io4BeD8i
	ZNTtsFiiaegrguhhJrfqFW/WFVa49f/NvGeqsrpbsYTbpmCKxYkdCluIH7x+mArs
	XW79CSSU67He9YmA3ncj9z9wLpwlNOjeInW4kNjhoUuhrKWXDJmu/croAIaloVf1
	7eRsys2lgrPJKnl5nshK5U7BFY2HJOD8TiuNLoCVDEgoEu4YuypDVH8vob5SFcck
	4+81JYTjha9UUxpamE6UA09JBYIEowvo+r2K1g155KTFaWYhREFB99OB+MpxU/nL
	uTyJXkn7yZmKr/BS2reSCjV//FfEc6fCYUXCCiY4yPXMAW3nOMfHx5Qoq8th6E0r
	isGHNw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwuhbbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so4277464241.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194247; x=1778799047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=Nsma7KOR+vLrGr+q/CtwlrYtpfX/353EdJlJzhQc6hqFGnu5JSTWQ5stT052Yw0Ovm
         tBWZhEJN6miwbWhLCgUxRMekM8vYU6Ojn8NLQXh8b7BN7c204chtCEaDnjYF5oEZmrQK
         4vtkzDD3EFdQheIOxBIiCawhTdewq6BXg5hyKzmQ5lPkoVZmDwJ3MvEQSvxUXKFfhO3d
         DqSLBKvgbT0lOQo/s2KUGSpwbL4KJI73Ls/a1OFuovFRQZifjCHWcdL+QAexfILsGxSe
         u76imxgcNsNrbGOLVP2TG1LgVMz5lKdsN7OytdU++jqJjip3YH8SnpwVIbxEJrqvEmqH
         ldOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194247; x=1778799047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=edJue4htj1/6yA330XjSk4emEsskraGJVNTPDwrcKdE=;
        b=P3UWN/BZINK4+SarMmgB/Ve+IoL9keNPiAhvR87hrgK8Z2lp7zuOA2Kxrz2sfIKJ1U
         teJFrmNd+iyZl+bZhWIXK9wFXnXTFw2vX6ZdHGQ8yWGQ/U/g/q+qh4MLTKptjVuArmZB
         SgehfRbrZkQqRXAchi5YzTiAIRo5jiNXI1MaOTUhVp8+GKeYgKRq6AtXN4m6vTysQ9hX
         KStLpixvZ/g9NZ/5HwjnqKK9bD3WI0g04UIoASd2hgwupS0FGxIQpwwzN3es+e4/m04c
         ujUwqINQkZtvoxiLCOdcJQrIbbJjF+3Pq96IO/WIiq4ghCFOWUIqwk2qdPyIO4qigNxw
         arcg==
X-Gm-Message-State: AOJu0YyiQMQ6D9C5fy18wbnttZWFJs/YMeQ2qJPECezKistr0SZwNNFk
	++8Hdj20xEm4IzcQJNP1ACGAyaoZCMbbTsgOMJztsy4DLWabktAjwRUSjzlfJcuu0By1vhGvC3m
	QDc+uucINO3qW22iY6z4W1NwP1NKetIth9PWJtFY3FsEnRONvtob8PY7E5fN3+gEtBg==
X-Gm-Gg: AeBDietstJWorETqTdMVq3WzVsCftoNp2fLC/R0FttdFiFgeollaKYZPLvpj+ILpD8I
	Av8I/0kIbPwtHffte5hqspF1IB1t228XWMVM8ZxQgf9ZwtRiOK04/9NVBTJqcCdEkVY82YTX8Qp
	UIEX1dCE0bBWs9nev/7V7mujS2MPw9FwDy5bSiNnkWNhL2vEPr8BlwcApTQckZwPd1lmkrmKGeE
	Z84JODInF5Zz9I+QhVafxya8+mvnE6auEdyDV6OlHdxGdxOkT+tWyuC4dpcZIQlj0xaYfyQu9Au
	pVvSyZLH78NIkis35UfAlzej51dZIwMSB+oSUblpFnNuReyY+Yb1bRcSJCQQkFy3JYC33AFK6K/
	jHLH2NH+2XaJDgdgKXglEZLr+rSma9WKRmN3GcASvvvnmgEmarjd3HuzPsCKFMhCigB5bu3U8eO
	RKZRaJaufRfPuwnHTJ
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076961137.4.1778194247151;
        Thu, 07 May 2026 15:50:47 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:607:f4e7:d2e8 with SMTP id ada2fe7eead31-63115d82c8emr2076938137.4.1778194246707;
        Thu, 07 May 2026 15:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:29 +0200
Subject: [PATCH v3 14/15] arm64: dts: qcom: agatti: Assigned clock rate for
 CAMSS AXI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-14-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: zZV4ArczwAvqKsA0FLjETcBRYAC1L5pQ
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd1747 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMiBTYWx0ZWRfX1Pw3tNcVQRne
 PlspB0DweuHPLr6TTTODwzDqTFxpIDDrjniCmcdvP2IaVtkZqwyZqYkXRB6gDFUVhei85s+a48v
 13gEu+TIkWbjQ8nrttQi6DrQAbqekiv8v9TOY/qJgx32zl/fmkc51MLp3TzusSV1Rru9fxfYMvY
 /CVBnWNs6b19sZiysssZvRsJbQTBvBos1ZpFdEJ2pmhBLlPok620ICW2DgAfyqR8zux34ZgtgVK
 YZEhlFxZ3e03mawKoGgUQGs5gZCU4B7rBa+Y5C25xMtHdNbcu+wp46jFAH9U81VmFm4kpho2Js/
 UeINXTzKY5/FdsQ6HYg2pb0qFyus25tLFKqSi3jGv5QxH3Fuew3uz9jA8mVzCZiSX9UJ9/unx7+
 iUAmm2O3REJf6m36vOeyYwociRzcoRzGf1a0rXVKVf0vnzzW67PrbG0c7gvbgUyOcngMnXjMUhd
 PghWgNBIRHaL3btxwzw==
X-Proofpoint-GUID: zZV4ArczwAvqKsA0FLjETcBRYAC1L5pQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070232
X-Rspamd-Queue-Id: 2CA4C4F004A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60876-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,5c11000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Agatti, the CAMSS AXI clock is not managed by the interconnect
and defaults to its lowest rate (19.2 MHz), which is insufficient
and leads to throttling of CAMSS-related traffic.

Set the CAMSS AXI clock to a suitable operating point by assigning
it to its nominal frequency (300 MHz) as defined by the specification.
This ensures correct and stable operation while leaving room for
future dynamic scaling support in the driver.

Avoid relying on boot default by explicitly specifying the expected
initial clock rate in the device tree.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..6a6ab3f15c49eb1e8150f57198ffe2515fa9ae52 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1884,6 +1884,8 @@ camss: camss@5c11000 {
 				      "vfe0_cphy_rx",
 				      "vfe1",
 				      "vfe1_cphy_rx";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
 
 			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,

-- 
2.34.1


