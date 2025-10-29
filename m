Return-Path: <linux-media+bounces-45890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E401C18532
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 06:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B414B351071
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 05:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0865D2F8BD9;
	Wed, 29 Oct 2025 05:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/AS/BE4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilZN3j94"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D140C2EC54F
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716677; cv=none; b=GJ/XlTXOJ08juMmS2aZ4imHSoN2HYEd6r1X+GSFcGJjsEBs27L0/YP89FpkeY1fJSnuT450NcfPY1qTRpsXkhF6xxqX2HhPFEWXJsEzU4RcsA149LHeVcScxcx94SHzpClOnpAFiAgEXhjb93MLE9/XBVgGCCgS24G3T1eRPuqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716677; c=relaxed/simple;
	bh=F0W5k3SvzOe2pljFMvhAaWmKlZxvDKSkyBzST1T5kfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sEmjPTqu92xenUxRU53n7MFWv+7TUYRsubdoS9YoRmCo6np2uWP35OlzMHIRhQZQb74ltj48R66aQfDI30VSQfqNNJKfizUKDff9va6TvxZh9VZJtMgBGTqSgvk3BUREN7DFh26tmj4rNqhzbmF1FgA158lCct2vri1beum/9l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/AS/BE4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilZN3j94; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4upx43720145
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LC3GMcFuvDtY3XJr35Uc7e
	Y+sExnlTPbLnkdhHO9Mdg=; b=Q/AS/BE4AlEFAuGOBZfT2ZaGNoCEoqt0U8Z8Xd
	MtZ7G9x+9JoKXw9oOm3hnxau2tl4nb4bstc64n/NoTO606lswJWYxYZOvBcVIwrj
	Ikl0Zgq15twGejhfkIVnO7uFe80DLH1LByHLVmsdkymRJtbqPudnpgBqK6nJWKv4
	J/tMaFlGzWTVELu9WGuzRCJXatvVYr6esqKcDsFL8QLlHV2bqUFQdXEGmH8wePbK
	72nKf8k4cAImKxUv4F8OuSm6kVVKtxT1qdR/9Eb+uutnminsc0qUchbwEN0dHNJ/
	mrMmh3z0kqB+i+00DQBm+bEO9Rop1GVO+rGOcGVMhRs5V4cQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a21bht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-277f0ea6fbaso80657225ad.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716674; x=1762321474; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LC3GMcFuvDtY3XJr35Uc7eY+sExnlTPbLnkdhHO9Mdg=;
        b=ilZN3j94xnwuZqraVZVgaXvpt+HyZb5iU9JSzwp432HzuhL1ExPL6aQhgCDNYAy4JW
         iEKJ+xC5o5paYQYEjl3IA7nFsp08aGpSox8jtXdVu0DLh/RUYlEckivI4dJqIBEZACum
         khqjK4R8R6DOZyNjWWD/7qIQfAAptVVMZjcxL1tW4mty09Klv2wGCkaCFBv+7IjYc79f
         TpyHgaff3Z8ME9ZK+XBUUNQ4FlivHIwuN4ZZZk+th/jEUI9j+x1pt6NfGmWWLt/3S090
         NFX3TH28DuCuX/aMOC/DCGfeAub1r8WQY7TY5pJ4kPOaGAEAMs6gGPz59grCSUxnwjVc
         9f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716674; x=1762321474;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC3GMcFuvDtY3XJr35Uc7eY+sExnlTPbLnkdhHO9Mdg=;
        b=V5m749yjg5nOJwp29HHtZ2p0mxS0QZpvIPbL6wSuxvnNq44KN56fNdYl1JWBXMJxbk
         XLrBmzAsmFSaINT6LCcm/5VjX38N/9Vwz7gQbEu7R6uy5uWLGUTa8IJrkBp3qu1fft7E
         sp2bRuL1T+vD4v2GFrmASBk5CwGUg67kkp98rKdiuU0JtsZE1oXkvsfsvHHPmJW1/NL/
         LCc4zT+I/2iBikbLhmjnZGUhoFiASJn6fPhRhP4m027/MlI9qXOTNXsJS3Efmzqn0pmr
         Tb520CIA3wG/KPISlgjHIRJ7MvExF6YDSlph42tyiy4J8Cbj66stWFikIkdNJkytmlTw
         oehQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzSnrpKr5BkdBAiyACirjoMsbtOKOf3ABe6JMPjvV1QDIJlWXPoiixhxxhP0oaiTaNgMcLpwm3U/N8lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZkFJffUKANWOtayW+khtimtCKeNN5Tvj/1qJsRYbDB0LlRDyr
	3A4kY+C2T70xWoHeM1LpmDHZq9oL3C7eyoZY5wAcMAF1QF+N1BOlaPX2v5U2gwQiKJBiPO4p9rf
	2mkAld/IVobtFIvCMadf9XwuNRTziqaxbBQ4/1bkqTvlnFW5c2LC0LizvK6IXzXqWWw==
X-Gm-Gg: ASbGnctT6JMWmdCy3xJkVBjDbcz2Age6IVix3LmdtBekG2Mi8+rtw9xyPPSm5Sq5nSR
	SqOBtKjFAVwhD0UmOnlbywn1BAL9EkBdO16OJDeEUxL/QwJ2lMNraNsd+Lw1s9PnqZpb6Nrelji
	rfQ5U6rxetcxc83SX5ie297k8LxwXe3oMxgeOSG8AS/yloItQtaj68kbABcOcMCupNTtL7ZNHYx
	29oiiDxrp9GF3Q8+/ZLrctNqpqNdmwaodeBGLoGPvD0hZgF2TXtM6kLafnoqYwkxpIk89vHLlw6
	oVzXyBgYu5jKT3N0HyfQGgbx6tOjBj2OTBGzKgfOerKAvWSQXOJWqXCSsjp85xlndiT56udamTg
	6+ZBeJGKwieQW8aDT1O3Dnjv4gcYZhx5YxgxN8Tbo0WcoCWKDDE9ilQ==
X-Received: by 2002:a17:902:ccc9:b0:27d:339c:4b0 with SMTP id d9443c01a7336-294deea9531mr21189195ad.35.1761716674195;
        Tue, 28 Oct 2025 22:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwIT/+Uxh78/COAQ0RUyc4JxApOhZCBiPwjnlxdxjlDaZnqWNHQph4VHfmOmFbB2rlTLvPFA==
X-Received: by 2002:a17:902:ccc9:b0:27d:339c:4b0 with SMTP id d9443c01a7336-294deea9531mr21188975ad.35.1761716673694;
        Tue, 28 Oct 2025 22:44:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d1fdesm14280643a91.5.2025.10.28.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:44:33 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v4 0/6] media: qcom: camss: Add Kaanapali support
Date: Tue, 28 Oct 2025 22:44:09 -0700
Message-Id: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmpAWkC/42RwW7DIAxAf6XKeZ6AJE3T0/5j2sGAWVETSIFkn
 ab9+5y22nrYpB0A2TLP8PxRZUqecrXffFSJFp99DBw0D5vKHDC8EnjLcaWEaqUQO0BrIc/TFFM
 BFxMYHHOGGOCIGHDCwQO1emu1bZXoqWLQlMj586XJ8wvHB59LTO+Xnotcsxe86FUDxzCtSFgkC
 NCdsltLhKJtnmLOj6cZBxPH8ZG3akUt6vu6FLL5z+sWxWTXdk2rUVnn+j/I9R1Z1f8i10wWCrX
 pUYpOu1/In1cfiU4zuy5XKT+q95vbVxTMmWDEZCKUCJZCLFwwIpfp2TlKEOZR82E0GdFJvWvq7
 Z513k/uDre+P9AbmCGaI/gAi1v5xRx8eIWBRwKqdVpS3e1M0/9FUpIvHQlM9tPhHXLBMmdOmRS
 BFyuZBiwsaIS27oU1Uu2Q6IbTyJ9aZfiy3wQ6c8/L4GXHZj6/AN75hRONAgAA
X-Change-ID: 20251008-add-support-for-camss-on-kaanapali-e5b6dbd5209e
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfXyN6dxbwd8cRq
 YHUk8pF6miQQtM2hqFHHj4CiiT1IdW/yWUwkhczrAJQVsUoOg+rc6gTfFB+o5Im1UUCwuJMOdde
 rmAt2lgMKkkF65+UIt2xxius6Su1gW7n8py6WH7p98qp1urV9RRq4zyvUoDekhr93JkcIjiJREL
 aGZhGDcCu3+hjV9pTTRI/8L+enB23hOvWqj2XlokbY/fUwLs0miWdwdQwyXv2REwvoFVJlVAEea
 Jw7yqmAXQWA+h13G31t4cECQFEOOcHycbhvDLJc+o4BVmqW/PjHlibyNuGZoGzwg8XG/MKvBI3p
 SrMFDHVIhfpoY6eM+qJxoKY+cu6Tm6GyL5ljdQc9KIBBqSmU3mpLxQYC18pSjcUFVvzJsR5qOx9
 9/B4zEUoBOMcYG/LO4XeEMEcIvtOag==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901a9c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AVJvM5lMoBLg5W3HYfAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 27tQPampr2yd8kAwcX0F9URPDry4AfY3
X-Proofpoint-ORIG-GUID: 27tQPampr2yd8kAwcX0F9URPDry4AfY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290041

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
Changes in v4:
- Refactor kaanapali camss binding style and commit message - Krzysztof
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
Hangxiang Ma (6):
      dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,kaanapali-camss.yaml       | 406 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 382 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
 .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
 drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 352 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 13 files changed, 1486 insertions(+), 5 deletions(-)
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


