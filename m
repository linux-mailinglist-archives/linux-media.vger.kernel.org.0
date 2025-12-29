Return-Path: <linux-media+bounces-49621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACBCE6055
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD6F73006445
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64882853F2;
	Mon, 29 Dec 2025 06:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/jTYO9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLAvqz3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0A1C8606
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989902; cv=none; b=sLlIyzuhIBHTb3vJTBeuoWNiuWDWqXqanXl78zQ0gbZwqph3DKhouSFM4n/uFeIBoiMJY9kxXQF8w8m1ChUuqXYhPFkAxGqUm5wOyk/UXDfVik9tcbt13PWSl5Pg6Gvw1daLlloYVikWfPGc66MP/iJ1PtHa6GX2USzx+jieaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989902; c=relaxed/simple;
	bh=l3HYQfLfyDGmAdRdmedMRdKbd3YII9iS9an4QWGWaFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RJod93qwvohp5b0siWPkaJUBYz5Yv7Z/54ApHjR2fVgNSOvXsQFHXYTeiXb/StKxxTwYuoOHmG0/nmuMIR8LiQYv5gg+c+LOScedYbLmztHH3oufF71pTcL5ex6NJ0kYXE0AugPlpS0DgdEh5hIjdzSOdPmhRxRyqHpEbZkOy1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/jTYO9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLAvqz3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMlWk33215628
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WMiYL2e1fGj83Lu/5WYNPF
	G4N3K7VEAwd6MaaQi4AfQ=; b=O/jTYO9QjHgbil3XWiTze+MKXkErR3dGjdp1hy
	G+uIw/y2bVPybedb8RHs+htMGdLZMWfQKvFlWfDItvsO/AAKJ3tlRJC4Am03qfnu
	G0IcGVYP2hupg/CGOnDQDTOLPJdyeWY5wr0JMFq3C9V7XA1kpsgZdBnrAGdyEJm0
	dYLLlA0CoYN/Jp8ZX5tzUsb9H5eooT/Bea73efkLT9xLPRwoHyjwtM5CAHBznd7j
	etBqmZ76tjbxu2r7cpDwEoj7UHJ7bo8SQ/jugQbHJ7//ly6i2RfNVaRZ5K2RPGIl
	8i9VHesNJTVBQ1dntARonIyV/0yX8uSTfWuvJeftNeixySdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6bfgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa148105a2so8518092b3a.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989899; x=1767594699; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMiYL2e1fGj83Lu/5WYNPFG4N3K7VEAwd6MaaQi4AfQ=;
        b=HLAvqz3zLZMffgexyaZdnXod3xXc68PObBmmuCXv5RbXatlNo7IId5QwYbw8u43Y/s
         B1bn70yLLocVF7WGO653kH6mObyziF5tMoimX9vJ73DOUNUhxS/rVn426wgBbz3BFbKX
         dy44z5BQpaxbRGvVZ1+GOlwgnD3hLr3HPZWV3R9oyFzSatpVEYn/FTodymCCeudlrCE9
         /7QdbEiAcIDywS7HaFS6BnWrtrPFq/6znjrJ/eO63RnPWm8XEJj/apwkpWrvPl43IrSb
         9uVKGcmDGYSByc02MF/WfpmBgfzvPKQIKHijNh2CNNjyOtOsAaP7/CZfmKsrZ1uMwGgb
         RJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989899; x=1767594699;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMiYL2e1fGj83Lu/5WYNPFG4N3K7VEAwd6MaaQi4AfQ=;
        b=K0UON+FSck9W4mAI+3zVq5kg2vqyLMBbMyaC9kWc3TlwaQsj88m1p+BaNziIUpiBTM
         I6jeMrAwBycQAr/71nd9Y60NuWj+sWGGMAq5wXoF3fA38FJtwZIAerpLM77aNL9FwIiw
         tSfglVX2HKvS73Wy/BW0dprjq96DVNayrie4dcBY8uyrppXXR0bWxqqGERXSAGwfNc7Q
         HfkO9exOLsIIbEL7iaE7mPzZ59UomukDlEdZS1MxHOer/ag1817ufElH1M/jfLQoNNTp
         K5WjG9no8PtyJdRIq3gesj/suACOF/ZK+s0GfdYicdlme8Pi6It2XKDwrqoXxkLxSO3Q
         eelg==
X-Gm-Message-State: AOJu0YxIE2e48IThM1V2FF3oNF6im1YUs3lqLbDwxcfh4bUW7lGOP8zY
	jDRDw3WaZeP6t/B0jG4gnK/Nv7qQqvkNGUshLeX5wYuHq7SYysPWxLC77E5h3Qd6LLU84P2qAp4
	jWB+/VIqR+LdiYXN8mCSq1GoXi3D5OKK7z44debkN+feSgnpWd8/QOOi2Z8if6VDl1Q==
X-Gm-Gg: AY/fxX6f7pPsvG4mdeotvab/yjssvJJ8w5FQmV8yGHXW12wANaiK6M/oKlAxk66iEcn
	ICtQYOHdUnQ/crVbFbre9Tu/QSp16GIv095Ol4EgPoiugO6xjogKXNiXal/nRA4IIoWmVMh6Rto
	LpAi+5p/jOXxlFJb7dTqsDK65dGOD73tLxidszkFr5kkt20sG+R6yLnR8jpgj8foOvOwxzz+uoM
	N2NZtjaXIvCcRx34EZHJ6OaJMdwz0GYFUJVSov111xohDzmRlClrKOCQ9vpCbQyh3lG3edyEmPK
	9BnzITZo2YVrjrB4a24aqAJnsVDSDl6QQgJMPXVobrpDQD8y7pK/YniozDC6SoqyFKW2dyQfIhs
	OtnTpaJ+MmFhtPGVeGdbF0K8q0cN872Y8TFuCiEzkxBV2Mi4=
X-Received: by 2002:aa7:9312:0:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-7ff6784e709mr23526980b3a.66.1766989898591;
        Sun, 28 Dec 2025 22:31:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoCrIhzru6J9/SBY6w94BLXM3xiqCUW/yKnyKPD2FdthRnHntCF2oEREJHuj2YxYdf/T18Og==
X-Received: by 2002:aa7:9312:0:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-7ff6784e709mr23526950b3a.66.1766989898096;
        Sun, 28 Dec 2025 22:31:38 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:37 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: iris: misc fixes for fluster, seek and
 concurrency issues
Date: Mon, 29 Dec 2025 12:01:19 +0530
Message-Id: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcgUmkC/02MQQ6CMBBFr0JmbUmnAaquvIdhgWUqkwjFjhIN6
 d2txIWbSd78/98KQpFJ4FisEGlh4TBlMLsC3NBNV1LcZwajTY0GG8WRRXl+kajqQhp78uishzy
 YI21B7p/bzAPLI8T35l7w+/1pTPWvWVBpVXt72DdotSZ3CiLl/dndXBjHMh9oU0ofaAvHXKsAA
 AA=
X-Change-ID: 20251216-iris-fixes-4be01def1c7f
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1323;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=l3HYQfLfyDGmAdRdmedMRdKbd3YII9iS9an4QWGWaFQ=;
 b=VqAogHl/5mSdNnD94YerpXy9Xh7ZJQ3tsVbrf52ETgJaHqBDk1Jx8B6eR2LYYlWLDnyyx8LH3
 iJK+rSpf03aCA0hiMjB6PPCs+OWPA9slVk8hxf43f5whWQ4suZkOv+C
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6952204b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJ7AGJJM78aGNJrzRvkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: i1qfpMG41bSGhOjYkelzHSIHX_sOpvrs
X-Proofpoint-GUID: i1qfpMG41bSGhOjYkelzHSIHX_sOpvrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX14u6AH3T2aNF
 vnSskr+M25iPzDiZhRRNZS5EKOVa5ndnTLzpERuw9ohJPkgnI6gQQXZqWODeloKQ60k5C4kx7uP
 HZ6Kc+ZK45cR4qNCU0VPC3vB1P06cVJFna9COCbu29G0afFv1oW2lhnmUBN9bjXbFAmdtMCWpZL
 u/LeK2gunSN+OAr+CfEskHCf/ppGO30FgJehGiBxt5dBXQ5gOBFA8jmMRex4YnM3Ru8/sAjOdU3
 SKRXOZ0VD5uCOzOkCe8ygRCp6G4QYpjDqMoX5Pgiq6bMcFtWU/3kRfWnpyE6GmDZpwch7dfvg1r
 yKZGj79URbrmDqg/X+Zxe1TlOzS1sHrnTZTpdeEUJMQi/oI7YWJCZ2ktdbMxHzY1sOIQC1iXANO
 B39FL/dnLXPiP7EwLpBWOlGvm2XAM0zvZobMZibgp2538Y6D7gU62kgZmPERp38bqVrU3TVMqzu
 31X9fntzjGxDxeBLanA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

This series contains a set of fixes addressing issues uncovered during
fluster test, resolution-change, seek and concurrency on Iris.

Changes in v2:
- Added missing fixes tags (Bryan)
- Link to v1: https://lore.kernel.org/r/20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Dikshita Agarwal (5):
      media: iris: Add buffer to list only after successful allocation
      media: iris: Skip resolution set on first IPSC
      media: iris: gen1: Destroy internal buffers after FW releases
      Revert "media: iris: Add sanity check for stop streaming"
      media: iris: gen2: Add sanity check for session stop

Vishnu Reddy (1):
      media: iris: Prevent output buffer queuing before stream-on completes

 drivers/media/platform/qcom/iris/iris_buffer.c         |  7 +++++--
 .../media/platform/qcom/iris/iris_hfi_gen1_command.c   |  4 +++-
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   |  3 +++
 drivers/media/platform/qcom/iris/iris_vb2.c            | 18 ++++++++++--------
 4 files changed, 21 insertions(+), 11 deletions(-)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251216-iris-fixes-4be01def1c7f

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


