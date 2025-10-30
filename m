Return-Path: <linux-media+bounces-45971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7931C1EAB2
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30D2420D8C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A53334C00;
	Thu, 30 Oct 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoYtH0iX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPkjOQMg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449662FFDFF
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807639; cv=none; b=f/F3r6ZUrl37XoaDxCuu8o5cnwe5p9ki+TXHqCoWc10yP31RwumdkdMXk+hv4u6QLTjUqranD/CFUytCVvNvs4TLzUWrZvaaaHHsbYhkmy1ao78cyiFo7fQbBWLawew+XD7bCJ/vjrZeA/ifikkcWUkeONYEf/aknAHlNjviAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807639; c=relaxed/simple;
	bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkq5opdLnqhCoD9mSnwHpagbGIrhoy7ORuhTpSglTEXO40xw/A+Cl+/+CwgS0/islyLjrLdtADYDLjCScZMcHLcL22LHfH0qVmVrLrMEmTm13HR7x4z31xlL1RuN8uy1NDdLF6MWHrIjMAnJQLCJLTaoMEg9/tddZJu5C349hNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoYtH0iX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPkjOQMg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLGWKw1655009
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=; b=IoYtH0iXSHh6k9PP
	EdiWqkrc6lk8aPI/Ew6u52eIh/upcZkR5MDYbIN0UeQGCGl1Jtgb3UTD3ElTv/8U
	ebx0jzubXzkB9992kGMRGu/+nSYySo//YMy5kItGHa61kq4yZSVSEWUVYd87rCB6
	tiYYqF+WFC0F2j1aUzKMmP6qM2ImMT1TK1uh8TBvnsrPc+mfOl0yn6GbQSomYvxi
	7c016+prILa117s09r1RxZQ87vUxMpkqigJXcTA4K9YDodyCftiIppI8PgI56S0y
	TevF6V6kfZI5WRpTORw4bJfGnPam86jnE+ITRtpui/OqIDo1YgpeYkPqkB2SBIa8
	cXp3Hg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptsc50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 07:00:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269b2d8af0cso1657865ad.2
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 00:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761807627; x=1762412427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=cPkjOQMgyvp1zYoWmBwCmNZpS+Kyf7MN/zCQ773azG+K/5QN4LQgQ7CMLjX76Unp9r
         NbDaOTgPmIN0yhVCCZ9ePIuMbMP9i9C8eopX1S+wjdfmFzVjqN8luqG+7/4q+b1zdPe0
         66Zv2ukYdBpYrebo8hjLMHIYYSIVggVzlImpwPxo3CY1XGcGJ569a2gt72z9rOeGjiV3
         igqCVNzsoi2m//75bFv9LD2CPLSvpyA2I7vlIFU2ZRcCAGQ9G1rmVvwp2ugelje0TKDI
         8i2XPO/WMb+zGhkI121vaqhYL5WCffU+Mmr8tKzwpB5g6D883CsuP/RB01XcY4uSDIWG
         R5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807627; x=1762412427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUBZezXctNZUTvhj4jU3CP7PPArzUZna/FMnzKRKs/c=;
        b=kw7egTN942DvM74SqphZL6EXOqjAt6IjvJCrhi9OAwdtKR45muwlpjSRezlcYErgap
         eCqZq1paPDzBhgtNWD6JVJTqqA3vz3PqasLMAR1pUhmLRTzECfJwEA6/mkH0cv/vJ/Li
         PYay6DWKGXP+kHX8NxQdMXwVCEj6Zg/usG6cGJcJe/shNeQ5sA8RL1EZaJ8uzWNaJMWK
         PRb/4ggv7fRwao2VtUXCgde0Y63ecUa1gCkirb1O6UTgbvCy/ThoPHeRMul4+bLl5IcV
         zKF8MaCWD9jGMiKYZO86NenZM5am/DMnpUCyL96ukplsitqFRUnguh7b19OhBj2N4KHy
         JYTg==
X-Gm-Message-State: AOJu0Yy+oIz7MexXbuFWlaRq0XckV5GTIhLZM7SP1t//3hbRFGQQnckv
	zFG30HuSK8R76SpLCss74gXmjBndOtbCDiijK/2wIMqIySEJVrfCIkhkzPhwyEgre1a5GzU0kLa
	mKwoSYhr13z12znYqhwF8Ck9SqPl7qCqE9Lh9IjyheB6fyzDb3yrjMzARQfVXrcogwQ==
X-Gm-Gg: ASbGnctOG0ZeCuivC+Y265+KzlWwImqhLi+saGndMBPvisGFWM4br8EZyqaiwX/mrPR
	SaXfUVRyyVC+2i+s2IBow3EAD5OVQIMnXd161hVVCsevoqK4/GYnJX2DMCnV/O8eYP9srWAggB2
	PxaShszPtmQyJ8i4syNGp46DfJKtj9X8mqs92f5SZ9OxKhmH/aOaz9M5lhBg6EBwG/aJZ8g0ElH
	fxhHqnBtrM9L2woUyD3Xpe5sd5QOejvH6kkwKstS5LDtZT9lGrUU4Bd/H5PQUaLBGswSMGjbAE5
	WR9WyXRksIDBqJDCmyqKaXYbrmxqtKlVy71Ge7UpLgsL5oN/i5cftIXarGT7vvXkAXjS/JIrz0O
	Qx+SGmbb/9gnId0k/rFTw97OooqceERX638ATZhm24pE/+08AvuC21jz/jn4=
X-Received: by 2002:a17:902:f101:b0:266:914a:2e7a with SMTP id d9443c01a7336-294deec3018mr26280005ad.6.1761807626738;
        Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdslsaWsoG4zsyjqgYfwt6Z3rdZ1U+hkfdV+J7do69K7rWHlvoTT+46HkH4s2Yl9Fp2Cxvig==
X-Received: by 2002:a17:902:f101:b0:266:914a:2e7a with SMTP id d9443c01a7336-294deec3018mr26279535ad.6.1761807626037;
        Thu, 30 Oct 2025 00:00:26 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a73sm177671325ad.74.2025.10.30.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:00:25 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 00:00:07 -0700
Subject: [PATCH v3 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-av1d_stateful_v3-v3-2-a1184de52fc4@oss.qualcomm.com>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
In-Reply-To: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761807623; l=1154;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=DSP0RYR4BmXibqx7IUSmnSQ47NHXteY7yJtMQO88UP0=;
 b=0WMtZEe/tBnXp3+5xyjVoKFhYzyXZg5HwdMYCozn8Yt5hskJhnmYMQpWrNMGItNuJZCIaHz9n
 7tn/p0l2T0zCvNAOd+pF604B/fGhmhJft1XzwEO3bOPsdTVMLXqQDCf
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA1NSBTYWx0ZWRfX0oJNLySVHwmM
 yaIP0AkYvTLd4RMXahGg4zqj+4szkDrFp7sviOQUWVay2uycQjTMp5AvlLMSwZRf5r3h6HpKISU
 pFJOQD8JrwtmxZPQQWAyV8bI5ZyHdpAXL/0LcTlgi13DIpRgide3FH2LxISOQ06SR/jPjB9YALH
 NCp82Kxt+gzLF0iILSnM5ffgDOCWDPeGUVb4hi+bdGR2hnmBJZdTIcp9xeMcG2BqlGzSBMtXgzS
 2ZSiWr5exgGdY0sc7kCWXHb/cejxlzZeQbsuSNeQEqSPtcV1+7a1BxHv0aCSZwGQ2AadEV5WvcE
 GuYKyzTXzKLjyfcsqPD8gB7Md++lz8CYLNYa1XTg+hrz7g3+0Vfx7V6e9H6+PlHs3RRN89m3O05
 jNWiW0aVlkB7T22mwZnQxwtYfOjzpA==
X-Proofpoint-GUID: Pf2hbC36Pm3j13n72ulIZ0cnzG0CDAvG
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69030d0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Pf2hbC36Pm3j13n72ulIZ0cnzG0CDAvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300055

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1


