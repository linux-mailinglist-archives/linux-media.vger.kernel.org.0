Return-Path: <linux-media+bounces-51888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNEwKKsKfmkrVAIAu9opvQ
	(envelope-from <linux-media+bounces-51888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105FC21C8
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6CD1300461B
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EFA3542EC;
	Sat, 31 Jan 2026 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPdsPzrw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5CqMGfr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5413542F2
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867938; cv=none; b=pdWGEwgQ1kYjzZ/wq02pHjPcBAbevdCnlOJpBzqRrZf7zWno578x7z1Rn7GjHJ2Rw0GsUS9vfMVaHEfCwT+e5WsJ/r9KFZFjt1IqwBD6W4n6z5QJEwzE1gPLK5vl6diEL/UL2H4I2eDXXYPlCk6a69aYtjsMfmmlaNE9uODmKbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867938; c=relaxed/simple;
	bh=i5quBdpfP0q8d88le/+tG+r+sh9g1G7PqtQUP8Kt+k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2+9HKAcgW95vFtGHcaOFBBOnsi7jgo06505ET5/D3Ml/C/z/vlYq6U+JQdsSUGnAqPUZFUpTr1m+5GxvtjbNUJ2j7oOLvB08KxxcTYnRNVEJP0+FLV7rE2D6wkm1Imp7oh5hzhrdzFHbbT3aRhSmwe1wS8+vn78Sw1J4vdx18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPdsPzrw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5CqMGfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VDHQ8F1501293
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCcRz/mp24x6mQIqTjWTfUxNpj3FI2IsdIkammU7t64=; b=CPdsPzrwO3zzb8dV
	bBTEeUqLSlcg5oO6FSzTnFZN8sUoTGRewYXSemg9LSDT7p8iTJA/7ESj7p3SSVPQ
	J2gBnZC5IOrNv1VOT1PrQs7VqhMu8W9yq9FhLS/OG3+nKVHaqEDEAl1i3aTVp9E0
	3LnlvhySyiHt2IEjlQCSSDzHsHM4KfA7kwLiOlqjKkfyO2iXYY0Ui8xCG7ECkmCt
	qF60UzbVw1LBHSuOM1YqU7MwlLbXF3YNZZkiTuuVY8bWpMg+C5sFGdEl55JQc5yM
	AIoiO5ARZBYxTrLYOj3J1Ee4OKDj+aJMgYnFHJZn6NjN9fJ/yQ4FhKKb3qayM4KI
	6fP9sA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rvsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:55 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec87b2b4ddso2778432137.3
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 05:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867935; x=1770472735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCcRz/mp24x6mQIqTjWTfUxNpj3FI2IsdIkammU7t64=;
        b=R5CqMGfrie18gopQnILJQ/krv1usjNECXbGr1ZqyzJ7cTcLTkc8fnrj91aucbqVrFY
         qdG8QckIOxfahvvBZWpgSkMKyFaN5Mjrqsu0yiFhCFHr8yUlDJw65ndrP5YFjaiVthq2
         BLr0k225K3ST2tVxVm7t0m1v+OdeKE8wJESggiQ26oNgz8synkHf97SdbYr7pUl6yfw0
         QtvFyKV+GJivHvWYSrIKJlEewjKqX6ib3DNZ3KIdd3n8OL2DD1W+5grrXfr2XzIQnUSG
         iVOTcNhf+j7f2RyPjjvTFuxnOpnX40UO2sxbykq99IWrH1NYlfYuCVTYxUzexrh5+wXW
         yu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867935; x=1770472735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCcRz/mp24x6mQIqTjWTfUxNpj3FI2IsdIkammU7t64=;
        b=urMpA1FF2ogwlur8QhwPg0hdPWvnGOrKj9fnXZWTLuCD2R7/SNuuNvqzio3WU6iS35
         OXBujO09OedmJ9VSoLElMdDTiCviAwLXlrIIXP11gIPeX5sPCBV/K8v6v0bl+iv/kZ1f
         yyf3sGmJCqm1OywOg26ROpiqb2Fh7n+WyplgJ/Z/lltMw11kQfm9JwXRKJSHPDRDEEZg
         yCXj2ySpbTRaJ7jWa6m2ZC7oNAyeDUic0zI7UWrE9F+UNk5HXGKpdftvCkeXY0rq2moD
         365GAEW0tppCqjhkSlHCjLH1nPGqWg+jDR9AV93lXfJHCDC9jdKihyFt3vHOHO31xKWz
         x7DA==
X-Gm-Message-State: AOJu0Yx2g178AwTuig8Qp7aR+ubdbdxLugR3FW175lV93rrL0SXhyOoP
	vgZiQWivqtlLEdsv1SHGWrBnUGY6fAy+8kd82epdfvYYEwvrTP+G9FSb8zLIgjqRFtztSQmau0O
	53n8hKgI0ziIReVPIrIw27fnscISMHy31s4izx2k1M8Z3qbADVmfKydhgGZGfzA0ghA==
X-Gm-Gg: AZuq6aJfMRNJwYrHKTEA6/hP2k7FnTnPhhaKIHlNWr1P7CW0EpcQZNCU66kkRIT83fz
	CHa8Ea+1H+KxbiBcuVAwyb453NPUX+V/y7hBNNw2+8r0fiH+c1kOh7A7uiCMmvF+62CK/dmjCav
	ta0bzD1Bp/5bpUH+u1ZI7lNVREvitXFl6TZXxRpykvvcZR2e9MKDpUDZSgC9tCeiOh3Alq3uO3X
	yGMRe/GgRsd7mcKhVvfZaUQ8pcz+U9P8EPmQUQzFnORPLLIe193zCNsiWiEkVWAdhu5WLdKIpC5
	pYo3Tto/Lqd9BnmmBgq/yAN5svVK7Y9c0rroEExmDvHHyJqStt/2cntjawsTOGmGbCyQty7uHAf
	4S+RW8OxyTEdEi5R+meVGGjSkLTshxa24t8zDVaURvIBsUDR4pMw7f2RCq+WFDJ/ek0in70EAy6
	IqAaRjNoKLllob42uKZQQZaNo=
X-Received: by 2002:a05:6102:1622:b0:5ef:7220:bca6 with SMTP id ada2fe7eead31-5f8e266e86amr2067874137.33.1769867934859;
        Sat, 31 Jan 2026 05:58:54 -0800 (PST)
X-Received: by 2002:a05:6102:1622:b0:5ef:7220:bca6 with SMTP id ada2fe7eead31-5f8e266e86amr2067869137.33.1769867934458;
        Sat, 31 Jan 2026 05:58:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:50 +0200
Subject: [PATCH v4 1/5] arm64: dts: qcom: sc7280-chrome-common: disable
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-1-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i5quBdpfP0q8d88le/+tG+r+sh9g1G7PqtQUP8Kt+k0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2Yd12wh6Tr9kuS/n/fNrbhXXlhsEbciaeOLWTy+z2zYz
 ae1LtTqZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEXLew/+Fh3NoWFnN14+m4
 pU/MBeW3dJ1dICnR6Vt2MWWfaaAWe0wrU/gxq779C7dotzjOmSgfO3dGRHpf165SE7a/Kj7ZJ6I
 esZ5ey6/UxK2sez6sQeRRftXciQozP/7XiNaoDHN/kKdxVkq21ubj7aPeOp6nU01dvs6tZCuf2r
 q+2GH9npPGHr91VRVU139nUH+ZsnPy2thTHfeXfC5yD4rQlX5w0ijqdWGD5uMVn+OOGx39aC2ka
 pviFbTp4ZeQqd11mWXaHmdfqgpWLrbv3qyUNZ91DnfgH53N+pejNU5Jzjt5ce/D2TYaeglBT9pM
 FidMlk/i2nr87x5rf2+TO7wn1tZJ/bz86Unw75d9q9UlAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfX8gOkdNVe2wW3
 gNTbMEzRITF6tU8k33MLssviw56fTa3QIlDUQOSneb2xPl1CMfCTNAFV93yCLes36uIp2Jkr0fp
 YAKIYp1BBxGgu9h/e3DQlrta95xC/gqzY9SIo33OXfTTW1phS6J/P0Ri4GAcHhOAfLI83gv4XpT
 IE6pE0vXy+k2VTCmM9YunF0bkFmZ+OMV4TWTSGB/hFEZgfdje3+Z6/4usUKSAYUY07FSgc3xXWw
 Wv/nhEwUs4XTd+YpUbbQERrJp4dIUuXkKjHF7oRI2xIBRn9ZGrY9uPksIR7l5ayo62/HVbqt+Mi
 bSG9b4/fjsYw8e2rZD946tHcEpiktWMwkOJCZzP4FV0D+0OtUFTGer/byqTpfH7gIpP9kpoHldR
 igRN/qfz4xWmq4HqsTRH5F4/6SIYaVo+vk5tWvV40WGIdG0V0ZLgw7mkWPxw0+/i4meuwfT59N+
 rfOygfVZFXBTeCcNgyQ==
X-Proofpoint-ORIG-GUID: c72ySf0by4LreE1n-ZHhhpBkVkDeyvmI
X-Proofpoint-GUID: c72ySf0by4LreE1n-ZHhhpBkVkDeyvmI
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697e0a9f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=foIlI7qs2i6qjVKSRT4A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-51888-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8105FC21C8
X-Rspamd-Action: no action

Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
core. It's expected that the ABI that is going to be used in a long-term
would be different from the defined venus-firmware subnode.

Granted that the SC7280 Chromebooks were cancelled before reaching wide
audience and granted the feature ABI changes, drop venus configuration
for SC7280 ChromeOS devices.

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 617a39d32488..debf62baec9b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -140,17 +140,6 @@ &scm {
 	dma-coherent;
 };
 
-&venus {
-	iommus = <&apps_smmu 0x2180 0x20>,
-		 <&apps_smmu 0x2184 0x20>;
-
-	status = "okay";
-
-	video-firmware {
-		iommus = <&apps_smmu 0x21a2 0x0>;
-	};
-};
-
 &watchdog {
 	status = "okay";
 };

-- 
2.47.3


