Return-Path: <linux-media+bounces-61264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJBnEnItA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:38:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E8521620
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBAE4305362A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36523AB476;
	Tue, 12 May 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vfd6PmCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZEypaob"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D2A3AA9D9
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591705; cv=none; b=BF/T7b73B/WWJZcftAZht6qdq96xD4CSoXlcszUFz8hnDoh2VPGQFyjstIGFHXivHlQ3583z+5ooP/s6NtMGiCrcsri0ac3EktLJTHC934HwSfKppCZpys+CUUw6Wb1IqrMXQX/+FR5AjjujAR0AMYrIvyrWx+bZrLft9bPcaoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591705; c=relaxed/simple;
	bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f70jF+jxhpDDfQjNLCK027TTA4WlqewSFFMX33yL2lBRtsQlS390yEs3f2ctrxh/E7+oC3Qm23WSvujX4AQ4aio88R5p4rYE3JbmrRrT3M/F8sGgdRxwlidKYROg9oPMO4CN4mNpIdh1jNjLIfKhPg3xeX82tsp8n70BnTn05tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vfd6PmCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZEypaob; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CChPhL1410916
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=; b=Vfd6PmCBfd+Rg+jg
	6RluTjMnnwSC+KO6mMAwb1VhwaU+ETxHk1On4h29lWOAvELvVKushktz/DactpZH
	aZpi+ZYncxm/KAlJPw1z29B6OKjsifsIhaXHvJD/4QE1C2EF2DeE0mMfQ7a4dkT5
	/B8CGl7H2zDBoXz/m7NWcpy9C8wQjcrCuyYP40tqix3p2xrL51dFiXPMua2F7NPv
	ktd8z9LhM6x9Mp1/P3L4CNMP6DbqU/PNhPVjfHfdttlRr7s/LqpsH+AIPZTMPY9Y
	D/jednpjaJ9TbLescHV0RXQEF2boCk5FHCQ2O3W2OTssKsGJkP2WI9utFiLmcy86
	OEkvow==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e44f303f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312ba5c81aso3319535137.2
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591702; x=1779196502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=TZEypaobp60AKwUlPncDRpWO8xAmNnHBTZmsuKP30nLJSCMAHUNSf5V/LWmuVt7L4h
         KYQjRbRVJeQljjY0tcRhFgaP9KjOs/c0ZshXQ+IyLABO46NSWAizlCPQK07pCVF31npo
         sek86r6xjVDo+2Ep/UJcRlcfJYRVomWMLxCZqJtJS6qid1Pyed+w5DCJ65lh8NyKbWA4
         D4YStcOaTRYPSRUoLly5wehT0FR6g7G3warj143NALYfbuWUie4eoOa66nYfc4tFgjWD
         eMIdO/kmn7etx1T2ave0GVwbYr6Eju+athYCL5Jgog9Mlj1GOv6Qkdwju1KQHN2hcLAr
         cXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591702; x=1779196502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDo1vV7+IOyQcOn5Aj7RJ30JqBUruSiA9OfWyU/LZEo=;
        b=lK9fxMECRYznOsb+aPzQXSfy/ea3dq0HalF+da4Eua03lxC/0A6NPkG4o0DrPMtck5
         J3m0eno1C4CLpFo3VTwRXMBVzwjePhrscggcLcG1/arqzq9HC/ttkIV3LcoOVQNwcU8T
         r3euqhiihQ5Lq3ZAkk4oTiy93Hi8S7/fEgk15z20Af3EU+Ga2AKC84/kSoOOmwukf+yB
         T+u1x8aTV39NoQ00KJ4WPEIyZXHENihWmE/LVb2v1fY7GMYi3boePzdYHPIJNi/Saafd
         vwYWh2a4faYaiayH/S00msIxcZXFltyxXdOXdaF+3cRNAxsQvTTUqEkE8aVGn4lKYaiG
         Oyjg==
X-Forwarded-Encrypted: i=1; AFNElJ9YzuPZICqtl2sX6J54Za6WHPcyHI5Idz1Vfwfq7z04TA/Mtccrsu/9IXupiGYSH3qZtYEFpNqu3H4BCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EdWndIY6nuCpEYKRZIMA3bVjkKYOu5JMAfllFQmW/B9L8cSk
	RJTjSA6tOCcj+iJrrt/sdRptfnfZ9wTRa+N79QKrmv2YcetVyzFDjkjJ71OSgU7md2kIic8O36q
	nCxwMCBoqmeqzj1ma2VH699odKJnMIRHjnKTpBk80pKGNnpEK+vW6xhtv9ZCRYkDkbQ==
X-Gm-Gg: Acq92OEztxsBJSqKLtYspjl5XrpWRbxTs+1A4V0d+oTGuvIxVBrLWY2YJKaluZsouvB
	BzjfYn9TjpVu/Rug2Q6vZAQweQBTQJLp9FH1EHk3HwCdTcfBFIYEbHi4dWVN0KT637n1byGGtbi
	p4H84kl7T9fPbQC7uP+IpOrgdNHaMUSmHnpfXMqQzrWwAhCgje5zNg/iIT7HtWCXOSR1xJsYoFm
	9ChF126hCvQVduYDIRej8myCStsxSdFK/9qLWOEjTuV4HIERNIEWu9fsrDJnvwF0M5dckCVrx9a
	wdfqkD3od48WKod9yqwXy6JTrRH2fev5S69Jjb87AMTCeP8oujkRWd1kPG43iS0tGheKqwvwi7v
	CfyLGHJSQu33/WGbuuCV8CTrUaqYgr+5BFMPxKVpC5MEDCartTrpqGlFnDZFRhyViVqn6mQEnQx
	7YtpMQou30mlUwZWTctcWQpn4kTuMmC9y6ZNY=
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185899137.10.1778591701715;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:608:9a34:c8ea with SMTP id ada2fe7eead31-63615810378mr1185809137.10.1778591701211;
        Tue, 12 May 2026 06:15:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:51 +0300
Subject: [PATCH v6 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-2-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vngOrHkgNad1Q4pt3o1jl/qHUnWu7b24wMujj5oCGFQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM4ux+oBQwIZEZ6sAiS58J7gOTOLKiw4t+w
 A5ZjUc/POWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1XgnCACOk+6lr+9DepHGfXKgOi+V2oxMVbImOmk50sdWQH2yW2zGxO3qMWy8WDKyKFcYwDTVMGE
 bbhvZOrvJe3WNY6XGx08fVJ6nb2jJlHJ35F13lYNj/faKykaE/e6tNIjkLRALQ7x2lNuViH0woS
 JXBb3+VF7VNK2oxsNktug9TrUpq2rTot9dFilMmlV+A3qDd/4k1uRmRFiqPTyT9W8tEERKuIo+B
 /gj5V0c8PgMrzptJLAZdln8bLe4NDEyi07YLT4m+OApasGBFAQ6viNoxnKsG/vA9USyorLdJety
 u149cXE1vBy/nq6wWDaZSEJXjGA/PKIYl7BNSc53rjLpPt6m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pQy1elho1SFC-edZSF2plM5gb2rx7Fm3
X-Authority-Analysis: v=2.4 cv=SpSgLvO0 c=1 sm=1 tr=0 ts=6a0327d7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX/P/uuP8iz7QL
 gBZazH8e7kq9LcpyGJRAkFH0q6m5XFOzL5uoowEFBmaCrn1MvlFUeVdpyWzaD5SCgxEIDu7qZRX
 cOCkUcFs/ROLsCZl+PEzgv/I01GXvhZRRJe81oSd+2yCXg2Ggo6eA5+twGnKZ/HKAU327gpNVpN
 Or+Vus73sne+n4I5jXuF7+U+/LQAd60d8QF71FNZ31OBXwfmadGT+6ormUvP58foxz0UWqr0v5e
 lAqLqb84vmlTa2VtbpJH362ZWz2rpLDvlY7/sBG98kIP+R1Eb2QNtkx4F9jihfOs0txq2GFEIYn
 0gSG9/nBPWO0INYx71yODlZz3fZIkSA7HDsehSy+RSBq5kK9cEYI9Uv/bESPN79LSzWgc7AbglT
 +AT1+zeOTAip0khibkmR7qV0Ct/kcr7788C2cjWxlbM7sQFqEaZAxolcLPHmuXDBWFbqy6HSdQN
 l0c5LO+yqUcArqGsPmw==
X-Proofpoint-GUID: pQy1elho1SFC-edZSF2plM5gb2rx7Fm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 575E8521620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61264-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1fcbd400a3be..9ef6f3df2d48 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


