Return-Path: <linux-media+bounces-50512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D8D177F5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 982B73017676
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EFC3803FF;
	Tue, 13 Jan 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhlVsbkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KgqBz76j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554332FF646
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295017; cv=none; b=GgyhM1QlQ0UGgglkPMvjTNqf8wszOI2jNFt0UfFECOPdqlYSoMFKi9pZIunUvwwQQntiwuJiKRKlWKo/jKRweWkoFEEb5z4d0YwzW0f4RL8q394OwutGKdJD+WvLm7vrwlVIMCRopBJ2Dc/c1chVmAoX7cPBofonjk6TNmNXmwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295017; c=relaxed/simple;
	bh=CCrBPfDUHXCLF+sAKdTxaOUPPDGpDxTX/YaIVUXDBP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Apzl0AR0/i2JtkEP1o41d1DaFtKBCQlWEu9OKAlAPsDQigZSaEWGdPdbK71TmwL036husEjVn0MTnm1eTGT9fG13qiSxElr1Qjvn9kEeNJkCB4j5lS/kp28HK61fZoSS8yo59RM900GUDfJii6idc0DPdRiTkg6mJ3LzAH3sQOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhlVsbkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KgqBz76j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7nNmO3299965
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cXuRG8HdAcGJj40Bzvm3fE
	n/FAs+C8rYmBIErtB+Ask=; b=VhlVsbklC3V1o8k6IgeF+ujpl5QDrP4P0fQFcV
	x5wn/CmPdC34pnd98kXKuPiLxYwcKtSKBdY9NTykBs0faSNk/JpSkXgI5+jOalQO
	7LLrbGpBybOFNeJeA7ierXSDWJPKZ1aMi1lHJO/95HZr+kuhGH888JrEcGlhUDek
	+WM5cgpbRuu5DiYhExL0B9jDxy+A8kBd7EBOmTKD3uAMlhQKV3Uc/CwLVnGGTTmg
	Z5WVv67P3HSXnYLfoil5l3YLTDJivi3+XeTZYtklTYTX5rSzCUHy7ds86sNHh3OK
	426vBD+if86Difz3rLcC6Tn7ff5VnoE5DSuKinm1ElvkvEKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma3sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so159445311cf.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 01:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295013; x=1768899813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXuRG8HdAcGJj40Bzvm3fEn/FAs+C8rYmBIErtB+Ask=;
        b=KgqBz76jypeNyX6ggiEqVlCgig7mrCsIwIDUWMzAfmwQlXYAAfzSIiRXFt3asarcm1
         6HoeVhzvj7xjhPdfo8fAWU7c2I6K6NFB92VKOJUBHnQijIfFyi0ALDScF93COcg7Cjt5
         VmZtgiD24ey+VlC7C+R7YrHl3PhwedkCglX4+UhtBllIsMB12Ms2/RCHeCRqnXe1b2Y6
         7k4lNaRAA92mtb9afUPOBgS2v16hfVkNRkFkkIlOwlnGQNzZnTJshp641WjdmMHtPaE+
         ui+3VdjOxZh7r9TQClfb6Gg8QxlOcSxjojnFi1kftaycRKA6FuL00/Xeho8NHD3cwJHn
         K00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295013; x=1768899813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXuRG8HdAcGJj40Bzvm3fEn/FAs+C8rYmBIErtB+Ask=;
        b=b1RVtYzpCas9SqJiMKiXVQy8Pz8eHZ+1CDBbbLxAIXRDb4GH36MuyehfYF5BVnbbKe
         9jVw0H5XouV8rbNsNzZX9xBmPnI97srBjX3FhPjXS922EQwYFkIvBQVu6Vd8YMh+39a7
         yJzinPRoekD5FL2PGWjiI2SL44Dv9A1WqBq/9rrj7LWUzW4CqByUtoouGXQRP0iYQ5MR
         6F9bM4EuOVCA9p1wScfjy+tmYRMP0KDLN/+gUOeZrMMRW+vl7Uo9paDLNltYqC2rPTrY
         /nLbTr96jSKPObx0W+ixXWudFLepVtVDPoTCXW/WpYgFbV2zNvxpHiIviIv+8tZV7Nyw
         QvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFXjzZbYUCnS87BDj331ISFXRSmHXxmZx44Ur98fyb3ESNJDxBIUGbkj8p11uKAFJkjtRqjCpCBz1GMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSWzxTYB0ZRR8RHOyXgzDzNEd6/7Ak1+LPJrnjzvYcGTj2Jxq7
	Rl8mKHlDsf0yHak8VCukTMJvcJk2XAi9y/Ky7K3aWFs50V2CM2GdTeJc7x2E0Ik7XJndnhUpLib
	5arc3kJtOzeZ5k/ke4mdHlWy8cQ4KA33ehHvlkRLjRYb9oaTn7MRrJ/Ml4b0XZ8HOmw==
X-Gm-Gg: AY/fxX6SS0ySpvq1SjPSvq2+oDTf8l75V0TBrhOW2ikbEI62EPw6U13+nvRQOYmJQE1
	N3ZTVKkT243I2sBkGLE/lf06L91g1qFqkAEF97V0JIS2N3m6IW12xdf2j3J9GP/rdY/pzIgPXTE
	kVWSLpKmhNqmMzYZmmZ1xPrKuDxGcxRj9ip3ZgvF2DZ1RPUW23WdpEwiaYmSg7glObk0bI3eBOu
	DEd3xiaZKLZ1Z2oYpTqimPf6OUeEa8JZ2nL5tefHyJrwYRluZqeCBBruqAqVXACrbyxGfKRAMrU
	lmHEdQI9/4G7grMLWgaTvDvVWczGlCDwRvPsGoO87q7stqCu0mD0H5aHkeC9YH6mjOiYQZv4oz0
	ZMNsWdNzhoY587WVgBTxzdJj4wY2RqM2h0DjBwFdhOTNmv6rcUyrmotpUl6wyxBQfJpWj3xMa53
	0H
X-Received: by 2002:ac8:7dc8:0:b0:4f1:e284:d42a with SMTP id d75a77b69052e-4ffb49e6a63mr269174171cf.43.1768295013421;
        Tue, 13 Jan 2026 01:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOeHMzJUmr6BiFWhpv0+C6YitdnE91LicHOFZU9OazCjsnxlnjcFa9txQZlVC7PFNEtI5PYg==
X-Received: by 2002:ac8:7dc8:0:b0:4f1:e284:d42a with SMTP id d75a77b69052e-4ffb49e6a63mr269173811cf.43.1768295012934;
        Tue, 13 Jan 2026 01:03:32 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm154352586d6.8.2026.01.13.01.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:03:32 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v8 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
Date: Tue, 13 Jan 2026 17:03:25 +0800
Message-Id: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0KZmkC/23P0QqDIBQG4FcZXs9ITbNd7T3GGGpWwsrSko3o3
 Wc12Aa7OfAfDh//mYHXzmgPTocZOB2MN7aLgR8PQDWiqzU0ZcwAp5gijBlUovX+NvY1lJgIUnA
 pGRUg3vdOV+axWZdrzI3xo3XPjQ5o3e4KQtmXEhhMIeElKYtKakKKs/U+GSZxV7ZtkzjAioX8A
 /zWCHkElJKUsJxkPKV/gGWv5/QwxQ/Hd8dleQH5I3Gr/wAAAA==
X-Change-ID: 20251226-camss_tpg-b23a398bb65a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768295009; l=3885;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=CCrBPfDUHXCLF+sAKdTxaOUPPDGpDxTX/YaIVUXDBP0=;
 b=C9WgBLYSzGKYlzXRqPhwYWEFVyNcUgfgB+78jhqWDx3+HZoHu73kCtXgD9q7XGm+56NSod/lL
 HO5aRKHuwuHCBK3yr9JD9mh99ZWGX4h0PcYSL3xkNpy1rOd6f/Qkd5w
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: RXWuNL71p86_Qn_SG3X-vXIKIPBYUnc1
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69660a67 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=GpE7naLpSaSh0VXB7mUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RXWuNL71p86_Qn_SG3X-vXIKIPBYUnc1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX6+tPDMEJjwZQ
 mI5lOiItf+ZhbYh1InyNolYDEiElzlzdYEK1mREh1yz+iiKqthDWUbVBwBzqwP1etk+XvvceJVu
 oyKZtDrijChgjghOge00fQrU/fmDeCJ8uj94VDVBakIATGnVTWk8J8Qwi9mC/u/ggaGXM9A4TMZ
 itCfOlzgWvlDi1BB8MyX7GmhP+NS48p/WWPeHvLCapSYzRRLBRrEZ+cjwrFIMKAPyk5jVSSVnEY
 c6n4xTjM+6uBY1aKD9n+kNnkJv8mqI0Swgqxvj+8oTHKDj7L0Z24kn75Ez+vwqJ++DwMmTii5Wg
 PawDYjKx2VrWsCUXHoPR6XpM6jpdEOBf2dyeQOQBbrQI7buWbn9nejgUHqpjfJBv3lMX3K87RqB
 /2LbXllF5zvN/pD3YBcaTVufz164y3lONSAMKSErwdDoZVQUQpK0aRV3sLfzVdvShgnEzbXKexx
 x2Cd1QI6bTYwlXLtD8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

This series adds driver changes to bring up the TPG interfaces
in LeMans, Monaco, Hamoa.

We have tested this on LeMans EVK board and qcs8300-ride board and
Hamoa EVK board with 'Test Pattern Generator'.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY
and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
  --capture=7

Changes in v8:
- Fix error bit operation. -- Bryan
- Add tpg link check for tpg enable/disable in csid node stream on.
- Link to v7: https://lore.kernel.org/r/20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com

Changes in V7:
- Add TPG support for Hamoa
- Add differentiation of register bitfields based on hardware version number.
- Fix the null pointer issue when TPG clock is 0.
- Correct the clock dependency for TPG.
- Link to V6: https://lore.kernel.org/all/20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com/

Changes in V6:
- Addressed comments from Bryan and Konrad.
- Add exception handling for the streamon format.
- Link to V5: https://lore.kernel.org/all/20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com/

Changes in V5:
- Modify the commit message and change the chip names to LeMans and Monaco.
- Add the header file to resolve the compilation error.
- Remove the definition where tpg_num is 0.
- Link to v4: https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3: https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

Changes in V3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to V2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in V2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to V1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add common TPG support
      media: qcom: camss: Add link support for TPG
      media: qcom: camss: tpg: Add TPG support for multiple targets

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  45 +-
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 ++++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 710 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 127 ++++
 drivers/media/platform/qcom/camss/camss.c          | 183 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 12 files changed, 1347 insertions(+), 14 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251226-camss_tpg-b23a398bb65a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


