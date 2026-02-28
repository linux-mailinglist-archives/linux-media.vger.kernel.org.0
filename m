Return-Path: <linux-media+bounces-53838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOoZFTYJo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:26:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F701C3E6E
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9198305206A
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F85036D50C;
	Sat, 28 Feb 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jThoHKfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jh8ekdgE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0804657EF
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292396; cv=none; b=gtlDIGWi1F2L/PoFfJFOPEjNtYAnVbU+SYwlUk+Erx75fqb6Qmd3tE9+q8IRBf8FbNDv8wS1QHoUlQyOodrXmLRiRRMcLgp/HaunhmaM3rJ1E+1Z8wdToj/230U3JunxNTAzqKt5r/DJ5n37gC57igZmxn5YaC9kHAeHdwPqwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292396; c=relaxed/simple;
	bh=t6pNrNVU2f7MQrVHUbMbg5d+syqPrsol39H5I4t7HLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y7d2aN8oWjBHTemdIYxDYpUpSs6hN0ykIbMx6XrZcEJ/8Pt/KrTW5haxRIfSJDmzccTNlQsizXRxiiT/aP6ZZvTlsjUaKmDlNWV8zG6ge9cUrbpDItZjqJrESuthFCzjcyjvqb8luzx/xeC4Y71yRz4oh/kEFwQDfFsXfEAKBG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jThoHKfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jh8ekdgE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEO6HM2774543
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cgaelWnOW6UjfureQVcah6
	fnQanC7Qr6+L9X/oHDxX4=; b=jThoHKfRpBrHVE7drL8dUI2ac5jZttsc0TX7v1
	6Ewa56x6YHvGA67HAVXvwI6EHv4k4yJF7CLMKDkUq+IgBIGVReCKeBSlDDiX045y
	aa4ek04LQNyX8n7HwiLLo+OVFg7s0GFYcmtipTi1MZmSq8IvdFZJOcuQaGVkv3HA
	HXYvBQGjAzm2TUfkUpGm2FImT+VKflt6WG/QIJL6w7drHQvxoD+qTOWGN8foC5x/
	Jl3FYE/C09QWAVzFJnFEf6JgHoCTQYsq/Izl5c/HCmv+u3kyF/LyZSyzcLOvZKt4
	dpuSJruQIuwIYF1LVvMr1IGO77fMgYst6ZHjHJgrBRiH21Dg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq15t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so3078115285a.1
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292394; x=1772897194; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgaelWnOW6UjfureQVcah6fnQanC7Qr6+L9X/oHDxX4=;
        b=jh8ekdgEog3t0LHQLTugIN7HNraKWmafE4XzML/frPi6SRd9Ga0/3RovRcqWRgYW+f
         cFLeu4xDaderhxN/xb2AlKhShdfg1K4WYNaUqYCqiXsClTSBvwpsgcc6deWx6GCHb/dc
         sSwMG3512mreEvA6+PraB4KvmWwjP3acozYaQh4l5OLE6wmRDNR7fmdDN8Asi0ouTPdK
         kDIv4Nm3/d89cxKvk6Rc6C33o9IXjXCv/3qy0QSkJ6APJPwlyFyU0jrqFXokrAuoUyeH
         tBmj6/3+UR21ihyBN0jPAkB7Kwc2625O+PN0TCaGe57W1i+C3G7164234IEm3VMbase2
         bAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292394; x=1772897194;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgaelWnOW6UjfureQVcah6fnQanC7Qr6+L9X/oHDxX4=;
        b=Cw8Ywt6a5nQ9QgGKcldw7giVklRvwDUqMeYE7cqIZSRpuMXk/6jAp/2bx2uIDDnKDt
         51jGrULz+K6zxXcSF1IvynVkbom+XqCj49B0EzAyi7kYeEsUsrpzR5HU+fZwnjKRAOtv
         eUc3ylYQa8xTdTEb0n4r+FJj/WHMOSNFrn0c0a4yl5up8SFfdcPvp98UYq3VLgA2OZIN
         UZ4t/hjKgDmYw9yPYq82mwDBAJijnumwb9eOwlKyNIA/FVW7MtKkbw1Xuy+Kywypzyd0
         /N4iBdV5FIVrdJnSbL1vVUzuBspkdPy4QKx+gfVUW6zViLchrKLppl7JtFNwc1wXcaeN
         v6LA==
X-Gm-Message-State: AOJu0YyznOizZEov8o0FwHgG/AELOFvIVP2FjVJe1bvDwx7is+rh8w5D
	M9WBQYje/6HolPrvykRcrIofIDkJVCl1vImkIhjv/YiWjghaSv8Cep/ZTK9slRusxZdZebmwEiI
	+Tu6inJnnFSKlQkVoKqa2/c/LuxKskTRN/8Ub5LhPq7VfIDZK+KoVjeHl/dF9FztlRw==
X-Gm-Gg: ATEYQzxmT/Eebx6KW0Irf5GFGtvkW8SYbo9SzbFEULLKz49sxtF3MwPAa0wXnCNozhE
	vIPXsIQfJ4hMaC++rY9KQ6I5idYQQaTM8wX3OuXzNia5PUlPolciNAbqNUf4lLhVbc81s6ID39s
	liHcoErL+quJxgOzzhPYaSfkWlei41ZsTpyrX68uhbRkm6DWT8S/cLvlo58E+ihiWWuy2qIAS2z
	OEhWM4UqIQ5tyHS3NHDN1l4ld7C2WDP+Bq/UPMJZwXPfJPKfyVihHk0nYYAKn9bbQlW5lJBJPoa
	RogGuMDJOXqXSBHMJelxgi1aSB/RifuBHML5D1Efsnxq9B1QAQ+JZec4rc+EWXM4hRRWCobcRpG
	/dPVCITWYq4gva/E2HCgrX0inTpW/ocwp/t1idNoM3SSYG9Lx1NfmJQrHQDMQ3DXAwFi85nlBqn
	0yvH3wd2zSzaZmuOCeIaZZFmJfy71i4VKRTEY=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr1248394185a.37.1772292393612;
        Sat, 28 Feb 2026 07:26:33 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b49:bd5c with SMTP id af79cd13be357-8cbbf3fdf1bmr1248391185a.37.1772292393090;
        Sat, 28 Feb 2026 07:26:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/11] media: qcom: iris: rework platform data handling
Date: Sat, 28 Feb 2026 17:26:27 +0200
Message-Id: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMJo2kC/22QzW6DMBCEXwX53E1t8xPglPeoclibdbHEX2xDU
 kW8ewzkUKm9rDQrfbMz+2SenCXP6uTJHC3W23GIQn4kTLc4fBPYJmomuSy4lGewznqYOgxmdD0
 0GBB0rktOZdYIPLMITo6MfeymX9dDO7rN0TscS6bQE+ix722ok4Ee4bNHH8ix32djCi5zIUQFC
 w2zP06bzk7g7zboFpq8wtQoXWCm6iX7SxdcCH5ws7pr4IUpMq1UKpA2YEvXWh9G97N/YBF7vHf
 Z8r+yiwAOWuo8zdPKVFl5Gb0/3Wbstj6nONh1XdcXq6j+FlkBAAA=
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5153;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t6pNrNVU2f7MQrVHUbMbg5d+syqPrsol39H5I4t7HLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkmt/UstxUqX87hkAKI8JNyI3BIsFUx4WVrS
 UcIGTtcaHqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1Qa2B/4u8QzsM4lDcL5DGfpqQTe8rCt3TqGqa5wiL56BuXtpbqu4qh6RNbJgFlFqlCfnpms+ing
 YIv10YdXHHpkrk3Vovsal0/QYSd3jY++huWYF++wd/QD9/E6AoFgw2c9qtLiH+eI6VB7JeZ0GGa
 +kGgZ3Gq93X/lLyEc0NhYAjHjd+g1YVSUqMPAMPm1Ql6UFDNvlY5KzM0j17YEuEKHh4wmk2r3Ye
 pAy7u3uxUqZDbjhoP4yItYdio1CxA3hKJFf0+s20iwTH+arjcpq+dlQRmMDsoy+ooj+DOuhn5iP
 1S1kohUSnHFuB/lJL3sXI3UcSj0MQGy842YYHXYo1u9lmUl2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fFSvWfqhBV81yO8nqNPSurJAdSKt-cJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX0GYKZguLmPJh
 LIYPHikxfXkv+S4qPuI70i1sJqTJWFxeazwaqNu/Go9z0a01IWOECqRA3L/8FwarhFxUOaM7pkl
 Fici4GW4TLihxDYnilZ1NyFF4XxxVy4Eb1u+XNAfinWFk5k4/ytpz5novEMRfSH1YmhPMCR5ZgY
 1Tgl+0EjdUjGmFwQAMGUj6AAotU9TSN5S6U6nUteFz9KYxAvsLYmqnTQ+caRiTvA+uoQwrbCZxd
 AtCsMysuGUsVSn9ewn1IJYyEWSfknjTpDdw4YoBrdCEscs4EP1GmOLNoJcAhFEbDoakjTAtOtiY
 w3HnAG1IDCoG/dGovvHZisPZay90/Xcvdbjr54cm9rZjpRs3Uy5DYsaoCRkOcoJv6CaHFvTXbUR
 K4N+NHdfVQNGy9gqe52o56+9r4+Jnao6ri2Mkj30l8cu/wOhLeYyMXR9NA25eNJokzdOuCZoc2+
 jzV0TC15auFjeKrNlTw==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a3092a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q1VH8HUFWZtrj_NjifAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fFSvWfqhBV81yO8nqNPSurJAdSKt-cJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53838-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69F701C3E6E
X-Rspamd-Action: no action

Currently platform data for the iris devices contain a mixture of
hadware and software description. This seems to work in simple cases,
but as the driver matures, it leads to strange decisions.

For example, the recent series extending SC7280 support to be able to
use HFI Gen2 firmware ended up duplicating SC7280 data, using
SM8550-related structs even though the hardware hasn't changed.

Another example, SM8450 and SM8350 are also simiar cores (and similar to
the existing SM8250), however SM8450 will have to go to the same file as
VPU3 cores just because of the firmware interface.

Last, but not least, this leads to a lot of copy-paste duplicates
between platforms, having similar firmware interfaces. It damages
readability and complicates adding support for new platforms.

Rework Iris platform data, splitting it into hardware description
(definied by the GPU core) and HFI Gen-related firmware data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: extract common set_preset_registers function
      media: qcom: iris: handle HFI params directly
      media: qcom: iris: simplify HFI params handling
      media: qcom: iris: handle HFI subscription properties directly
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_ops
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++--
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 191 +-------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 133 ++----
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 531 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 301 ++++++++----
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  71 ++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 +++++
 .../media/platform/qcom/iris/iris_platform_vpu3.c  | 214 +++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   5 +
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 816 insertions(+), 1074 deletions(-)
---
base-commit: 779cae956c8316aebc1946ef86ca001f99658270
change-id: 20260227-iris-platform-data-c5c80e84d1a7
prerequisite-change-id: 20251119-venus-iris-flip-switch-d59a3fbc6a4b:v4
prerequisite-patch-id: 615a763749fdc0c4ee184478bc64120972d8c7a1
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-change-id: 20260110-iris-ubwc-06f64cbb31ae:v4
prerequisite-patch-id: 258496117b2e498200190910a37776be2ced6382
prerequisite-patch-id: 50f58e5d9c6cd2b520d17a7e7b2e657faa7d0847
prerequisite-patch-id: af2ff44a7b919da2ee06cc40893fbcd3f65d32f7
prerequisite-patch-id: f3a2b9ef97be3fa250ea0a6467b2d5a782315aa5
prerequisite-patch-id: 6bdd2119448e84aacbdc6a54d999d47fc69dac81
prerequisite-patch-id: 38cc9502c93c71324f1a11a1fd438374fc41ca84
prerequisite-patch-id: 059d1f35274246575ca4fa9b4ee33cd4801479d1
prerequisite-patch-id: 1cf4ea774a145cdba617eb8be5c1f7afe5817772
prerequisite-patch-id: 46375dcd0da4629e6031336351b9cf688691d7c5

Best regards,
-- 
With best wishes
Dmitry


