Return-Path: <linux-media+bounces-47542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D558C77493
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 05:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 608DA35F218
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 04:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FC62F2612;
	Fri, 21 Nov 2025 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBdec4Vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSGWbtw5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14F2D7DF4
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700228; cv=none; b=B0Jp8K3G3FzBJnbvhIQEcoXT51wzKYToQMzkD8l88IXN7r80FWxVPTCh8mF3Zho/TNFiZFVUBzYgQ5zWqprmbEUiJjeTe0v+Lsx6hp8s1FCKGUGyOGXU6o3UV0oa1TV74vVZnbr9dM1bXW1/bP/l7b1QV0QXEMUkNK3dET0nRvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700228; c=relaxed/simple;
	bh=3Iku0IvR9ZUucYaf8M6BbAcl3AfcXymcNWEowgjyKY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u4y0xCVYRIKbOxmnvJPP1H81zZtNOkMBTNDKgrEOKhg7CuGwFl/WoCUbD3T3/3WywnlhvlVZu71t5EwJkqU2CYotnHX3REhBJ9r5dq+Zf2ZZDbmzltTlpsKRo97IXnOzg2NF0KCPYNuPGoVRE4lS7zno67FEAsMjSpbK3cGJ+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBdec4Vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSGWbtw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKBJ9L2051038
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VAaOY6iCiep7qGBDL8Stf4
	xqfyBbmZQAE+nfW3ORNPE=; b=KBdec4VxSP4E8tS77UDDS28jcvjU9IvPzDpYF1
	AB8cZ2550Cgs3ok1oRdrEr0oJp+iI8xLNJXJJUBugQSYIZOmi5iw/8GKH7JXE5KO
	eT06qyXbER+uaGcHPPtahx5fwHK1ACKoOaNa3kHUcYi1Ih6F66s8+MAD3BOJenrE
	rbE8DGD4/W2e58QSwdDUM3MxdEa5UwxUSRW8kI5q/wfRoW0GvorvGkyVrr3P6E6S
	URWxey3rU0K9lxHQQJux6iFwi5yxCwY9c2HDr5IhVBlFxlDNPlFKihh5s3CLBtkP
	ofBCtnRWW2zQIhH6TNyBTc3yQwEFEtbhT1bFiLexHFkckg6A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj0m9u4kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:44 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-3d34aded76bso3195044fac.2
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 20:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763700224; x=1764305024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAaOY6iCiep7qGBDL8Stf4xqfyBbmZQAE+nfW3ORNPE=;
        b=OSGWbtw5w79gseh2F4To3+dcvGTWvf0FP2V4kmpKamgXX3Ci5MiMZ1m0oYPeRVzLNy
         4bvF72/o406nElr0t1vCHX/vYBn0yDePFm41TgRvPipttlEwU5UwoXJnJ0EITmajyhH+
         DZdl8WVSKvtDqyRrExf+QCuAHsdZRMXhomC36LyvmkQGQg+STs8HytZcoYm5XbHjSfOi
         sicC6XU/ijGP4LDfoTeiPPQ9a41jwxHy+dDy+GOHgRy9eohMm4VpV+zbzreP3+B0JVxW
         IvXePSgDIKKAnSKKeA2eqyCpkRBmnWiqJsysoow/u5pH+3n0/IVB/yLC7btdGNW12pNF
         pSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763700224; x=1764305024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAaOY6iCiep7qGBDL8Stf4xqfyBbmZQAE+nfW3ORNPE=;
        b=jrmalitv5PtoqQKPUsRA6vgMO3gkLCVCPiDyVu85ZH/lnCSyovgqJMwcWDuuee67/H
         sx/8BGueMgmg2YPzuvrsfn93AP4lAqVARShJUURQ9iYVdb2QE4xoNQv/PxIIZVK4JHPr
         8CELrUtDx86ALAPECQUsnB+S1m9iXb+zoUZM5kz4XjX2Otor8DGonlRiwIadqdUJc2ZF
         WErHGr0o+BmRbhyEj6luuJiHXhtfeKKBKzSrP5S0kZ7+FRHQGrXFG6CyXmQn82sztyQW
         gLdsspWoukMW0jGSX5eSf16DJc+dql6c9LMwn3runu+ZP5j8RoMzST4mZFaiLYrXEBrS
         d1og==
X-Forwarded-Encrypted: i=1; AJvYcCVnuwtRs4j6+VCcFDkG/4unHBduUSMGwRkFbm7b749Bf+qGdFQT1urKOH4d/MWdvLtaXC1eAPSAwWLq7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBZEXySmZpgXVd2mJg4pAlBRNquPmUhWTXgmNm5JXScMnC1Xe
	RQgAmwa7Dd0FS/wwjR1OtmgPTk7tqGMRoxmxPVjThP3S9tt5rJhntR051geszHsXmY9cxl7ilaT
	ep2i3uw5Bd2w9pDnG5OkGZ8psnHo6J9LalLE+bBKyvTU31NYbR4jyx54HfqD88QtU9A==
X-Gm-Gg: ASbGncsuwUr4vu8TDmnuuvR/zMgmkihQ698DRjOqnivvIWH14VWmIi5Rnp85piMVYAr
	llBKGNoxLlOwxbVR909FQ6dYUpGKrM2fqYdArxqkxrQNpuRRhvMEXDRLX+PxXg+tYFowctwlgzE
	EwDUYAs640NgwbRKXh/BKE4QbH/qGpJUNUWDUw00mxAsYVE+lV/KgvdHqibqdACtrrU38nRTPQf
	mx5bKYhsYpmTvzzYweBa5czwoUNB/2wdlFGv/VQQMisv7S/EMt7r3R9BCg8V7WFCJr6dkXAtSD0
	eurIplxz/vBs+B53G8APwtrfAx0ue5y2LQVNX4Pq14sQZ8NaOsdQRBXvnTu1A31U1ocYxWEVDSi
	CihPSPmB5ImIy0HSm8VBMXtKDEmQSg9UoOCELhu6KPZbdNE8RSVlUPuMN/CgbElop
X-Received: by 2002:a05:6871:c709:b0:3ec:a4ed:cf48 with SMTP id 586e51a60fabf-3ecbe52247fmr415223fac.25.1763700224198;
        Thu, 20 Nov 2025 20:43:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpEsbHijGIobeD1ldfSAfB6MDcksJCsrFOnx8GPMT2pErZD0fCcsDJzbRfzMeP4/7snBpH5Q==
X-Received: by 2002:a05:6871:c709:b0:3ec:a4ed:cf48 with SMTP id 586e51a60fabf-3ecbe52247fmr415214fac.25.1763700223778;
        Thu, 20 Nov 2025 20:43:43 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9dc2185dsm2198927fac.13.2025.11.20.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:43:43 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v7 0/5] media: qcom: camss: Add Kaanapali support
Date: Thu, 20 Nov 2025 20:43:12 -0800
Message-Id: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODtH2kC/43TzW6cMBAH8FdZce5EtrHB7KnvUfXgjyFrLdgEG
 5ooyrt32EQNhyJxAGTL/o0Z/rxXGeeAubpe3qsZ15BDijRof1wqdzPxGSF4GleCCcUZ02C8h7x
 MU5oL9GkGZ8acIUW4GxPNZIYAqGzjrVeCdVgRNM3Yh9dHkV+/aXwLuaT57VFz5dvsg2edkHCP0
 0bCyoGBbYVvPKJhSv5MOT+9LGZwaRyf6FZt1Cr+beeMyzOnWwXJvWqlskb4vu8O5Honi/qUXJP
 MhLGuM5y1tj+Q5V4+1dFVktyilVo63SmtDmS1k2t2SlZbNzRyYdHUnokDufmWOT/XjYZkjg2rd
 auV0fgf+eMzHTO+LJS88hmR7+BdL18fVsCSEUYzuwQlgceYCi0YDS2zS9/jDHEZLT2cRcdabrW
 smyuFa5/jHbedP+IfcENydwgR1n7zi7uF+AwDBRSE6i3HutVOdkeS4LTpjuBymG5vkIspS6YpN
 yegi1oyDaZQg0ZQdce840IbxC/OGnqprRmhXC8RX6nm4zfgLXXm4y8h6sXOmwMAAA==
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
X-Proofpoint-GUID: SHdq5gohWTGw-X04I6BngrKHT0vly79s
X-Proofpoint-ORIG-GUID: SHdq5gohWTGw-X04I6BngrKHT0vly79s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAzNCBTYWx0ZWRfX/vbGESjjBVE/
 D7A/4rtkqk2OgegBKmVyd50PNWa0SipnvUkyFb1a/D3Im4R+RguepYQEeZIu2pLK5jp53O8gSTF
 xMg+1rSv3T9vCkXOaCdiRXoytJfeHE3ErXMsThk+Ny8hdz+LPl30lqssJyyx3hfI9oMk5ewltVm
 gvAsNgrMf0YPiHaqUrS55LjHKoXqgavSdHBsdjD2vhZvsYov6FbRGRKZ5wbJRs5K1B7K3MBxVDo
 u16cDG4fJAoPlc2ptHmTDHIa6gVhEkWNWeOB9hsoMfoZl3d1ADt6cAZ4RapJgPxoHKXssaDwZYN
 2YurbJJeOxbqSPx4y9YAYPsr2HEcTT4jNYbMv/wOSKIe6JhYNFo8irqp7OtpadZLYneiy5XDT47
 oUKr0fL+OfJQgJUdNNwdTeR9FVcuSA==
X-Authority-Analysis: v=2.4 cv=DtFbOW/+ c=1 sm=1 tr=0 ts=691fee01 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BwhbExv1iWKvBhASTEsA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210034

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
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 377 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 ++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 +++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 12 files changed, 1719 insertions(+), 5 deletions(-)
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


