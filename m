Return-Path: <linux-media+bounces-50830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9866AD2D2A9
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80F3D3040203
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C186F34BA24;
	Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDKpF6UI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjBFFzkr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB71632C8
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548463; cv=none; b=Yq3zuWAphCMQzn4WMcKyTZD3/oI/TNb7WXsYCx6dUaSQqtUA7UH3t1qnnq5qHJSLdfnBAvxUEM9GIYECM2fUZLf2u7G2IUCF+JAxOBzZF60gIgokFRUzsBh+2VoIIXEQaU2F8sAa2KmQhIQxrHL2afRkxJhvm1ixytODut2KVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548463; c=relaxed/simple;
	bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uILhrtPTFXbQKmI0YROJUZL5qpvO/LMu5QsuV74akHg603WSAqea0azyeejrQ5Cq+KBa5n8fX1GRKYSuVCPTmWnIS7njXeM2C96tY3jdz6+0dHlffCMUC6Wza3gQN3MGo9SQi2LtFaOL5S0a882SJZ4MRnJ736ssfJA8rRo5ugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDKpF6UI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjBFFzkr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbd2Z1240998
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T0TMXQPqtA4+cBU8YRgxLA
	V4GrYtwj53rF4X6f/w0Fw=; b=cDKpF6UIGtOIC1uxr/epUYgZosWzU98ddK9MOc
	bZKXfOAZZrMXlBfkoLjVniWCq8u17U+Dcgy3gTDzHhZfqAVIZrSo7XGnhqDAiceM
	S+IbBiE3R+Z7w27hF9evOiEp1Dyl04wmZ08GBYAtaBP8kqMC39JSSu5lA1mLPaUz
	11UHd2RWwo1GLy21aX/IuF9lcdtvIPZeSlGtxPgaZ1AAU91oI8IsO5FBERN7M+3p
	VolyRTlqOJao/e7zFBT77xIGZXugpF7ql7VUj79pz/4pkP+AaLSeVZBPNjhM5eWT
	M0TfOqyJ0+JmZH//o9G8klUu6RU6xNa92qxQNewF9bl41LYw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a7fb4421so95408785a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548460; x=1769153260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
        b=KjBFFzkrtDGOingZ7AH0zvgCztES77InMg4dqNQOuPssPIZEx2KwieXg+WgMveSDU3
         SbVP9XVJx2fx/fDKXQ0G69CgV3k1+a2JL4m5wbJHiQnXQDI8mh5Sy5TEuRUefKh8U+ZD
         jdKg+VhtUB7rJBJRC7ehXsi7hzGUrq0NosCUE5YqHR8BEkq5IcljQywfqQTdEEtongsq
         DJY/75cXiQERZM5AR3FUKAc64qQuWqBjENezIl3ssR1l8QzyiQRq5sBlXylkxbXEA07c
         GS66qRSLYrtLGyyAbw09SMLeqb0rANgzZlgapjpFmHLoHZBtkcwW8yQ0VG+4nld8q8RP
         JP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548460; x=1769153260;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0TMXQPqtA4+cBU8YRgxLAV4GrYtwj53rF4X6f/w0Fw=;
        b=PgTA3a6iENmZfI0CpsB/sypE5eCDWnon6WTWjmM8QRjKIMTcLWuAq0uCOYKQdenoIU
         tqEhT1WOq/NN1PV9SF5vLs21zFkuG6x+4NW4rVdopyaxGxM+kd/bS/J4v/dCfy9vQtyn
         ySRNMFuHtlrOzMK1vr/jkAcMTj4qe2n7tLxl+W6sLuR5DoC9zoXgfccMOykzRqyeo6MQ
         LGjGceVQx+ZIiDLjy8LLwCrSuvRIE038zDzDAmIbm07b+kUyabwEI+3ZGU3NpC3IitP+
         Mm8SgY0kFeFbFLPHLL3ItdI5uET9Raw+p5po86BYkVwtd4FJOFomllDkw0Mh9cWAjb/y
         GBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhLKbXuzYFc+0jgDXzubBwudYLEamwUwmXvG//iYyFe8pzRg2TsvU6xFkvjv2tWK3QxwKQpCR3+87Cvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnC956K4vBslsbIMdX4/emEbLrS28FiGx0I4t/ZCiY5efVFti8
	pG9bMGSGKu3MM0+xRdG7vNm7juDl5/m14FbNv2NdD2CumX8+dtxJU2rJ/ZlX64M7lKT0Q3MosuK
	Yu1gNHyjJL62TbIXSyHVC1a3/yMogPJaPLmwJ8gfSZEOpdJIdLvO0YEAPdEhgG1q7cg==
X-Gm-Gg: AY/fxX5qRPmAXbb4HXLE8bTahNL85Xpwtg1AXIs218niNjp/sjxB7DHxDHpE92X+3wR
	tSgKqIsS6dwNT6LUjAi0FNsBAQ10/hYYQFMOyCqnGUk6Hpi82AKuZPSTDoGunzSwcs2lboG23gD
	jxCqU42DJaPhn2b9T8Fml6UXZXpDrT55iUbpyRiiTBW0N7RhpsbLwxdnyElN3sM2YX05pq08oNV
	cTxY6floJOp6tvgUpgz8HbY4cafdsddSxHiB7ZTiN5PzA0iFFYSjVZkwsh4r7mgcKOvLJOEtbds
	cZI24QDf8OoF6i5Ly2QJsOB4Jmf7qLBueyHsPtXRouK5O3SWAwQ0dsyT95RQABUIe4ELqRLnocd
	q1wt3rI2vjW3y3veLsHg4X5iWtbG1eLHGQxocKpbp6uOxvKP8MBm8PPFN4F3oydbjaVeBww0orZ
	g5VRlsMClDSArzO2fuj4sqmJ4=
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id af79cd13be357-8c6a677aacbmr301083285a.73.1768548460161;
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:89f:9693:2522 with SMTP id af79cd13be357-8c6a677aacbmr301080485a.73.1768548459734;
        Thu, 15 Jan 2026 23:27:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/9] media: iris: migrate to using global UBWC config
Date: Fri, 16 Jan 2026 09:27:34 +0200
Message-Id: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGboaWkC/23Myw6CMBCF4VchXVvSW0pw5XsYF70hkwjVjlQN4
 d0trFiwmeSfnHwzwZAgIDlXM0khA0IcS8hTRVxvxnug4EsTwYRmnDMKCZBO9uMo051WzlrJTSB
 l/0yhg+9mXW+le8B3TL+Nznz9HimZU0a9b5hqlXe+sZeIWL8m83BxGOpyyIplsQfkHhAFUFJpo
 0PHGtMeAMuy/AFoQ79S6gAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zc5bZgS5N9Mbgx60oLHQOfMAt62Z01sy/8DRrMk4RjY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi0zBzKOcdbfe/DY8ZtA7d9ri0gV6cT+3VMqzRiypa
 FSfqc/TyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJOLex/xVUOMzPrjLtVbeC
 9/bYBg8F16e/7gXs3XJM4YfyKunoXJH0+jyhLSKvpY6Z/DrTqiITXHjY1Wj95xP7k/4Kybxdbq9
 hUL1AWGiSXM36uS/eMEpWSZeb/t2cfo5X7PWacxLqazi5Zt8WjlKOmW6gIfeT6cpGY8MMbuvIXJ
 uFkw7e2Z10Zn+tpLHQU9M3nGVGgd0P9vukzbl1QOFz6ePMmgnX5pywPdK4gXVxLsf0M88CWQxis
 3NbKrY+XeJgb/j0mQHfYp0/W9bdiEtUbrn0yyY76Hz0+66HHsv4MgS5vdyfdy4P1b+XmGFzo3nO
 g1NXze5YntozS6HLryCTRfOAgU3ccg5xBwHT9YskZRyaAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FUIHxWKyCe149Gbj6eB32RCiMFODGhrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX1hmKByuPk3Ld
 7P3+DAzg/8heSmpOz5Ndtb8AUWEF7YFHVPRwbbSrxOjGpHtxvvOo7N3NsxaCVKC9Ll2C2QEfuZ8
 i5vqVdX01Z9CkNXnyt542CLvwipYOkLJhEH2W9Kht2gRKhKSJh1Vz/QkXuvILXq6kmGh5tm0vdg
 2Aa7g+lhl05GYee0RMyI8C/YjcOvR0B/NZcS0Ulv9dsC8GDhjGd2/amhGWqFZT8K8FUeS1bg1Wb
 xgM8p00F9uvPs7uqEiQ19KJmojjYxwobij8VAoUzqx8S0TodWAPBr2nh0ilxt7K9OhzsHgFBxGK
 iGOSEeyQNNo8rFgg5tq4iKwFdO/VROdrX0cQ4AXciyNWWoqVgd5oMmDUG+8FBt+8yDYPjIB5UXH
 BZd/Y5kPOeEzaLTo5XqLyrw9xCpYDP8yhnZnVDaZUgRlcpiFMSDl7gohp/pBnfxrZ1bW+M20tGb
 kWKQGL8JiEtJgqhan6Q==
X-Proofpoint-GUID: FUIHxWKyCe149Gbj6eB32RCiMFODGhrO
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e86d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sotOLrqpNFqtnHaJl_IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

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
Changes in v3:
- Dropped applied and unrelated patches (they will be posted separately)
- Include printk.h, decoupling the series from fix picked up by Bjorn
- Introduced additional helpers to retrieve the data.
- Link to v2: https://lore.kernel.org/r/20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com

Changes in v2:
- Extended the commit message and added a comment for the min_acc length
  helper (Konrad)
- Link to v1: https://lore.kernel.org/r/20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com

---
Dmitry Baryshkov (9):
      soc: qcom: ubwc: add helper to get min_acc length
      soc: qcom: ubwc: add helpers to get programmable values
      media: iris: retrieve UBWC platform configuration
      media: iris: don't specify min_acc_length in the source code
      media: iris: don't specify highest_bank_bit in the source code
      media: iris: don't specify ubwc_swizzle in the source code
      media: iris: don't specify bank_spreading in the source code
      media: iris: don't specify max_channels in the source code
      media: iris: drop remnants of UBWC configuration

 drivers/media/platform/qcom/iris/Kconfig           |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 18 ++++++++++------
 .../platform/qcom/iris/iris_platform_common.h      | 11 ----------
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 14 ------------
 drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++++
 include/linux/soc/qcom/ubwc.h                      | 25 ++++++++++++++++++++++
 7 files changed, 46 insertions(+), 32 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260110-iris-ubwc-06f64cbb31ae

Best regards,
-- 
With best wishes
Dmitry


