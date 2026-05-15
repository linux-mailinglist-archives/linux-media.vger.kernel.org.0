Return-Path: <linux-media+bounces-61663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEP9Cl0EB2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-61663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:32:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012054E839
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1432A312BBFE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6136547CC99;
	Fri, 15 May 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSzHlZC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a37i1ItI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB03478E5B
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842620; cv=none; b=k0vxFD5eS0f2ij1iOa1Rmx5Br6nOFqioKof52t65OH9dpqciTQOcvdk9SJs8BWz5O48YzYyF/BYY8BJNJfBeqEjCy0Pt3hi+HJKyIdTZEked/dB6s8fSOVHnzI8htn5E8V63JylW5aOAvCLXYlJfbZygLblDjuQ+nHjejRAqX+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842620; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Axcnn/H12X6AERbHbcgcwjay/y8IE/VHqOnKz6RuQZhe1zLxZMzRUxWbdctSABfOijf0XR0BpMr6trUCzY42kvp0Tp1ACy/hEIO3d2ZieD5p9w0j5U2X7vwHFUvjfiMdmhe7tVm9fnQ5quRzBYnpOH7sjyHTgDNazMa6Z3k5uxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSzHlZC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a37i1ItI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4rcsH3197662
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=YSzHlZC+KJyWTagj
	pqBIz5MH4Cbm0H4eRUy4PEitQjqumSG5pJ3c2EwLg1XLXSsLo/uVSJEMjpSWEjlF
	SSi7G/dK9l5sEoSfRaHlFkQne/rD6+TxNzhyTMuOkWrixxzy9w8mrX7DupJuRVIz
	oD8sL77x1RlPzQgHuC1kR4WF7LCVafGtKc1gtRcxO3I1qVi/s3ynvIsPufIROMum
	hCF8j7vak4U7cErbj7WYVSD4c9rmcoH3Ql92Bf1KGLnMTZuVnWnNOndzfpWn8Sjb
	0W+wls7ethNTOYMhFc0H3HZNYMs/OHsX6p06JCBJTck4LJFKjg9tXAuOj0jb0vOH
	g4j8SQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qax6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso65158981cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842617; x=1779447417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=a37i1ItIFdC7U9E+s8ljT7H8qv5Q6FPyEBXRhy/lhoHb1rqBt9jUHKLDRfB6lnnEOz
         wllrHiDm4a7gwTNoT8B150AQbGuVnulupkZ4OtMa3Kd11vK+Sh+xw1GA++tGcXqMJEjC
         wnuffPXMgaL1LswvqcXPl90P3D6ZLKhA2mm+5McJwy/4AjmnYtKCIDi7GNwdjEeKY7zi
         VCAJrCHwLysUAq3c0E9t0OJR4lXt1/qps61qDruZeNX5H+Xe0kHwS12SV7jsPw9P6Qz5
         0+oIMILs+8241RLObrUCBtPHVtQLiHLZDgR2K9g/acSEiG9EoNT2xJVM6n/lhxsJEWQk
         STWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842617; x=1779447417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=ffodcwGS0skGbhFBo2XwG5pEXuzqhzOdPKLOZ5mtJ7hal+jRzXM1ydBFGJfkxyjizb
         985nAWC1hWr/9rkUpivhbqT94IhGl1/zxF7NPamdtuwawkAwP6PnnGdYv+6WrM00TkAg
         nDLMRFumqCdHhNCi7L/WCM9HUsbLnk3dFMcX3+IP03qUWgCSisUoAJefHH7mFxHhNGOh
         ZU/qc3FSUaNZ8K/TjV65am0sNmpb8us3V6I3Btxi3yMXbk5SPcgpige+UhZ6ih/1VUvy
         GdZ4O83XlRD7jllq9fiec9DUjHHysHt8EkWKwBnW2keeE6ZxjCHnoHqtxIGh0eXSaoKx
         2ITA==
X-Gm-Message-State: AOJu0Yzy62ZYPRcH13cEOCOzlgS2lk7crcwdk/R1qqQk7BFsanlAED+Y
	zZfvujtxR5vEa7dFTvoBsT8xgN9yew2223iKZi07LYu4VVosfvQyvBfDtfY4t6sQDmm1sRbDUPw
	Uvpub2OsmlMlVpSe8Fi/jbcsMDJ/BT1HRK1E+74+AG0SMMOHp8hHGYU1XCAInZxWeAg==
X-Gm-Gg: Acq92OHuBDzxMXoe4yJuW3muJAmWnGi09np7cSNNECducjiZpHd3yJ+R+BiEspxjSsO
	be/a+l7N2V462zyY8UeXm43vQlbQvkHw+AV/Z/gMblLoXS02dK0ssiu/QM2Qmh2Ngx6ym2IM2VP
	e41i4KO3dcltN/8tSYCfGrc3JpIlE9WzeFEnWlYpe4Mt2fr9e6pD0KWx7MdNjmgCHPQv/bEvFO0
	K2KoRdIZgXBk9PS1p7rLMTj4R4QHKG6x00SvyBoL2qIUsc/Noi4fBPebzm4ZeOv8Protkxip4gw
	21WnxWUpUlshrxEoCnKv0DagIiUcyyTXm1+ENCBEQv68OkOvnUxrzl1pS0CSkrj4BjrpIfL6HVB
	gEePPIOEUntnydxVBHBlgYV6Pa7INewyG3edhOBz51N3vnGe9xejmPue96Tk8Rzh+8qaTAQxQIY
	llyTXkyTJAtbxzkajrHvLivp6dlevJB5TZfnE=
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057791cf.39.1778842617483;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057411cf.39.1778842617086;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:38 +0300
Subject: [PATCH v7 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-4-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvxzorg6mpVTt6wzfzmKEHOA97/fPPiuScBF
 I0yPPeAxjeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1b+OB/9Z3LS8g2BvuqWqR5uDR7+cJiH+mwhFIpP46QZsgz83QWMhf7wmOutCQb+7rCwvvmmCPYK
 X8iHqgfdVt/k4DCZ+vEyq4chvuJTdWAZU13FrYy0m0MyUF4MBJ+x+BnZB0obH8NbXUVEckk605F
 K1lj6S7/qRaDnjStpxlGQg2VQa9zRInyRg8JpiSqyqwKjZV7nvMSqCP2kjrcJUh2qeLwhJP0RlD
 AYais/TI/HoLndnRCQGnWH9xJd1tF9orYnF/B5db0SUkDt6aoCXsbtGncXvjO2vYW08YND1GNY0
 qAgd7dCiMRNyRQSvajrlH+4LClW4PpoB4PQIEalF0Wf7Ly3t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ri0yV5voldR6Nc4h0-6Wwr8IGop47srs
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06fbfa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXxkRjsa53NnNl
 +tgxfebBaBCNEhxAnQxqB0mpfDIlTAFFvdPHBrMeo7CxRZOU//yd1Vl/wOnlYTx5oZ04KgHb2BN
 GybRL9iUQTemOVXYlJIVUjJUkySqonwA7O4ysc2n0uBWdFmaNNClQDaGOhFjyHyh6tE29S6YboP
 fRQ8mHaPKiRU2ePv+sNXEVP5ISZcRAbWdcJRFb2i8Uqc6+TyE69nbC1J80M/tup+1FJ8vqJpP+n
 57/zwQ6Wde+gSfnohi2iOXPNSyDPvubDC/ZXCnspt06DBS+6GgTFs/AXMOSEfo0uCfcQzCLHifr
 BjYH+iIMKLAcIODpOZ/1DfzIi+NVrXS64txomCg0CX31CqsRXFyuDqXiXbw7YcooXjJTpnuDi/e
 d3hBZ2ej2+GlgU4DjOMlDp/R5UMf7shU3cND8b8tlAcLLDzc+CXMrB7PvyQhkaPi+PimmYQjQoF
 aRxiqrQ/KUQSdmTcP3w==
X-Proofpoint-ORIG-GUID: ri0yV5voldR6Nc4h0-6Wwr8IGop47srs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 3012054E839
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61663-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.68:email,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


