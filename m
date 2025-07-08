Return-Path: <linux-media+bounces-37061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C017AFC5B6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C719A18842AF
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3552BE020;
	Tue,  8 Jul 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1Cfx1hg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE92BD016
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963552; cv=none; b=tk1uAu5BeE8vKNmoLdRKcU3RDTcRU/JhPU0IDuRDhFh4W2Fq31omlanTcjRWIhCTHVY3HAaEmulQ0cdYnIpoLmwQ3S/rCqJCVAb3D0LLcpDnMODgQoRKlWyYbuW8+RlwySwzyvB8jtPXEpo9lf+kSKQkB2pl4H5imMtnZwIipXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963552; c=relaxed/simple;
	bh=1YiweJG7PJKgZc7ct5gW5B7eOHZFvQdVgCTtKMPZJ6E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r1feBialjz4Duvrdf1NfxDGMs0tJkiOjQHIFIZcwYx+PuuGTdT/RQ3dEW2x/VsxMd1LDe+Jdf1JCrJoeUxusE/hMoDymo+rZgeYBb6I4veZXQ9v08GXBnawjar4PIOiZR9YjWx27LdaIGZ/OKTU+mqq8fny1KdDP1eD5ScZnPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1Cfx1hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567KQPoV021443
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 08:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hDVPc02Smyom8gWGp9VQVfjqXXqRWspmOX7
	qSqClcY0=; b=Q1Cfx1hgntcw7SVNASlFOFPejuF2PPggOmzz68zcuGbXXckqOAY
	B/98SpuIAnfgHyRKgURrWml+z8mhPfYgxJlC0gDhRbWx8pVHUUfAViHI+KrVmiTz
	AOi6rcvaaHl/p0lUIDaSdbyCTPt5DUw4upPA4MDGGao7J529kRqFfWfZU14A7V4l
	dhLm/Zb7QotJK5ICrkhHZ+cNwyvvAL8tZ01MCl+NBNsll1jM4RAZ/sTQn/rAb+aQ
	hhO5Gnl67FEO0DTB7L4T3xnM9Hys7qdo8cv7gDn5QGQA7ZrfbYq6p2LKF7Ikjk/3
	UvrKNdwgK/SQk77Cs9w1P1bZhvFhAbk7jNw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmv6hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 08:32:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-702b5e87d98so85946676d6.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 01:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963548; x=1752568348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDVPc02Smyom8gWGp9VQVfjqXXqRWspmOX7qSqClcY0=;
        b=cF9PJzGti0wI7Ncz8xOvbzuY/7LPD7scj149YJSGwIFD5PUzpZ8rfDlZiIDcFVLeMr
         PbR4ACn5+ZcxWGe0ENlX38DrnS6EZuzOu8X58M2+CaxPfcbzhD04zAPoZlX59TZzMV8M
         b5r64G6wlBzg1gUCmLick17rpLEW6iraXpPMKXg0QOnHv96eep+2EuJp6EP8T3P/GeJE
         +peiNN2JCHE4S0IC4UYXtQc2B7AzuFcpBo+RxI65/hl1ub7UcRMoModOh/JenFoHJcmH
         YfLssc3DZxOUh4A4epL8MIlR+vpIpJxtOMeOblM0okj1onBajlxq7TcDGEJXmtTZ3rWo
         1X8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAJ1xiBW7kQcVJXIqlqLFqjemYOcgKo3Xpjq51Yl/lhzd0nhDVNJnn/z3C7vAPNuqZYIHbz8MMOS/MEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYJlOhMeqnf7iSQDNxCHtr8MSPntX4HRZQS1kKAp8Pz79zy2uC
	2q0A0FUH+IWazUYUMpvzsrIvGtjSwGuesoM+C838mdGW1wK64lWax5hZRYlfK//oKiA/jdemtDL
	gwp4NJFkzpml0gktqVswSkC0wVuYaWIXUqTwZxeG0oQl5o+bFkG49VlkIq5pP19ZbdVk4f1Fl5g
	==
X-Gm-Gg: ASbGnctbnLrhYI83GkNURHnv1ATOI6gYvmhxo4071wP/BKA5Pm6PdqZgMLu44NNE8IC
	ok8J2gU+wjHOLOXQf/GAZc/kCQa7iPfZFRHOvrEiTSWARfFhqKUpRpisnMu24UHlrOJjuBDuPeD
	Qh4HMD/GfM/62DlOC2YpFuBJdJaxAUXeMF4RY5O8Z7zeKAVxqTUC9XBLTz1M1AoLcfHx4dtSoI0
	3tqKSjW8G96TPOXJw8VO2ikk7n/9/WBLKvzXKFWXTtOuCOw7dc2lvowh9SKDDqeRec5rFMKIaJa
	4/Ch9fpMzlF6/9vHZrAZqWU0tMjc6Je/vkpiescq/l3oaXDTHAuUC4JV6Q==
X-Received: by 2002:a05:620a:1988:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7da016a99b0mr396936585a.2.1751963548186;
        Tue, 08 Jul 2025 01:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXD9Pllxg6KGYJANDZeW4ePM0iPt4DqJifc9RKLUtfnMpxdb+VIeT4mznPEqnN6ckwJLhUww==
X-Received: by 2002:a05:620a:1988:b0:7d6:f801:ed52 with SMTP id af79cd13be357-7da016a99b0mr396931885a.2.1751963547656;
        Tue, 08 Jul 2025 01:32:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/6] media: qcom: camss: Add qcm2290 support
Date: Tue,  8 Jul 2025 10:32:16 +0200
Message-Id: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cd79d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=75QQF6Qy0Hqb6vHseJMA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: pJLLFjk1jagmgZGOncciju4n0kBJpjuB
X-Proofpoint-ORIG-GUID: pJLLFjk1jagmgZGOncciju4n0kBJpjuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX0UCQ7Y6zhgMx
 BShULGHNCuRe8bD/Pwvjq0IYwXOasRkpbi3olg/T/95tPWguRE7Iin6IL2ip1icU5XLsZDXUpg2
 aymrDL0oMj3SLCCR1FihMHDJMzpWRwy/L2mRhqLoEX/qlcQYiZXRK5NDW1+njYIS8Y4GxoShTWf
 /6v8pjfn1cehfKUit/6BUzJHrPstm9mOyXaPAih49Yhslo4o9/9Y7nqtAMdK7RbPkKHIOEvYyue
 R1It5SdomPEL0E+OQk8D2rUfGmM8PtL9G7pUAQ5ISB9Xv4Pj2gfS9bUzJyqTGhni98Z8IbyadQ/
 U+NCgzT0ZCg4jb3CcARhLdBcFLM8IsI6zC1xFuRaYXzV9aBL596gpWvGHU4bnHz94EK6/VFXX3M
 l2RUhALOL+8HtpVLZxjBYE5BuPQ2V/+RBQnQ0ebM5kG6j6uW07QZ43dbCmWXZ/HsjiIpfqks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

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
Changes in v6:
- dts/bindings: Move the main top register first

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

*** BLURB HERE ***

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


