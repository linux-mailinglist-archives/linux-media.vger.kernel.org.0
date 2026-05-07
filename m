Return-Path: <linux-media+bounces-60737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FqrOMw0/Gk2MwAAu9opvQ
	(envelope-from <linux-media+bounces-60737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:44:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF14E3A11
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2B1F300D776
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC81374E5C;
	Thu,  7 May 2026 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/ckaxo4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJEo9JQX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621B36BCDA
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136167; cv=none; b=W/6uHcHqH0UqK2bUUIKFKnrTz5LWAjy5uTJ0lSrOrXa2Po/onELmLxdiVP6XklJ/4IO8LuEyxxhxaow1IA0sNlyUdK8g8bhq7K9InTSGrRwK8F9fnBAp1SQGOay71xrJoX7+E0XlgOicrWJO88sRBnGl1r7jwmPLOBsgl3m7CD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136167; c=relaxed/simple;
	bh=UiyU2L5PBRVSZqnioCJ8UBKUuINJuvq+zilFpwfxTpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqTM8eUidjyOF2FeKowIgvkTb2DTumFbFZYYkKvzSXLmtHSU256CQdmdiGP2aabzoo1BBmrQDdhvLm2PV+gXjx5WKfD739o48CsYp+Yjjb+X4sfsYZMb1dpIkWOfLam7Xh1lXfdhgTYIMaMH5wq0k5AxhWdcEw+0UCTbPtWhtyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/ckaxo4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJEo9JQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475LJHj1067867
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=; b=i/ckaxo435Lj1oP0
	fDNU/DOx4i5czp5xdt13JD/s/uJC+kyt5L0MWKucgvTAnPFLaJPK8vGKXhKST5J5
	+W9P64RHEcyxCvVkgsWIxAVsddsvjQ0vHCaO76XDjvGM+x+BqwF6aEt1oQbFOF9o
	3GSopI5+nnGWWH7RC/A3uca1iVaSHndmf5iKyJggb7m2qUdbd4X3+mDuCItixCsc
	81isHHQ3pAzqorS+X+KPnMPGgW3JR+IQh35p2pROSEzyeimpF2XloukcWGBp1gEF
	7TCbHzO52navw3mYw1PFkfA59pZt36/vOWSexPAoNB7C4S4FyD4i8xy8/bu9iTVk
	dYEG6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mh1890r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eaaf673eb4so142999485a.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136163; x=1778740963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=MJEo9JQX0m602umPJR3pqx/WFDfXIDo+4h21hRNi1IUBxkaATFqeh8WWnn7t5gnm4H
         fIlncurcPfmZ3ZhwrQcGrfHTVLxWXJX2a1l7hBkiegvBiyB77+k0jjp/WrCiT0kanPpQ
         Z6Et7R+2XNccuiKXlE8i9syTNmdzGu3xtgMe4tJrYjo/g7rd27k6vfRbBYdYbXq+wodP
         9W8ZWzn196OlL5PR/1gpr+ohe2yq54rwbR536RGxrEmMk/rLGkNgcm6nVrOhHtUWfTLA
         zs02BTEVT7Xf4yKjvZRzZO7yfEqe3JRocZ9cz88vETLZ1DegtjijSiVhYY8+RDu8zvpe
         OYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136163; x=1778740963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uP/7DJbBJLezPmijpydT4H32rrWZ8zWH5pgO/YyQvYg=;
        b=sAyiR/VoqDHZYP6bvOlmMlfu1x94a+eCbGXMbSSvC07FjAcNPWm2pr6XGLCS/AlJj/
         Ykh6qcF30oFI8DwrCX0JPMhgyn2oTMlMAHvrDy6OmUc+u3aJnlePOoBHIYhC6KVdvVxg
         NgMJVQoD+XBh3NccVqlwt3mWut7ODJF0Q26Brlexp5ThK4cqJCrorHpwW8hX1qrg7THN
         AZqUkiPIsVhAZnXkjAV+XRMupdvMSL4bRvjwzjSN+TOq0ieknINcg85MRCwzPuaxpn0w
         +yvm4aPVVCwm2MPo6Huis+aPt/actEFPlucuFiPxp9oTcWNNi0I+Av+Tw9dbJG3gzvGX
         2ZFQ==
X-Gm-Message-State: AOJu0Yz5W/ifmfkxHHTp4P/g+zwFwWTuveeHjG8jrajNhA9Ve8FUZJE2
	0aNcm9yyMELDdjEOGugiH3RRyxBQNPURe0hAq6C5C7VbS0RO2LRGav4nkKSDwkNZUF0cs88nf1T
	nZXC0ivDxrIg8Hmw3GhEezOh/fbzAKcYEjcTulDYM7ue1FvcIu1n5xKLzXbcofIyFuQ==
X-Gm-Gg: AeBDiet4shY538OswUPU41w4NqfNvBmJZ8ciRSuFjbsKL2hb89xqma/jIDp03wCvrEi
	MtxyJLVlVmS2qBjpduj/rq8BXRALq89OXlKs9Blvg9IUtxTdrCL4lyS8TFPecukmtk+hUdEn0+t
	W9WBniXCwaVrsPJ3dhBeigwWPFJHd1zRXFcsGwmAIXXjm7xheLikL13ED5OeLr4YvlE6I9WfD6z
	QzPyk13VxZnaxO+B7P1Gt45h+kCbMTNWs1X1DwCEzajl8phwbteBzLm4wzp0bW8Xr7m+iJKDBr2
	j0u3iuIXFhfMIVn1UsQgcna9iFGvtsP7WOhWmdbGeWREyhAd263/QOTrY/RQhXHMSu4XcIBbIAQ
	GFPbGs4inGngRunh9t7ptQneAskYdnTefXZQnoOtJMfYE8UCHh4ysw8GEisv+ENxW6DEGSOkrpg
	L+nnNAZWwziby2Ps/Cyy/aXJdzr6+2B+PYLIBSVXg0FGELHQDxSmkR6dFq
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725911cf.23.1778136162831;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4a16:b0:50f:817c:5d45 with SMTP id d75a77b69052e-51461c28aefmr85725631cf.23.1778136162356;
        Wed, 06 May 2026 23:42:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:16 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=986;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmRxEgr+Nvi2Lw0QP3FluQa801XHFjmueooI09g2R0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/Xu+8kSqxX1D/qHs5fEXFlfc1f/wFfPghu
 /LGQY++7WKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1V4XB/45ZlAHeOn97WZC3jPb2WpiP1oqa4VW0qY9GdaVUo5HSeDsPkaJfhU3+Ya0a8bTg5wcAAz
 tx6lV197e8QI/hm0HhUpv8leK4ZJfqthPjBRJ35sTRKDJlXt/SVsYX8Aak07PUynBdGDp6uQTln
 wZDrd4DtSxaZAAg8OA9zEfHNlym9gDxl9YkFCFkvwxlGsD+ME0bBoOtPwdaGhGGGCQYeuhHuFnr
 S2OxmT6g26w65KKyhFAM4CnbhH519R+qOhrRvDL5aKYrqJmL37jVYpQ7eWQAYYgROGCva1JSDOz
 4mIAv9g7X0eYe0S1rmFx+AoU4WCbOEnvD7i2P8KtswP+J7Zl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3dHCfmU4pfjZ4aj-Ojm2GH_-xBDHVK7I
X-Proofpoint-ORIG-GUID: 3dHCfmU4pfjZ4aj-Ojm2GH_-xBDHVK7I
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=69fc3463 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UHPahDyPz0TdaPj93UIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX8ktVrXPmSlaq
 hT1IeJ9OCCjK+J/T2L+JdSmO5MWd3bgm6/rRHdW+DsOFRT9eBnfBKTqwwRNH4RU9brb/FwnLx9x
 Kzcht4Lc0xaDtJs8/yFkmDrRZar/qK2qkHq8AXi6+8C1kSCj5kmRg5KVTrWiTiZPDrTtA+0kGJt
 cKzbbcm8de6wEhdgUtD4Jlyy31C0wJkkWVbX4FuW+cHgv0bzQnzJ7C0meLLbFNJjtmH1kJzdLLp
 bJZALJ/qjZGSLT5CyZHXgn4LobkgnXG0CQCMuYBzKqja50iqQbCcxzmoMLKfUMie22PX5KACNYD
 orNv9krTrpmPIqwEdmsH5PKAJ13BjCW/WD4Qhjx5Da2RFf9qGNNKw1nnZuRaR6FJSBr3F8cTlaZ
 OWBKhqsWOk4od+Vx2xAQ6YrRd7zDzYIA7fRB57OqZB4o0Fztkpp81ZIlnzvd1Wvt/ZUa7IMGE4/
 qW41gZFxd99L5VcgvPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070063
X-Rspamd-Queue-Id: 93DF14E3A11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60737-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add additional OPP entries for the Agatti platform to support higher
operating frequencies as specified in the hardware documentation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..fd40aa59878a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2455,6 +2455,16 @@ opp-240000000 {
 					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmpd_opp_svs>;
 				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
 			};
 		};
 

-- 
2.47.3


