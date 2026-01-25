Return-Path: <linux-media+bounces-51486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM4BFa0ZdmnXLgEAu9opvQ
	(envelope-from <linux-media+bounces-51486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:25:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F13AE80B19
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABDF7304CCCB
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA06C31E0EB;
	Sun, 25 Jan 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9/uxyd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs9iLP1B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4031A7E2
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347241; cv=none; b=e8xYjnVgkpHvPNtA7VlHe2FRGUeGYgBWc8rTxXnRxrjv8ORwY3zznKnj1E6Z/qm61+zUF3i9bCEJL0ZPzt2hz1of8mW55F0/KDBCk5SeKDOm3pnCFkXvSy9SrQN5jfkqoHgLo4PpqMFAhqGBr93CRXVSCvuhW394b4hMxZjv0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347241; c=relaxed/simple;
	bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzHmO9yVWPXspos16m1vYH7OpATHvDFF8+bvOttko0pcIJbvZvY/VjPFK6Mlw5L8YKjs/W8QlCGIPaK7KKMCzeCywCBzTeK3rh35YAeLWEJuA9WmD2I+olciPwZFAf9o33YR+fIk+9342UZitZsxHaUZ5DGmeDbOxBySaXqJdHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9/uxyd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs9iLP1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P7ZVVv3020818
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=; b=l9/uxyd3r79U5lHV
	useGRrp/PHZJLBxFSqv2e2WpAs48u0iYzmQKFthgTdQisg01EKGsJZvRHddPG0Oe
	9hrWLv4kFj67dRmKRxWEyW/YKQ85cVCyP0tin/g6JI10FHmqrsIuw9goYaS5GfvZ
	1Zmt/U5iOyq8Vbs25TFy8GemcpN5Ax113K2k5YpN6CyB8gyWk1hOC3F7P0clClwH
	g7EjwSvo3ZkC5lMqTaD6Mc5by0V/T0rqG/M22BhyzZI2RVUAEJjut1rPjubKgzVA
	/AXg4np8iiGTB4ZsfLZB4zGxJperZvFa6Vy4I4rxueY3ESLB0kDCMn3dV9snDnPQ
	oGpY6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut5hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so1161168885a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347237; x=1769952037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=gs9iLP1B2NU5lsq+KW9rlMCWKfIgkUTPdCK7jYw4ezM/wbr//Mj9kbpxA/7ZKZ4YFP
         aqJFgyvZh/LWeHwCunXE1q7XM4/NYyoo0HDfzpyWw7CLmgiOfYv4X4i2DCo0M5pthD/r
         XbRUXuofzdav0dXmGQEHgRcMnd8UKzjnC9vAnm4oFSFCOtxWEttj0kbndxwTqEfkiaii
         apnKG1ccSuxMYmJSLJnhE6DpLPp7F2k57EDeI+tKfv+7Zg3g0wK06Hu8PFoRX8VTA0fZ
         4ltWxi8Ry/tvmjvtcD0LsE8iltcvUBawoNhXbzE0J2jnTSskG7K2i/NgHneh+VimE+hy
         Ft8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347237; x=1769952037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R55yhKJIM4GxZKFd/ExviBVtmS7VFYCJqkhbikeyemo=;
        b=t917FluVpqo1LtQsawVr9XW5PCJaVPm7ZwYJPMUTO/6k0bvOI+erLFuFLqYHISuXkv
         D0DrH0kyxSjuGabmfAkYb85+2zpoXWpIXH1D4LM7xHZrRPtiMXi5QQ70tHAgscItclW1
         OyFLvFOZuUxNZ9o5EBId5cTymKBT/4HhHj0jvQzLJhcI+O2iGVB04bb42pvr9gi5Zg4x
         J5He/x5nT/lodEffvxZGzV/+LI5Ll4crMRGfkBIHDkdkp1cNq1cPRL6tc+BGS28Wkd09
         ItLGAs3/mSIp07oWhn85iTzFPqtUJmhNFxzAVc54wDaKlos31Op+dW7V7IP3IdFZnEWO
         wBcw==
X-Gm-Message-State: AOJu0YwDMZwJzJQECLiQhXcg81CuXiWsOJ4hlqqUb2cIRq/iGnbNft8m
	G/pM4g73opjTLPYozN9pSRhwTuKGNy9b3VmrAoV8WbmZau+r9ulYOBh4s7DzTSmskoIuH29wtOA
	T+QwkWQ+M7Da5zgqa5TN3uqQbKF1l5bghdt20muUFSsjCb8fDt9NvsmGxjSNASodagw==
X-Gm-Gg: AZuq6aI892Qsb8iNMFGkqZ4oDMqbAYvBN5Sb7nm13kenjGVbdl415RxjHq/HkSlF3zH
	gu41sQLYOSi1U3ENT0UuShZCyWY9JuzTuBfWev7y0hec+6FjE9L1iee4C6VKC/g2N2e6JDh0CVg
	U/ktNAFiqOa/gVtBu6RaIlD8mMa4/CTHFC08dt7QaRRDuwiFCFL452IWEQ3NyCn/HlNBuCX6QTA
	wIayCB4bZnoY+j8ONrwiuEAiVO6rDVv/EqEOWn7zqcTDaNJKg0Czot57ZMhx39ucze4K2gcp0TI
	42FNVTItut862KtMZZwdv4dZCba8dsax5MNQoDLex4Db2BLeiM4pcQxwluHsoeisH6Srh/VLFPA
	F8Q5oUZjIOXyIXOpxjSwf21iGDkiC2NYz0VL2QW3dVW2DFar7ZH1fL2craqB1/GydQIKop3kw9f
	Ko4CJNUDrJkvogqIDN1Nf8Lcs=
X-Received: by 2002:a05:620a:1906:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6f95e7250mr167673285a.5.1769347237002;
        Sun, 25 Jan 2026 05:20:37 -0800 (PST)
X-Received: by 2002:a05:620a:1906:b0:8a4:e7f6:bf57 with SMTP id af79cd13be357-8c6f95e7250mr167671485a.5.1769347236622;
        Sun, 25 Jan 2026 05:20:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:24 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-7-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dIO5YayCmsnxyES+C8CIdExF900jm6HWgkVRfQodJ/4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiUienrcTdA6Os40FthnDFiLH2Vjqi5R8VQM
 99YJkO/ZvaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYlAAKCRCLPIo+Aiko
 1VFkB/9fRfbFvEBSRuJnQY/BN7PzVlpWFe0Jr2F5smb9Al018yLKuxnAbHgTJ4vFb9ydB0VPv6Q
 91UlwxyCu5ZQ6EwroPm27CVarrECrcl6oSqxNjbZuAUlECnQf/vWtETX1T4BnLZFsuITVcMNzC3
 nU7VtckMNACtVTiGzY1EUa05+c9RNJKVbp07WDeL2vBgL9q9WNH2dB/FYNEYYhtDoQj9QX6usVB
 58I4ykMclaaXlw5rNGrUzsvtNDNNVFWwQnQylL/ri42qalOnxCCKzmdjLzMS8TjUmHND6x4Usvo
 mhYzi5P4X5hsXmhtPaty3BkP/Mnr62TkjCDDub8lPZGXTemK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX6loM9Q4nhoTD
 VvhdX7BUftuUIXdu+KOacPHU2GWrrvh5TSwdBWanJfqutmL+euGFRfjfR82hr3C8Xssq2AzBW45
 3HSY/cmkIYmNsOooTMSIfZn6AagC5hhvxQ52JioZFi9hDH7GmGJa6al2REMMhSQAFx7HjRHW82V
 pZOUJryof3+9stX3zU2Cmn+hDgbIN/3fHMvbvvHlUrmK+WksZ++ZuBrv4bXaLDNg3RdpH8TTLnQ
 DjXiVFHRhrgh4P6y4pNB/66pSdGVVbwkNAtO74hWctkF8kVH4Jh8SRcplmZwG2U2zfJadbyXtBj
 zsKSSNVEqHQoZkXJaqtBH8eId/5rUGNtyo6PKvNxIsn6vCFhxfpEBWwPW4Qd+5x1ciW9ZHb6psq
 bZW3xVrL8ZrHLTDDyow9LUGnkOBgXEKgdhzhdGA+FOIhB2SDg16nZAFAtGTVPZEMkObkPCcsXxg
 Ji3hDsBmbiZ3cykaW/g==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=697618a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sbAN9nOpwR4X-TBSHOkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: smhr6faN7c8UMwYiek769FxF_nL4D2LU
X-Proofpoint-GUID: smhr6faN7c8UMwYiek769FxF_nL4D2LU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51486-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F13AE80B19
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. There is no need to
specify the firmware as the driver will use the default one, provided by
the linux-firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..79f024fd47f9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -894,6 +894,10 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vreg_l5b_0p88>;
 };
 
+&venus {
+	status = "okay";
+};
+
 /* PINCTRL - additions to nodes defined in sm8350.dtsi */
 
 &tlmm {

-- 
2.47.3


