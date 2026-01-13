Return-Path: <linux-media+bounces-50579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66951D1A743
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7699D303271E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1F134EF19;
	Tue, 13 Jan 2026 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv+gz4hJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNGjoHkl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA43446A7
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323450; cv=none; b=VdJNUX22XOQ+uJ/GxTUFyHgcA4YIcnnqfyoaDZDNqc65ADBqMRFV42DCa0o7IMhblvrdKoP0JWbEsYdqIy4jECG3bPkhbfXr6Or+pgqypDegeIg9OHr2RtPXrZJfu70jprfH3bnlX8Fw0gbg/voFJp1qzF+jd0y5SWuIO7aGUEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323450; c=relaxed/simple;
	bh=FuTV8yKkAY6u6qjOMMvptbXjFhaNrD5gYES2m68Z6+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AXxOGbuT4x5HkuYyIrAXDu5vCIzBk8LJuub5RGXObO/tSVECFZRm44B/G5SWa+xrsvRIECOVy+sXAU4fM2YILsU8yWmF84IRnulCstoxSo5AWE55jI/LMg4WBVY8SmQbbVziQMioK7OXya2oL67+hrMExWVYge4QMDtIG4Wz0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv+gz4hJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNGjoHkl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsSvY2071209
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jOOAn5FsdoX6OtORQDUyzK
	OqdOTp2Hgauc3T1xnw21Y=; b=Fv+gz4hJd7qxPqScnumc1RxO3EJxmk5jUL69jL
	QUrXqcjNpnbeSwnI9P6FYlkHHhY/cBGqRR1v4x9JJmk0UQtZOmd2LTi3iwWCv9ek
	eabX/0bWdMCjDzQpFzQ1TwJAWEtqysnB6OqjKHPwiFBVlL4ZvS+xPiwRTjkWwjt5
	31oVemX3USHgqA/PfSkzz0JDcTg9y84NwToNjdHXwiXJZcAycj6x/qsu8j7HcZSA
	q0c61n/Rft/vDFjPbYIlwWg2Zsbns4RzYZFbEWvj0mgh7Wx7zVfIrFJhsNdawvKu
	y+R2P/gsdhV34MwtURlcKz4nVN/01V0ixlNb/X/GbSmj7ehw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8nc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so2016671985a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323447; x=1768928247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jOOAn5FsdoX6OtORQDUyzKOqdOTp2Hgauc3T1xnw21Y=;
        b=WNGjoHklS1G/CaVm0VJHJqE7mool2JOgPTDoL7qhVRVsVHycBac4XT2So43CRBNipy
         CLO3LEScOMh6TLo+EU7ZiHIo39/fbfRCbHEHPOpSRoEZyb4yuyx38bDMALh4u+DCLAoE
         dr603RPMkWRqo/hij4Qa2m0cdLAQzNBQ5bvOKtkqMxhu9aFauycKiw8J4DxgSYPjRlYy
         Oi5j4kLvGpdY0GoFcuZegOrDZhR1Zt7zvp/9gXWWbG598Ebmxlntpgo4eXkZ121z+feU
         Mn67mP6lnTMA4dBgM93+rQzGNuKM6wI2ha3LnEoGRXz+V4lE5SeXARZDkco4iq25pHFY
         bHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323447; x=1768928247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOOAn5FsdoX6OtORQDUyzKOqdOTp2Hgauc3T1xnw21Y=;
        b=u0pAvopK7Nb1+ds8Dsc/pctLdicMNqNDZXahwQut9fRiKMUrzsf4MA/fttKOU0sKJU
         aZnirimhlKHEoFEy3OpxiuWdVqcTPg4KrQxD1s45byg5naf6eGg4TcPUoIAhYtlQcGCE
         Y67j5GrYzfmjrSJ02Vo6ozGObnhHeZVy/86hJMDg6KeGdWs5HOfAT+QVI2e1tMeABz2y
         ru9JxKR6S1TOsU5ZvnEQcb+O05FHp0aGNQuZb47kVDelmeH6cbCmpg+YG311t4cRteGl
         REs7djlV4rYL7/SHdMkekYBXXBh41y4OTj3ODUS2S6GxVpIBbAZwzqJ75iIPStHf0+et
         YykA==
X-Forwarded-Encrypted: i=1; AJvYcCWKk/YMn/H3AFd0bFc3YQa0ZVTYECGfu8PG+79KzBqLC/KsVKDMxoPMUI8Vra0uD1qQqvoYhu2gAo1lMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8S37t4otMqawT30n4MnyWsRAZK8Z1NkI5WY9SCLSM7BrH8/q
	7Nn7+UMCWzUj17A9pZZ01eQYw7e8wX1iIbXfVtFT2Im59tcbsgjUhKaV8bWUA+zJSnSnY1DgZNW
	b7V+7af1rtSgGUGVLnn6S3p2cBc2FiRAzH7fL6J1Kp7olTSNO1uiZHWhRmmRYLr9+kQ==
X-Gm-Gg: AY/fxX5U/tWA4Fdfp1zcxEuu1+JZOPxU+/vIPUWL7gefpW/52fGR2zKsEemLmBQ+CZo
	HAT3PeQ6MsGhPyecN2VjXibGn3rhdeVwBXS+zGmes2qYL3RXwTINaydiR/mmrtEM9rvwPz56wFW
	JO/q1gxLzAXXMZW57qyDaLhUBeyuJDWXgt1TzyjiC3Z205Wwj9qk4/sq8miYdhzItOhRowmJise
	vYM3rbaMwwrXsMaIpEe5HhwIpNpFgwWx3FiFxFRvuTnMOJpC5WA+PmPHft057k41ZtwZIHmOu5h
	0TW4kQqiau3Zda0T+PdKQNExSmZopREGA42AOmJIbzqE3SU3tpjcg+HaaBxogkyPX4TYmCRDEIA
	IioM4cVnJMLlF56pPZkLq+vzcVXaNqnEOd2G8+wkdEg/Wmr9f/PiA3YQOvpWJ/Gi07xsERZZkQk
	5v6oD+fyyFKSAqqu+G8s9p7cc=
X-Received: by 2002:a05:620a:371f:b0:8a9:eb9d:512b with SMTP id af79cd13be357-8c389370d03mr2851935685a.6.1768323446573;
        Tue, 13 Jan 2026 08:57:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnv+zvvUSVye807I3iOxQYYNjQn6GHKp+z4DaM9QnMqbhtS6EBuyv4QUimpYjB1lN8tO2ITQ==
X-Received: by 2002:a05:620a:371f:b0:8a9:eb9d:512b with SMTP id af79cd13be357-8c389370d03mr2851931785a.6.1768323445952;
        Tue, 13 Jan 2026 08:57:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/11] media: iris: migrate to using global UBWC config
Date: Tue, 13 Jan 2026 18:57:15 +0200
Message-Id: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGt5ZmkC/22MywrCMBBFf6XM2pQkhhRd+R/SRV61A7axGRuVk
 n83du3mwrkczgYUEgaCc7NBChkJ41xBHhpwo5lvgaGvDJJLzYXgDBMSW+3LMa4HrZy1R2ECVP+
 RwoDvvXXtK49Iz5g+ezqL3/uvkgXjzPuOq5Pyznf2EonaZTV3F6eprQN9KeUL0XGXGakAAAA=
X-Change-ID: 20260110-iris-ubwc-06f64cbb31ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FuTV8yKkAY6u6qjOMMvptbXjFhaNrD5gYES2m68Z6+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyn4aTfhoELy+96Isg6gj+FEpj2PM4HLF3F
 l1/0r1uUj2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1TmpCACl8frr4Rr5rQxMRtCKc/tXubQEf7JhK63d4C4QxeYZnM9mBbK21nk9Gc0bY+8Y7CoS1mn
 nJptHC4vVnfgOGY1OdJ9ZwRtMYJTn0qEP/h3Kr6znajAFMoTLydKFY5pKyePXFKR6dkc+qslqR3
 pRdk9RUuy+C3pwtYOYBrdiTWMB74Spzr9LN/6XIGYuAaOp9lJKWxW7krmo28iHhdAymwth4doGn
 y+xaoRDX8j746gcU+LvA3jD1r9fPSgnQaxnMKe6kayC/pXSs1rFxMEYAjJFX/EJ8cuUYMAH3X7K
 9Sm7H23OqzEDJpo3NOWagf6Coc/gfA8H1dIsQqFlVuqlEOOs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: voEMTG1z2ZctMVsP1UYjm20S4pr92qUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX9YwbVz0uDFqy
 aEXDZfqG3bcI9j7K9Dm1LCJrRnLtMn+0f9gxdiwpAaiz9x9RxNxCiuRW9m3qUJq1+d3ddU3eukr
 jU3T03wyQVfQZZrbTtkQ3K+TgJqUR+UbyCE9iw7b95E/lx3An9fxxZh80K7mQL/LzHAdT1+YV4I
 cKrv8TUAH6E9Dt1JgZnDMU/7VlD9jQfKvUdJ/70XYYag06dgvQ4Mwi+SUBvTrt2L3E+SoMkec/T
 OqtmZYMyHU1hAR44tN9WAaGmx+6mqXkGSneB/r26RxjV+ykMtXSOiT9NxJk4WRelzyuwcLPnAYF
 MdSvcQ5dSmqyiwrSbDPSmposZHyAEHqSN9rPNsZKKIVLEJiZxuKxG40SkND2hbenP15qYAhNvAA
 PhfsDgcHWzknIVX8CwUR5T43dBS9TOqlgAo9Iu5H+sNH/lAmCpXb89uO1kzSmEDpiJ2W/4B5R2F
 2kn3IGNtknyrSWMT0og==
X-Proofpoint-ORIG-GUID: voEMTG1z2ZctMVsP1UYjm20S4pr92qUu
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69667977 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Having UBWC configuration in the driver is error prone. For example, the
driver specifies fixed values for HBB, while the actual value might
depend on the DDR type. Stop defining UBWC data in the iris driver and
use the global UBWC configuration registry.

Merge strategy: either merge SoC bits directly through the media tree
(with Bjorn's ack) or merge to the media tree through the immutable tag.
The drm patches will follow depending on the way the SoC patches are
merged.

Note: the patches are compile-tested only because of the lack of the
Gen2 hardware at hand.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      soc: qcom: ubwc: add missing include
      soc: qcom: ubwc: add helper to get min_acc length
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/a6xx: use new helper to set min_acc length

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c                   |  5 ++---
 drivers/gpu/drm/msm/msm_mdss.c                          |  6 ++----
 drivers/media/platform/qcom/iris/Kconfig                |  1 +
 drivers/media/platform/qcom/iris/iris_core.h            |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 17 ++++++++++-------
 drivers/media/platform/qcom/iris/iris_platform_common.h | 11 -----------
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 14 --------------
 drivers/media/platform/qcom/iris/iris_probe.c           |  5 +++++
 include/linux/soc/qcom/ubwc.h                           | 11 +++++++++++
 9 files changed, 35 insertions(+), 39 deletions(-)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


