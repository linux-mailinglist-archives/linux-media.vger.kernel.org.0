Return-Path: <linux-media+bounces-47910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F6C95D68
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 07:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C47C4E1B53
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 06:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C29628725F;
	Mon,  1 Dec 2025 06:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3T2L6Br";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hM/lgsBc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FB279DCE
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570649; cv=none; b=XXvd1wTBhjjj6cMRNmgUqarckyxI0YIgZ8gHNniqGgzKJES6d/On4IqcHlA8FcxdEMK0bHRYv8TIAgzgFAISrqHniWH6oVGROvpTWjGGfATqr7qRJ4RtKYNT6xK1v9YXXcfpPcH0bIWY2pm1TfSvAU+HqX27wWcu5UjcWzh/6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570649; c=relaxed/simple;
	bh=Vr020nqtUCHXarbY4qrdaIXty9DaxS6qdKa2hBaar8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ajiQenEogoA3FwKvTSP2DMiBGLoH9I32oErouUe5T2F0NlTdeA3MB+tE+Q2q9nGSjzQFe/N5Am0TVzwF4SYRkfRZFAWT1/y9acN4a8rC8ifb89MEz5EOKBN0rKptz/cqkLUqaGZ7meWTgwwxIcitfBsXdjaGcVPUamV5tZy1Zl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3T2L6Br; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hM/lgsBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUN0xpn3301533
	for <linux-media@vger.kernel.org>; Mon, 1 Dec 2025 06:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wFtTnZ/UsOPerl2dYASlmm
	2sTGIFrVh6QF3eMPrTd2w=; b=L3T2L6BrbcLGsJcbQEgwI/8Rp8ckFf3+yeqONX
	zlilxd4BgBeX5aQVC6fqFHeShTizRTuggiQekbLHL0huSohv9D7D1r9hC0h8XIbV
	mHbMrFSb0r16XofURfTT6/3atNTPUNhcpqrfrej2iqB7DbOLjHriNKJZaem25620
	DyFj3hfsireMX2A8qug6t+/MqVHrUldSLATScDivIcIInU1/W6tJtVhlHz5QgWAH
	jT9NB+Yc748Q/XoozWSAjV/2dxHuEsZ/V+o7Q1ofQr7igQwTT5FM8zsWLjLL6A8Z
	eNWWRpLSdu7ye5KicKngl6WnS3XnbmCjubH7GMYLqP8jZJcw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqu63rmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 06:30:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so5483639a12.0
        for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 22:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764570644; x=1765175444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFtTnZ/UsOPerl2dYASlmm2sTGIFrVh6QF3eMPrTd2w=;
        b=hM/lgsBc0Tfl+HJiViwtteUPDKenNwNiWkPhwwJG7r5nuXtZBdVKSHhwyDshUDPZBG
         nRF/fTXYN72JdV/REVRUWDX4hRbuM2+9NCwlbRB//aLAHq+XxTDLuvNenJzi9JTw8P9c
         6fAHmt5sZLcWFBjuJfP4VzvNnJ3k8qmAKYeClDNQNy9VQSD7JjYF3pFnvkMoS8G3gicl
         VzBraDvGTMJbr1MB19s6XUyyXaBMz3rOZOs6yEOn34hgtpoegf9kJQVtJ/C0zLcrqWuB
         s1JInX9BYjQCo1pi4rkEiU23k28sXF/bhgOcW68VE5MeQE1Qc+dltXJGs4mY598p1+ng
         Vidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764570644; x=1765175444;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFtTnZ/UsOPerl2dYASlmm2sTGIFrVh6QF3eMPrTd2w=;
        b=UjT3CwiwGu03rlNh6m1M3JX0Tzt60kYh0dSOS3btshhr9j87sEVRjbW/DP+GQBlJv+
         tztDb1Rh4bu+LmFCFj0Xw0sVccttq2FUcTc4D4J5EgrYx3AA/rhIkcQWcYxxiziItqpL
         r0WVQlnJgtofulVLNl6T/Q2K3TAZgHa4fU2FPkfetLj7Bemak6VdmOJ0TxHA+/DACybN
         EqfLJMfvw1+y0gBGkTEB4ScumUrHBi/awrva3Ai4v7IV33KMGPkhXlS+n2uqrsq2rRjY
         yO9ECPZuvnlXbKaDyqp9rpfWHQHjXLq/ac2ZwP7+VmiuWKGxrSSe8Qq4tHaJiCQ66x8L
         pmRA==
X-Forwarded-Encrypted: i=1; AJvYcCWpyl4Ul+dcZLHdIWmxtZr9tgtv/YQ5RbHSx0nhXrZViBzPkga2/M5WqHH/Is4+rTg7QtwY2kuc0loe9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4rT1aCFZbUiwiDxG6MvDybhpLldYT/luMFjR2XXHnIcvLx06M
	icOMgc3lqGr2I57Y6TjrIvjDi4hTsLK0rChAJ7xB8FUk1s+LxsFdxYCG4o8FHvixDES0d5Uw0iH
	07DZdWqf0j0My6ICC/H5R9snfqW8eZEW37i4ZfiOeCf7/H/4jduzE+vMcLHFEBYzl4g==
X-Gm-Gg: ASbGncvLTn3+SBuIXGmtsNhr4b2hiAHlWFA4Wto7sVGJwDXk+KsoM77ZnmxacxX0EvK
	E3hP+BbD96ax7aJ9ZR+RyN6HDqaQaElVINr4DWGD+Cy+2/1EyYGoW7NHWv2wgTphdP100pIsxqc
	aHDk16s+FQgSF1e9sGSwTMAHT745ETzqvGX2ei27i6eQnREvjvYZt4vSpo3Wxdm0MzP5r6jPDk+
	8UvPrKAoUd6+ImDP7+UKg2/G5U3lfpIEfAnZpVw+zEfj4Tdctz841N6ZQcfGAX5ic2/1f+RmeBS
	esYd1i7QQKS7dxi2Q0ovThxIvB0K7ZEfTn+chZLkJKGv7+HesjeURNA5/sSHaMt3tH15+2VR0J2
	lBqs9e7JjJSBHz1fXYXzevO/x5hn1tRwi8zCt8/rKsr/PA4o4g1C669+oZK0Md8jp
X-Received: by 2002:a05:693c:8018:b0:2a4:3594:72e7 with SMTP id 5a478bee46e88-2a71927ab39mr19616601eec.22.1764570644256;
        Sun, 30 Nov 2025 22:30:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWJ/PubI2+7qiHSiPPNTD7owmyzqrOBPWbYAlniIjClTdHR9qEWt/FdJnLB00D1xnlJcaoXA==
X-Received: by 2002:a05:693c:8018:b0:2a4:3594:72e7 with SMTP id 5a478bee46e88-2a71927ab39mr19616583eec.22.1764570643636;
        Sun, 30 Nov 2025 22:30:43 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm62713689eec.2.2025.11.30.22.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 22:30:43 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v8 0/5] media: qcom: camss: Add Kaanapali support
Date: Sun, 30 Nov 2025 22:30:39 -0800
Message-Id: <20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA82LWkC/43TzW6cMBAH8FdZce5EtsHY7KnvUfXgj3HWWrAJB
 pooyrt32EQNhyJxAGTL/o0Z/f1eFZwilup6ea8mXGOJOdFA/7hU7mbSM0L0NK4EE5IzpsF4D2U
 ZxzzNEPIEzgylQE5wNyaZ0fQRUNrWWy8F67AiaJwwxNdHkV+/aXyLZc7T26PmyrfZB8860cA9j
 RsJKwcGVgnfekTDZPMzl/L0spje5WF4ole1Uav4t50z3pw53SpIDlI10hrhQ+gO5Honi/qUXJP
 MhLGuM5wpGw7kZi+f6ujakKzQNrpxupNaHshyJ9fslCy3bmjkwqKpPRMHcvstc36uGy3JHFtWa
 6Wl0Xggq50szp1ZkexRqNCZVjls/yN/fOZuwpeFMj1/hu870tfLV2QELAVhMJPLMGdSU55pwWB
 omV1CwAnSMlj6OIuOKW51U7dXiu3+huy47fwJ/4Drs7tDTLCGzZ/dLaZn6Cn6IGSwHGulXdMdS
 YLTpjuCK3G8vUGZzbwUmnJTBnqoJWNvZmrQALLumHdcaIP4xVlDP7U1I87XS8JXqvm4YFxRZz7
 +AlosMKv1AwAA
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: PeVgchVftGb9m0T9_BKBdGCVyv0qX6NN
X-Authority-Analysis: v=2.4 cv=CM0nnBrD c=1 sm=1 tr=0 ts=692d3615 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BwhbExv1iWKvBhASTEsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: PeVgchVftGb9m0T9_BKBdGCVyv0qX6NN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1MSBTYWx0ZWRfX88VM6oAM95Gh
 Rf986sgZ2vgIgt6dTR3urDDSP3/JlKEYl440tGqCKvSoQSO1d1JTkD69JxfDlbD/wdG0RZbhCMq
 5RrlZGzUFR3bNUfrt31dHZc/E2LFbezPUwQ/esuVYgwADKCVnyAjf1/bhyRt9MMDYFmtlaTjOtD
 ufgObhaapVK8OqjyxKPGJMBdtRj2zeKFU5GRPSqTEYD587TI9N44QH00dNIHxOvJnDUUDgNb37i
 I4QH6qF7hCAoZ1k42GoRsYCLvAH39jJSdHq4nG+f00UR3jmgTMW1gjA5Lolm/I1leUH0pfDh44y
 2kYuBRxsITupw8WHOhE9uuKSE3rIK3eNOf4wHm5n7yAZhm3NpWwUnmFkHPqhCWtNJbB8AbYfKK7
 ObtBnQUAQFfWo22A5jvEiXTkxdbgzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010051

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:

- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSI PHY
- 2 x ICP
- 1 x IPE
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE
- 5 x RT CDM
- 3 x TPG

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
Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

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
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4

 .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   4 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 376 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1719 insertions(+), 6 deletions(-)
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


