Return-Path: <linux-media+bounces-48632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BCCB5BBC
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 13:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48FF33015D0B
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 12:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633FF30C361;
	Thu, 11 Dec 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DU+1OWJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zrv4kLiL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB14D30BF5D
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454631; cv=none; b=YTuOW/SbRRJ6J4evsULcGidNb9I4ZI6BmIQ84h7vW6rcxzFQplKiuJFFdYWac98N5s2qH6gZKacPJUpC/g7gduBrLQmUYaYdz51a8a62s8yD36L2GgLUcprjkIBI2aT4Bz7uc3rq+wgkVREciLbXY/j8lifRoTOLq6/RKbLYrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454631; c=relaxed/simple;
	bh=+WK8HK+awYHYgckuaEH0kk55HcjmJEKwrLfnKA+nY3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LkP7/s/5vLmZrJZOD8ob2eTEUQjpu6H8xl1nZcYy6TW86+Euj1vdKAtlnniyJPewriiDbhRFO7FFErPq4j4D1cWxDcTYY8nN5hnJEW4VTwVTDrH/oGJouAQi2H9A/A5+ZrzjST+uFv+dcjbPgLnL6nb/8JAf4+UdxSJYi56z2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DU+1OWJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zrv4kLiL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBB4bGw1956187
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vMt8wP1i2zzi4a8HI4lPUK
	6OgJaDfh4wND+e12sQiGk=; b=DU+1OWJbu6Cj5ssrPwliDRlHOnrRRcBx9tLBdo
	3S7f7CxotiRZeFV2AjGX9G0xObmY4a+tm07ZPudGrX+45eUxA6DQoC3hmCN94NRm
	MJqaraAeN1228JP7UIerTi2mobqzz5EMEOsYeCwMsMxJnji97edimIjjzAfSgcXO
	qqGnAZbSC7zXqtCoYbyxFIHUglJgqwg6/5S+pNQZ0CbuB30kICypjVOTNiwVGTRx
	Izh7ujlRJmA8j1czh6zJIimKkIMXfKDIF7D9+YOHrcXeGW+n2f9rMu7Zueb8DPpM
	4iuJjGZOLTEBzpDS2Pki2Gm4znB68ctGhNAe/ndSTvpEG4TA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayvryg5n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:48 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11ddcc9f85eso19518c88.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 04:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765454627; x=1766059427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMt8wP1i2zzi4a8HI4lPUK6OgJaDfh4wND+e12sQiGk=;
        b=Zrv4kLiLl96fNWybQWFh1qdkM5I8U17CtkqYljksA1JZD/qeSAgWNN6njEtiGcEWpz
         cEco8mnd7MdBaN33Zq++p5tqR8K1n4wPLWsHy9YSBrRwsTXTsJ0Jk4KkqJMnlOAuELSY
         Fst2HX24Yv1XOI/6v2f6aKjmQaVPbwKf4HuYwi8Bi6Fc+IRC7tF5lIu8vuaDE4rs/fY1
         J90TIfXWmr463HKDV1mEyvIkXi1hPC9a4fgpYdsgv0g0PTfZmMZRKrLU3XUo9qU+UZvU
         h9eOX3/FRAOlGyAK4Et4o756/iUURnhh9iTMREl8I+cFsgSFP+sInkaBTuvl7nJ+4ZuU
         8uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765454627; x=1766059427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMt8wP1i2zzi4a8HI4lPUK6OgJaDfh4wND+e12sQiGk=;
        b=g0YkQYQ5QrscNTAW3gXx+5QsWT8Opu98MoZ3uhaiRUg99gq8HoawAmn5VMd70Wzbzw
         2HzW1M8gdigLTsiOX5LmmpcSD4mEyhnyjaJAYGYJprb2fMkzAINtcgWR6eqkZ8heKB2W
         LDa1arKx32JZH1tNazYVvedMjlntsAamRPt3lXcLd35Gpzm727kB+JOwhp1exiBHl97D
         KE1ip/cV2baa+Na0auaFKT/MQG8aw5NNBtZNNeaxDcrasMIZITYkfCjES1cYNdMvw5iY
         G/qQ1b7i9/oU8vLfKMC/DmIZiylTWf44Q8Nly/8nssofv7DVyiCTlMURSLHbUQQohq/V
         pRwA==
X-Forwarded-Encrypted: i=1; AJvYcCUjDf76XpfV/VgvLTxISWcPb2LpIc3eeJgjNGadWRnu1FV8pN4BRHb9P2XTMnNLQSLLccuhYjT7blmhxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MJs+3pFLFOfyJI7MYM1D4q3XyqaFJudOHc+2WOv5crP0eRMu
	1OaGZpJzNAz0QCDsFyzCYOnp/ip19EgzGlNFSnPyk3tNhe0hEVPI+HSwrQdOmulH28Cah0KsvPu
	CsVtWljZX741Ydja8C1uKcMlCMoBRuyqDhbLFj13XKaVgxmk+z/hwGNF4u5yDCZqaNg==
X-Gm-Gg: AY/fxX4FBO9MUpVIBVI+vewSpt5H3OP/OhqBzL2K3wKZewDRq0fWnyMPsb6zFVrqyjZ
	1rpvgpvYSb1ARV5SjvwSQXzMyBjNsxu3uxLGL38HKR8gKrDn6Pc5Diwp4HxIhSzYVxoG9c+Xb63
	m8jjWTSDlxqX76b7k93Al0t6cqAC4wYFIIr0Pj5HeXnvIJvN26yKIx4gDS8++wAW+KskkNhRkbd
	pMfm1FlVTiXJxk3Ds/XuVSIlZg0TQevyv0+VVg0nhm9cF+FVzlYc3l0GfeRhYTrsvcbBpoYu655
	6scEZcVZ6fPll86QdQlb7EFv+MJBvHFr3UzccyP2NVBfvyxNM9GZlAKRlCmAfKXgvXQlTrPCTyE
	L6nLfS4ydJr5AtYSVVTJaqWg3XSIkNcdJ+LrEvPnOSP1vfWuVeMeHbXKSxfW1CeCy
X-Received: by 2002:a05:7022:306:b0:11b:9386:a38f with SMTP id a92af1059eb24-11f2edf7c3bmr1708069c88.22.1765454627208;
        Thu, 11 Dec 2025 04:03:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1lDLrvDA+J3guslZLGNaf3A93fEcVmHQgAEn/LkgLAD9+g+vloax3IlLWh60Un5moV38qfQ==
X-Received: by 2002:a05:7022:306:b0:11b:9386:a38f with SMTP id a92af1059eb24-11f2edf7c3bmr1708045c88.22.1765454626534;
        Thu, 11 Dec 2025 04:03:46 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm5924073c88.9.2025.12.11.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:03:46 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v10 0/5] media: qcom: camss: Add Kaanapali support
Date: Thu, 11 Dec 2025 04:03:42 -0800
Message-Id: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+zOmkC/43U326bMBQG8FeJuN6p/N8mmqa9x7QL2xw3KAFTD
 KxV1XffIa1apA2JixBhwc8nH3x5rQqOLZbqfHqtRlza0uaeTjj7dqrixfePCG1DC5VgQnPGHPi
 mgTIPQx4nSHmE6LtSIPdw9b73g7+1gDqYJjRasBorgoYRU/t83+XXbzq/tGXK48t904Wvq3ee1
 ULBtR9WEhYODIIVjWkQPdPqZy7l4Wn2t5i77oEO1Uot4vN2zrg6Mt0iSE7aKh28aFKqd2S5kYU
 8JEuSmfAh1p4zG9KOrLbyoUQXRbLFoJyKrtZO78h6I0t2SNZrGg65COhlw8SObL5kzo+lYUjma
 Jh01mnvcEe2G1kcm9mS3KCwqfbGRjQ7stvIB9Nw68xKeieMRoNuR66/ZHGsE0tNskyxkVxop/j
 /nuDbe1dGfJqpiNN7Yb5qeD59vOYC5oLQ+TFmmDIl0eeJLug8XRbmlHCEfu4CfcWAkVkenJLmT
 FXbtnrDrfP3+AfiLccrtD0safWneGn7R7hRXUHoFDhK66KqP6QOS/Ef1PfPlDt/RYilHS4vUCY
 /zYWW4piBPhTKcPMTRXQvOAcplTEqmpgs+yeQH+smwdNPXVfa6Xzq8Zkmuf9VcEt5vf0FAghyB
 MAEAAA=
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=P9g3RyAu c=1 sm=1 tr=0 ts=693ab324 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d-Za1eDmXPogXgNBA_QA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: SQMYPWRmlDfXe61_NuV_Uoj_ReaQ2g86
X-Proofpoint-ORIG-GUID: SQMYPWRmlDfXe61_NuV_Uoj_ReaQ2g86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA5MiBTYWx0ZWRfX1IVzS3TzxNp4
 XNtSfYYrcBnIZsaTW/ahuWQak6aSjpgmm6+UY76zg+mfidCxF/98vRyZ1hrenObnFbKqrzOFV/5
 XfZ8z5dZ7WETQS37HACvZRok20YL7FXcPGTK1DzAdLPowmKAsGGgOmrILJn6+osCIFjPdEwfx5/
 PMIdjnwa3Qv65FpvfQqoMM0bPNRSiPPxKGefV6YFEfvCW6b0T3kK94oDCOS7H8Jzhh3vwT7bNgL
 tEyqrvT1Fc1jy7Hc8swZ2AjgP6dyP926/pJ533/vp6VY71nk5jqD64afmbWpJW8i0Zmq1FELe6f
 +z4VPVPQxKGgF2yL8CAJ/iKS1okUacNP64oOlQoNiby54yOdzFkuM+2NMD38dCZoTOhQCizmKp0
 zUU9H2q8KaGW1Kvrb4+djVQp8KrBjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110092

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
Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

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

 .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
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
 12 files changed, 1718 insertions(+), 6 deletions(-)
---
base-commit: b09b832c719df5e10f2560771fd38146f2b3fd7c
change-id: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
prerequisite-change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436:v1
prerequisite-patch-id: 3ac5d6703a9530eda884720c146b9444f90cf56b
prerequisite-change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49:v1
prerequisite-patch-id: aacb03b359fdf95977805f42918c0b6c39889e32
prerequisite-message-id: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
prerequisite-patch-id: 27c2ef96f0e747ec6b4bcf316d8802356e4cc3f4

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


