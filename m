Return-Path: <linux-media+bounces-53721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECQVB+OooWm1vQQAu9opvQ
	(envelope-from <linux-media+bounces-53721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:23:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5B1B8D16
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 492073099A8B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEAB3EFD0A;
	Fri, 27 Feb 2026 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAiQczyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYCgb0PS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29435250C06
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201510; cv=none; b=lq5RLNCnEeQAeMYjb/1JDrsvWZISy1nJC5eIW5QszLVvQ+1qhsZTlxVG9YclujgxHMuM23wdjJYXuFTT9MW0IM+LbqYNoGSG9bRfrFlBw0+lFLkxYzl5ljUdbGisH8Ns1sS7Y9oY4URMhR3jp+erLuq5ewxtMWSjSOugCU+3keg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201510; c=relaxed/simple;
	bh=RLDAzGMUWXS021KPM72oLL7GhSjlHGnGQmwf/nf+QgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rX1z9AsX/Kj5Gjth7VcENhspu54k12A/2v/NmM3ZHTUy1ZYGFPz6NhFV2fN02bA8/0ezJTG+4alMhRHTkj2EXxEklngEP1fKhLO6N+w/WRI2jIxK0iApbTI/BwT7w9pLEB2NdBSA7FyGatn9UXRINRJSvpu1xSdYQrdMv+B84QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAiQczyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYCgb0PS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9qWkB1600697
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wy5SNSh1uoxccf5R0tqQwk
	0UdFuzmSmmE82o9oJpPdw=; b=ZAiQczyXoMNZQ6j4iphmappW70QUqTfkwLhZ32
	1O2eC+q/qJQIQyu6PXKhgCIWpcKbDrBqW5SXvrOylF7HAerW/qWMtqKt1IobiFEg
	ZMzRco9M8HcYsT32QmiD1BJE3xJCCyc/zhXdLsVPkKSZ3JtUQ3oLmVPOppI8DEKJ
	l6QtSbpVg7mu2djMAIRRNAwn2z7ZP5LITSD1gpbtsJ/8e6qlKaDSmHY55Ea1V7Tr
	8U8U5JF1TCIvlwUqsBOyLUkByVOw0klOiTgpF5FtjXWbXuGimUEnXwyYAvXO/S4R
	5DvFKXmoO0E+Wj/UMGxYXFUadrIGaH9lByPz111JjTUUSgXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99uvmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso6347615ad.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772201508; x=1772806308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wy5SNSh1uoxccf5R0tqQwk0UdFuzmSmmE82o9oJpPdw=;
        b=XYCgb0PSs3lVR2tafVmjRzzt0OEP6NrhgPDVX/WQGWQ/BErr3zC2HxGCy0T3OjEqiO
         OJtGbvJ2/u5WlPPJ804L6QKaZ7a1AtH1xyWjoDopw55N6RUPCB9lDuPJKYp5/OpAqKGg
         S26jTGXDvJfdXX+CQrJwv9LdXLGysdGwhaTIsP+qbO+4+CvpCCxJRCrJkp+SQjvE/PTX
         lMOLf/sovQNo0xt7s7efN2EP8MLj0EIyJKjSYA2ZjjjOLyXjsRSgrQ+UxaLKUYH59yjp
         cpYszVFIfzfPSZigcfWjq4UqDKfoUL8WlLwh5+3k8wNF7/1b7d1wohD7NMjPakfm5SuN
         IpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201508; x=1772806308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy5SNSh1uoxccf5R0tqQwk0UdFuzmSmmE82o9oJpPdw=;
        b=gF45H/LJmQusVD6/MjJwouPGFlMsBQTkU8+yJVKpUKrJ8DaDlGcV02RRJpc6LWJWzW
         M7AxLcB+iisePQsQBufvjGKLbVBJ7ssUwpZ82TMWYoBerUSYWRGkqW31FyagB5kZe7Od
         r814LXNBbaa9xWrN6MKfr+R5rf0ekfTYhlbUPQjqoFaQ3jw0iHKfgXS25lXFPwk7EiBD
         I1v7Si31z/jG5H4V3cjdAWoHk2k1xYyPsgw74sG/R8tWXKVSkOs01sc3HSTqdWq+A5dF
         ntjQ82/CWn5Oj/iBl6UbWm700kvsphoRy4LNQGGDphkFgFGKn2XwmHgCaYkrhVej0HKc
         SlPg==
X-Forwarded-Encrypted: i=1; AJvYcCVuKDIpkItWs7XK/RVgXuN+OKEVe8WQlqfIieFZPOVmou4mqI3683IUGeXVmRPw7Wok/xyPvz17120KLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyha49kEI/pz9iWm61syFowBo62dgd79h4YPovoO/SjZckC1rle
	BCuR1/6FAbHgRGsEfqMlvHktK5OfqZQdkKVmekhTPyXPFQn5XFpmcCziTWNwiXCSjgEj6fppE8e
	jNVZ/2t9qbuhP4/SEh0vRcy+rYESB5tTqx5/H7ZzC0r9TebkS1FVE3k32tQVD61Fzhg==
X-Gm-Gg: ATEYQzzWMYi9L0JBr5Z0KgPq3SPw/zVwEpzpXw6VKZBOAFOvgVBRxTvMOIwOYwdPSLO
	QilVdTvE9PUMBwwa6xvX/b9KSNqBK6zC2vmaZF5AeQeWSbzAp5sN7oQwCWPZ7TFZR2U/AUVb0ST
	mzD8afiGiPQqLYhHNcJts4OzUPuhVj4LM62ZIOUsakX2qd1zzlwmF4RucFIq6NFHhoQTNslXwjF
	QX2qulNtAdO74z3hIrwPB+GKg91+r2qPGN6kzf+fmDrcg/4ne4JAwZjL/qLaiMCYPf8EGulElv9
	amm9Fc1dRAvC7r3d/tSvzbc45r5IgxalawqAmCdcLDu3QOnjClF4ojEDvF51FP9fLF4vS51Z/TL
	EXqQz/pHVfaZSuG3uOkza9n3gffm5gccNaDb0MJNir81NHjD2pUrlpJU8
X-Received: by 2002:a17:903:240c:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2ae2e250953mr28576665ad.11.1772201507412;
        Fri, 27 Feb 2026 06:11:47 -0800 (PST)
X-Received: by 2002:a17:903:240c:b0:2aa:d333:ce84 with SMTP id d9443c01a7336-2ae2e250953mr28576075ad.11.1772201506643;
        Fri, 27 Feb 2026 06:11:46 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm60960865ad.24.2026.02.27.06.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:11:45 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: iris: add support for kaanapali platform
Date: Fri, 27 Feb 2026 19:41:16 +0530
Message-Id: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASmoWkC/3VPy26DMBD8FeRzjWxjjEFV1f+ocljwutkkQGIT1
 Cji32ucY9XDrjSz2nk8WcRAGFlXPFnAlSLNUwLqrWDDEaZv5OQSZkooI6Qy/AwwwRUuxClQ5Kr
 1TlqNyqNm6eka0NNPFvw6vHDA2z3pLi+SjRgjZN2ueM+yKk2jla7LSrRWW8MlX+kEj+Q0ufJEy
 wKfc4zl7Q6XYR7HMq2P3a2HiHxnaOmKxhljpG0qb/paD00t27qxArRIhx5c5bRVznq25zpSXOb
 wyL1XmYP9V3GVXHBURhulTe8H+ScLO2zb9gt4hKJtSwEAAA==
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772201499; l=17886;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RLDAzGMUWXS021KPM72oLL7GhSjlHGnGQmwf/nf+QgI=;
 b=++tqwVroluv6L39GDqR5mQ092PszY5K3gt5YAf8fUonPPzOUHbARPZO/ApmnWrCKGAzB04dnl
 MuY/rxGXdOHD7J7vnZYv7ndccgaJRd2fb+4eQGZnUcGT9pYQZWYjv9O
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a1a624 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8
 a=xUdf3jHjDDVTvoI38tsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vLuubrH0HaL6KXreDfKD3T9fVbv90Of5
X-Proofpoint-ORIG-GUID: vLuubrH0HaL6KXreDfKD3T9fVbv90Of5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX4dBVks4z8AGN
 aCGqqcF4hExivuAaZ5qqMGQWs8C+A5FwuK4lyhAKtsPmboC251FGOEvtKfs1qEIjU1enIfOaMmV
 IiIejOtQ4fhpyYr3QCOqd460Q/GWL5dtsOuQa4FGJjMCGRkJye6B3rQrEAEleuh6bhctbJENYd/
 9q0uSw2S9OmwLXNdFPDoVOUWEz7GbnLrZG0Poqcuo4j+OlVs6E9Z6DTsNCM9IiM86Czmenhj0Mb
 o/2NyI2zvgAzGOhnaX8vmE8EMo1HONxZ7CDjD9Uv64+Ne6PUZCxa++nt7GpN/Qh/tabeNRkOY63
 t3ARtb58S2tmP8gVBF2ytcWitGMtEBWOhLA28+rpizDvLrpQ/6089V7MtRyy8rJbqcgdkOEFquv
 0M1o0y1mMLZP34l2C53n6N37qY9/u9SfZd2CpD7E96iTmgWIiFSFU8yrhXKEJ++xqBozBaYfi/i
 naba1a3srzUJI3Y6GWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53721-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96D5B1B8D16
X-Rspamd-Action: no action

Qualcomm kaanapali platform have a newer generation of video IP iris4. 
The hardware have evolved mostly with respect to higher number of power 
domains as well as multiple clock sources.

Considering iris as a client driver, it adds the handling for multiple 
stream ids from VPU via iommu-map.

This series is depend on the below series:
https://lore.kernel.org/all/20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com/

Following patches were dropped in v2, as per the comments, and would 
be posted separately. This series depends on these patches for 
functionality.
- https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
- https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/

Patch #4 is also posted alongwith below series. If the other series is 
picked earlier, then this patch can be dropped from this series.
https://lore.kernel.org/all/20260227-iris_sc7280_gen2_support-v2-1-7e5b13d26542@oss.qualcomm.com/

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

Fluster test report:

77/135 while testing JVT-AVC_V1 with 
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1

The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding is 
not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
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
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
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
- CVMP_MOT_FRM_L31_B

3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C

2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b

1 test case failed due to unsupported profile.
- BA3_SVA_C

131/147 testcases passed while testing JCT-VC-HEVC_V1 with 
GStreamer-H.265-V4L2-Gst1.0

10 testcases failed due to unsupported 10 bit format.
- DBLK_A_MAIN10_VIXS_4
- INITQP_B_Main10_Sony_1
- TSUNEQBD_A_MAIN10_Technicolor_2
- WP_A_MAIN10_Toshiba_3
- WP_MAIN10_B_Toshiba_3
- WPP_A_ericsson_MAIN10_2
- WPP_B_ericsson_MAIN10_2
- WPP_C_ericsson_MAIN10_2
- WPP_E_ericsson_MAIN10_2
- WPP_F_ericsson_MAIN10_2

4 testcase failed due to unsupported resolution.
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2

2 testcase failed due to CRC mismatch.
- VPSSPSPPS_A_MainConcept_1
This fails with software decoder as well. Earlier discussion on this 
here https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/

- RAP_A_docomo_6
This was discussed on bug 
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be safely 
dropped in the firmware or driver side. Client does not have the 
required logic to drop them even if marked as error.
Discussion ongoing with video firmware team on a way to handle such 
case. Note that the issue is not specific to kaanapali, and its there on 
all platforms.

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
64 testcases failed due to unsupported resolution
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

2 testcases failed due to unsupported format.
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm

2 testcase failed due to unsupported resolution after DRC.
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm

1 testcase failed with CRC mismatch.
- vp90-2-22-svc_1280x720_3.ivf
Discussion ongoing with firmware team on how to handle this case. This 
is not specific to kaanapali, and its there on all platforms.

1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v2:
- Described iommu map in a better way in binding (Dmitry, Krzysztof)
- Defined the function IDs as ABI instead of hardcode numbers (Dmitry)
- Added iris vpu bus and configured callback for dma_configure (Robin)
- Remove parsing of iommu-map from driver (Robin)
- Fixed fluster issues by adding H265 line buffer calculation for vpu4
- Dropped iommu patches #2 and #3 from this series. Those would be 
posted separately (Bryan)

- Link to v1: https://lore.kernel.org/r/20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com

---
Vikash Garodia (7):
      media: dt-bindings: qcom-kaanapali-iris: Add kaanapali video codec binding
      media: iris: switch to hardware mode after firmware boot
      media: iris: add iris vpu bus support and register it with iommu_buses
      media: iris: add context bank devices using iommu-map
      media: iris: add helper to select context bank device
      media: iris: add iris4 specific H265 line buffer calculation
      media: iris: add platform data for kaanapali

 .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
 drivers/iommu/iommu.c                              |   4 +
 drivers/media/platform/qcom/iris/Makefile          |   4 +
 drivers/media/platform/qcom/iris/iris_buffer.c     |   7 +-
 drivers/media/platform/qcom/iris/iris_buffer.h     |   2 +
 drivers/media/platform/qcom/iris/iris_core.c       |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   4 +
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  16 +-
 .../platform/qcom/iris/iris_platform_common.h      |  19 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  90 +++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   |  86 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  64 ++++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  96 ++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   3 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  24 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  51 +++-
 drivers/media/platform/qcom/iris/iris_vpu_bus.c    |  32 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  16 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
 include/dt-bindings/media/qcom,iris.h              |  18 ++
 include/linux/iris_vpu_bus.h                       |  13 +
 24 files changed, 791 insertions(+), 40 deletions(-)
---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260126-kaanapali-iris-29fd184e2fe4
prerequisite-message-id: <20260226074245.3098486-1-vijayanand.jitta@oss.qualcomm.com>
prerequisite-patch-id: 421e3bb43ae0dbd6a1ba02acd02592d260456eb1
prerequisite-patch-id: f4b9b5e59b3d37407941f7fee05ca4996ad3d9ba
prerequisite-patch-id: 4556a2b44275b120be0faa86bde0b55593065476

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>


