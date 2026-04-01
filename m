Return-Path: <linux-media+bounces-57855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDBwHsbzzGl9YQYAu9opvQ
	(envelope-from <linux-media+bounces-57855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:30:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5B37884E
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF7C4308302F
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16803F0AA4;
	Wed,  1 Apr 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owf0MQI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNeR4pIF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCC93EAC68
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039116; cv=none; b=X+X2GCBJ4y+WTZYrUw0csL1rKxlvj46IYdPOxwnUL5vHF9XHop1EukL5IharK0piOvInk/ca7pQF93E3sdrWnujQL8C5Y6f3cTDgRgL4xDVhGsbyiAAPamMcdHOX6q6PHOUAIzG4hq72dkdl7OXcfk5sV+WDKmrggh9TMJBS3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039116; c=relaxed/simple;
	bh=mAwX0EaZSAno54HSeI6K2yFRSljprrQA3w6CZbcroEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVyfyEW3h9rX8TwTQFGRa4D8kyswxlbBOy7iyCb5trqLnpSXmZnh25lKh+/dp6htgFyocTkNW7+qsKzUDZ/zM9fShz5AX7FC9NuIsUSh/TTf2QbXNfZCODqFlXCBnB4bMI6DLKl33Zqn7xkpzvtnQbGfSvMrsTLvjwS8iI0oLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Owf0MQI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNeR4pIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63170ufR3103973
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 10:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=; b=Owf0MQI8eEMJFiqw
	Uj5uqMz7WyxU4+l3uGXDWIgxWxK+XBvuQSB87p2i9lGrBWe7VEGt1/s9VGXRjD9/
	xXRrMTGUtRsVRAu4NH+wlqo6HLZSPDSW+FaSSaOAhXa9mJAYilvemAtC2tzU58cq
	/i0vheqTduPHQrtFmm1O35Tl/VWKDA6WzcUwtrX8DJsznvKZiVbOzcefdgeckuWC
	6cvLsEYDew/TuO8YbXJTGHoC1RrEggxCl9lTH2hLihB3Lkf5EpZBrPBfj0z5Z89S
	WabZD2QXkVgd+xdnM4MG7/6HgntX5bv3jv5zV48E4I3EX59gXcu/XEFWg+Rdb6TE
	bvXStw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23uvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7385a1476aso4285803a12.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039113; x=1775643913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=;
        b=bNeR4pIFHIBao4xA3l9ggjz+5F2kBxjLs1nM4FDpJwd4K+52BBbkPNEdzKd+YZcpWy
         JGQapO6TPHpLbWIsigu8IrdeqVbTKvBXZoOKGX33yJTDIVuTXxAyTqQ8G6LEFEWgb/x6
         JoCdjwV5RfPMy1qlAropZKU47EbcDiJJc6vZPXgMdzeJslJWeAyToo+RYS8zDsWy71uR
         uNtD5r6GuEnzC82FqH1jhapSo0cyxs8Ya+nBdoX+RUk1t/cNKLsH+2CJFApq6OdYHno9
         HrhEESBO4bHljdi1SR/Po28AhQPXcVbTW4nCFRJiDf9Ze2hbhFHYroRnKGDhaA6hjrpl
         s/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039113; x=1775643913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=;
        b=F4eX5RuN0S46VQ22odBLRw0cTYLIKpZhMUGyewVb8xuf0EOs+gsW+ZUrjCNIDtrEI2
         KEyPpyfyE27ggJUL9tvOG1sFVOEnBT1z3struHlI4/5aDOHaC4ulk1i6lUMlBpBQwxxh
         5oAn/uW7SgLGYSofbTf+a6bGr6Yl96IVlvxFrlPEkMh0u7tgeK+VenxwfaGYCUMZsmUt
         5U/fEBETzaoD4brDA1uvk8d+g2gNQ+0OaDbLH4uilHPx1eCrIRdAgD/am20MRe3dRrod
         AvXv+7R/bEswNfWJwvV2hJ6GV1WJ9Un51syfCmzdlwJEIqnOKuV/mmkJeThMuX1H8bAN
         o3sA==
X-Gm-Message-State: AOJu0YwyM5PMQGJQbNZos3H/rOmDfVvPD1nKznQ65Er3aLHojXS8Uhr6
	H+u1gmSVF3eTn7uSz7QZJy7Z8bpJLsGHHEmxM/JU0rzJGKkEqov576exGdEc7R32+DNnNsoX/j0
	EIUfMdJk4s/JjZxL1j9LmvCm1Dep2+GLt9zfvdoq30czKcB8YQy17//KdmDHv+Czjuw==
X-Gm-Gg: ATEYQzwA+qjRuI+aD59u8S56hM2Lz8G4Y8RTWDMHlz5+PZvIA1IydCOvYdoI2x4smXT
	9q+0W7qkz4O9JjOUPQXziYkOYc6n+FYX0a94vbilZjdXp5I//Ouu6999ihVrrmOpRGTAHTOwdxe
	JZGyCqbAfPj/a4pnkQ8BxkIoAM2zjf6vmSxzPx7Zh/SlZlShqziQPBTBG3hk07cmEiRv172qyna
	l6B5/8U4q9UKolnHHrOrzYUfFaFknhaO+Hz4GudRwylqujJhxfZ8XzcT9eC3/fW4lidNIn9px0R
	Oc9S/gioOk6pGtxUcOvE/O4QgCf/sCk2pgAcT9x2+e7rxViCwjomoUeMi/C7lfUoLKt6dL2smn2
	KH38ebrXj3nhjqtNaY/OEuMdOykAd8Y8+Rd0NbvpkdV9WGCMefMsm6jfOsqZkgi9mRlr9FMby1I
	LrRUuGTNOece1MrYjhG6Bg
X-Received: by 2002:a05:6a00:4095:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82ce898117amr3288782b3a.15.1775039112815;
        Wed, 01 Apr 2026 03:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4095:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82ce898117amr3288748b3a.15.1775039112321;
        Wed, 01 Apr 2026 03:25:12 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:25:11 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:42 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=864;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=mAwX0EaZSAno54HSeI6K2yFRSljprrQA3w6CZbcroEc=;
 b=8V522elefGB9MdgGf2Qjl8En45Q8N2xcOd6LvXfEf0Dl9Uppv+IsQfDjfgFHfQJJN6wRr+XdC
 ER0eTs58qi+BDC9EKxljmvq5iG9eHi3j8lmKc3cC/yzFgaYQYFdzExg
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: blPbr5yTGYftGKAaZ31sjD-F7mi097l7
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccf289 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfXy/SMUfPAffiP
 6/zo9kfA5sq9eo2aIMutyunnxAfqUR6qoEuVFnRtSiJaMJbDlwSz/6ew+fhtjRF37927VQ5f+Rk
 eiLw+F2q309gBfRM56Ds/rQzBgW5Kg2y7TOBj6RcJ7DUSfg5ifMFwhgN7rWIyHwsc82ICMFvoMP
 QQwvMjAcPSJ2DGm6NhX/JoeSjej8dZdr/AjrWqTOFRJt5axpuLS+vlRsEaCAOVPr1WHv3O3p3x+
 jyZnyvGkHcm/OesuouL8muYyZo31JduSQWuePqJYbIAoFW84VQfRxwBx5qYoEvouTVgfk153hVY
 CDarbSDS3WexhHa8VdsIm02bo7lHf/a9OPQZL8sL3j1FlXyZ2U9QNTXR10ss8PChYtYPQ0s+W9+
 7IXqUMaSCuTSg4WDkuvkxbTLhsbHCbqqoLeN0QC4U3TfKjLC1oFm9cXIKzEQLMtTz2lUrfoMkC3
 +FbIVTvcsLEv50ZXlcg==
X-Proofpoint-GUID: blPbr5yTGYftGKAaZ31sjD-F7mi097l7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-57855-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D5B37884E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


