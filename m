Return-Path: <linux-media+bounces-61594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CshOP6fBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:12:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB35402DC
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73AE4303D530
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F373B19D1;
	Thu, 14 May 2026 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT7CjWA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX+JnvSs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA417385D9F
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753412; cv=none; b=hYTKmpe9Xj6Jy024NliD4XmSZT6VSqrXn6I1NhEAGS313Eadfm3X6//kOgolZwPDs8W99Y0yBwp+mTxo+lZD5hZ4EhhlO1AkySCbFOWx/EpIhUTO4qfPJrzBGrBDd10bCFmVkVdCtoMSamAHNsuHpjAY+36RB7QQTOMLUGOJs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753412; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDIVpdRmJFJZrb9JyjTK2USmcMUD2as74Ua/sN6uh7S6NLhZHpLRvdGxAd4MXnXVSFpHDuOsUP691ETp22lm/n4bXxXrvmBVKPn3lx7ayoBq3IBHEahbSRq7o488WPqjpuB3A2No32ePzJbQMOgds0HUa7TFITmg7cgJVdzEz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT7CjWA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX+JnvSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k9jX3702039
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=RT7CjWA8mT4Z2i7N
	xtiQU7Bj6WIZuVFST/86WSZKB/Jb+4CXNRm4BbO/ZZMA+TUp/lvQPNWCNlrMK//r
	N1ie4s/gMxOYlILIy0pPsIgxsAyIey6aQiG+Rw67hTAdcDHhwY4OYDLs4Nisr24p
	E5M9nyYSrc8JiM72zDN8ldEmfAzS78av743qs9URsns81I0XbRoGSi4fcRmOHoCK
	ZVf3getI/I3/JJtaP0i3NgcJXs7jk/Qbo1jfQrSt6Z/12G1HoCxHSnuz181peU+9
	knvUiQDhlMhlRtA5Tl65tK5IVNTa2SWvqJYve+cdyiIwpvnCx8rKxKDENzAXDpwZ
	z7FXtw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kss32a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c81086bf930so5433039a12.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753408; x=1779358208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=gX+JnvSs3IHbaRrxd/r+AZg3J7iJQ0L1xeaJSJcgMfGgMWtWq2ebmbFQqEU8gjm0BI
         +Mu8v5Kgk1opXPtWJpDQXj8P+0HNvwfapGJqL9qH+9CzHqvXAZg69NpKedRArCnvU/Ii
         zzEaxCxJe5MPt3jWtpcHbfJWs2uqIR3paxr8fN/rV3RVD1sO/Z95pSlEVLHs39OgURkb
         RmFv5qJgOvk3DSotJUuAAv0BHHtUMxejqzMIYeVAPGLcrJ1tpbd8hnvq9AZrNIV3CPdJ
         aROlrEcV3wwsGEWR5/tjQP/e1Gr77SOEmIO+aeRaZgGINQaai+FscOZ7MOeJ1zOXvuE8
         05aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753408; x=1779358208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=POTYz5sAXOk6I0ySpBkXWDesHJ5VP/5Hr/PUnAC9flRn7fNr1lT9ui5a+h9vmEY0r/
         Zl2wJAEM3eTWdrjQH8NbWgX+SRhcCiG4WJWelHBt1wlIt8N4vlTRmNRsthUyFXRcpYrg
         5vt0cDHCJNWYy+7o/pndb5yWI3AmBsvQyvKU2m3lCTkVqavVJtq5mCSB8HJmLVLM8rc/
         zJCxUoBQnaS3aDHGqHqIWE3H5Iu3i372SZCnkvVBs5DfT1s1YiXIK7d2zk1o2rIhLOCm
         IyLvjzApuKiKHGZXxBo0PP0ABfcIyrdw4dovvETGwrT9AbYNBmRVkEqjsYgwJGlCZYCv
         A4RA==
X-Gm-Message-State: AOJu0YzvNYqresMLqQSrYOjc3cqKjOnhpud9Q1Uv0S1lAoy5sAqnr0fy
	bSl+LLOamqbdTobCMrvgZgMbvhYDIIern/Wa5ajqcs6914znhEQoAEUAyeiXJTvVettl0ZLE9is
	ynXzPwzc5Y00HpWBE8dFVTkdxg6KCZnhb5ylaanEfUv9geeE0h+u5yiPwZEERKnbYaA==
X-Gm-Gg: Acq92OFYc0bQI5xsnU0/iZDr/OADfnILkgEgYxz9qzCiScx1ZKiD62BJnPXN/D1H34S
	lEnguMdtkzP6ROLrVJs/4Adal4+YvGHIoJl2CdrLvI1QtjePfUWmo3cEyvA9AeXqXaH3Qv19qO5
	fkqCvU/0p/VvpVrrCu1H+KfriRSjJBqSjaLuAV4cwqbaeK2jlQ9TSjkkwckYUxaMdYpNaWG19r2
	HRT+arbj/ix9kUxwUGTDYz54Y1AIor0ByLK8wWmwTKrKiWW2DvABLqADAj1hN3vc/i2FURdEyIv
	HV5dh3ELbx+oFcvUT3bSoA5Db1CyCH/gp2sbO9pjfchULUv9cCVewGaI94/a71oS1llAhfW9Nn5
	emRzPzh01+K+OW7fJ4BYA6PIzucAdpihMBy2m4AmxvtphVcIgVB5QfafihrlQqQeasUREGN41Cf
	KLZa/0mghTU/w3QbjsqRnp
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3404003637.30.1778753407681;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3403962637.30.1778753407098;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:10:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:37 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-5-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=XvDaPxN44wekljoc0CV7Y7J2cIXJH+w6vuKul/77hVGW2Uo6fgyz+6+UsJgKXY/IbAn30qQsQ
 1Z/H32YjFS0CxXfyfp7CxJni41TWGjmu3LZ1vu4iTPjU8RtQ47y9qSE
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 9Kxy-ZmJ0wpPWZfZ5-iH33Wk5JuNl0oL
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a059f80 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX0tZPTxngsnt5
 jsVqVXTot4JAIbb9DFwvDrgWHyoi+g4NB0bQVQApISv5jM3oY6C4SN8Pva9Ix4HfA+Y8a6zo6an
 xEgmAffkSTCffL/OdDzU2XgH+SOSjGo4MsIBg6iYUXpW6DRXULDrAxH4pARSQi/ngBGugFzig4V
 hGdJHl5X/DWp6Wyrfu39A63CJekGzmkV2XmYUE27w4+NZvoFkYmZzsHz9RRH44NlYpR3EpkP5g7
 HPqsVH8/iVAZY00TqpKphQ0C61R5iZXdtRiecJfe+fC2Wz9YrHuqaSTl1/A6pPoR1ZbnDo+u+iK
 GBUZ7ZpgrN7WanoLGKGjc5zrCZKhLUrNeMuiSoIrFd1HWFYL87iHZ55wB19nKOZhA2DpnGK0i7w
 FuSIVarYKGET3ikVGCDnYz4qrbMc62r5YnbCrDXy382KEJzTkCBA7C71yhILyajTLvdQh7XosvW
 BLF80KVi2tZCHf4JWKA==
X-Proofpoint-ORIG-GUID: 9Kxy-ZmJ0wpPWZfZ5-iH33Wk5JuNl0oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: 1FEB35402DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-61594-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


