Return-Path: <linux-media+bounces-51092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AADED3BF72
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 875893A2C65
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE8E3803F7;
	Tue, 20 Jan 2026 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjbvOy6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFBmFVWi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99A36CE1E
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891393; cv=none; b=Wcs7jDfL2lDxyl2my7wODGRonLsj3pcmnwPWOnC6/LauNaB2k6X5VneRJ5m9S3ldvr4y3c4+/4RUmZtUIToc3lsBq7V4/bPOPFaJ7wQeT67JQEDoPTPkQ8//12tUhZnooBeBI4OKzxFKNIVHRGBNwHtHlZJXEVdkjEIHV2IjVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891393; c=relaxed/simple;
	bh=hfoAzXLqTI0yuJFaKhOjgbfjuP6BlxPjmFABx3KYJhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ea+tx6N4YFQFSxOmixtej6WfadX2pCDgw3hJPkMwB/NFdroObK8anMUFq6Iw0g6ruvqAMYcXCRaFEk8mbr/Bf00lgPv6HmACsZY59mFkVeI/AMHct2VmFRUjAw8fXaAN9Qj+fojLDA1Svz0QLFQYJI0j175+WiUgySyIGnUwepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjbvOy6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFBmFVWi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMBvWl2098580
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rKbpxgXZo3AMg7pqeE0a16
	yE8K6ApJHO+VrUYMiH+O8=; b=WjbvOy6aNshECftZ0Sghqh59lsvtO42VrPcfoj
	BDw3251MSRbX708q8AiPR40RTStKoq9wAhTlj8R22w0YRFWR5MYy9Wu40Qm1XjhC
	o4mbZEWb0R9Q3NvTCTZ0voy+bK6wJje9MbRZadtNEYmUWtaCEoSKb7b3IGPtx1BO
	yL1nL7lqmxMiF3ffXw3Kk6+MWuSw9OE2HscA9wUO46/LrrS3SokXr7XtCAfwfNTC
	x0I8nqC4ZwgPRFSZdQB6frMfGb6NtW0DH58SpPXulDfTRoTHkOuFU4kio2s7pybj
	VHxIhs/Cn3zykyWDib5JIuZImn579uK4swb28zoSI5Yi8zlA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7ju1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339eea50bso6472115c88.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891383; x=1769496183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKbpxgXZo3AMg7pqeE0a16yE8K6ApJHO+VrUYMiH+O8=;
        b=HFBmFVWi4ys1W7TLfxRtVJ3DdErWnhcY1CDzP5O71TU6GxiqEV+o3PjZsUp1g/pulY
         XT5Z3owrAes+vdkKhArXQbJZxuaXPUVUDbul+sq8i5xnVucG2g/7jhWQncvAJBljx3fX
         bftlNUgM5+1CyocY2kZ4VMfwNX+TbAOXyfq43bP8YUN1FMXzN3KJAK7RBwnnimzVY1b9
         uRo3BfC3cQgls68dMk4qnjIZzHuimG2ikrhL2WWCirXSMXCmJI4rZtTqvAb96LrnbDEa
         Pr+vkWXEOCyp7lTy4xeUaNG6cLT20+lzN3q6DDN3/hQ0qvUbpDUV4U+rCwJ/DxsbrM2c
         yrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891383; x=1769496183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKbpxgXZo3AMg7pqeE0a16yE8K6ApJHO+VrUYMiH+O8=;
        b=FtHqspBpjn2bL2GZd6KgWVA8vQkgPVXv5bVXwu3+lSlsZNl/um1venAK3q2Dl8VNMf
         RbMhDGvFeCV/WMIquUUwS3+784I0vJialoeVGV9/lR1tB4Jx+ZVM2GUgSqioQvgreJG3
         scoO6TzIWYryssiBB937SI9K3G7Iq26mclRpIy1czK5M9U3ygCKlen8hUNMEqvasvJ5O
         aIRT85ggCpvxRd/W3rsJhWVwIehsn3T1apqzMi10eBPcRPzno080KrhfMpibdm9iO6Ew
         hlyWzFGNjY9/apUbqxDQ7GIMkbXdmBOzrNi+HH3mx5QhOf6uln6sB1eDTBojCKLoRmyk
         kwbA==
X-Forwarded-Encrypted: i=1; AJvYcCWwoa1ng/iJhWhSLhaw9vzGR2TtQIPC3FvPBjQ1no0lhThz0k5RSAJa3JGf7MIei4yivarqIXNWvbdyTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAP5p0Sq5UZFRIlwkU2oQiuyU3dovX1k9Mfe9Gz4F+7QXYIX9B
	qzCTnZEECUMJmSTEmOoesHjdZHoGzZh+MiZGGfKeqwEgGFKt6Qg61Kuce1nfp3YB8+GC0rhGdTF
	wbVMMHpmWy5UfLPH6G/S+CL290h4MOl2AuzjEMKC31RHmcEefTZJIadno9bTIAea41w==
X-Gm-Gg: AY/fxX7cSTXpG14hIwrrpFQp8mSLuqz9S/bCS94M2KLAn3g5C6bn3HHC2TEfXCYiufp
	YVAFrMfe8h4TbnYR4KRm2nZ0zMvPuu9qZskrhhVV+W3YH+ypEJYnpFhqSGGVVq/y+XMKNhEWSlE
	VVo292tnUp/jEPtDUgiWzbv7U2Ekk7ZSVHsao+UPdF8J8Nqo84iFhFfoLgIHEK9GXgtN+m9gkaZ
	Cw1PiYFtHz14t0viAnzuwIq/mv4lhgd0UqSg296jZyqcig94DicFPNVENyexvg+ZeRRx9HWe6SD
	4hvG8ZV0mCWjDqdd41gGrWg3R2IZn0UkBXTAzMzWtd9WqyMUzwwijbBGINcWrjguNmcm+fmin4Q
	2vfi6tA5richAVLWYEd56BTyM19utkQFeWrQcYk8aGjF2i+kxjUFH6I18fVq+/tEb
X-Received: by 2002:a05:7022:4184:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-1244b380f9dmr11966060c88.36.1768891382749;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
X-Received: by 2002:a05:7022:4184:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-1244b380f9dmr11965983c88.36.1768891380662;
        Mon, 19 Jan 2026 22:43:00 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:00 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH RESEND v2 0/5] media: qcom: camss: Add SM8750 support
Date: Mon, 19 Jan 2026 22:42:50 -0800
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsjb2kC/42QsW6DMBCGXyXy3IvsA2zC1KFZO7Rj1cHgo7ESM
 LHBShXl3esA6dShy0l31n3f+b+yQN5SYNXmyjxFG6zrU4NPG9YcdP9FYE3qGXIshEAJ2hgI0zA
 4P0LrPDS6CwFcD6ErVcGh4LLJDWXSlCVLlMFTay+z4YO97d/3ry/sM80PNozOf8/iKObXfzuiA
 A4yly0RUq2QP7sQtudJnxrXddtUZkXEB1ZyIbLH9kKLmBhU5KWqdyVpo/9g3Jb7PZ2nFMy4fuI
 3lxTTgkY4at3rQZ/sSleZUmjynNpWVVHgPYlaB4I73I7VpqfLCOv6LpluP/J0MYKKAQAA
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfX8uCm8YsUfrBQ
 brOO1NrFB2UnVgzNyIP/y5HQDy4+cG5782mb0Y2/35fLTArErUSpiEMUcWzbW3j6uPy1sYboMfh
 iLReCzNTCZvZduiZ7gmt7uQh42iH7xScYPB3GY4cxZKjlAuCZnltC6m58I823fdXewd/PQrMaZU
 NtaQgnRVgOMTTOuz7bvOg4aKt11vE7uj8DqN4WG2Gg9OVdtNjN+ecyXHO/7GNM3B04n1/Ii9nIM
 EYkLUUd6ovgses63mNxrTebDhf8pEXb85g/jIQuUIWfX8JaJvVxu+A13H4038irITgLzR09wpkH
 w7VWVCCJmbDw0NsXO3DbYyGYxiWXyOsz0V0BVt/Ta9+eBM7a+08uP86PKMg4I/6nE5DJUeTnYM8
 nLdLpVQJrPN5Q2nzSF3X78duVWJDKp+SQRFwzEw5y1Rr4HeW7UehkXT+CDql/R6T1gK3a+cJHoG
 4wXb9d3lBmwuaB9GKyQ==
X-Proofpoint-ORIG-GUID: dxTX8QVJa82MFFPLi-VuyXcCrruc0JmR
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696f23f7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yK2hPAVbfSE63nI4_cYA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: dxTX8QVJa82MFFPLi-VuyXcCrruc0JmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides

- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 6 x CSIPHY (CSI Physical Layer)
- 2 x ICP (Image Control Processor)
- 1 x IPE (Image Processing Engine)
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE (Offline Front End)
- 5 x RT CDM (Camera Data Mover)
- 3 x TPG (Test Pattern Generator)

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.

- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove reduandant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1478 insertions(+), 4 deletions(-)
---
base-commit: 6ada99659c6d6a0cde83e6c0f4ed0ef0ba1867e1
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-change-id: 20260112-kaanapali-camss-73772d44eff7:v12
prerequisite-patch-id: c3758c408ebf6ab407b1977ccd51cd7179316c73
prerequisite-patch-id: 7bb9332e44b93bb9f063bfa0626dd38ff450aaa8
prerequisite-patch-id: eb308d8bf8e0f942d5a0dd1826cf3e1963b05378
prerequisite-patch-id: 8c62245a3b0a2527d4ddf47438926d3b1fe3ff41
prerequisite-patch-id: 36bed25998858225c8e1d6beeb977236cc1b76d6

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


