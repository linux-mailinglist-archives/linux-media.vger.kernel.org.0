Return-Path: <linux-media+bounces-61090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEeELmDLAWqgjwEAu9opvQ
	(envelope-from <linux-media+bounces-61090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:28:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7D50DB95
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7DA43024469
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C883806D3;
	Mon, 11 May 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTVM0mrY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXYEaZxR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215A37B028
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 12:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502083; cv=none; b=qHw68HwJ0oaE4hDpsfEzFDxumt+sS/qElF9v3uhJZvOl44CcJMEDg0aiS9y8FZFvgKbBZ/A4X2SjpHhBl3IedXyP6xgcnuiLyFpgV2flT1TzpHRi2X8S5shkj6/3NAMJemnyKnkS/w2IQ+5ZQJsFrFJ1+tNCcVizunH3RN63Utw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502083; c=relaxed/simple;
	bh=qkDBANbKABhf7npi0JxIaa96sPGJTiX929zehJYFhYE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=mEcwPoNJTrz2XdR4b4jNJdR1RUlCafD5//eRoTz6NlmnxHAlyl54wHS1FhT/uUri6k0kudsfA6x+aJW4xB/wTcEBE18MZy2HCaHTe6lj1VhJY7Ly9eZZtLOhTm8/jWPDaUYl0xS7w+bmmgSWEHCgqwN0N+Oh85VYSb6lW3eaKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTVM0mrY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXYEaZxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BBIcfC1345030
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 12:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4yN0RabSg9pB28q28gWtZM
	+q46ir+gBrSC7+NVnc6Ug=; b=GTVM0mrYTRs2pV68TPeU+GMhDScAFqkl1CsBPQ
	BWMW6EPFGTNmlA7nAMXjvsmKKlvBi+uX6XKJxtRrwyXl4yOv0aLfwlbY6m+Kanxy
	QGS1d4X6E0VM7Ni7jpj5XGq41LHLAz1x3+iBljJhUSfxkYpFghIZ7N31KANRsGtl
	LEvC8HDq3g57rZKVV5zdUbTcP+MsIsQPIvostBe/mxZkpoa4t0qyg7QKFnaZ8IL2
	dAVfjNWipd/gnM7306G8Slo9m3Gjp4A3c/FyqjkxaOMNGI9tahdDkwCFhDJq05jN
	87M0kpVeC+Y3NAZv0P9Y1GGGzX4haINk1rgxiw8SMZY31Y6A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3e4986cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 12:21:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so4759638241.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778502080; x=1779106880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yN0RabSg9pB28q28gWtZM+q46ir+gBrSC7+NVnc6Ug=;
        b=kXYEaZxR2noplKz5D9nrurzoJYLq1jud/7XKq1dklsck3eORoF4U/y1xWok/Sf89IG
         +G7o/PHFmjMeGkfeiahX5VS2AmdZnbx0c5bOLmAg+qVS4McN4VE+L0CN65n6meTUyfz2
         jfGLF4kPRZQvasVKqO9y//B6mzcPwe1YvUSYX43j4pA20PPuwYP0chVWFoxEQ74M88wm
         QTzow4VpakWhhV2LpFi1OTrws5MGt26BBeZM23E5Tzm0T5i6kK+15inHt5JKMPr9nO7k
         qyEzsCLOf/DAC2ZQ3LQs21jrHBh+YcslIk4eVLkYLTZIUupe6ECcAqj8RnrQaxFP29gA
         j6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502080; x=1779106880;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yN0RabSg9pB28q28gWtZM+q46ir+gBrSC7+NVnc6Ug=;
        b=Mv9FYG3bbcv3YMbO4CKHR4b4dJeM3bgWQ8kBZ96zJBhp/8hSNgTkaOo/qF2VuzEz2U
         HQZ5upNKI92kceFeKCR4wrcKVSDeL8h+Wp/+PttRGOGtEVO4wjS4JVUpdGjamJg4kHdK
         egVfcQHMIjYQRGgjvEAdp6socjIwIFcBBV9fYvCxdaiZGmWUSzJ1apd0FdrcktlLzCLc
         OetV3uPvI3e25EPdEkuTlbCHBYd2ReyrPlHBPZrWKRsQL8wNi0YkGEPju+v9bwvqMO5D
         d1dGLMAArewcv0O51N1oVa5jYwN7RKNelWj6WwMr0QfjZ8uM9YXw88lhxJCaNYCFRd1X
         yBSw==
X-Forwarded-Encrypted: i=1; AFNElJ/RULMTy/JaHlP69NX++v2+/yD9npMzqoYkvHPjL5WAqDguqckwAGSO5MkbfkC6Teqp2oCZ3r/2whyopQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yGbZj/abdXXob5vSDPqNymP8WNUigftBmWXxPnT1KAXD6sYe
	EvYQY6oZHlVnZ/q8XIoYQOiBczOY10hxWP87inzyIKA6nu7njgcKLUPOdGCmUmU+L8OWL12FBdv
	+BjNdDTxcHqGLPmPP2jHUxYKgMxrjs9mdRHuaoDCobaE1GVExSYuHHZOSuNuOgGD5pA==
X-Gm-Gg: Acq92OGidQpnpYj7aHoPMWioLStQ7lz47+2urkC1pVN2+6qdQSA5q8NndLbAjvtiHdq
	fzMw902PmNRbf95a+QknAziJcwj3+j14E3BN7xDTMbLkspQ7CDERB0wEfH7m5p/ed4I/Y9b384L
	r2ZQ2wCPc7lVXEtbEEtGiVbCYw+XFbjhmUHEiaFQvyXY0JY7TIwF+FIZTQ2/WJYHfeOvl+5CBI1
	vD9aZIb9EeZy+nl4nPxSL12J8AWTXrd/UpBL4xvH+6qdU/rMXtBzzJ8/RcRD1jxS0+SdyffMWNU
	se0y9t4mjg0rMKWbiodckJ68hnyhbq3hyyfFBQ4IQ7sOH4ARd55/GMOdPCj9nzAGJ2nCySgRVs+
	DnCHSwx5S75uc/g2+se2EmQ10owUHqfbqdb3PhNp6d0xdReQwQCoVkVWue+2zjNFN5yMSBuoc26
	NEMHt2yi9kJneVzv89dYnt6Mie67RPb2/3XbAFRhYiB2Eo6ROrJeoWjcqrMr1WBUt8VdplxlR9L
	LcWG4di2jsoqFPF
X-Received: by 2002:a05:6102:3e10:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-630f8c42570mr10949942137.0.1778502079901;
        Mon, 11 May 2026 05:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:3e10:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-630f8c42570mr10949935137.0.1778502079531;
        Mon, 11 May 2026 05:21:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfa048c9e9sm164540366b.50.2026.05.11.05.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:21:18 -0700 (PDT)
Message-ID: <f39677f7-6d51-42eb-b96c-4111c5e12a59@oss.qualcomm.com>
Date: Mon, 11 May 2026 14:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [GIT PULL for 7.2] uvcvideo changes
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R1GbYanzrtqJyAb3J78XNz5XSJ4TLUbp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzNyBTYWx0ZWRfX1Cqugcb/dvZl
 wDtyc3OAumsXzzVITd4r/dPk4Gn3hMfvILb11ODzAmJ5obDOj72KdCmgnyU92vKTCDWZwgfxWHo
 vMuvWhtlIpghYMI7DNKlCErq5aNmhH0CHTM41QJvpaNtoRaUn9SsAHzSuxCuToyDWlNlsulC1JL
 rb8d2nfYMHtiSl4pQdwNIGZthT4dYLX4Vp8B9WsvnF4/SUlPUXKX0LTshrxURgBzMxPk1Q7orE9
 N34S1U+W/AHNfXXIHTaeHMVYg3ibf+/qCR6iuoqTBrWQOMH37qboikpPq8UwNk5OpP6uhBnoQ37
 CCbqfyDG79GxsopsjN0uwGTe5St0ro0b8AKTRU6OPEtqg9eBgA35Crm1spem7uYsfpL2B+PYUtK
 YslIFd282GsCCbyusW0ywmGzgNDYWiRGTl1rZAJYDmMzQpWHbpWaVhKwH3hlGwq7CuVsvsGeGgc
 Oy/n+mEItNZY4VaPPvw==
X-Proofpoint-ORIG-GUID: R1GbYanzrtqJyAb3J78XNz5XSJ4TLUbp
X-Authority-Analysis: v=2.4 cv=Yr0/gYYX c=1 sm=1 tr=0 ts=6a01c9c0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=_1BZMC1c5xGN5uulgYUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110137
X-Rspamd-Queue-Id: 26E7D50DB95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61090-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Hans, Mauro,

The following changes since commit bc1ba628e37c93cf2abeb2c79716f49087f8a024:

  media: v4l2-subdev: Allow accessing routes with STREAMS client capability (2026-05-07 13:23:50 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20260511

for you to fetch changes up to 0f20f81dfe4f0358eccd584ad21f967a4f9a5083:

  media: uvcvideo: Introduce allow_privacy_override module parameter (2026-05-11 10:58:24 +0200)

----------------------------------------------------------------
Improvements to the uvcvideo driver:

- Fix frame-sequence-numbers / SOF detection in some corner cases
- Add support for Logitech custom focus, tilt and pan controls without
  needing to use userspace control mapping (without uvcdynctrl)
- Disallow userspace to override the privacy LED on Logitech cameras

----------------------------------------------------------------
Ricardo Ribalda (5):
      media: uvcvideo: Fix sequence number when no EOF
      media: uvcvideo: Fix buffer sequence in frame gaps
      media: uvcvideo: Import standard controls from uvcdynctrl
      media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
      media: uvcvideo: Introduce allow_privacy_override module parameter

 .../userspace-api/media/drivers/uvcvideo.rst       |   2 +
 drivers/media/usb/uvc/uvc_ctrl.c                   | 212 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c                 |   4 +
 drivers/media/usb/uvc/uvc_v4l2.c                   |  11 ++
 drivers/media/usb/uvc/uvc_video.c                  | 109 ++++++-----
 drivers/media/usb/uvc/uvcvideo.h                   |   2 +
 include/linux/usb/uvc.h                            |  10 +
 7 files changed, 301 insertions(+), 49 deletions(-)

Regards,

Hans


