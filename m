Return-Path: <linux-media+bounces-67461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NA/+ImK7VGr8qAMAu9opvQ
	(envelope-from <linux-media+bounces-67461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:18:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D62749B3B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IMpGsHrh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eqpZ14J5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67461-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67461-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5E8B302F4E1
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CA63E7179;
	Mon, 13 Jul 2026 10:17:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A824D3DDDBB
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937867; cv=none; b=a3C5JNn3BlAZaJrznbP0GtNb7SZVvvp0xotjjvOnQs5PLGMx4QkdmYH5YYSAx8cuMM3EC1l8SDAeNMBiI91FH41wz+yUpz0Z+XyflQPgEAFr25zr9DlKI2CWjDsk09Sunenjbtb2XGCEqT5L93pjAQv2RT8JQycA3LKzm1x0UTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937867; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmVaiLkITShAJsMThBXAjwBq5GaTxCV4NT9TCBE3pxcjk7K3vvE+Ei3do6GEkHAN1eHsnquw9gQNyULkgID5IWqXDaBxiq4DBmmaPjF/MaE7Ye4KQDtRtD3nW4GcdL0YU3Y3/pakbUBsfHEN2kl49xze0lm/t7kQA9znK6sDNsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMpGsHrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqpZ14J5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9da1v953014
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=IMpGsHrhYU/Bjnnu
	l7TBLCS8mzX1iFVdNCGSirLcuEa2sBRnnJiyJMVVx0cyI6DCKXxEXVRqbv8U9y1r
	BkD3SJDiofeFjooEq2r7FbDLmd5dBgMlCd6XjfqK2zNF4BQ+U7Hq1eeWUNyBDBSZ
	N1flU2U+Vc9bfmiAFLqY08b7CxUNEArKHuyRBpL/6Jvnq3ZhJWEWdHRDXItEDDEt
	tTzLqWd83sF9HrBp/EcCn2Za8oHIQxiiXQ/CYADflk9bdQje0vw0kX9l3pcjZ0w9
	DYDzij3oULzlpQUgCcAs3b7f+WFE5Zcb0NMmWilsYaspvkXFj+DUyLG6jgi+6MRX
	ZlWI8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3g4mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:17:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso43373215ad.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937865; x=1784542665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=eqpZ14J5WvAvUkyW/B6rldlEtgAUQVGxGAhrD3pnW1FoLcMqJn1T5KR7DvQf0oI+od
         pm+p1OhfD4G0Hpmmn2bsZmDIV9VxlDouJ+vi/Hi9Rm7+lNIF8F5SnTJL3tJ1zla0/ERM
         2rmpC0rSmyP6EZHLImBGedwHfB71zkl0kOTHtldp7s0Z5WLqk5ZSCewL8b/AfFhot7TK
         AkMLNLeNUizgfSCniNmGF1Zl+9AxvOsZ3EwLWWLMnedAn4IRQyrtoYFmAj0MaUsJjkkE
         dDaiwVCSXVRbsQOdrdJ4sDsxxTcKRCc/9tzKvkKW1muTLr5Ar2EcDzcS359szQQziFxe
         sSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937865; x=1784542665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=kX3sqJ14NsJqDgE4qr3HP6aU6XHnRHP8rJboiZilpP2LAB01G4qowFzlAwzdonbuIe
         tmqYePUu+CtT0iaHimvekgQba+9PA9qOqQYJL0jiUh9aUYsRUBa5gkeu9KdR3AAlpKMA
         0xf1oDpOodjewkOBvXyHuRPprOZsTX0Gc+NmcvdBBotI8VFOHKZc4QRq3rdgM/KR/xRh
         d6Zf9nRgYKIOrM+wgzgDjlYIqNqYNwrJvMAnYu4+sE2KA7aXT0gYqzzS4bX3aGQ7mz4d
         uxJXgw8q/mOL+kRejOhzoR1nKWPmm7DpYLhiIad7J3dkfzEE2VKpVqFUbI/43yYGg8M3
         oi5A==
X-Gm-Message-State: AOJu0Yzhw2/cfCHIlUoYCQWBA2zsv3BfVwz7sPO/Y6LUGkmBWXh0i42x
	1fm9GFZdoBqPWepqpY/dRGIctE1cKMqXOmxUo2/cM/YHMUcPU1o/+u7NbYMUJ4Gp20csjjv8ZfD
	8Qfazz1ZCl17X/LUbfOQ4a3DB4dIXCSsodvW8rnaMtBNjbBNHuBbb2qzYPegxAUf+SQ==
X-Gm-Gg: AfdE7ckfOzU6+3Ef4C2fJ2AzXxN0/nceTkYaj/WnJJ9NRu4vFwnVLB92WxIUIEnBNBM
	Ideoe+PPqEjIcZRF8ND6eoIEQoSfY6dcENAPfK8/WLvkD1k9SXBw5pCAk+WuS/Rv7V3ZTO9U9D5
	mfY8fbnJQzC8UfitweLVoBSKweHpefvXcr5SWOwA+OAdrDVZoFhytVgzA84cJmPZPTaLsBAYT1P
	HbAFS0pRKOAHj5B68ghV6hry7AlDCJqcd6FDiQqooJ59osluV81QYMATCxZv9Te5BFBS8jBDlvi
	pfTX2rNZ7hY5FvUyTS+SbVrr7DUSNly7bLDexMyLI676CjWYNb8yPPLy81FVwQosEWn0YIPqi7R
	OXc+q+ulnd9mqOtCfOHrNsRNv5/UQk2yjOx2y+HNKllHo00eFGzlFbD0AnCRvxHurLP2PyA8oJG
	23StM1KII4Ug==
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813455ad.15.1783937865335;
        Mon, 13 Jul 2026 03:17:45 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813245ad.15.1783937864904;
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:17:27 +0800
Subject: [PATCH v9 2/2] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-enable_iris_on_purwa-v9-2-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=dyX9On16Ld4tkiOAnHRplOwY2mAj27jfz661dBMxoW6xrBgHyAo/pJbiT2//GW5yXVpdAaDy7
 gw1ElsB08MQDuSkenjq3GwxjH7J4IE2FlcLvWFVfLbnP1pXrwjt6Eyu
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: bbRcpm4GJYC-DT28C2SVxLr4_oENiOYD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfXwmaCTMscw7+m
 HVNLFXzo4uwrqVk2NZKY1NdMz8r05PUqgcdMz6N+IeORmzOAAEvnbvCHKBAHvroAp/YVDtF1pRO
 yDk2l9rFgjNN3x7EDPkogD6fsiBgPFE=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54bb49 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfXzW952NWBW0Nl
 hCSCpoohsf7am0lfNv3MjgxjZHUqhR7vN6O3f1TkyH7lY/Swy23ZVWfn7KDzQzO7q5s35+I1yRW
 37BJnVVj2p3C4VEUDAxEHpSG8Wec8Qrg9R5rxcprEtr+JWPpByPlc2QzX9VALy9o5vIN1IdFQT6
 icX4UfDgKs+Q821qCS3Zv3UHJ02j72VEBu4XBQqolzn69mCsLQrmdIHx1T3DEFAbGJzHJRMzhiD
 lQybuiJ8Xva50sJ4DAEdXTU7BUulvTx+cytEdUqjSDA9VDhBilURba8mnXTGcDZJZco+4+AaDBV
 X55DaN11NBweZn/T+UI3bK5a+6Ui/dZFdJJIIGDILYXschXoW8ZhhgYEWcfMPUecAlwKgx/BdL9
 PQOlWma1MdJtwcJapMxdPOoRqW+Jp20r8UAkB7JR285EaqVBskO9loKySEk/k7jfah+TZ1arHLH
 oVyaW9evbI7VkU1vJjw==
X-Proofpoint-GUID: bbRcpm4GJYC-DT28C2SVxLr4_oENiOYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67461-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11D62749B3B

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0


