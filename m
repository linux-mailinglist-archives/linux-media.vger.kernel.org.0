Return-Path: <linux-media+bounces-43118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A1B9CE58
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F881BC183F
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 00:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FDB2D2490;
	Thu, 25 Sep 2025 00:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrD18VF3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14C645
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760356; cv=none; b=QJaI/yd1V5uGaf2OLKzzGNp2J7ZrGJGkGe0ODNjBT/YDzQhPUEfLERGnJQn8TUIpNOgdLiT9JOhqba67efkVflr6aWYPTR0j1wjo63u/osBZdrQ7FP8Io3HZdUgIi/Hi1kXmgkCP++sVYFd4k38OM0gMqJ90l2VNS7y9oHW3V7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760356; c=relaxed/simple;
	bh=tquxESu/nRjr22uamAIgymAqRedGWmQ4uJ4GXogXU1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ex2TAQpgMDDeok9D6ZvtevfZmGczrIoXW0x9Z8mKw7ZgM/Lb4VUivdhk1fq71ZlildpBYtt4oa0nvrHdBbK0pQ/ri5wgI346kr4OdYKCJxpTl5ASWOmMirnBzpyUwx2THxrAT3uxTJW8KyuZk+3lCvnbIAGOYwLXGfIN8wQFqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrD18VF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCqxKn025092
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m3yth0Er6BxjFFQbzZX4hu
	kLa5fd1ASG8+CklnfwgYM=; b=PrD18VF36TYdBNkFOOnrPbvo/WwjRgrD6MrYbR
	eUl8uSMnJsxQV14pZ8cwcf8qLYzZyvTnoHkdvEPRDWePJi5yh5WNmxRCscjuERkZ
	OFlNBJ+eHdP0R8fBOvTQ7ccPU1sF7nteAXNcQTAJxWR72gZA6zfbPQosGG68e7n8
	+wYCJzYPIYhilh3cmW0WkOWadowZ6puLNpyekTOU50Js0/O3r9rMory253yMX0e8
	wU2EMdDpSWw51Kz4c4XAS2D9QNjSVGIbY6rnPEH+eFXnIHsRjCB8F9OFU70mCb8g
	BdImhK2JFz4zu4bAe7VJvN3WD5CO1mcfrb9Hv7uEwIb6qCXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexgab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:32:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4cf47c9bab2so13951291cf.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758760352; x=1759365152;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3yth0Er6BxjFFQbzZX4hukLa5fd1ASG8+CklnfwgYM=;
        b=CUDvMbx60afzrP3E0YWQhbE2FrBLiMhxSLHF+jXgpzHk9cRD9NtBAQDeFqbZZjRcl1
         35vBi9QFSBizwW4pWNC1xRdeYedz+2Dh45/Xx3j6eRhRfmGzQomQvP0A1LohDkx/gwYq
         31LWVHkOIKJnbdQ6CmqjNf3fxdR8MfYlATuRfst4SnWjg0+4vpvEvvVDHbig+kgZ8DWy
         vhOP4/LJ2E4u3CFeopbKg95GI+wl63rqvjLG/dAGC/I5LNHUnVU6wW5UNYHBHa+2jDfX
         3P4Asz6pEv6eo89SEkV1C4SAfuunVUIQ9HQ58ry9Lrf+vKHSvPutUG2QhlvkW6HwwBw/
         LBaw==
X-Forwarded-Encrypted: i=1; AJvYcCWQXjfKqsJbHhWCA5YJU2W/oHCMJ7lfGPF6HkUIjPL9GAVdt0qiK1FDNPzI+OMGgWki3vdMdsaa3YP0qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiasF1ei4vEfScf8kAzwYVGApZxY9DczYefVj0kZlbVGastEh7
	M/z2IwpcGgGwhkvS3J75lhTtUHZ3bN1EpqKxBFC95gBnQGPK1N55feLq3ru78We+OmTqH2qKMSC
	+9J3Ro0PjZrtQzUyZKCQAZB/sryTGgYMuBK3qIXGs4SRuczc5nejmirKPLGxFqSduuA==
X-Gm-Gg: ASbGncsg3pUj4xiwlCFT2iHhsn2TvKA3UKZzHiIw8EN13zzHLEE32sGxtyLHCab6CGe
	Lv/8RV8yT2lOLg7Bg3p34FzIDAwTR0xcdKkSMjYyEWSz/wi9QaDdmmYoXLfIvGydpnzZfcYL2cx
	CjDoGnGno+1luO/TDPSSTQzQPF2cy1w1MN3bwDUbP9rPk17UGQeL5tMY53tzN/KEKIWoem2Vbfh
	xRFuC9gsFC5Ck5eQs2NUxapVI3Pr5Z/cfD1uHaa/RDoleEx6KW9JfRvi2h4Bf5uAVt7WViB1t8C
	tVvF3d0zmcfQa3Rud4G7RTP2ths3ucDs/0Da4EQRGDKhbOAjhy5Da61WM0RgWj3fyw9LJtYHQeU
	0zJp81MiLCaC+uqmNNsCrgweQ7HMCbNA=
X-Received: by 2002:a05:622a:507:b0:4b5:edd3:ddd6 with SMTP id d75a77b69052e-4da4dfa46f7mr21336661cf.82.1758760351792;
        Wed, 24 Sep 2025 17:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrcAkBbMUgBHYnvQL0jbnfNZVBsyYnhHLutUzQBJc2Cnxho52Aab7C2HMLQn64KEa3voKmdQ==
X-Received: by 2002:a05:622a:507:b0:4b5:edd3:ddd6 with SMTP id d75a77b69052e-4da4dfa46f7mr21336491cf.82.1758760351398;
        Wed, 24 Sep 2025 17:32:31 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10872687sm1774501cf.28.2025.09.24.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:32:30 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: camss: Add sa8775p/qcs8300 camss TPG
 support
Date: Thu, 25 Sep 2025 08:31:58 +0800
Message-Id: <20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH6N1GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3eTE3OLi+JKCdF2D5MQks+RUM2Nzo0QloPqCotS0zAqwWdGxtbU
 A9m34+FsAAAA=
X-Change-ID: 20250924-camss_tpg-0cab6ce6372a
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758760347; l=2713;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=tquxESu/nRjr22uamAIgymAqRedGWmQ4uJ4GXogXU1M=;
 b=dTJ9DHs82T6UGBGS2Y1ZkQ0opZ3yYHbIFv4Rhi0SASI4ievWKIsLOMODVz0OK1WOl+HEC6qre
 rBMLP20PdUDCiJeLrSWYOiEDjYLBJYm1/QcZ5ID7Csx++HQzRd219sV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: rbXytNphPJzsmjs04AU_KMM6sBAQl-CJ
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d48da1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2kMP3QB-8nRYnlZXCZMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+/p0zsJq4v0+
 JHS9TPHwIoDq7Wcj1QmisOIzLhBIwcge83ySLM/ASAMV0haX1kfvgnfZtTasVZh7iURknp3K02r
 VQ39vd+PjAJsOBhSLCjwGxNrDx1p5LmlsfA0eRZ2lv1XzKEsTTyqcUB+PhZcoOmEo+SNJleVHig
 wbipXIgwrz6SJf8a70TO8eJJOpKgguKmvgCk7IE9vbypgOc3iogJv9sci9ohX6lLUA/YsMKQ38/
 5au463D/XsEKyUhmpTJ0Q0CbxOZaKbg6phRRISeQVXn6TGJfK4rX4oKxJfzHUpSvc2oHn6S1516
 ppGsWwp40wl7nfRG28uG07+stWB0RNp9ZbsL9ca8kAwcnJvgM50M/ALyaie2he6LF9hxahW8ybi
 h+6TsvrB
X-Proofpoint-ORIG-GUID: rbXytNphPJzsmjs04AU_KMM6sBAQl-CJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

This series adds driver changes to bring up the TPG interfaces 
in SA8775P and QCS8300.

We have tested this on qcs9100-ride board and qcs8300-ride board with 
'Test Pattern Generator'. Unlike CSID TPG, this TPG can be seen as 
a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Changes in V4:
- Rebase changes
- Use GENMASK to define bit fields and avoid using tabs. Use FIELD_PREP and FIELD_GET uniformly to access bit fields.
- Link to V3:https://lore.kernel.org/all/20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com/

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
      media: qcom: camss: Add support for TPG common
      media: qcom: camss: Add link support for TPG common
      media: qcom: camss: tpg: Add TPG support for SA8775P and QCS8300

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 219 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 696 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 125 ++++
 drivers/media/platform/qcom/camss/camss.c          | 131 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1227 insertions(+), 14 deletions(-)
---
base-commit: ce7f1a983b074f6cf8609068088ca3182c569ee4
change-id: 20250924-camss_tpg-0cab6ce6372a

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


