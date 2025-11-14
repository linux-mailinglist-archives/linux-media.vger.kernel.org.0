Return-Path: <linux-media+bounces-47042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A626CC5B21C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DAEC4E2E41
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9D824503F;
	Fri, 14 Nov 2025 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByKpZjts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTe/7zDC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7C2580D7
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091008; cv=none; b=onnNlKI80x9zrJ0kWhQkQs4gpiRvh/PfT2oUT8L+yD50By7863TBR+9xymoc37q5twhagc2CtWhaNFCNqpSFqJOD0AUH/iZYyWJw3wRCB1KqgrnRJE8iiP8t919DpJlm/bA4jX9Dophcz/Jn8604YnkaUWP+8j3jfL7TDGZmzOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091008; c=relaxed/simple;
	bh=D1FTubn8zn/ISwZhvZltuSVtAxQZXI422WrxEw/o5ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HLo5cUdwoZlwPhGusFckj7aV4h6W/Bv52c1xtY5z/xie5DAZzlSnUOi66e3n7DqpEIX1+4q9Or2X5qnLjxwTHmzz/mM8rAuRBsHOAjBuhAY+YMbiXNaieqnoVbspmKpq3cFX0ptixIaZiQEDCwPK7tZqOExMra+tuZMca8IOaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByKpZjts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTe/7zDC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb9AG1630688
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QG3yb4cCXrpKVY/9okD8mW
	vorCK6PfJNnIXtzAbkBlE=; b=ByKpZjtsK6qtbvdQ4nr6n0qoFR/uDcw0C5udi3
	/UcC2hLatYwJXk0EJ216pBxYikhh3kP0nWJNiP9HDQOHEJmH/7tCyDE2O+vCAS4P
	gYMPxs+5DtdLoLGeCRA4j3i1K97JZam8PQcugaXcewrYrqS7rHIEW7TD/iGUVaeT
	POPWqy0xrI4McpFJ0W/0ZpLG1QO2NVexwmfAcPizwwQ7xUUjeHpGJtcoWSbWvMGH
	eUOm/i5dxsL35ULn0mG+Qu6RvAfDZCcneAhaHYO/HbE9dI2NKsZqeaoqjeDC5OhX
	ZW8PWpyLxjXNAD84vhIXlKZOK9ET/VTTD8eyIzN5Cu1NauBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d8pfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:30:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99f6516262so4011769a12.3
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091005; x=1763695805; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QG3yb4cCXrpKVY/9okD8mWvorCK6PfJNnIXtzAbkBlE=;
        b=FTe/7zDCsNZyuEqs3WKspd41P1Lg9Vzdgm1UjTvNHb+5r2gJ/kN6ugAs7WGVoB0e8F
         UG00vaTKVNPRYkwMOOIlTPVoYY8UtRPYz85r+Lzxwp4apqCmSfDxZmFWQn4nShywzFTs
         crtMiZ5IXDdxsBj495J/WX+TR9Lrl8ye4Czzp+whnzWK1/r32A0mW/iamLE5HxPv0nDs
         ylmYkB49oyP/PDCTeT7B3mC2YY/+2B3jMCUOb/AHvtDvX5I7u5AMoANSsx1nxgoBzF+y
         wJxie125+uK+uRjKRQYe08V8WpeR7NpKdmkyZYcjg7lmZoIS7R8h/ujfs3ZeQv7pC2zP
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091005; x=1763695805;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG3yb4cCXrpKVY/9okD8mWvorCK6PfJNnIXtzAbkBlE=;
        b=V6MRgGiw5NOZhF8jd+uKsbWdTi3SHZ0fUPgtLZnB7YbnjddOBJ2odArJx+z6WRslxx
         uka9FG9t7p+hV7yi1QGfiaQW3pkav37Kpg2emalKKWhV85AdHzLSJBOErfebAnB7/owR
         Yg8NV46Dot6rclU4rp4SF8NxqhFfVngkyfXIG/rPubCPcWVk6NBKxCNEtp60vAv8GJjg
         sYA4PSSGPKn+UPcp/L3vQvBNxxG1T/Np56XMhXstARqFayMeCRwXFkLX8jH4JYE8Bpnb
         4m41p7wZ+IjCmSeKYeiq6abL58P+cx8s1drcIiQKjvwGXbEwrR6NgWngmGWNJr96MpNe
         fv3g==
X-Forwarded-Encrypted: i=1; AJvYcCUOK/V8xbJHrhCUe2vCvvRYPhqdIqypGaabW/7D9oAkqaXC0FGgGzzUcv/45FMG4on8wkUBEakX5+ZH3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qSLfjkUz3lTn6aihUsKNJTLXJBSelMUIuqQJPf4S1l5a/ATf
	8ahlMXNlD7frUopP1Ura1p9Hjb5kWwCN+wxmPGWL8ofm3IgFVbGIPqvGKZqwpbttnFod08R2VcF
	Dmy0FUEIGYoUDqzAolr0PDeNplZUwfcK4bFzhOprII1OkRz68nLXzbvvKJ4TlFy3awA==
X-Gm-Gg: ASbGncvRJWHrqNud7rHUslfnKhSUCeO70dllDeWf31DJn+s4IjAVmEhOOi+cbjyxKeS
	Udj47zasu+KB+MqGTBzQQENlFC4aWujjRg4Dg0XaxVnUtzneJw1xsqnrJrydKW8KJHl5iEjhbia
	QQqio4+bqo6KA1eYgcE0LuuHni1dxG27bir6+yavVOlVr3BT7zTcZwBCBvVg8EhcutJKsrII0ht
	QosH5X7mTvnvBPGMu4Uup40B82ycuP24MfnIw5PQO9kK4WPM/df2N7IJ7skLutXKfcXHmVs0y5o
	SMSpivQrHmLLHN6eumy36KqQHLPUKXbus25EZ7CnxG6ilkJHxtc3ggpAsqXZZqYWNiE9PdxUYQn
	aYfyqBEShlyZ7cc4nu5ZGSvwY+fMyRUxHAneHFCvwFUz+6uAO9oOE/g==
X-Received: by 2002:a05:7301:5f17:b0:2a4:3592:cf62 with SMTP id 5a478bee46e88-2a4ab8635d0mr474899eec.6.1763091005238;
        Thu, 13 Nov 2025 19:30:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu3U2hyC+nNF4ju1H86N6KLUuoagJGQQx2m79/H1a+sBmnUlalVM18cW7lSKu04eCvzBCPvw==
X-Received: by 2002:a05:7301:5f17:b0:2a4:3592:cf62 with SMTP id 5a478bee46e88-2a4ab8635d0mr474891eec.6.1763091004550;
        Thu, 13 Nov 2025 19:30:04 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm4104108eec.5.2025.11.13.19.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:30:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v6 0/5] media: qcom: camss: Add Kaanapali support
Date: Thu, 13 Nov 2025 19:29:17 -0800
Message-Id: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2iFmkC/43SzW7jIBAH8FeJfO5UgCG2c+p7VD3wMTQoNriAv
 a2qvvuO02rXh0bKwbZA8Bv8Zz6bgjlgaU6HzybjGkpIkQbHh0Njzzq+IgRH40YwoThjPWjnoCz
 znHIFnzJYPZUCKcJF66hnPQZAZY7OOCXYgA1Bc0Yf3q9Fnl9ofA6lpvxxrbnybfbKs0FIuMR5I
 2HlwMB0wh0domZKPqVSHt8WPdo0TY/0ajZqFf+2c8blPadbBcledVIZLZz3ww253cmivUtuSWZ
 CGztozjrjb8hyL9+V6CpJ7tDIXtp+UL26Iaud3LK7ZLWl0SMXBnXrmPhF/vq+w4xvC/VH/b7I/
 +1xOvzEL2ApCJPONkFN4DCmSgsmTcvM4j1miMtk6GMNWtZx08v2eKIW2HfbjtvOH/EP2DHZC4Q
 Iq9/8as8hvsJIbQRCecOx7Xorh1uS4LTpgmBLmM8fUKquS6EpmxPQQ5HMo64U0ASqHZizXPQa8
 Yczmn5qCyPU0yHiO9W8NivvKJmvvwpZEBpBAwAA
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: X8xvpcC9uZueRYY-5HWRVoRVCJ1rPmW9
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916a23e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yQDS3Gn8WMEx0jDyfooA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: X8xvpcC9uZueRYY-5HWRVoRVCJ1rPmW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNSBTYWx0ZWRfXxg7kK8DIGE50
 joUQRK8NoGceQWyhsECP6G/clfw4TwXoG+tEIVV12SbTwvfzAPJo/0Igd/2eTS5mwwPrVWFX0dZ
 ci13O0010OE1vWQRxvDCmxmidMAGY3SZSbtx7IrYUXZtpE6Hn6fFhwBzneeNrnczSJvtb4GGcHh
 PhcDqXz9/7yFQLSTPdWcGl33lZRuh/NwfJkjceKMiyHeVN4DJusWKHbJNIoUcJEit2oAmXwBdBm
 5r0TpIA03KNu+85UhOB8QdTlKAGAwaK2YzVODiDAVOVLQx62gRXekd0iTBCprAWo/KwRAKZdQX+
 ys4c5OA985zqDHzxX1dfuX+jV3TuuMOGtwq1C7TWvVg4z+OeT2MkU3eXwZ8rigFh2ojX0k3djOE
 OwZ1oOhOv2mJUiU8gJ/TSjkijeG0HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140025

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera sub system provides

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY

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
- https://lore.kernel.org/all/20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com/
- https://lore.kernel.org/all/20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com/
- https://lore.kernel.org/all/20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../bindings/media/qcom,kaanapali-camss.yaml       | 639 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 382 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1717 insertions(+), 5 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee:v1
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


