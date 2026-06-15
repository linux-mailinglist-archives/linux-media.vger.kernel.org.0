Return-Path: <linux-media+bounces-64895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DPGWLAu6L2rNFAUAu9opvQ
	(envelope-from <linux-media+bounces-64895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:38:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 134ED6849E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:38:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=C5bCOD31;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OBAlHkwx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64895-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64895-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CA83040DAB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D1A3D3CF9;
	Mon, 15 Jun 2026 08:34:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE43CE4A8
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512486; cv=none; b=OZifvJRVupr/olTwo69vcKaQBtINKClxEV6pWIjMVOrHUb080LQ8MsJawQQ03lfeOl3q0oMVQPGbkb5308Sy14hnbydxlRYV6s6gvuMgy+SvznLNY//qikl3AOYSg1f/tDTd1a/zdOk3Qz+8AIhNH/nSZkWRS920NwTEObZA2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512486; c=relaxed/simple;
	bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+nSSD00Z5LhQ2f3oEA8iBNg6zdNyeyARVtlbIJ2xIdJK9rooTTYXe57Lnqyw479EsZf2Q0FloBuWC2hbzccM1UtSTOU10H0Qx63AXXWPl2Uf8iadoO1KxdDTEFkqWd4fxN5JSzhuElLsZk7rWYlaDW23/tZAB0neaK45ytJSrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5bCOD31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBAlHkwx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kwna3710267
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=C5bCOD31o9X8JCPB
	EH2SV7jxXq7pOagOvmzO9qdzXMV1FzPgAgfTTe03s8GZtVAC0R4ARKpnb9Aur9Mj
	euFZsY8I13LIJlZYeBDbhlDLmuDi71OkTV/D73twgXMIEcdZ1V6Lw0ZlwKU632D3
	L4FJv5d7s5xXZgfEdhf8S6sjH+CLxMSMBVHljkwQMZirYPNFRzrWV83blw19li5P
	DOyU80Q6zRXw82R8F0SRWD4yeAG8iRcEPio1kTTpo/4QAFc51pg1ZrIWI5KKLjTL
	dYTDcKktDUTmn8TzNp1VMdYjuABtr8OKdee4cdwnpmoc7Tb+UNSj/6BuaJIeixLP
	UmDp5g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956ebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2b64850easo13180125ad.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512477; x=1782117277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=OBAlHkwxg+mXOBZOaVcETdKRWQKV/bFnpgxQScbGKAnm4XvaWRXbxAWZwjmBt6T90N
         8vokZLQ7hzLPK9t5BvmMmTzxYWphuHMXVzI8FKR0mUgmq3qV7q+l94vyHO+8EIKWzdsq
         6TrP+TeRhssePPkamqP3iAScLNTVEe2RszAu979PcKE6Ls8ZaK1+eARzzUA0RaZGkdtn
         NjjNzHIVSoERqZ1eYVe6tVHgFsrBwBLz8DlRN2MJM2A5JQEFXTxujmLV/Al416PiPOUv
         cUQkMtmZP/FzSwM5teouEfiZpUiaNbQ04LHex+w1/jchZgH1SFn2I7N/8Tnzk/5iXY14
         mjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512477; x=1782117277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=cLF17KtFCaVD+UBnoH24kUCia3n0K/fuc4IDe4d12MHJVCNCaLjma8HYZT96lqEn7M
         OB23klveV4v5w5Wqgx3gN/HjQLE+pNMutkBIacihGa6xo8aXrbWvmpLOXR7L9jr/HjEp
         Vo12YP65k0JD9tNXVChB+fh5xa1w1CxrxeVD09EcwfEj/F0YVwuQbN2Gkmj1zw8kerT4
         EeVusjGphxomNvOnxaPpyubeFpPhEziO1dZDUY+KgCbPbXNNubwHa+KBAIZdWIRFc1TA
         ybi4NKD6RFkymbOhqmXod7vMBF+ZzrESHfMaeFn7PWG0jZOdgOYa6A8vDwVLNNIosay9
         600A==
X-Forwarded-Encrypted: i=1; AFNElJ9xdexFTOUpgwPbhEdmm4f7h6t1GELeGkXnhGGeFQRikJtVATcmjCINmaMI5ZL6wBPXOdiko7c3iqIyxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lDKR/4RomlftbP5GP+ZVduty4wsrVO2WLfcDbD2zGcshUZnI
	n28hAEL3ZCee2dWyifmNRZHvUxKPolHe2P/0gz2vvr1EWijzN5dm+p730tjyhhMYuhZEL+Egqc0
	rj/Gcsfd+Z7XVomJqMsYN6VlpuNx8q29tJyNJ3N17FebSko/T+q7iT9PX6WUPV0tDog==
X-Gm-Gg: Acq92OEu1FyJIyLDu9VbtTplzsj99rjGRrIGXPRtqj5T8+igFEw8BCI7HDBOkH56ln3
	OttMI98SwzoZkEsGlKDOhXt5CdpvzgBIB9FlyL4wY+hs8IdH1iPC4ehPl6KTf8nAVA4rqJVB4qr
	W6eVC40/Xvj79t99ty4nybNdPtOIzpfRiPVKFDVxebaZspSDzZsnm5xsYrR4tmu36X8njFipKUW
	PMAJKxXTdm92ev+aQXXym9mENm5AvvbZ+0faVyLlBRoOyFrWhopFaJ69D+DuE5iJr4oOazdSMVL
	+sf7cq4vevlf3agWguuGwRu5Nthr4KSTtvKzz6HPfTk1usz9tc31RQ6kVZusD309H35lo1h4AdR
	PXZvj0iE/YkC/ec2sr8sXzTfx8WOcAa8cLHgEyLQwpHYgGwp378zu
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117854195ad.20.1781512477198;
        Mon, 15 Jun 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2c664242d9emr117853835ad.20.1781512476725;
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:36 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:57 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=/pRrOKK556VJkn2xvypB+WkA7Q98Cm4fvxRg787rFyzv9ZMhta35uNAd777+FV3JUGfvNTb4L
 we04eBxSkVqARtkFVUcK1QgfUuGB183k11kRiNV/HxlK1R5An9FDIos
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: uXxdhzEBw6rlgXO52yTk4bELRuNhbyEr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX/PTyXdf39Io5
 bUaR/t2plB/3/qcgyuE6ALBUZjHYRylTRahxYqY3/StTXz53LPC8dgcF1nX37Z0rtsY0yD7Br4K
 WoVAIYj+M78ji61UQ+/Dk+VaqwsJZuY=
X-Proofpoint-GUID: uXxdhzEBw6rlgXO52yTk4bELRuNhbyEr
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb91e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2e7cSudmGVCC
 regm9l0iFq6YEhX3hzxf5QYJo031vKkXKz43y+BbcBMG+Wfac8YX/3Dov1HRCE3KoPDAWpOe19t
 quMuX8Ao6f5oF5aDu6ih2kRvtuufyS6R/U0wgc+FQ6FZMVW4l9SQ0fPh8ohFjyqvGNpWLBacoCy
 pFs1W1ydTT9FqHsdFgnK+nY9rMDCy7KtiPW48n6rlvlRSiA8QatJ4O1TWN3CEP8UhpDwRaJKUmx
 WagKoSXt/0BCfehIV6NxYui3n2Bkfk4dGNYsJiwPzaFJAZGczSJBGNJgxLbhl4B8LqCc3bzzj5I
 xmSXF5de20/lM5X97cxhDRMffG6pYH0vnqY4aCJCyprcVYOmcKTn0GRtjXam3Q4saQ+3CSbrday
 OL8hURCXg3Ga5tyrI5bTyq/UiWb+a/W0jZ2yLkjHWJRGoW9B7vETkM2iUPkcTNmU1FtJpCzy3AF
 2BAMat85b3LY64MW2/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64895-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 134ED6849E6

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


