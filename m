Return-Path: <linux-media+bounces-36795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C85AF8BA1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCFBE762DFE
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8272FCFFA;
	Fri,  4 Jul 2025 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwrhar5n"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118202FCFEA
	for <linux-media@vger.kernel.org>; Fri,  4 Jul 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616944; cv=none; b=XHWawQIMK+o9X0YHdZGhE6mB4hoYuyEJtKZbXoXaOihlKfdGbZD7+W5ykSrFgpaep/Kug4w10F7UCFASPj56VTOpAX56/tC6ov5LvUjnP7wvPNDy5ecclGueBYvIOGxgHJVZxxLavFAhqXZ6jdUHhcWjGSV2QqaBKjvFDN141BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616944; c=relaxed/simple;
	bh=Pj/tYIKKqwKkMqL1bIJHvwLfeOU0zWWpn4f2N/ynKIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tVpF1U+6ITMxnomN1OlT7PWO3CN3RuLxLWrKjycBOYermkpXeV5KfEBTFuihxQWA40sx3Jx6mOnUnjpkYSvrfb+wWXZPIjEvdvzxTSDJ17I11Q8+X49gFjUpu4i4IJCAFWl4zqgEJ5qo3jsKOtOPAhv1QjYLzeqHy10k7xvUSSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwrhar5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647lisf024875
	for <linux-media@vger.kernel.org>; Fri, 4 Jul 2025 08:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=egnAFh2CHr6jf7UAS2g/dHOdUWFj93fB7wC
	YrltYTe4=; b=kwrhar5nL+SryUQBK2wPVRSgIxtvk8WLWAafYIWGXtNgIljsjI8
	8xozyucXsxdcanFE0v9N0xUcsLudDUUBx/CRpgAN5bDA3uB1JsT5C6YjedLyWqM5
	O0iZHNegrJMgYgy1KyScSp8fbiMV/xAFFYKkyk3jeD4XtarpuA/zK1BjdK5NNueV
	0we7TkodlNhcY/wl6Mm6eN3zzku6Dw8wYpLtbOuJkTNZnSzPQm7GgxIpzWoC2w/H
	eSBrsCw6EJGW6IetUk3TPLWG9Mgz2IADvevRLpdYNvwl1caNklbfx2wgJgYKiY9n
	BM2IMkOdbNRl9AqcanShnJ0JNZW8Dn8M5Jw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802atwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 08:15:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so195911885a.2
        for <linux-media@vger.kernel.org>; Fri, 04 Jul 2025 01:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616941; x=1752221741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egnAFh2CHr6jf7UAS2g/dHOdUWFj93fB7wCYrltYTe4=;
        b=of1SS2keURk1Q4SFUuSvJaluGqfNvUW+aSGZN2r432TY7WUTirc3Ngsi1CzWvtAZW+
         ifolIRl5G6zKYZh9loBcmRbmrKO5pbIdUEyXh3Q9b4LvGyQyzyh3GQToO7mHsm4YosMG
         5ntIYtYBI5egrC5RXlbJV4ygxFPRTEQNT5j0lLhCoPHKQRStUm1/f1dwRbR8QFJhTliG
         lNTrxqOIYO4nsMB7u3m4y7lHUp4CxgVN0hm4fAYKnt/6V73jVrdR4YOTOruLOEqu2Sw/
         oAb+xuLEsYDRAj5QtqKzB/sztQz5jNXR9OMu0LaEt/pyA37KAqmJeoFiOWZLXKsIL0xj
         M0hA==
X-Forwarded-Encrypted: i=1; AJvYcCWzdqzzWSwoxTh7MPTKbnehWFGxqOct38cM+2Q9eCDHjgsiSjHsZGb4khnf/fngRYagm9wDg1dUJyBj3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwykCC4+VlpUonhaC889++rywCK3qLusljCZ8nFdKJcJQmxuRHx
	BJxBoVdAlVz2FDNOEIRrLsv0OPqaNYofDJq/wKnW00EyFb6wl7kbSGltjPCmB2Leymr2mLGiqe3
	gCchYL5sbPwvT86/1CtZfuecqQ7Ufku9XjEhyYyi4BjDohLo0AXw0CPbIRj9L/orNgQ==
X-Gm-Gg: ASbGncu08l31jvxgUtZs9i+IkLfKkM9fCvJxWsgE/wXjlg6DS0gFO77JUlwxSzEkuPK
	d7NhVm70eYmc6We548HLhXlhBY2S8iaA0L4vOQ2xcf6tR+lwOVJAbV6VFGhRSIOAWCzUV8/1s2I
	RzxDZpFL/XHTAi8FODJI9plW3QP1Ec+tgC2MazF+3NLIq4rg/k44xBreyo6G0JVlkUo6o5WtTEp
	wEjt89oXosbXwRju8XlBm1y/nM7AIlCH3uVYFmIIYQDNC5iNw0Vtj9Htij7eFXKELS4ZDTrQAO1
	nT6C1cfhAcGvvNjldBqd/SRRgTfhMXUqp/paM+vtk3P1wZ2dtlrQ62oPFQ==
X-Received: by 2002:a05:620a:2991:b0:7d3:f68c:5778 with SMTP id af79cd13be357-7d5ddbfe672mr240706685a.54.1751616940949;
        Fri, 04 Jul 2025 01:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXF60Y0F2ErCw1va3vR3EOkW73U6IVC7914Cns3C8QMKyb35z+syYZEs1ZyOOWYs3ydcfQvA==
X-Received: by 2002:a05:620a:2991:b0:7d3:f68c:5778 with SMTP id af79cd13be357-7d5ddbfe672mr240702985a.54.1751616940443;
        Fri, 04 Jul 2025 01:15:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e0ed:c3b0:c674:7c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm47991835e9.16.2025.07.04.01.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:15:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 0/6] media: qcom: camss: Add qcm2290 support
Date: Fri,  4 Jul 2025 10:15:31 +0200
Message-Id: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: G6h0C_NEudxw3lL-jpjE3NHGJW_ENRCo
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68678dad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=75QQF6Qy0Hqb6vHseJMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: G6h0C_NEudxw3lL-jpjE3NHGJW_ENRCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX4Sx0sEgWQjJW
 IAwZLlhrhEmFH41VJ5YfIqoFWmyhldPmRLS5cyn3Oiq+uIWkBoeipk/SPlSMEcaO2RNCSeSYWq2
 tcqlo57odAkP71+iP2WFubgWHWHzntpL6U7zJkb3hXp+iClrrcmYqi23B6VxKC0FKkhD1mj0zNJ
 e1iJR2hfhZWUy7cDASfXkwpbsMx0w3OF8fpDTpjbyu9zNHHwERh9H35b4LOvo4NFAAHlZZX4KJb
 F++0BlTZ211imVEhX3xaXMu8x6wiDm/T2PMiHjypcXD1YXhfdk2QKuqvUbT5pcPdIdzjnyy/Zu/
 QFyRMupg/nm3w4amY4n80GvUXaxyIbUEdsNm7xDjiRGldKxs2NMHjbAHI2y7AYc9kajZmxUXado
 C3rzqfn/PwwVN5Y9KnDlyIcSpAbyBGD6fA650dKstBGRuwDvlFp8NU3gyqEOtGx1ZCLc7HSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040064

The Qualcomm QCM2290 SoC camera subsystem features the spectra 340 with:
- 2 x Thin Front End (TFE) - 3x RDI + 1x PIX per TFE
- 2 x CSID
- 2 x CSIPHY
- 2 x TPG

Support for Pix Interface and TPGs is not part of this series.

This series has been tested on Qualcomm robotics RB1 platform (QRB2210) with
the Vision Mezzanine (OV9282 sensor to CSIPHY0):

```
media-ctl -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -V '"ov9282 2-0060":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csiphy0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_csid0":0[fmt:Y8_1X8/640x400 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:Y8_1X8/640x400 field:none]'
yavta -B capture-mplane -I --capture=1 --file=image.gray8 -n 1 -f Y8 -s 640x400 /dev/video0
```

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v5:
- Use regular bindings for csiphy regulators (vdd-csiphy-...)

Changes in v4:
- Fix dt-bindings patch subject (remove redundant media prefix)

Changes in v3:
- Be more strict with writel/relaxed usage
- Add more info about CSIPHY configuration
- dts/bindings: alphabetical order for reg/clock/irq
- dts/bindings: Use patternProperties for ports
- dts/bindings: tpgX => csitpgX
- dts/bindings: voltage in vdda rail names
- dts/bindings: consistent hex notation for register addresses

Changes in v2:
- Use RDI_NUM instead of RDI_CLIENT for consistency
- Add comment listing bus clients
- Static maps for TFE ifaces/subgroups + Warning on invalid line
- write to write_relaxed for reset function
- Use GENMASK and FIELD_PREP for register bitfields
- Fix coding style: lowercase hex, unexpected line break
- remove inline for reg_update_clear (pointer callback)
- Change avg/peak interconnect bandwidth to match downstream
- Add IDs to camss CSIHYs
- Reorder camss dts node similarly to sm8550
- Fix camss node name with first reg address
- Ue RPM_ACTIVE_TAG for APPS->CNOC

---
Loic Poulain (6):
  media: qcom: camss: Add support for TFE (Spectra 340)
  media: qcom: camss: Add CSID 340 support
  media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init
    sequence
  media: qcom: camss: add support for QCM2290 camss
  media: dt-bindings: Add qcom,qcm2290-camss
  arm64: dts: qcom: qcm2290: Add CAMSS node

 .../bindings/media/qcom,qcm2290-camss.yaml    | 243 +++++++++++++
 arch/arm64/boot/dts/qcom/qcm2290.dtsi         | 103 ++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-340.c      | 189 +++++++++++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  89 +++++
 .../media/platform/qcom/camss/camss-vfe-340.c | 319 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 11 files changed, 1098 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-340.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-340.c

-- 
2.34.1


