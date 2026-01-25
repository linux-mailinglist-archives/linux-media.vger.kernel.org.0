Return-Path: <linux-media+bounces-51488-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPVWEwgZdmnzLgEAu9opvQ
	(envelope-from <linux-media+bounces-51488-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6B80AB8
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0D40301D966
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C02B191F84;
	Sun, 25 Jan 2026 13:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhZfF1d3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPQNK8XL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ADB31D735
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347251; cv=none; b=nLpAgKz8zk5XrCV4m9BHPj8n/ouDsKPCCUqUzZcwRyNNf3+2OcxQq9+eSsNvJSQUtK7eWXO7IDQ0QuRaKytisVXQBRI2bv+gBBRPLADrqJdoduKnJPDe9h/jv4tlL5MBgjquEreQZCqclMqUeCJL7nhjn7dATrQAEoeplDynVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347251; c=relaxed/simple;
	bh=eMPPp5QdHl6l2+RHuOJrKXZ3iHN1D0E9GpkssxyQIzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rp4IEUMRRKS0yYNgmHvj/GYvtWmpubPwJGZExePdNx1bEbUh1yVSK4ETAPNz7UbFzBce6rqRpMnhMDhQ6q5aMo4aXei4FQftCFsoAuyHTJxxI1JuCmUevk49g9X+R9orVHbgjn5JR/iM031Qd3zDV6HOQVWQ/82cDzyPRXK6X5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhZfF1d3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPQNK8XL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ODhQMM924060
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=; b=GhZfF1d3DRcOlI/u
	o1a5HpEq+ZqJtySY4a4YxUhmmDGmnhNg/NS0K1bdqrc67vUe6HpRv5lnMP7Io1MY
	3/toM9qVsDMVcW6VuwRTytB4XC6NDK8yav5ewj5yjpuOEMajTUVxdppY04QiZx8T
	h11MC08ZRREE8dRYkFBIG921CZ2bWG1czIBICRMe6ERoQUVF7Im+QdeXUsK56HX4
	rY7XzntafdMq0De/LWh8xkgpP1bacDdhtrdbUow2xxNNBEJWA4oVvCTOzRsZ73fM
	vketmLVLYhNP4QHfup768LQXhPSqvw6Wg+rjgo+v+Zd5Bsr7+Bq4Z68jDvez/Mv5
	l/kIiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut5hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so1641767885a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347232; x=1769952032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=OPQNK8XLvrXtkAyWAYMEsk2acTNkj+4j9Ri0OmERaKrUilimAzkwtFysQSo/Ciz+7Z
         2TZ429Qca+tostr1x4/FEtRmGEUdTcmo5sK4AFfyJe27M4WGo9NGdAtE3aWU29y6QmsE
         kidri4XEP2w1U6p6urw/dUMfllLQsg+Q1Io5yQTXMbhFiiimQEdPQtAJoRziqFfM5k5y
         J9VarokYbftFMBHcf0HK8oZlapiY4vzpVkoQhMquOWVVke9+MKwYZimkGrh8Un/pXiHE
         WHAsNM4bunpEAZzcURFB279QbbSit0AHezrE4VbCA4i5huH6tHQhNEQ9TjN3DjBvtiFS
         3OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347232; x=1769952032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=PRQiWQkr52mQQhVukYrxD61SofMHPeQBG2Fr/wtucrefGo2Q9/V0npwuILRhovpxzm
         RvPEmNBuLQfsYImTHYD9PvJJkJU88oZ37EMmpNEf5vmfkKcVQJNL8CLcCvsEkkHs3CQj
         LR7Vb6nL+w2JehOBgxbJffIrDZLkQDB4z7SKNrUBzGe/OmTWAPZclsjEZ691VawXo5OW
         Q61SeunmnDWoRFqhaJGxb6E6JkTWcDq8VfTrf0rFhkYY9vlOCt97kvj4C9e3o85uTGgM
         hyobB8lwfml6hCgUIHTUv9MdlBuQ/NjTs588GlFC7UjIXxhz0FPHqYz5JY7mkOaI9BF+
         Vl7w==
X-Gm-Message-State: AOJu0YzGCEDwKlEDhHS+Ypg++kWFL6HVsg2qEr5FA7mcCWY/6PTtyedI
	v3bXU0dpOQwLudZgmii8tEjCyARytTHWgoPGPW7OFB8MFLv6eEA1zpXLpRGyehvRFcrl4+MKuS+
	5oWDHIxWVK/ldNIhEDOoEjJXzmIxCtJwhag1pmaau9wcWOXPl1gETqJSZnQ2bV4B53Q==
X-Gm-Gg: AZuq6aK73Ktr9LR44VbZ0abkLReCpFcunAJcIyfp/KADVg6h6SB2bnvz1Pi8ieIqDwS
	d9NPldyyfyHLCr8P7VTXMQed+D7pgUaNGoUG2RRecfNbbZpN/6GBT61hCzRenxxOg/xWtTEtq2j
	T3UMmiIdUxT6JBIoOvsKVRUt/QgCQAjyb1gHY/s1WLt0alMlNu/EK9df6ukFeI2A4mXhZcmG/Db
	gQycmk6ii1GiFJ9TjzqIDBJpM8diQnkLFumX7WqfoI/mLz5YHHjNDHj3XnI/OUykQtZQBqoe6Cz
	GI1krCrbdVczWH8Vp6d09y2kBK5V37hrR+yuhs7FEDQv51Vh94/RAYzhfum6TSdqSnbDfr7Lltm
	e4NlftCEby2K5KOW0/Q2sXPgAXbdOzq8j8UtOKgxGBn3mxpXcPmQbS9QBOU2BpAMCypPCYhxA8p
	mV+8rs0oicNPUkmVY9jExj4Pk=
X-Received: by 2002:a05:620a:4012:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8c6f9622014mr169198885a.41.1769347232245;
        Sun, 25 Jan 2026 05:20:32 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:8b2:7435:f5ef with SMTP id af79cd13be357-8c6f9622014mr169195985a.41.1769347231737;
        Sun, 25 Jan 2026 05:20:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:22 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-5-2c5e69fae76b@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rkZGIV8zHoppbf8XaAIcqSxhBd4bGzlkBwNa40cVeqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdhiUcac2K8t68PoW35MpHHGslGoSTOG6uBC8l
 3pCKI4JUCaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYYlAAKCRCLPIo+Aiko
 1QLrB/9Y3B0jK6C6fnSS2qu848FxonrEw4c6G2CbrOYLSuiXBWhJi+CgPTq3+h6D3qLjy2CEj5u
 +lNd1uD/HbpDWVEWgrU0Kmlxrhz8B1CLrJzm1vUjAF/L2sG/hk9zdYKdlvVxeIw/OWIrF8NTQ/M
 yMmwYzb3eOHJoMVGWM2lW00W07GEvvB/iZRkp1KVvqtdriY7cBtL7swnGxhmGgfEKLEIF/xJ0Ms
 oz8O0rLZC18sIhkuWWr1aDIiKMcqlwwbOXT7HarydERwjSmkhvsKyQdCptH7+7Wl60yv4Uq5sMB
 TD5MfoO419oiNx0NMAv/MHn23XqE0wAZV/kCOkS+EcOmoKEd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX1SfHB8/aYQC1
 YCa/mcQYlAcQr/QA4u2iepFvF8Aep1bMp6AuKlZFjCn6jibqc4sDqqMeuJF/PeCxqElvnim+S04
 s6NUco9WZbBUCrpJ4+FGIYctuqNtcoleN9fed1JXLGeidvehWM1pS/3DJne/SaO1yWzBv21yMiX
 T03dshvb+eTdz5E+nKXdCFX2RSq/vSRX8imTuHgqIKN78xlRFOfaJD9yOXNiVcJgOZDmZYAkbZb
 z0JxllGBleSf3syPcxwKyHQ6P18Rz9xMiAWS0mIBgtNJz+RQDIgZpFbIOeXtx3yrBkIBMV7Suxz
 T9JVLkU7SBC/YTFAayMSy5BkCq3DylHCej3RqYuZL/aI4KqbaXFPPXqfqUh+6O2+viz066Uus3/
 5mZF3qAjj6Mp5jF7yRoTWs+LLGUyCzD9BnXo5K+nyYDgE+p6ZzJ654p8mB8NW5sJj5+CQ4BcbIk
 V4OWiauCN72zdChKG/g==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=697618a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9kCQqHoLWY5iHRgZhBMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1IaMMF8SOvozCpdwh1S2l4W058WvYVMY
X-Proofpoint-GUID: 1IaMMF8SOvozCpdwh1S2l4W058WvYVMY
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51488-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFF6B80AB8
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..62f4593958a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1474,6 +1474,12 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.3


