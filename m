Return-Path: <linux-media+bounces-58692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id A3NWDwjK3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:00:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C393F5904
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A975304704C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE5723E342;
	Tue, 14 Apr 2026 05:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="el+sBlYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZi6q2o4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD791D5AD4
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142832; cv=none; b=EPda2x7aVHFWxevZapklcKWTG/CvZICFDwuAAtHXxBQ6jOX9Vj1Y8TZLxhlWH0vr9QetRS83FxzfdJbJLuLrISMcrDmeeaS4KxnUImZmQqSNjrci05jfPQTg6TsodxG+eZUq24UiK2yIZoHmBgAiilQTnxFO8Q9YD5Ht7PViyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142832; c=relaxed/simple;
	bh=syjK+wfsZtO1kX5rCepgeoW4nSKRvZKEk0MXeCCU3h4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WVerIeu+Y98LRDZu/+w8oHzB2huBNgCnIC1N6vncUzaLEHb2hlOuUKbMTD3sSmpCHjX6b8VD4GdqYAzw+9tNtiuXlNtKFVOQstBipmBrXrt3GlEb97gmX8FvF1NO3k2yKf7NSC7VqX+mkPiTWab74Y/QbmLrJeEPxDhdV8hVyV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=el+sBlYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZi6q2o4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCc5v2386476
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qJoJ9PikU/Esk34g9/pgAH
	GZSX+QHgCvc+W45LxFBK8=; b=el+sBlYGkLp50eTPMHcQqTXBBzGgBJRhteKZ+G
	hAYPhPQzyhktw/W13r55cfrG4DkwXOVyXCYXoNCW+6ZhM512/zBpcuEAZ1BHBXvU
	gbGCU0a/YRCcMmmjVwNkc6xPz5jlTyPmuScCCNKQapUeJZKQV2vFmLI//Sx5BjCV
	3TkK+8M08VvfhpASRi9xneUeFQTZ0M4lyMzYYVxIldJ1yuU1Jhu37Cl4KeVpkVGa
	wf6byhC/D0XjJZm1jjOOs5tWO7ln8g8ThidvUfD13SPYUS32IogsKHOLq3a0uB+I
	ocl9YT9ofkDN1FPZEBHzAZRBRK432od74sQwCDcfbnXsBc6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w12es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so64056325ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142829; x=1776747629; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJoJ9PikU/Esk34g9/pgAHGZSX+QHgCvc+W45LxFBK8=;
        b=MZi6q2o4gSSPmfcJCAqw3jzIbCqT4h+rvhnmaDRbbPor0IOHJyCWD2WNnvUWk812z2
         eDSw4IY9NruCSlGp6TbFWkc5IySeK5ITJcTr+JdcOn8H5pvF7RnLwf+6ahITE0hRTioK
         ghYQLgmYcQtQ25dXsLO5FdWyGymtd9vfWpW9hESACvM3XorL9j/8GDnh6zYONV71uERT
         dk46+WwpGuc5hQB4ikvlqVpJBrWOrTJfZWdgTA8udBM1KiqcwywjMA4/PQV0j+avm6Zl
         N5rwV4MG1eCzI8RzZc0jd1edUduTDuAOPXCWYC1hYsatFEurwojl33W7ZGisg7b5GTo/
         f/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142829; x=1776747629;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJoJ9PikU/Esk34g9/pgAHGZSX+QHgCvc+W45LxFBK8=;
        b=ahUq0ImT4uanc0PlM+Tiy0Rb4ovoqeFu0H4a6jNpcCUc3ffyFRZmRsvaJ7e1AXs8EL
         gWNqGFNkUn72bOarAvxVHODqMKJV+STPbXSdxiX40Z88ZKUM46wKFm2nNcQQTHygo1OR
         Dl2t/6NH/kS4AGyfOHxdj+C02FTSlyG9wQ/iDH2eCETeD2F9z7R089zfcpXPZ44+nNfJ
         NYg2oocjpZUjyoy2809ZcUceFrTLhwcT3EwX7c8TChFeNnEKN2cpurajsuX+GigzpKo3
         9ZRv5476agMfzUDkTupZZKIXTVRiK5OD2yPvlQHwBADOApsBnpbtplhVLEcVpPTdIv/u
         iOkg==
X-Gm-Message-State: AOJu0YwspJkefotdOBKdIVWcicRq0mEOgx/9eSmFdGmmNe/qQlRyRG6C
	4laN8gM6EELLTwwHNNrFdnG8vr/h2fowFSQ7pHZ1NE9dqj0HpcCRTX18vBMLojZAhkhfCkqn8oQ
	TtEcjzRnwogCnnZhWswV/klALUFStMeP/voGFZSZpfWKERyHG8zslx6dVeZX0LLF7Mg==
X-Gm-Gg: AeBDiesK8biHcoYbwNSza46V2MYBamtnvMvpF5EnsZ3kcEZpOmosdX9Ls732pX3kBlo
	/iaZ5pzpoOsttpOu81zIVvXH6QgOU2GwsxWwnH5IifPtdVBkDjaHlaG5H5gjQoMvYXHlL6GBoSd
	SCQq6bog3yDb3Ai9lx5YXYi85/tyTgaUONjBevwpF+UnkeS8IFTxy05rM4fIh7gU/a+GRfEw8qG
	MTVKHi5JZqvUKOuXsI4xUWFdHms4VihWlc9hnaimCwmCJ/FB6pXGLlimSyJN+8x2ifpyCWUpaV4
	T9/NSV7bfV+2DHaPiNpuLm9AlkY0/8EY04FwiuZTGq0pHGuyx0jTTcWo7CIt0hGU18O8rxxFGbx
	7uB0QbRM+PlJu/OsAx4aGnrVvIzGKOA0Qztv2yg+DX8lUPkmsnXix6XM=
X-Received: by 2002:a17:903:1aae:b0:2b2:4e1a:aff9 with SMTP id d9443c01a7336-2b2d5a95dc2mr162435325ad.44.1776142828756;
        Mon, 13 Apr 2026 22:00:28 -0700 (PDT)
X-Received: by 2002:a17:903:1aae:b0:2b2:4e1a:aff9 with SMTP id d9443c01a7336-2b2d5a95dc2mr162434725ad.44.1776142828010;
        Mon, 13 Apr 2026 22:00:28 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:27 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH 00/11] media: iris: Add support for glymur platform
Date: Tue, 14 Apr 2026 10:29:56 +0530
Message-Id: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMzJ3WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3fScytzSIl1DE4PEJPPkRANLQwMloOKCotS0zAqwQdGxtbUAwQB
 FklgAAAA=
X-Change-ID: 20260409-glymur-140ab7ca0910
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=18045;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=syjK+wfsZtO1kX5rCepgeoW4nSKRvZKEk0MXeCCU3h4=;
 b=q1rJNbHG2+iIJZlVgzWLj4NFsHJ49YkE1qKp8QPjO+Q9kq27VpHmJ43wE+OW3IpkclIalj5/4
 yLF2Rf9oruuC5CuYRwkPo0nt3EluyetcPLZZLsUtyVpseELdgi0BYd0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: udZR6ZfxgoFOaV1PpV6ahqbhSLBK1_y-
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69ddc9ed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apL-334RAAAA:8 a=e5mUnYsNAAAA:8
 a=mI4aUcGMY0OTypOOqssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=eWIHaOtA_ULHaMmHwLHW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfXxoxsTmko5Yt9
 se1/47hwEsYFM/spLBqFjVbkPCz8AgnpwB+xOx6a1oF+8rgTJnEnWZ2tbpLHgLxhoCWgz/ZffxZ
 zTZA6Y+1RJknSDkflvMfJa/073cdyvlsrXoC2gsQl913etHb1fBZ+KGqs2TM4+EhC+AmZa9gmmi
 eHAoIc5WoIYw9/ur8/zh5QrP4vgxFxECiPh1pC8SFIys4Zzvou52UQJoYYPnYt7VjekF1jy4W+t
 WQ+YA089Jz4kJUcwKJGpgqwJrSBFN0lV1XnTIJQ1AEeHavbiYP+r+bDhm3cOKjYxYIQba5956Cf
 BNdUuv8yWGHT/0fxoGjNytJ9s/vmtAVOrUW7hOAyFL/m/t4sYqlD4ZI/T+9nbuTEHz7vn2Bn6wS
 5LxOVIkgi8cd0HerxiuXwt9wwiVvM4d9rrNeZ73oYy91SeWnNXyy/MjCzgFtXLhemPUhz5QkNyZ
 hVv5/OO4b0b5ldbn0VA==
X-Proofpoint-GUID: udZR6ZfxgoFOaV1PpV6ahqbhSLBK1_y-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58692-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26C393F5904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Glymur is a new generation video codec that supports dual hardware cores
along with additional power domains and clocks.

This series adds platform specific support in the iris driver to handle
the extra cores, power domains, and clock requirements introduced by
glymur. add support for firmware loading through context bank firmware
device.

Patch[11] is dependent on the below patch.
https://lore.kernel.org/all/20260410-glymur_mmcc_dt_config_v2-v3-1-acce9d106e72@oss.qualcomm.com/

v4l2-compliance report for decoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.0.0
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

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.33.0-5441, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4310f15610f4 2026-01-18 22:09:17

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.0.0
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
        Standard Controls: 43 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

Fluster test report:

77/135 while testing JVT-AVC_V1 with 
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1

The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
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
This fails with software decoder as well. Refer the below link for the
discussion happened for earlier platform.
https://lore.kernel.org/all/63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca/
- RAP_A_docomo_6
This was discussed on bug report
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
Based on above discussion, the initial error frames need to be dropped in
the firmware or driver. Discussion ongoing with video firmware team on a
way to handle such case. This issue is not specific to this platform, and
its there on other platforms also.

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
This VP9 bitstream contains 20 superframes, and each superframe consists
of three subframes in the following order:
• 180p subframe
• 360p subframe
• 720p subframe
Each superframe is submitted to the driver and firmware as a single input
buffer, with one common timestamp attached to it. For every such input
buffer, the hardware decoder produces three corresponding output buffers,
one for each resolution (180p, 360p, and 720p), and all three output
buffers carry the same timestamp. When these output buffers are returned
to the client (GStreamer, in this case), the first buffer returned is
displayed, while the remaining two buffers are dropped due to having
identical timestamps. As a result, only one frame per superframe is
rendered. Here the expectation of the test result is with 720p, last
decoded frame in each super frame.
Discussion ongoing with firmware team and gst maintainer on how to handle
this case. This is not specific to glymur, and its there for the other
platforms also.

1 testcase failed due to unsupported stream.
- vp90-2-16-intra-only.webm

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Mukesh Ojha (1):
      media: iris: Enable Secure PAS support with IOMMU managed by Linux

Vikash Garodia (2):
      media: iris: Add iris vpu bus support and register it with iommu_buses
      media: iris: Add helper to create a context bank device on iris vpu bus

Vishnu Reddy (8):
      dt-bindings: media: qcom,glymur-iris: Add glymur video codec
      media: iris: Add context bank hooks for platform specific initialization
      media: iris: Fix VM count passed to firmware
      media: iris: Rename clock and power domain macros to use vcodec prefix
      media: iris: Add power sequence for Glymur
      media: iris: Add support to select core for dual core platforms
      media: iris: Add platform data for glymur
      arm64: dts: qcom: glymur: Add iris video node

 .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |   4 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 118 +++++++++++
 drivers/iommu/iommu.c                              |   4 +
 drivers/media/platform/qcom/iris/Makefile          |   5 +
 drivers/media/platform/qcom/iris/iris_common.c     |   7 +
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  71 ++++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  19 ++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |  25 ++-
 .../media/platform/qcom/iris/iris_platform_gen1.c  |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 +++++++++-
 .../platform/qcom/iris/iris_platform_glymur.c      |  93 +++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      |  17 ++
 .../platform/qcom/iris/iris_platform_sc7280.h      |  10 +-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  12 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  27 ++-
 drivers/media/platform/qcom/iris/iris_resources.c  |  33 ++++
 drivers/media/platform/qcom/iris/iris_resources.h  |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  68 +++++--
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 148 ++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  30 +--
 drivers/media/platform/qcom/iris/iris_vpu_bus.c    |  32 +++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  36 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |   7 +
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 include/linux/iris_vpu_bus.h                       |  13 ++
 31 files changed, 1039 insertions(+), 93 deletions(-)
---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260409-glymur-140ab7ca0910

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


