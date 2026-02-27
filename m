Return-Path: <linux-media+bounces-53651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMJrCfYroWk/qwQAu9opvQ
	(envelope-from <linux-media+bounces-53651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:30:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE81B2DA9
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2246A3042014
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 05:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B06392C42;
	Fri, 27 Feb 2026 05:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKhh+pin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeVPe03b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F384038E5F2
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170223; cv=none; b=BaFEERcROaJUJgCwlLmE7oZSXXAEj5YEtMhy415wE2NkYT1WsGOnyx22rCfxosyIE3+A9fD1iI6d84iBI9G+AxQQQm+OaVo6WNmD8S6pX3Nd4sao83z/xQsZcK6oq83lDuO5sOEyiXUgMHYJFGYKUwHLDHkmAgriBRF0ke294gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170223; c=relaxed/simple;
	bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnFCqJ08Iq+FhcH5052vFiQXZkX4SlkftcsYpu3B1F5YlboH4TVVlCH93+0tRkHoIzXRCYHsAPovTO1DxZF9W86Tlj3rdy8HYsVYoMFb2xeYH7H7uRlfo0jBIEjL7WEzbullbL6oTxMVdtFzBl/GWg0u8wcmkIPhnYqXSplZQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKhh+pin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeVPe03b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K55i3185561
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HJn9ZHvf9FI4W4WNYfDcOy
	VsafvW7lubtQ2GHHlairk=; b=FKhh+pinY+/YaQp3ER/MfFUCP/d9wDyoa4o3+t
	zg7jxURdZQWse9Vx30RxhcxyxfNFsEmRlGTHEtU9tCAb/caI3OzeVoVjbg5cfFIa
	4IKiddnOk2b6oWfNy9lL/GM1j8+TJVr3NaLxrEaNLbQqYd6lx0WPvgXRcOd6c4as
	yThIwXt53MEBjl8rO52P5JHJ23adnPYJaDLMe2Tp+XlDqoLNJ7/DGtH6buxoq3Wc
	Gf5iqcq6jlXfsHzb0m8FJh15tjp+NmeKhum+c+kKYCiax1e/Cm+Rha/mYs5hi07q
	P1wcMECobaXiqHLYY6VIsUE+L1GwCOjJUyTmIg1SqIh8NUiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp63dn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a1999e44so211729191cf.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170218; x=1772775018; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=SeVPe03bAEDx5bTRxD4XUft5e4nUE2X8bURXiJzOF0xazWjuJMcXzW1E/7PJTgjWLS
         2cDzJpbg/0FqxtgwYaHaL+RUzM/icaoeyiraRgqdy2GQLXEFgORF9zJkRFnAQPlBEPF4
         k5QTpPEG+s7+aYzgY7iA/skkleoKsRqvgERLwEdTzs9eViAiOU7VwnN69qUQ9d22ChCJ
         C2AJZmFqoH5nCpqjy3LAC10AfvbpIrE3bqBnG19vEtGwSKZLq7GtcdTOeOo30EViY8iO
         KGp1N97hDwfek7nPHEn3+Kd4Qia95StC9CrZ9iWrS8sVBYEqZqi7X0BETFfMmvAyNOQx
         sqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170218; x=1772775018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=UbbyUKEjYdpVPgtHAYYWNesRXXeRmk3PXePljfi/yYHNDBfQ+7pUo6mT4CTQ1e7cYT
         e0fH09sdPzx1piypqGYuBQUk1sKR/tFRbgaglig3EDG22AiKtFf8DUHh3jRPhDeOJ1Ez
         Il+eFwDi8Xk6Lj9DV3cUiNr4g2DId7DCVzEH3+lKjeoP0I+AdkBNvRULEtvBnrSYvYr8
         CFucmSp4XDJIvsT1kM8btLQDRHg3CWlJdzNpWqb6Nsc6n5X/mzCki6/+NvgSWdW4a6Dt
         Qfoq4BryqjKphPG+ioeUtJDfUHN/6rANlbvqrc+3VsD/Slkf3mgd53hVxysFOn+hCpQu
         RD5A==
X-Forwarded-Encrypted: i=1; AJvYcCUlrFwpEM5ZJPbYK33ztmKKoirzLnDHn+7SfYY4Bwn5HON75w8Xyc/5WnBorIwAljGgxnOmmlm2zZGgfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydYvwOUylweMAmvqlVbe6WQqnu7uYWdrCNZM/GCee4PMFkiP0X
	OpKff+flfjjr438oeXsLF6+JFfLlrL6RrJOI6twt2a7s0Az/FTS9ueZKK1Yqk6Xew2TYG/Gbsvh
	5V8SjxddbVqyToCymGkxIYVYn41eZ1C8CUpIdk4fyPmDrgjlOzha2zu+dltx3rAWcCw==
X-Gm-Gg: ATEYQzz4LBVP3wP93zCSQPLqxmhVofySoVQyOhYVqJV4ZgFSAiusk3kUzhhYx3mg9lZ
	YfVhNm+bLCEbILEPd7ct6eXrZ280oTsB/yPioyXKmwnVFHqh6ga5Xj8hiDUT8h3itStpvBQdm7Y
	+Rm5eG4tqopI0cilEA7yaclbp+60yvScN6LdnQi2cSsS6UX06dyZJicSrzR63+bgzLoKyvk+sle
	PNx/ISBfWBhyFwHVw7aV3X1CDXK5+G7PSkdrdCD7sezBYLUM07TJYwLmIRkBmQ+Wgtfdy4hxuur
	FR5FyXNvbROTar87I0tAWSuOLuufWIQdhD//9E9gaKpmWIA9s50REzq8vA9d75HBV+M+9OWCjoY
	0s6OSgkZUJk70ZQCowCQPvv+ce8PXDsnevZd27/YQvq3mc9W5hDgaja/ggnRFe29EsDWY761sf/
	HPOITS7CW6Dx0x
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21107051cf.5.1772170218264;
        Thu, 26 Feb 2026 21:30:18 -0800 (PST)
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21106691cf.5.1772170217868;
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Hamoa EVK camera DTSO
Date: Fri, 27 Feb 2026 13:29:38 +0800
Message-Id: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIroWkC/2WP62qDQBCFX0X2dwdmr9p9lRLK3qxDq6auEUvIu
 2fVkBb68xzmfHxzZTlNlDKz1ZVNaaFM41ACf6lY6NzwkYBiyUygMChEDZ3rR/eelk8QSuvoWiV
 jY1i5P0+ppXVnvZ2OPKXvS0HOR/lLtFXhaaw5wsoThEwCzt0PtEZJ5Y3mUTq7SPbX4rGRXIJX8
 EXDZYUhrTMIDSih1HHOtPEa5IgQXJ8zcI2mrZX3O/H1P3H7yhwW++DpstO0CI0OGFV0jV34Nvc
 ul9ux72m21SHwoLDT7XYHY2KbfVEBAAA=
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=3165;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
 b=8RV7fA/Sx1rI6qohw3+zb1LKEYDpePCGdcv7PiS3aBrOv03aRI3r6pv4Gg73BxcSzTs+QRu06
 fLTfZK5SwEZBxqkZrbXaCwIg39Nn4+ww05FHBxniBH+AvqVQbZNOcGo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 1iDDA4iXahasBbeFS-4DXYcU9eJJnOic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX92bumnCk9zXM
 DMnNNt9wtDsArrkw+xTCrzzPIoOaRICk5fqi9GdYm/7YAQPfLCGNLmEmV/Js51AB5fKlsThg5iG
 U5ySPuENF1CNgLLFT77gyFGoHgtp+MZbWHq/vJRj3X5h18Dcc0gwRMOVNxwNHGkMcCALySH+qUB
 YABy5Fpk3moFfrYHTEHk2l2uiV6ACR/T02NdLJXWFotLT/6B4oqgurU6E0+YXI/icTg4vOKPSTs
 S9iLHJl14nMwPtCysujHrURM1BDTwS2DicPBvay/BGAe6kSD1h5yiLvucvah/pjTERqsMDTG3tl
 Kqwpacrq60/HEEt8Cxpc984E5WkCyH/YOhJIKEbuFIKRpQeY8XN/NldS6FiEzSK5j+u9ICmUX4E
 g/3QiprsDlk6A/kflRuaJA4+XUK/+Ot4SAlxNux6gHoEYAr2JztafwKVaCLZ4NfCGe69rQFhepF
 QVMzXiGiJGRaWOCniyw==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a12beb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OrI9xjwDScBevOMuhrwA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1iDDA4iXahasBbeFS-4DXYcU9eJJnOic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53651-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B8AE81B2DA9
X-Rspamd-Action: no action

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (1):
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        | 15 ++++
 4 files changed, 117 insertions(+)
---
base-commit: be8c02c846f256767d06a28759bbc7cc0257a1ad
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v3
prerequisite-patch-id: b92aa0af5255e56e1a53fe2bc06d8bb57f155117
prerequisite-patch-id: d39af25f984300c48e6eddc4c7bfe64caae1d61e
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v9
prerequisite-patch-id: eb97bd225a1426e2761a40a8793dcfeebf801673
prerequisite-patch-id: 0dd709980bffcbfc3c007c8fb8b2688cd2bd5e49
prerequisite-patch-id: 3c7474e4c705da65499de17ce4b7090bd8a8a2e1
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: ec15148282029b78c452ef5445b0346dfb7ae43b
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8:v1
prerequisite-patch-id: 33b8d2fd11bfd7ed5c846c8e56713e0f13908da1
prerequisite-patch-id: ada8ee35053d0c5db6a290449ce479af06974776
prerequisite-patch-id: 25f09813cee88243e1bdc01b9df9d4fb9de3ff5c
prerequisite-patch-id: 5f2c62b86829efaf76f2ba2342a991199575751d
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 89bc5fa963a75ec2b85403160f884353baea5bc0
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: 09910d9b9b2231a65fcac9ada44c7b2f7b7a9a04
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 98c6a10ce51f628ebecb59a447c891884b297444
prerequisite-patch-id: c3e8d5e110bf0e25a534bbe911c43996c21d2cb2

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


