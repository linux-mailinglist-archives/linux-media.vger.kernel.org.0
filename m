Return-Path: <linux-media+bounces-52151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PydEyKagmkzWwMAu9opvQ
	(envelope-from <linux-media+bounces-52151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:00:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAABE02AF
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EB7530579E7
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F8123FC5A;
	Wed,  4 Feb 2026 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT2Q7ODv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HEeP7nH/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7E23AB8D
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166801; cv=none; b=hWu3lCg4fRuW4CDfDNXcYynXEGDnovLNSaEgtoDQ/RZHfgKHGizfiGWwGEm69mrI6wnnjzhY8ae91kXlC2aHRhO5vs5N0qYZf7q5Tp0/SXzCd7+nLoB+8BLZR8zdmUkUKdH4vEMWsLBOQxRnkyc6C2r2vktAGz0T5br8ETt9vFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166801; c=relaxed/simple;
	bh=NfLzmE5xWwA42fboOATaUS3ihgAtr6cr7dapV1J0XF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+3e4vMguvQTRuxjk/V2LTInt8GM/nOUZMoXu7CCpAKDsSiW+op4kpoRW14i/RDp9nL+MzvZ3nl0iCjXXNaZSA6JiMwITX7IXgJ4AuldSjbSXV/oMeBeWh0MfEnmwCQAjVNnyDQdqBYkv9XmWSQNa7JtDLniY/+MaI02ToU6bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT2Q7ODv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEeP7nH/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613ImOqZ3824271
	for <linux-media@vger.kernel.org>; Wed, 4 Feb 2026 00:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=; b=PT2Q7ODvpzBAdVmU
	EScc9i56eREFS6WbsbonUBddpNTAhI9G14D6wBcrwwqlUerIcC3Rmb+hndgloipN
	Xy9j1ttyssc9lN7r5/L0QLlPsTw5hemKtVs25VmQOGEuzbY6W1/LOt6ylPUAmWJh
	YEhuUgyDgHRlYcQAyk8JO/lYYTGjM2YVxNV+/O6J1jQq8KFyQYVnbpocHqNCJXzc
	PL5V/aQN8Ig/3qwImMRuWWnuUUIU2bPVEi1TkhGx6/8T0PXf3554T3p3cTC+5iRy
	XYuRlFXWvMbEOjQQnmB2Z16ii2qfJuth4rytzGw0HqUy95nsHW+hGDAWLkCdwEOI
	rQy9dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33jgjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 00:59:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c711251ac5so1760301385a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 16:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166798; x=1770771598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=;
        b=HEeP7nH/oDld9bXhI1Bd1gs1NVf0BPeXGUoXHreYAp6mYZvRgRWkTLTPgkJWCk1Wwg
         7tlhLjXlfMv2+rVdm83FN6m4jyVo/SY/7GSNZbtp610W0eNxhAlAlmSp4YbMBmvOSrPb
         a4rWDZhn94raVc9uSHb71Mkh8196kW6M0A1aFrUEnZ4fzcDDX+JJ9JP8fjlR2dIbpf1h
         aAybhgHqS/AUeuQxeWiPypLvoMMfk46o9+hHLuOMZH7IE/Mu7AdUzw/3Ahrbe09IovLM
         1zl3ad5uc2JAkx+NjsbW03Uru+ckvxq2vUiJnyJYROe7Q3//zEeOo/6+h3OH+FmnU2/q
         d0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166798; x=1770771598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cdJXOV1m+mI0FazdKoVmmfJbSUPedEZOVAEp+F9mNEY=;
        b=i582gi8UYFMTHx17L+uYdeQh5so6jVAdjMQZbPLHari72TRDweazdu3Sjvy6RL417d
         ++4sF/jPEZUUFWDsFqvbeuKV+C1GgBR/fvgS9/yJ4sapxyXgKgU2mltOl7iLFwrDyaY6
         vFPLCWffr7i8aqPlJcjQNet00ZXInH74KfIRihEDx30GVazbvXpMaE+gzIi1TnSL8IVN
         BvLrhN55vtBRIeJaQhtoebGXqnAteQCDDiJu+pUR7GXhtlvv+Xbz4dBpwLLrlp3A3u70
         nos5XGwEkbVHW3SyZ43HCMI8n3rvYf27JuP3jlVG0zUAskX55Rm3gqB43MiHMiIakiwX
         RhQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB1x3WixlUxRZgMdy3UD3f/G9+l2pIJTan+7kHVO22HsfEoZQ8lIZYADX5/AMjHnBdV5FCk6ni8IOqhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIycWAbzNIGDTdbT4oWIlrOWqbq+KOFdICQYhB4LMQAROqFTWI
	vcPqtvvs1CmFwIof8EUVzkJ6jgi7WEyPs6tIrnCKjy/s/QmKv90LJWe6KFuDJrVRP1jGGgEuC91
	7ffhO9Gat4V2KCg/hvq+HZAihZidEjE3uJZL/YnP9Vohs4+VJPWwXKFe4pLcU5XAIKA==
X-Gm-Gg: AZuq6aKT4I+XYTDz906XVs7+V7YZY47GM6mwxZuvqluODBA19C3JDRiy8pdmVxclL0y
	B+kmbAUmgeO13non6QBxW5Lj9oWw5Lekr8CO2EAEU4vGWnaB15qf0eDYwlvUy5EKFIdyXyXP5UM
	ystPmRwoTkV20+OWnFmLB9bKDl09NJBm4kXjsqck9Vti0H4py5gmCm374Spzo3YNXY/HHVCgU6a
	xZaRQGcJYNAUrVBmRSmnVrdjy6sB+VmidMGh7Pn3UOdxlJwruR/xgAeHsYqDBIFUc0N5FgFr8/1
	AFCAZQBFbA+uzw22q29TqYFtQvI9dz6fJQaWndCjlncVwwOnLJZ+Hb+9/lO5aj2U7FFEXpI8BGX
	aZccACpIyRjh0uv/dfVC9dB4ErsHpvsOtg8WkUSNZDp7hAflwDYBbFLlEpFZg19B0CqVJ7bohS1
	OqYmspihEgdYvMIEQSfbgsedg=
X-Received: by 2002:a05:620a:2a16:b0:8c6:a848:71fd with SMTP id af79cd13be357-8ca2f846e6dmr193270285a.27.1770166797769;
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8c6:a848:71fd with SMTP id af79cd13be357-8ca2f846e6dmr193268885a.27.1770166797264;
        Tue, 03 Feb 2026 16:59:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:59:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:49 +0200
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom,sm8250-videocc: account
 for the MX domain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-1-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4671;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NfLzmE5xWwA42fboOATaUS3ihgAtr6cr7dapV1J0XF4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bTLHbTWX0xkz0MAq1qTj17rigUl56auSrF+LXQr02ex
 98rxjzpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEmCdzMMznzZ/y6cahMtnC
 pxv6m3i+JOfUOx2Yy+TJoZ8V/ir3aXqF14d5154KX9a33F3As2mRNPdLH/mtYSV8Wml8TBYyOxq
 VJr2/cszuNLf8PJ2PPNNM2eVPf428KMV5X/rg7ocmyrcUGvSSH2060NTL81+X0yVHOjm/butOw2
 KJiPcvJzJ7LTDrfhP8IP/Qp1Qz94PvWxZcWfFvfrm5S39Nm6Ku1i/OvGCHRWcNrnpW9efen2QRU
 d2RwDm7W5Kh6O8D190fWl6ePyacZy1voPBO/I9+y8T/65U3TNbLn6jZmBe9J8nj1oFVz79MWtj0
 a70Pt6mnocZTPp79WxxLM/RqvzUKrJ86TbhoueUruaDJAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69829a0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=YnufBIW6yfzn90QHPNQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PeAh02x4pe_KRbHaI8ccGWhZvFc1Hc1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX9ORjLDp6/MdH
 YNiSEAQ04JZWs2i003WG6iNMmlC2eJbyBxb9FHixXYpZ7NS+fQ9vIOK9SDg/OcWVgM8nYDiY4XM
 q6/eErnXgJErwe2w6Nz+El/uZ3GipdoKGhUBu5WEmjv2bPSdXN0+O0+KHGs0fH+cKPehJHudiqj
 bfhyFI7HdlL8lXH5Bx6Qmipf+MMNiRV3PhaBrq20jdVJ0IJxV8hR3RfeEI2lfXLgOaFeo6h6SGT
 H9PHdnERB+apHLJTi9JQUE0vf36uoJE8pRM/JnKkJNd2awSRn2t5c1ZtQcu6298Zj3cea5HAVWX
 V7gh1TKJqz+3iStWjT/vCFK31ASurEnRyXRK/tFAjvilDbKv3cQ3MtWFZlTX1emmn3Hab1HAa3l
 B/4R8fMCybbnbdrpYqhxAX6OrC9CCmQtfD0/zn8n5uucB5rqWkEAiXzwmP3am5MFAdZXbGgRnbf
 4qQEvBmp7V+UnUy/cOw==
X-Proofpoint-GUID: PeAh02x4pe_KRbHaI8ccGWhZvFc1Hc1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52151-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,ab00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAAABE02AF
X-Rspamd-Action: no action

To configure the video PLLs and enable the video GDSCs on SM8250,
platform, the MX rail must be ON along with MMCX. Split the bindings
file in order to provide separate file utilizing MMCX and MX power
domains.

Fixes: dafb992a95e1 ("dt-bindings: clock: add SM8250 QCOM video clock bindings")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
 2 files changed, 85 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
new file mode 100644
index 000000000000..341d3cbb7cbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8250-videocc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8250-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also::
+    include/dt-bindings/clock/qcom,videocc-sm8250.h
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sm8250-videocc
+
+  clocks:
+    items:
+      - description: AHB
+      - description: Board XO source
+      - description: Board active XO source
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bi_tcxo
+      - const: bi_tcxo_ao
+
+  power-domains:
+    items:
+      - description:
+          A phandle and PM domain specifier for the MMCX power domain.
+      - description:
+          A phandle and PM domain specifier for the MX power domain.
+
+  required-opps:
+    items:
+      - description:
+          A phandle to an OPP node describing required MMCX performance point.
+      - description:
+          A phandle to an OPP node describing required MX performance point.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+  - power-domains
+  - required-opps
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+      compatible = "qcom,sm8250-videocc";
+      reg = <0x0ab00000 0x10000>;
+      clocks = <&gcc_gcc_video_ahb_clk>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>;
+      clock-names = "iface",
+                    "bi_tcxo",
+                    "bi_tcxo_ao";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>,
+                      <&rpmhpd RPMHPD_MX>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f4ff9acef9d5..8676c7e22b4c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -19,7 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,videocc-sc7280.h
     include/dt-bindings/clock/qcom,videocc-sdm845.h
     include/dt-bindings/clock/qcom,videocc-sm8150.h
-    include/dt-bindings/clock/qcom,videocc-sm8250.h
 
 properties:
   compatible:
@@ -30,7 +29,6 @@ properties:
           - qcom,sdm845-videocc
           - qcom,sm6350-videocc
           - qcom,sm8150-videocc
-          - qcom,sm8250-videocc
       - items:
           - const: qcom,sc8180x-videocc
           - const: qcom,sm8150-videocc
@@ -128,24 +126,6 @@ allOf:
             - const: iface
             - const: bi_tcxo
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-videocc
-    then:
-      properties:
-        clocks:
-          items:
-            - description: AHB
-            - description: Board XO source
-            - description: Board active XO source
-        clock-names:
-          items:
-            - const: iface
-            - const: bi_tcxo
-            - const: bi_tcxo_ao
-
 unevaluatedProperties: false
 
 examples:

-- 
2.47.3


