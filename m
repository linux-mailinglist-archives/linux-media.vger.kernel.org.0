Return-Path: <linux-media+bounces-48557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3911CB2E9D
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 13:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1918430BC97F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDBF31A54F;
	Wed, 10 Dec 2025 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfsZbcsa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nfu41T1c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3B2C0286
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370182; cv=none; b=jSOzo2f2Q7cdB6O9Na4XdoBd8WbBwP6SMf1mTwl+oaEx6AJkDx4uiW/JOVPSjXXbp+TXn2LyGY7GqtI04SGm75YA1UUfiw6/AnVNmJsB0mJv4uBraUE54xMrhoc+LfqtbA2oDZqGa5ZyEKdHDethTeQeP9OQ7QjpZLF/JxfbtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370182; c=relaxed/simple;
	bh=o8eSeRirNNmXlnskOgBKi+y+7Dz2Km54hHIOvsFNEGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rJR4E18dkTMGp9ZrzVkVakBIL7NQZcSzXG5m+o4FBkZu2+O6nfrjDzFFs1j6N6zkiofAxP9nOs+X7gh3G5ht6MUvRnjKFBn0ktti6sPaScrgnW6UI/6b4oy+Ro8QGhN40REumvqeHuLZLUfrY1olmFg3cdvvBbaINl2TeVD0ZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfsZbcsa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nfu41T1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9Gnqh2858885
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=97D43faowDlvlGt0f1cxAG
	1gGE4rIo8KasbmUaBLI0o=; b=pfsZbcsa7TkNSIgjSSxB84ELJ+fp5yvAcljr6J
	ol926rTNt4tT+/BcMPOodpxeDPmTv5tpQvRwy0YD5BApsrpmI9vCnPi6gMNx5YAl
	P6DN4JEnnskb7QHK869GSuQg/vA+dNdGktKY2MxLUrWa4cShwIFkLAh8P6MZ04Xu
	kt6voq+uUZ0NxUGa/ZDZ6lxO9ISqptpSYBk7kevbN4tMGqpT7N8frgE9W5x6zpcL
	vekTm4fhYbjkdekVq7GxcsHL8mN2a+HFpdSEsXHzjo8Bva+kNzm3HNwOatNBrCNz
	c2/mDEkMzpZjv9LJjrSe8z8TT+2RWKizM5pq9owGb0uMoznA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay63frhf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-298535ef0ccso48887415ad.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 04:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765370178; x=1765974978; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97D43faowDlvlGt0f1cxAG1gGE4rIo8KasbmUaBLI0o=;
        b=Nfu41T1cu/NRNlXZdy3j4lJI1n3zIyzQxdnicUrNgVnK+siwxTZalJ56ohU8x8Mc9u
         MLsR0NCJhVNuMs7EHAVUt8nWyV1GWVcb/l5a5y03PsX7K7imzuem5y7mRAcBNvlCYFIt
         VByJP1u+BuKe3K1Mx6KYzzWviA+pk4d8jUaGsKcR4yQTTDra+ZXd4FpMneznWWkmiLNo
         y+JWdBzPnvbgW9+qM0EmkNknXWiFbUVmfUaXYr5cRWQ0cj4mw8fO3Iq4fvBSJSTLj8fv
         NRapBEDxJ8fYH1DUWDDNmEbgcZRPxjkRkIE/9C3yLZK1yzLkqC1VzDiljxy5yj8ICHEz
         DLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370178; x=1765974978;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97D43faowDlvlGt0f1cxAG1gGE4rIo8KasbmUaBLI0o=;
        b=ZNrWXiupDtSaGb/4DDoZddwJ/LQkqXHLT6LQoSbxCRuo+FJhGG+LrKeD3mqpM+/xAv
         ZbS2/TJvb2+WCLHnhJO7NWG6qOQPgkznJMxFTq33GrFrGv33VUFY1rWvKgBYBKC9ctgD
         MQqvpHRfxJyBrj2gjAYeA+1Y19VDAvjHtwA/94dI3dZ9yjryGxEnKCnFpWt560Udmjvu
         2okT2hoqM/BeoNDV1l4Nl1UP7d+r6/6o2Y1Q2UUucdp0xWQf4/bHxdMT0dP1capRKu4w
         yL0szKLX4Nr1wPZFk7V9VYaqxsO1kZxRn7odUyHLssgBCfvOp+BeCahXuk/KUl0QYNJT
         sRWg==
X-Forwarded-Encrypted: i=1; AJvYcCWpBuZeTynf968R0CsR1jU5UWMIc5A81cjDtQU5CtcclNDttmAwCbYfqZzfYxIWMBboC2fxckqBi/HcUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2rn9CjwI2EprratOlpyu4UPPGYPMEpZgCW1pz11uw1VirLAR1
	t0j+h0VBEyr3tNVMQzKSHIQKPnRgY+HZY5Dhk+dhzrAaP1cmjcWpsjE+KSIY8aq1hib7l5KreCo
	tbhfEHGw2LD3tp+EDDeXTbjC8ljWWMMLt8Vt/PC60Xx5bgPjTGPGo52Iig91pMz0eKg==
X-Gm-Gg: AY/fxX5CHfF8otAPO/qxWM4jTWvtDlxTZ95c8E27pggFPHf4O3G64Hw+eTYWFhGpHuQ
	ez/MXM9wWOlDK0il4WUG81EGie6x2AKL2FNrIdo+1jqf5dp1M7k+bpQa/P1jyqjtM0D3efWKgkF
	H3cOv9OHXxF69pybjFZJPybCQ+lOhLJTqJNKW+7H2al9jr0WBH7A/qxAhQkUdv1ZhifYxomN5Wv
	ubUeCTQSrQuD8NmgAI0sYLjqxkRr5s87OwapyVqut4wzM8e9B0o4cRJIYaOG+rzQ9lvWg/+th99
	DWrDyXdvuNVHh1CK/1Mp1sind/lDtxjw8WryoLQTlhtjezJ6XnBtib6bQW/SsMGQ5fnxUL9b+6J
	+7LRlkH240P2p5i4Mz8Be6pD43/hxzQNNeq7zI29vls++
X-Received: by 2002:a17:903:1b4c:b0:298:970:b24a with SMTP id d9443c01a7336-29ec27ecb03mr24090145ad.58.1765370177738;
        Wed, 10 Dec 2025 04:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz2iKOM8WOtQDxAgqVkFMmGDgLy+sSJ79tRgfhClQCTeebfivaJFNy9r0Bi+FOxblCNDRCSg==
X-Received: by 2002:a17:903:1b4c:b0:298:970:b24a with SMTP id d9443c01a7336-29ec27ecb03mr24089885ad.58.1765370177210;
        Wed, 10 Dec 2025 04:36:17 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9c0sm185434615ad.68.2025.12.10.04.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:36:16 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v4 0/6] media: iris: prepare support for video codecs on
 Qcom vpu4 platform
Date: Wed, 10 Dec 2025 18:05:58 +0530
Message-Id: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC5pOWkC/3XM2wrCMAyA4VeRXltJD3PTK99DRNos06JbZ6tFk
 b27VfAEepHAH8J3ZZGCo8jmoysLlFx0vsuhxyOGW9NtiLs6N5MgC5hJzXddv06uJs+NaTRqsFT
 qkuX/PlDjzg9rucq9dfHow+VBJ3G/PpXiQ0mCAyclFYLNg/XCxzg5nMwefdtO8mJ3LMkXIECUn
 4DMQFNMKyRhtCX1B1BvQMAXoDJQAFZTtBbIVj+AYRhuQJlsUCsBAAA=
X-Change-ID: 20250924-knp_video-aaf4c40be747
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765370172; l=15894;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=o8eSeRirNNmXlnskOgBKi+y+7Dz2Km54hHIOvsFNEGc=;
 b=KXtpW3c9WsTGCjrOs2H/0Z8l4nq6ZE6a5CQSRunLP8L2G2YcsebEt3c++fMLjJ5d3/HCpH2TT
 8vFf0CAot5kCqmyRpGWUeM8g70PKZvQ9jKzmuNn6ZShwxgc2H3mqbCG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: kmQHYA7HjecQeZE9dDOcH3OqZYS5_S-0
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=69396943 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=unt__282QlFEYn7dfyIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kmQHYA7HjecQeZE9dDOcH3OqZYS5_S-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEwMCBTYWx0ZWRfXxdpjDidaXM5u
 DCpyirgV0NqnlHSHgn/TCM/4oKpO2BPfMJJ0XYDa4+rrKYN1StqdA3/ppTJZqd9W0q/ey1eGIkg
 Vkl2SQyp9lx5XODLo8CtplXwAE82RoPvYvjt9883UspAEE5pKyqYAzBq2YpSmEx2p8C8vO8YVTU
 PzMO4pYQ5Lkf/ngcurp0JCHJxoVfhBankPOUUElKbbOaseShX7Si1w81MAu/MifiPu31t9hC1M3
 Dvr7AY054a+RTi4zo9gXjgTSY9GDXXbqaM1Sasrc8b5F+yOj/UVPSZKt0pBrYjCb+hdTOw/LQ2F
 ssX1rfyIifXe856INm0FA7Y7xwLbhpHT3+Fgjo3OTDqMeAAeSWxuzdz3QVwTHCIm4w+HsOZEH0q
 fwZlD7lns744biAfjElzMLha5pRLsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100100

Upcoming Qualcomm kaanapali platform have a newer generation of video 
IP, iris4 or vpu4. The hardware have evolved mostly w.r.t higher number 
of power domains as well as multiple clock sources. It has support for 
new codec(apv), when compared to prior generation.

From earlier version of this series(v2), the kaanapali binding patch(#1/8) 
and the compatible patch(#8/8) have been dropped. The discussion for 
this is captured here [1].
The series introducs buffer calculation and power sequence for vpu4. It 
prepares for vpu4 when kaanapali is enabled after the binding discussion 
is concluded.

[1] 
https://lore.kernel.org/linux-media/fdf4c469-d276-4f64-b13d-5266cca7235c@oss.qualcomm.com/

Please review and share your comments.

Following are the compliance and functional validation reports executed 
on kaanapali(vpu4). For the series to be functional on vpu4, patch #8 
from v2 version of the series need to be explicitly included.

v4l2-compliance report, for decoder followed by encoder, including 
streaming tests:

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.17.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
[  328.905995] qcom-iris 2000000.video-codec: invalid plane
[  332.917543] qcom-iris 2000000.video-codec: invalid plane
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 21481 buffers
[  350.438406] qcom-iris 2000000.video-codec: invalid plane
[  350.447079] qcom-iris 2000000.video-codec: invalid plane
[  350.458821] qcom-iris 2000000.video-codec: invalid plane
[  350.465860] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  363.878157] qcom-iris 2000000.video-codec: invalid plane
[  363.886546] qcom-iris 2000000.video-codec: invalid plane
[  363.898475] qcom-iris 2000000.video-codec: invalid plane
[  363.905527] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  377.209312] qcom-iris 2000000.video-codec: invalid plane
[  377.218027] qcom-iris 2000000.video-codec: invalid plane
[  377.233635] qcom-iris 2000000.video-codec: invalid plane
[  377.241360] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 21481 buffers
[  390.624700] qcom-iris 2000000.video-codec: invalid plane
[  390.633590] qcom-iris 2000000.video-codec: invalid plane
[  390.645629] qcom-iris 2000000.video-codec: invalid plane
[  390.652618] qcom-iris 2000000.video-codec: invalid plane
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.17.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

gstreamer test:
Decoders validated with below commands, codec specific:
gst-launch-1.0 multifilesrc location=<input_file.h264> stop-index=0 ! 
parsebin ! v4l2h264dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 multifilesrc location=<input_file.hevc> stop-index=0 ! 
parsebin ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

gst-launch-1.0 filesrc location=<input_file.webm> stop-index=0 ! 
parsebin ! vp9dec ! video/x-raw ! videoconvert dither=none ! 
video/x-raw,format=I420 ! filesink location=<output_file.yuv>

Encoders validated with below commands:
gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h264enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.h264>

gst-launch-1.0 -v filesrc location=<input_file.yuv> ! rawvideoparse 
format=nv12 width=<width> height=<height> framerate=30/1 ! v4l2h265enc 
capture-io-mode=4 output-io-mode=4 ! filesink sync=true 
location=<output_file.hevc>

ffmpeg test:
Decoders validated with below commands:
ffmpeg -vcodec h264_v4l2m2m -i <input_file.h264> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec hevc_v4l2m2m -i <input_file.hevc> -pix_fmt nv12 -vsync 0 
output_file.yuv -y
ffmpeg -vcodec vp9_v4l2m2m -i <input_file.webm> -pix_fmt nv12 -vsync 0 
output_file.yuv -y

v4l2-ctl test
Decoders validated with below commands:
v4l2-ctl --verbose --set-fmt-video-out=pixelformat=H264 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.h264> --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from=input_file.bit --stream-to=<output_file.yuv>

v4l2-ctl --verbose --set-fmt-video-out=pixelformat=VP90 
--set-fmt-video=pixelformat=NV12 --stream-mmap --stream-out-mmap 
--stream-from-hdr=input_file.hdr  --stream-mmap 
--stream-to=<output_file.yuv>

Encoders validated with below commands:
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.h264> -d 
/dev/video1
v4l2-ctl --verbose 
--set-fmt-video-out=width=<width>,height=<height>,pixelformat=NV12 
--set-selection-output 
target=crop,top=0,left=0,width=<width>,height=<height> 
--set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap 
--stream-from=<input_file.yuv> --stream-to=<output_file.hevc> -d 
/dev/video1

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v4:
- update power sequence during timeout case (Bryan).
- rebased on media tree.
- Link to v3: https://lore.kernel.org/r/20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com

Changes in v3:
- Drop the binding and compat patch.
- Address comments related to variable handlings (Bryan)
- Pick the updates from Dmitry related to sort register #defines and 
  connecting register and their corresponding bits operation (Dmitry)
- Link to v2: https://lore.kernel.org/r/20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com

Changes in v2:
- Dropped dependencies from binding (Dmitry).
- Dropped optional items from binding (Dmitry, Krzysztof, Konrad).
- Updated binding in sorted order and proper alignment (Krzysztof).
- Fixed order of newly introduced kaanapali struct (Dmitry, Bryan)
- Improved readability of buffer size calculation (Bryan)
- Optimized fuse register read (Konrad).
- Fixed order of vpu register defines (Dmitry).
- Addressed few other log and commit related comments (Bryan)
- Link to v1: https://lore.kernel.org/r/20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com

---
Vikash Garodia (6):
      media: iris: Add support for multiple clock sources
      media: iris: Add support for multiple TZ content protection(CP) configs
      media: iris: Introduce buffer size calculations for vpu4
      media: iris: Move vpu register defines to common header file
      media: iris: Move vpu35 specific api to common to use for vpu4
      media: iris: Introduce vpu ops for vpu4 with necessary hooks

 drivers/media/platform/qcom/iris/Makefile          |   1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  23 +-
 .../platform/qcom/iris/iris_platform_common.h      |  11 +-
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  25 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  33 +-
 .../platform/qcom/iris/iris_platform_sc7280.h      |   5 +
 drivers/media/platform/qcom/iris/iris_power.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  20 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |  16 +-
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 199 +----------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 369 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 342 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 ++
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 188 ++++++++---
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  61 ++++
 17 files changed, 1045 insertions(+), 280 deletions(-)
---
base-commit: 53ed8b7dd11ce00eb0d573c1e1aaca96f91c92c8
change-id: 20250924-knp_video-aaf4c40be747

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


