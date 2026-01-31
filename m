Return-Path: <linux-media+bounces-51901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOWEOkw9fmkvWgIAu9opvQ
	(envelope-from <linux-media+bounces-51901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:35:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC520C3470
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25839300E0DF
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 17:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB8D361DA6;
	Sat, 31 Jan 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6m820uO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OB8kQSMC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B2F360734
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880846; cv=none; b=socBbiYVMq8sf0FvUhshSNM52SXF5ipsMeWvdNUqkDODbGazPLaVjc0wUiGzl7bAChonGAqccgNq0jCHqplmsjTJI1Aehd/Mzc2+8Atwvb0cY1vBv0YjvCALBYKa2rT4jWHu25UPXtc6xrPB6lUnN0pDylTchzNPefs1WFDjh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880846; c=relaxed/simple;
	bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMiPLJq76Q397zGlsiwauTOd73Sm3ubaScQ7IjG03TVcJvHjDEK8dtClh+bZcTDUSwVQ75rg+atFOWAhH2wI7/g4/5xknQeSLpnmkVQBaShqTEHIDi4AHus0aLZRhjsRhAzC5s0nO9GvmJ6Xs6d+2Yngc5f9NTGTdIY18TDdjgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6m820uO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OB8kQSMC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4SrcX3956249
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=; b=Z6m820uOoVDRQPew
	WAq4x1ZVd+loxuvHT9KKogpDpvVbLXQitnvoYpBtmEa6uadzeRhH97EO4yRZvM5t
	E/ljoNXulQR8dM03tdMB8v0uPUB+4iV09uNvNP5XG9fO8sTCPjdEYwuQZeCzr9EJ
	H7/krzzSlfJ2S+3WjBehOFXcMbUgDij4CA2oz1o8b+ps7Dbl8f/7Sh3Vyw8oiVpl
	DyoXiRdeMXAwbbH4LZdZ1XddvWjE/BXPS/6NICdBByZ7t5uUgMSjktovaPxMo1vY
	VBRVLHzQtplt49SjuWMj1fPy1EP+BYGXPJfVPdOltlu0+hvPDCE6Y7wTDk4COqxi
	6gLiuQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are976v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9483c030e3bso10532692241.1
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880842; x=1770485642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=OB8kQSMC6Ky7Ey0FnrccnXuz81sqxKqueD7TW9Ch1+EyiAZzPPWzz3HJ97CUGHlDMA
         0rhA6b3iBAS1kn0s1ckMZ7EpGJ8N2LRx+kWc1mwAcSUgKkSGP0JJNeverRqd25szF2tf
         b+60kI9z4867BJrswXr9vyhsEDtdGq0ZSgZri8beiHijCj5HBn8nCx+P+Rerr3tWb27c
         e1TB1oRBrlEi+NDVeTg7j3T13iJGMvR5/+IZMw4IjiRsAr0f0AiuJJcHQN3aBrg0IbgI
         emntj+RGT+1L7M/HDumg/6IUBJDcrsmGZMl60wN2AKiBdym+xCEKez6COmfRtydiKww+
         75cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880842; x=1770485642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=GrVdWkjoCW9+bfN7yofErd6ifzuA85Ub51Vc896P2mbqT64NfUEDo0A8mjqZI/2e0n
         whrC+WCaOdEGVtnDh61tFUcpN+ZJEOBrxQsrXaWqGBTM/5MPOAVkktydnb0FQSRQ2+3I
         M0ODjgYMG3o5U4EQBPhBMKBTtB8RjgGJhAsFjYChD07bLf6W48whtREcSgBHs8BHjH4/
         OMJHZbbESHCfHbpSM+S/NRVc4b5U+/crjLvBclJEiEkvh39fEsyXjVgQ9GPkG7TvAfMj
         KZqGvWoa2qQ4ZBgZwgh7EJdljGfabrOB6gRMl6SIR4MpGBqKgW/91gpcS4VHB2Z5PKvE
         86Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWF0GZp0Y55KHRezg3+6kGJJ3UnT438Oan3v2s0xCWF8tUriRausufZEtLf9lZtPMPRQSVpOknC9INLXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFttzkdudTcKcey/b6yJ5SUOpYvzNHMqUTWJuFioVqkWAmM1/9
	PqmpcElKZ26J5lu8tmVwfikIi6HD+9sboEQBd326V2sQxiEG2zVIyiHpWs1lvo3HufwZxq8r+G4
	52PdhNkai7OhmzwSL+xYU5AuzDGXWoholEOo2Mkt4lKsCFJ7krpUNsSpVshlCn7ruHg==
X-Gm-Gg: AZuq6aLqv3oWKPoC9yy0myIdAXlLk01LvI8T4AMZaagaqc2HMXtEdZZJboYuLa4MjZc
	CifCRqxPJb4X0SO7TipmuHrEcj+0FI77cJBEkVkLbBOA/nzXaaT1Nclp3NY51M9mE83Fb+OUCSI
	lQ6Gpie5MjnMTfeLkkWvnrF9UBKKy6eCz92D3+wqv7IebqljNVe0uqTB2UFUtFKrp1BzOCzwuLV
	zZyc1IYQ0bx7mgnUBfUDKHC9lOAYWShsMgwaBPwhdv3Gqz8eF+bR/Mtr8AfUt+AEHjsdiDyOpQE
	Pb7fStjlINTVHLXdCwmKTsASiRcwOwU1akhUEVePBcGdVFvzBq9UlDHxyBADnM8KeciWRpxh0Pz
	3nkkb/cVOf2bO19UIuuWVgb79IsxUKwIKoLyGvd6D9XoZQA9DXFj2VTIDM7GYuwhPrgogkB46Mw
	WwC3HLuZgdOuJn8t8rt5zIp+4=
X-Received: by 2002:a05:6102:c50:b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f8cdbf6decmr3348390137.15.1769880841996;
        Sat, 31 Jan 2026 09:34:01 -0800 (PST)
X-Received: by 2002:a05:6102:c50:b0:5f5:4e0d:2046 with SMTP id ada2fe7eead31-5f8cdbf6decmr3348378137.15.1769880841606;
        Sat, 31 Jan 2026 09:34:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:34:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:49 +0200
Subject: [PATCH 7/8] arm64: dts: qcom: sort out Iris power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-7-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
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
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/c17+bd6qhjDuDDyzvSrSs0Hej9DaCSZ4+
 EXTo6V/zC+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1R9JCACaB4CLTA3yu35nxhYP/dRbPYEyYygXz0L03fZeu5cKmKY2gQl8Y02bB2Wj3lqZLMwnn8l
 5bgpZpxsazZ1dw4cO4OGMunK8pT/Tm54IuPnSdDnvk91o3tqLRwtMtBULAgQFmLonk33fkEugHF
 DcDbiuKRuZtSF7t5EB5uHjPqXSdNubFHT4QOl9Xc+Ec3ric7nKRxiDGHE+aJNzsXzUe+oZF0BPr
 fZZclIeJX9R9hWhhDQf5oYQL6+mk1fnDcwBOnpX7tTFOAgLeuiBoUzULgzeK5bwdJqpBSchWLLm
 zFRIzOPzBIdYdzC2PeP4RwBIsB6wdhr8IRQrpM1FnqOLhZFh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697e3d0a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: ou2iwidYfvcIaJROxKUCJESO14BZ4bvb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX23BuOFpsA3w4
 cwZLrMcNrOM/2iAsWtcd8UBjAuFs128JbQ2GBB2gUALFfmeSILRSsm+N5PjRMASeLuNS/zJy9B5
 tjfBBFdj3E30ZnJn+RJ7jrpAdpxeadxz3nnUWTKtQkmf0PPBmekTY4E2YMYVolmL9zILr3htJPO
 y2+QNt8tHIJerX/rIBJC/SdOmWYJONxKOV1yIlnZfjnbINexrMsbsHqsCRCTKjPW40gDLxi3bB0
 GCX/G5FQiE+8MsQrQjmpKwSpeDnlSNnVcjY8wmJv3dwVd+8FHw/X1GW1ahrLvk8Xza+7A8Q35NN
 31nfc2ibXP+ALLy86nRoTPNkdi8GCuVeZOjlWk3kCcADCKCK1J3EFfQHoHhRZY4Stw4VMZ9q4OV
 sgC9/y8YhTZaIpUMVajVcHDKyaHkEp7FP8ZQftHtVyqT+cyCJFJt4aqt3IhitvwX7SWSaNFcpY0
 cI8TRaUqwsCoqpCukCw==
X-Proofpoint-ORIG-GUID: ou2iwidYfvcIaJROxKUCJESO14BZ4bvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51901-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC520C3470
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..531470506809 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


