Return-Path: <linux-media+bounces-59963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAw8H/T18WmElwEAu9opvQ
	(envelope-from <linux-media+bounces-59963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:13:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE36493ECF
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 582073088F68
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0427D3F7877;
	Wed, 29 Apr 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f02SVpQR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wo4OErXH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EE239A079
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464613; cv=none; b=bjeTUKthz+NojJ3+tIU7Krs4LsoNKIfccIoIcQSFC9cP1RGJhHdxLzpzkqmACrLhRZojEwf+904exhOiq+IGcLo1NYVTFdEk6EUFSpUhR5X2MLIQd/ueqhF0uiqVDB1HeeFDJmNLt5j7wwMI1BYoyLhPb7TaZJ1M8keTi7XVuH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464613; c=relaxed/simple;
	bh=NbQKCittLBiFvy69oxSyCQeIJL/KwdNpxcrQe/QKucU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LI75ahuNdtkFxnPIaSnLJoOoXgLNeiOR6t3XlY5S/uccsvk9KGJO7xNYH4Dl4R46gYSPAVLAxYoT182FUNspgeV1UihY2P+uaFVhiRwLYEhICgI5b8FNmwX3J9iq57ei0qEFx7DE9LrO2cx0xGQD930W+89GSBnIndxnWLpBR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f02SVpQR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wo4OErXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppvS2094109
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fz4LoT2b1QQjgZX0eMyx6G
	m8BhWgAsVWhfNYkxnjkJU=; b=f02SVpQReHE2od1xZZCs9RcvePhByMw/zDUrgu
	fHXc2DG3qaWlD+4tLv85p+K0o+dIytCBXtW867NVq/FMGKZrutzClBfCn7R6nMuf
	F8DGJITuCcrLIZ8oTKo77ckbhe+nLN+lclbk9cBYoXjiGORYCe5/rcHqowfhi3st
	9o5lTb+6d96lyxgKJtv3WAnejXx/UEZCVkD+edbFm4Xcdl/YB/cmZWOvV56Ikrfo
	JLVglCbEKChCzvPq3gIlxi/WPQmIZg+KYwB2yaETTSfZRKBJs8QDJ1ZvIh0/JZnd
	aYl2DCpSaeu54C/iOGB3vSx2bcwAcecEkck83YUisB/8lqmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3s79c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 12:10:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b454cac322so118124435ad.2
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777464608; x=1778069408; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz4LoT2b1QQjgZX0eMyx6Gm8BhWgAsVWhfNYkxnjkJU=;
        b=Wo4OErXH6FuWYyVohQEi63n/WywdA7UQ4V4wAFz62LXdC4zMZBlqvV57ZSmbyaEIG9
         5gJi5JRHOvlB+3B8LdBUX6VfAJiu/Wq2RDRx1gpkRiWk13A7Ld7fAMWt0GYKNW1gI1Qu
         t9NBXXBgOL2+Rp7RI9Y8JdgsGfR+nbXbOC4n3zPomJ6lIojN8eZiibtbcKaTpfCc3/mk
         +UXoO0hoQWem1d74LYkKKOrtikiS4k56e172EjXQfg+heRbI6ZHNwk6+8HsGriaCF9Sw
         Vg9bvx/cJrOiwYxqApL/nQf6MUHx0tZrocWjoVDnExG+Jm4jzv21clCCHfG7mk+wqwlV
         wxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464608; x=1778069408;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz4LoT2b1QQjgZX0eMyx6Gm8BhWgAsVWhfNYkxnjkJU=;
        b=jg5A9OIjS9yylAGdTqwNvqMSTrLcumHLgZuddHdIuLsuF6ay2ALQh07ikZMX0bT5vP
         y2uFQreaGF2v6pQAP8iFVY13c0i+NvlWnrkOZ/w4OExIg42isWBo1cIFkBdaw5mnr3Wt
         4K4agqBe8T9JeAmVZuw1LJrt+Qypj7wXDN+XjuZCMwC0YV5Pz+QNipkzIbZDl4p0QTHz
         P2p5Fw7q7Fr89l4RqSMce/xiNplA4ruotyW0oh282ScSpE/Iwj7YCVm9Hj/FC96SkW/h
         j65CcPQsz+9Z0r6UWcqCoaDCxbVHcvHUJVgbaV448d/wKDApu1n4LI3BT5gmmjLw2Qiw
         uR0A==
X-Gm-Message-State: AOJu0Yw7/wt9wl6qo8NJusa0mef/PI0BydcuuCV8Ur5VrsbAYVgyM6hs
	XPbv5YpGcjDVyQBml5H2c6hH/g/bFkSe8EyCObC29ZI9g/HaN0GXyPdJ925l7hxBkediOXmKaby
	FDyUHh0rS6Mo2FBcsTyLLtBq4WvjaCBYPG5obElvQvy/t4CMNeb68XLGBWDJlu8H4Xw==
X-Gm-Gg: AeBDiesR6tWMOdJSBviJ+KmH+awEh2OhOg8RMtq6H6BgRfYP2+5NfYDetLjEC4kE8fS
	6Uf2kEXLE5Kgt5ObDgoaCp9Uqdw2hxSBsyEQaItRr3RbagNJwawCdQFveM4XLQJCLwMvNY0n4Qw
	+zVPAYmIRvpcxBgDVSNsPAJQG/DwZGzEvkpKzotjkJ7LxUX5J1HXn5l4kYlb3yqJRA2CqpJY561
	RF4IdALi5tD19ejVv1B1CCTJmcUUBoZ4wVAuKxmh5Db+kUbxt8sySzmy4kCgc1495faROY+Qdvz
	fsEI6l/4Oktj7eoMiGRICx3tZkMuSLE4g6uyAJdEK+GLkGuHn+DDp4xYWRfdAcp990vkqao7RGA
	9RACV6BNcnwoKOnbG+W21CdVF6TRJ6LpxQHqx+qnizQD+JyIDiPPB0PQIoXeUyefwnUf8Ww==
X-Received: by 2002:a17:902:db0a:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b97c46186fmr76099345ad.23.1777464607610;
        Wed, 29 Apr 2026 05:10:07 -0700 (PDT)
X-Received: by 2002:a17:902:db0a:b0:2b2:4029:d77c with SMTP id d9443c01a7336-2b97c46186fmr76098945ad.23.1777464606980;
        Wed, 29 Apr 2026 05:10:06 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887ad80bsm21482765ad.37.2026.04.29.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:10:06 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: qcom: iris: Add generic Gen2 firmware
 detection and loading
Date: Wed, 29 Apr 2026 17:39:46 +0530
Message-Id: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAv18WkC/43QzW7CMAwH8Fepep5R4ny0QdO095g4uK0D0egHT
 VsmId59oeXIgUskR/LPf/uWRx4Dx3yf3fKRlxBD36VCf2R5faLuyBCaVOco0AqNDn77JtAvHLl
 DiPMw9OMEiwYqvDDGS0O+ylPzMLIPfyv8c9jqkS9z8qftM68oMtR924Zpn6lKmLKRxMzeY0EFl
 s6gq7XTaai0UlXKanYPuuUYaQ22zz7XXCgchDFEWLibI6TBENsSjYDFgABBiMqaRpnSfPcx7i4
 znR+Td+n5ek0qLJ7aCvtzGCBew1SfNhO9rmxtlXVYvGtKNJs2V9f6cTQB0nslrNZUl/L9aM9th
 zNNvh9baGgiWKRMIDPZAiuhyL2/qxIbOHLbTwy+ndIpFUggtFQ5dkKKV/EO9/s/o8+0MUECAAA
 =
X-Change-ID: 20260429-kodiak-gen2-support-v4-a7f055f15afb
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777464602; l=18339;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=NbQKCittLBiFvy69oxSyCQeIJL/KwdNpxcrQe/QKucU=;
 b=1B9tEo0Hxsp66/OhXTo59eGSyv1YRPc4XL9lJFhvn1w64WYJtxLr1UkRXg0I5VrxjX+Mh3H9K
 aYfpdzPnapgBnW3NPoZu7wtDTbJuOoUEtasugKqIl86lft/ytNxziYO
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: yMVZHyS4uzj90mfCxiaf0BsqlCYnCciG
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1f522 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rTZW8fraxr8bdO3-5NoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yMVZHyS4uzj90mfCxiaf0BsqlCYnCciG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMyBTYWx0ZWRfX9LynZsVwGQIg
 jRyrXKqzdm+lnQW+UOu8QIKMJrs1s5uV43MgOh/S8fMZt8U+tDc6EGtTVnx7ezg3JpiNmhUd8hA
 uOMOSupPjpArz/MsUEF1+zKIQrD8iF/hYWsA89gRJsit1P2epyAwN4IivbuFW54hSrDuSrKgHVl
 xEIC+uhYkm+xPYVpp06bClOlo8ao/b68oTSoRripL4/pvX7EIl84K9Kdn1N3ATeLyLfluWyHnh9
 QAkZ7rRG+mxj+lSWUh5vYw0fk5r97EEkUxuE0hY4HAaW1Yqcbk6fy0SpJsX9xYUAuQeccHObCzV
 8ItV1+tmDCKIFmT+stHQzb88Pvd4HqLi+6gk3sV7mIHMAO9pf/XfWSgY+FZ3emEaX3LBLOLZ2nB
 mh84pS6nueIrgz5AGWOwwksxQlVOevBaA0kInXUxRrvq8R/jjwm+kh9jOgGMwvaFlZnUfeg8CbK
 TMpuByT2JDbSx8Kpg1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290123
X-Rspamd-Queue-Id: 0BE36493ECF
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59963-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series enhances the Iris driver to support platforms that provide both
Gen1 and Gen2 HFI firmware by adding generic runtime firmware generation
detection and selection logic.

Some Iris platforms are capable of running either Gen1 or Gen2 HFI‑based
firmware, but the driver has historically assumed a single firmware
generation selected at build or platform‑definition time. This series
updates the firmware loading mechanism to dynamically determine the
firmware generation at runtime and select the appropriate HFI
implementation accordingly.

When no Device Tree firmware override is present, the driver now prefers
Gen2 firmware when available and falls back to Gen1 if loading Gen2
fails. When a firmware name is explicitly provided via Device Tree and
both Gen1 and Gen2 descriptors are available, the loaded firmware image
is inspected prior to authentication to determine its generation. Based
on this detection, the driver updates its firmware descriptor and
platform data so that the correct HFI implementation is used.

v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
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

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
	- BA3_SVA_C
- Interlaced content is not supported yet.
	- CABREF3_Sand_D
	- CAFI1_SVA_C
	- CAMA1_Sony_C
	- CAMA1_TOSHIBA_B
	- CAMA3_Sand_E
	- CAMACI3_Sony_C
	- CAMANL1_TOSHIBA_B
	- CAMANL2_TOSHIBA_B
	- CAMANL3_Sand_E
	- CAMASL3_Sony_B
	- CAMP_MOT_MBAFF_L30
	- CAMP_MOT_MBAFF_L31
	- CANLMA2_Sony_C
	- CANLMA3_Sony_C
	- CAPA1_TOSHIBA_B
	- CAPAMA3_Sand_F
	- CVCANLMA2_Sony_C
	- CVFI1_SVA_C 
	- CVFI1_Sony_D
	- CVFI2_SVA_C
	- CVFI2_Sony_H 
	- CVMA1_Sony_D
	- CVMA1_TOSHIBA_B
	- CVMANL1_TOSHIBA_B
	- CVMANL2_TOSHIBA_B
	- CVMAPAQP3_Sony_E
	- CVMAQP2_Sony_G
	- CVMAQP3_Sony_D
	- CVMP_MOT_FLD_L30_B
	- CVMP_MOT_FRM_L31
	- CVNLFI1_Sony_C
	- CVNLFI2_Sony_H
	- CVPA1_TOSHIBA_B
	- FI1_Sony_E
	- MR6_BT_B 
	- MR7_BT_B
	- MR8_BT_B 
	- MR9_BT_B
	- Sharp_MP_Field_1_B
	- Sharp_MP_Field_2_B
	- Sharp_MP_Field_3_B
	- Sharp_MP_PAFF_1r2
	- Sharp_MP_PAFF_2r
	- cabac_mot_fld0_full
	- cabac_mot_mbaff0_full
	- cabac_mot_picaff0_full
	- cama1_vtc_c
	- cama2_vtc_b
	- cama3_vtc_b
	- cavlc_mot_fld0_full_B
	- cavlc_mot_mbaff0_full_B
	- cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
	- FM1_BT_B
	- FM1_FT_E
	- FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
	- SP1_BT_A
	- sp2_bt_b
	
./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- 10bit content not supported yet
	- DBLK_A_MAIN10_VIXS_4
	- INITQP_B_Main10_Sony_1
	- TSUNEQBD_A_MAIN10_Technicolor_2
	-  WPP_A_ericsson_MAIN10_2
	-  WPP_B_ericsson_MAIN10_2
	- WPP_C_ericsson_MAIN10_2
	- WPP_D_ericsson_MAIN10_2
	- WPP_E_ericsson_MAIN10_2
	- WPP_F_ericsson_MAIN10_2 
	- WP_A_MAIN10_Toshiba_3
	- WP_MAIN10_B_Toshiba_3
- Unsupported resolution
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
The failing test case:
- Unsupported resolution
	- vp90-2-02-size-08x08.webm
	- vp90-2-02-size-08x10.webm
	- vp90-2-02-size-08x16.webm
	- vp90-2-02-size-08x18.webm
	- vp90-2-02-size-08x32.webm
	- vp90-2-02-size-08x34.webm
	- vp90-2-02-size-08x64.webm
	- vp90-2-02-size-08x66.webm
	- vp90-2-02-size-10x08.webm
	- vp90-2-02-size-10x10.webm
	- vp90-2-02-size-10x16.webm
	- vp90-2-02-size-10x18.webm
	- vp90-2-02-size-10x32.webm
	- vp90-2-02-size-10x34.webm
	- vp90-2-02-size-10x64.webm
	- vp90-2-02-size-10x66.webm
	- vp90-2-02-size-16x08.webm
	- vp90-2-02-size-16x10.webm
	- vp90-2-02-size-16x16.webm
	- vp90-2-02-size-16x18.webm
	- vp90-2-02-size-16x32.webm
	- vp90-2-02-size-16x34.webm
	- vp90-2-02-size-16x64.webm
	- vp90-2-02-size-16x66.webm
	- vp90-2-02-size-18x08.webm
	- vp90-2-02-size-18x10.webm
	- vp90-2-02-size-18x16.webm
	- vp90-2-02-size-18x18.webm
	- vp90-2-02-size-18x32.webm
	- vp90-2-02-size-18x34.webm
	- vp90-2-02-size-18x64.webm
	- vp90-2-02-size-18x66.webm
	- vp90-2-02-size-32x08.webm
	- vp90-2-02-size-32x10.webm
	- vp90-2-02-size-32x16.webm
	- vp90-2-02-size-32x18.webm
	- vp90-2-02-size-32x32.webm
	- vp90-2-02-size-32x34.webm
	- vp90-2-02-size-32x64.webm
	- vp90-2-02-size-32x66.webm
	- vp90-2-02-size-34x08.webm
	- vp90-2-02-size-34x10.webm
	- vp90-2-02-size-34x16.webm
	- vp90-2-02-size-34x18.webm
	- vp90-2-02-size-34x32.webm
	- vp90-2-02-size-34x34.webm
	- vp90-2-02-size-34x64.webm
	- vp90-2-02-size-34x66.webm
	- vp90-2-02-size-64x08.webm	
	- vp90-2-02-size-64x10.webm
	- vp90-2-02-size-64x16.webm
	- vp90-2-02-size-64x18.webm
	- vp90-2-02-size-64x32.webm
	- vp90-2-02-size-64x34.webm	
	- vp90-2-02-size-64x64.webm
	- vp90-2-02-size-64x66.webm
	- vp90-2-02-size-66x08.webm
	- vp90-2-02-size-66x10.webm
	- vp90-2-02-size-66x16.webm
	- vp90-2-02-size-66x18.webm
	- vp90-2-02-size-66x32.webm
	- vp90-2-02-size-66x34.webm
	- vp90-2-02-size-66x64.webm
	- vp90-2-02-size-66x66.webm
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
Changes in v4:
- Simplified the code handling selection between Gen2 / Gen1 and fallback (updated by Dmitry)
- Link to v3: https://lore.kernel.org/linux-media/20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com/

Changes in v3:
- Rebased on platform rework series by Dmitry.
- Moved version detection logic inside iris_load_fw_to_memory (Dmitry).
- Make Gen2 as deafult for SC7280 and falls back to the Gen1 name only 
  when the Gen2 image is missing (Dmitry).
- Link to v2: https://lore.kernel.org/r/20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com

Changes in v2:
- Improved the logic to detect if firmware loaded is Gen1 or Gen2 (Dmitry/Konrad)
- Added a patch to switch hardware mode after firmware boot
- Link to v1: https://lore.kernel.org/r/20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Add Gen2 firmware autodetect and fallback

Vikash Garodia (1):
      media: iris: Switch to hardware mode after firmware boot

 drivers/media/platform/qcom/iris/iris_core.c       |   6 ++
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  24 ++---
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  16 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 13 files changed, 145 insertions(+), 56 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb
prerequisite-message-id: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449
prerequisite-message-id: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-message-id: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5
prerequisite-message-id: <20260329-iris-platform-data-v11-0-eea672b03a95@oss.qualcomm.com>
prerequisite-patch-id: 34d473ba50399f8cfaf583f4def12de776aad65d
prerequisite-patch-id: 5a6a2b41c9312687512db5d12bac95114b8d8719
prerequisite-patch-id: e6ec4cd9eb5e93f3443f5f496a1b990a95b5d96d
prerequisite-patch-id: 4be4bbb454444d6f314c2b6ad6a73290184e6d57
prerequisite-patch-id: fd9cd7882f2a8f1b6141f48ff5c3da708839d03f
prerequisite-patch-id: 952471fa5477280d399978c05fbc9bfe6d2d33b0
prerequisite-patch-id: 01c5b37358de833f85de1954f770fe0489818a16
prerequisite-patch-id: dd14b47d6cd8ff14d1bc78c187c061f6fe262fda
prerequisite-patch-id: f4eba0865e7f91bce3fb4b2c627ee123980e0ff9
prerequisite-patch-id: 72984784b916e2d94ede8ab7d52cc0dedfa37c41
prerequisite-patch-id: 2fabf4e36b4e4f74b27fe75133ab8ba0ec9b6e3d
prerequisite-message-id: <20260330-iris-remote-fmts-v3-1-a26ab9e90101@oss.qualcomm.com>
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


