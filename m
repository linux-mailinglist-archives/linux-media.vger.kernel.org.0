Return-Path: <linux-media+bounces-51560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGUxFkxed2n8eQEAu9opvQ
	(envelope-from <linux-media+bounces-51560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:30:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA417883E2
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52C9306E3B9
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839D03358DA;
	Mon, 26 Jan 2026 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa6jQ4+5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eogqC1i3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF3358B5
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430391; cv=none; b=mhPoxN94iy+EM5hja+hZ3SwawKGp2cPuhqn41hzSzR6N1VAdavY8Lq03Thfn9cNSX8dP1k4CbbrKp0k7+E2dCUq6xgdGOEk7MY51tFjAO4yFR5/8zgfG4LSvMMZ+2NyCgxubmGCk9UxMC3xftRhmX7lsjdhKXbqExXhODrFSMGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430391; c=relaxed/simple;
	bh=sXgpZAB7fBr74J4nr5ln8ouz3i95Ff2hs0Y+dXHx2qo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0mJD2qKVy31G1J3M+nRH/yAly5AbLbesw5wywMmS5JNUOZMqr/q86+b194hFcKGiqrgI6wZ0Ia+atooSObz76kHwC9JKeZEl3MI0Mp7KuT+SYlznEdZOBa19q6GifjQ0gIStX6k5nLvFx+uFn0ORCHvo6QJapi//HL2I6dLraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa6jQ4+5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eogqC1i3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5UHcP1019020
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UJ/cBH7DIpycsyrwwFYgg4
	UAaSrAaQym3P8qPeNnyE8=; b=fa6jQ4+5Hqdq6SC0WZsSGVySMKBR8/1tfT4H6L
	SZvDHnl0EMZFwbXxhulfAlwmGxt/LJC/kmpKwM4tQkMGB2aymiTegie5WpmvNuxD
	My22Gp2hdeew1RR3HehqYYqTyAnsLkTpdCjOAPt221+n5yg9znNE01b/dKjgfW9L
	cEC4q3mUCJviVif8sB0j0Ra5jl5kGxDlz2b2CEfkb4SlxSpg31eJuBEsvFr+FJwP
	JKJQ6QwWxV4mGg2sTIOd2B3NUfeffOQ+FfUjvJNT7dQjxyjNp0fJ/Ckx4C1ZcxYp
	aFhd2yuIUoTEwaZzYEnV116/PTHQ1nQt2149DCsVBSJ8lDew==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx2680yhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c552d1f9eafso342387a12.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430389; x=1770035189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ/cBH7DIpycsyrwwFYgg4UAaSrAaQym3P8qPeNnyE8=;
        b=eogqC1i3tkg3S8LLpHRhz+4PoseMVV8RaeOfQI0wTe9MCDts3vhQ7j7Yzys0zdWvrw
         qObYFiAqBbQVxN2wLMUrBypUrNszkSpFWa+xq+U/wnoaC5/KyYHCIUoI/qkFMzYsLwiJ
         3FSM9Y0WCF6WPvh7lMaLn8anDDn/FWcXKz9m0I3wraXnJJKSYWmduMYMDhuM8yFEe3hy
         wGhkH14T3iuedInLuZ/5gelbRVicNv+HSLecCX947wlSilbfjhhw93QJNlnf7u6HvKYo
         IsD32TXdKWBgaKLIKmaR0LwqdFEqQIiEq2y7yLWuYh2ZAg7aumA4l7AZQtSCmHFpORdd
         MWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430389; x=1770035189;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ/cBH7DIpycsyrwwFYgg4UAaSrAaQym3P8qPeNnyE8=;
        b=Aly7d0xkbmjsYxxXSwTR/ShVNmY1LzXeSjIOMSkkiyZ4+QtB88U5ZK2Ta4f4C4vGdK
         ukovD+itPDbZsTNpLPIS46S5ItQihJe0yGu6JZGsgQas2g4WSKvdKfg49hsWjQLTA12T
         ZQ3hXyLqQIvNBDWbR0qOdRrtbBeN3hZ8nc6y97xxYwnTxgsRYk0bZgCAC4GWb9s3TnFg
         pXjYVvNOvSS2WmZK7Vn8mOhH1qiYjFNHVxE8TLClB689SPvQcJZpZzXnjvq8SwAUF3BF
         AL2DsdNW3rEbd76G3Lk1FsE/97YltgxQoaK+9YCO0Ez10GxKZoHKcuf3/Zk4/t4Xzsfm
         pc+g==
X-Forwarded-Encrypted: i=1; AJvYcCXoolJXpLKCUd6sF5lDV606J4qME9OgCqNFtFBs2y6HkSy+IxVDjx74BzzJO8moeNN2sM9EHGx2lkLLtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRuust3nH2rtkUCB2qSbTphd/eReq7HosPJT9uuto36sVztzj
	iRtbOp/fpc6PkG804Mn0jKZChm3RhZaBQeSPFuSp3nC9arJVR7BPX/dV9pfol4ofMipsAwNB0Vs
	sVJbcdhfN0hO0Mi3eZ7xg/ei+Kfiod+GQC7If/VyUpN1ac40R8wee8F0VyNpxQrX5aA==
X-Gm-Gg: AZuq6aL77VLzHNA2QWL8h5qHqNqCph2zV63oI4LVp7iASgegy5Qw/EXBm0+aykZZJXD
	pMK4ZzTUzrLxq0Yj+Md1JEyIQbC4yx1RPLDGBC/vJBHjr0VqhAPAtT8jaa3gPw6KTgDHwPAgAGE
	3QC1KeAhAdRNCfUV7QAz1LApHwx0YbUZMyNWIDqrqkGJ9s5JhZaHXiSsc8YjENoDfAvGnGWWYVD
	mPNTDFHif5ARhvZyoysVRoq8k+UKe0YdGhQVwek0UoRdk2RUHoD+15nA/WYvMhAjohg0h/JNYqi
	YfUNj4NerfuIeNHHMkim1H0kw/rUs+Teu5nQjEL7pAry4ssMhLV42LF4DQkicU9FjEhaBSy0dbY
	HQ3q4za8YxPbJsMdDRnI6J/8yOxHjVpUB/vTNvt2JFD6y
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3890948637.13.1769430388513;
        Mon, 26 Jan 2026 04:26:28 -0800 (PST)
X-Received: by 2002:a05:6a21:3988:b0:38d:657f:7d87 with SMTP id adf61e73a8af0-38e9f0f4a4bmr3890921637.13.1769430387992;
        Mon, 26 Jan 2026 04:26:27 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:26:27 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 0/7] media: iris: add support for kaanapali platform
Date: Mon, 26 Jan 2026 17:55:43 +0530
Message-Id: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEddd2kC/y2NQY7CMAxFr1JlPakStylthUZzD8TCTZwZA20hL
 giEuDsBZmPpPcnv35VQYhLVF3eV6MLC85TBfhXK/+H0S5pDZgUGGmOh0XvECY94YM2JRUMXg21
 rgki1yk/HRJGv7+Bm++FEp3PuLh+pRhLBd7cv1v9Za5yrjSm7atW6Rlt94R3e8tAUyh0vC/7MI
 uXpjAc/j2OZz/drbEAh/TK89IXHCg3EgHXAlsBbPzQDErmwgsoBddlFJFTbx+MJLtyH8fcAAAA
 =
X-Change-ID: 20260126-kaanapali-iris-29fd184e2fe4
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=14125;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=sXgpZAB7fBr74J4nr5ln8ouz3i95Ff2hs0Y+dXHx2qo=;
 b=UdAc47Zn8Gbk7z/QwjTbyRbxGhOwdvde9DFwYraBREbaRZNWPdR8b/XMJkLLxtJzxMjSMCQ35
 C6VeU+fRJMTBUxvL4yOD/P1duxVI1hIoask7ZvdjA0TCN4SS//QeOmE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69775d75 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=toAFPFK_xAPQ-ejxx0AA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX60yFJkjEjJ4Y
 GRuiH1Z91TaunuZF44MX5e3akpz7xI5kkIX8Gb2cNGIxqvAOAuaV8q32V2eUiJiiTsHEimKyDV5
 O+m+JnmJJ4PxWKjyOKNgQGdM2Mx0fk/H434moh3Vjkh8kMDKaZEimMP071/fHIzrqrpXbOGfrVn
 qpeyBEA49R/yuVtvsFtVj0LtySL+qqrHxCn3mWzcU2hDWtO/ZKOvz9HqU4FtwFL4I+WkzmCwipS
 TcY7V1d5ZT+Qi3acKYnlviztlkejT0FeuyYPDXuSC7LAQutnCqSp5IUTGIIOG9mlxxoTxGMbwkL
 pQ7HnbmT1h+wASLTsV7zeIA5ca0VW+37f0sHWpFr6BC9SxGUsAB6I5/dFu9jgVPeXuKbAiyUefQ
 t4eGNpd6AHBma7GlcEK/bpJZrEhLTcSDdd4f+Iz83Ge45I9Xdzbj96pIeB6gKnvcHG9RH46rNfr
 IMX7B2eSczyeniQ96FQ==
X-Proofpoint-ORIG-GUID: qNGEJgtwmE7eTdsRuMTj8jeTXYdjXaiO
X-Proofpoint-GUID: qNGEJgtwmE7eTdsRuMTj8jeTXYdjXaiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51560-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA417883E2
X-Rspamd-Action: no action

Qualcomm kaanapali platform have a newer generation of video IP iris4. 
The hardware have evolved mostly with respect to higher number of power 
domains as well as multiple clock sources.

The series extends support for multiple iommu-map entries for the same 
input id. Considering iris as a client driver, it adds the handling for 
multiple stream ids from VPU via iommu-map.

This series is depend on the below series:
Link: https://lore.kernel.org/all/20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com/

Following are the compliance and functional validation reports.

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.19.0
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
        Standard Controls: 12 Private Controls: 0

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
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:2000000.video-codec
        Driver version   : 6.19.0
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
Charan Teja Kalla (2):
      of: factor out of_map_id() code
      of/iommu: add multi-map support

Vikash Garodia (5):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: Switch to hardware mode after firmware boot
      media: iris: add context bank devices using iommu-map
      media: iris: add helper to select context bank device
      media: iris: Add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
 drivers/iommu/of_iommu.c                           |  36 +++-
 drivers/media/platform/qcom/iris/iris_buffer.c     |   7 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 .../platform/qcom/iris/iris_platform_common.h      |  30 +++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  90 ++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  80 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  59 +++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  93 ++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  24 ++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  16 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 drivers/of/base.c                                  |  69 ++++--
 include/linux/of.h                                 |   6 +
 21 files changed, 726 insertions(+), 64 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-kaanapali-iris-29fd184e2fe4
prerequisite-message-id: <20260121055400.937856-1-vijayanand.jitta@oss.qualcomm.com>
prerequisite-patch-id: 1d896ff4a958ebd06066dbf705c4c45cf73b6041
prerequisite-patch-id: 44414df7d8342ca19c0518ac087f08f98546c3ff
prerequisite-patch-id: 0f45ca6f67948e03a89274c144660a55b3ff8fb1

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


