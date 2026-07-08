Return-Path: <linux-media+bounces-67001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bcw2AGVlTmqOLwIAu9opvQ
	(envelope-from <linux-media+bounces-67001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:57:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC208727AAB
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:57:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V5jyl+b1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=beXkZx0R;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67001-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67001-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31D5E306CFFE
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320D315FA81;
	Wed,  8 Jul 2026 14:33:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F313B776C
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:33:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521229; cv=none; b=emcQD6xNBvaq2PshNyorNgvfN2VC9TCqR4lY+IVofp0UsCm20l9BaLNwUzrga44vfLPhvmsX7hXofdI7Yf2MGH++mEdPn8x3HlSt2mE4GPMPEjnwvjihAMrU5kFooEQstYyDovDVaL0vkRVv1+1pXj/wytZ3w4mAKFMlyie2POQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521229; c=relaxed/simple;
	bh=tkvswx7Z2JZZARgYNRxSn4YuFR4kF2sRQSnJHr2zm3U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gDXgrQPa1KJU/x6zpAWBLwASEUOyaCjXbwrIch+DD17Oe7tYrEeuc2umCdgwnUuRNQK6z54uw7amfgReMoAUG4Htsp7GUxbQX284YtMdMBzlVLCxicdtaeg0dwQoOHXw1ACllYG/owVFeZ5MG/jjE17/d92PkELBOCTlm+ERlKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5jyl+b1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beXkZx0R; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3h2D2617718
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 14:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2DCqZxCTLgFjn6MXkdKNeI
	9wQOf7nR0/ZrJdMksdfnQ=; b=V5jyl+b1P/Q8kXDmKhDbsCedH1WJhC8XrLfl4Z
	VkfuPw5tstgfAawvlJNTiH2A1Ym0TGGIz+N8Vkee0KpgivG2QOb0gmSVdVNqwr5T
	UZSjKEgyGnRAkSPKoAbFJZAlZ22dLdhv1LrHziEICvLDBHG5S6/KzXQ4ULp9T4xl
	PeBpT2KdJAZ9tZm15pi13qXdLILH/zlHvBEOtICukORilVMXmJA/cAEXHEpLIr+t
	hUsuBl0aHO9FzrpNYRrMi9rtkoXFh1Adgt7iL9vTNAvkLwwpqMQrJlt2reil8Er9
	ddSThUqrJnArVwTvjxe8O6GytzjJMCt6ruJG+HPXK6cEBpqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwa16j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 14:33:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso14828271cf.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521224; x=1784126024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2DCqZxCTLgFjn6MXkdKNeI9wQOf7nR0/ZrJdMksdfnQ=;
        b=beXkZx0RZVMwLCZLu8qISnn2H8+UlpKGOub4uysa74uuMLM9iFX2iEIS8EcgQE1ild
         LNxSVQn5b52CwCum8B4yLruxv9Pss0SLwxBop0TyBBkisC5kZ80YIN54hkjlIclwge7H
         Zw8C77tyEMohph8xFG6/z+YnaCzoCd/uJRN2HK9Fx4IHCkkKlXR1uF1r1wV5T3PDgXRw
         sseumKdUyDsrT+TdfVf/VnN0dEo4ssU8zNHzkie447Wen0/I22kUr8TqojmQ+6zTwJI3
         3Tt8DSIAs8/BbAKnYvO1YZYviSNg51yn+wqP7IGO0HgXoL1NyNV8py3Hd9It8ahF1tTc
         EfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521224; x=1784126024;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2DCqZxCTLgFjn6MXkdKNeI9wQOf7nR0/ZrJdMksdfnQ=;
        b=eNgg2cvtbYdimVypoCPH2Yh96JT4fK0OF8jHnhQmzk36f9OFqcssU+7azVzVk5XloS
         kJH53coIPl0NSrTN3x22LBj2V2odCxaedyDookjGHkQf2dPTdzlVtOA6Z19eYlx/YldX
         SsxsnLxKwUgAPyfWrAIjlbteK+r0L0s2+U/vTCM9Ntvsd40WXzJ7kye8acNNh84dmZ0/
         3Sie3JWXBPxzweAy3/CVrlmKSJpGcpU7uKdzZSmsBfqiZdqMjBccsIxlmJp8ojRpfOdy
         Gexbe6FOCDqGZeUL1iahr01IWNYBD4HF2wqluO6guQwuU9Cs3hLIcoPy0+iJo91zJl7z
         7GAg==
X-Gm-Message-State: AOJu0Yz4IFZf9gbGf+mG0QISyP2JYjnyR2TktH1A7YupgqUAwhAyoikW
	N7t188lKr4NuLV+EgVF0W3ZWl53LVyIGiX5w/3sxdBZtDZ/KhXLVBZLc2rrzgvYSIsmHrfUahAR
	6cvBi2T+Zm0KlDCZSa03ZCvFKVfrqypd6WH39f2gA7Jwbd4yE/5hLOZW2W4s4+V1v8ZR+92TFzj
	uJ1Xg=
X-Gm-Gg: AfdE7cl0vyhWILJnnGvDgVeVXc/0MKgYDbtF+G9inO4LeGvG0jS2fHNVv5UONpIiEpH
	YJ1vqBXMeVX4pNtbcneYMMAZvjjQ61mzOFPz+FpfhRuvKkR618qectIKv5qvqHVCr9jM6L1L4XI
	a2UkyFsIwcSaAJ8UaXGwWSFFba+l/rLU+kAUaS2NHMdQA3AtQmePJUtBmwbT2oKR2iqc4ma9S2v
	nDUVYpRTWX8imaBya9VA5v3mUsvbI+f0TCZWTceOBM2Y0/NhuBb1DpBJO2VEH9jmzxC9UFoifqT
	kDRoRJGOLS8IRk1TRGLoKgvsTP+nWnc4xIgVdpjsyN2FZG+uXmo0qspevsmz8Ul0mN8UgtWExA2
	dSR55PJrGbexqyZpAFNEnQsybRxurH2Rr3YjkayfLAKcx1AFmTUHLbIWB857oGzOCDoyrEfkqK/
	xJ+ag=
X-Received: by 2002:ac8:5ac7:0:b0:51c:120a:91c1 with SMTP id d75a77b69052e-51c8b399024mr28605541cf.17.1783521224476;
        Wed, 08 Jul 2026 07:33:44 -0700 (PDT)
X-Received: by 2002:ac8:5ac7:0:b0:51c:120a:91c1 with SMTP id d75a77b69052e-51c8b399024mr28605071cf.17.1783521224064;
        Wed, 08 Jul 2026 07:33:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm8960807a12.17.2026.07.08.07.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: i2c: Add OmniVision OG0VA1B camera sensor
 driver
Date: Wed, 08 Jul 2026 22:33:30 +0800
Message-Id: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpfTmoC/22MzQ6CMBAGX4X0bMl2y5+efA/jYVsKNBGqrTYaw
 rtbuHDQyyaz+WZmFoy3JrBTNjNvog3WTQnkIWN6oKk33LaJGQJWUImGux4iCcXLUqlOalIKDEv
 ruzedfW+lyzXxYMPT+c8WjmL9/jai4MDblmqhVCMBjmcXQv540U27cczTYWsq4q7XgLuOSQeoR
 VGgJkL6oy/L8gWV32m25AAAAA==
X-Change-ID: 20260618-og0va1b-55bbf3cabb0e
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783521218; l=1778;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=tkvswx7Z2JZZARgYNRxSn4YuFR4kF2sRQSnJHr2zm3U=;
 b=XW+5ZTeyldk1uorWyhjwhEbt5Q7bS1zYfVCZastqMuqbkXgUxv2/A9yrJR45NbnyE5rNQlk10
 MYFVSGhNoQiAumR2fISofoQ0wh66LKFOwqlIn6F0a0EwQNCGoeDXxlc
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX2CqRZYW6UkEd
 4uBoBK2KgtDe7F5g360M6z094gkFING/bunV5S8AgD2CJhWOkZ7P019hvlrcysHiHk2xHgzidZ4
 ireJ1ste69ZfU1afhKBq2V31U6LUalNUwI2zxcqYVN/sdveEk3gIhWbd8rHl4bdNI3Gxbf+Vgf/
 2ViRforZzP1bj5aadq1aPQ0vJtJNPTxHVVQQqfrSDvA9+U34oVnG9VDKTb82teGO8l+ZPeLt4aM
 +hnkmPud0z6eUD2cBnCI7SL8r/yqbJBimqPJmMfsFL4iFfOus/iYxyszns7CFq+JhRgVOeV3pPF
 vvJdZjNnE3Lfw9hejQdejWkvFO2pluvIzHP08QOFyzGQipTKN7dQs3UJF//9TumkGyxM0M5JcCE
 5aH3xgdxjLSGPuMKSacdBNnzUxZGqUWn0u0YtjzWPdlIsGFJSxHw5T3E246mwedTn8Q0V9CSLhC
 i6zpq59gn3+GqMjQtnw==
X-Proofpoint-GUID: 6YzN9GcG32lQS4RGb0prjF2_MyQbOfWM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfXxSr+4KY4RSfl
 Q5T4xsWImv3ZtSZvJSepNOPFBgdJAC+5h39Mm5cR8BmwxNpsf9eJhga3lJnh109fXcc/Xo2FM9J
 41Y9aQTRtLegxXhisZrcTWxzhmLINOc=
X-Proofpoint-ORIG-GUID: 6YzN9GcG32lQS4RGb0prjF2_MyQbOfWM
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e5fc9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=heGITQUUmN4W7_K8Z5IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67001-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC208727AAB

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (3):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 375 ++++++++++++++++++---
 2 files changed, 344 insertions(+), 46 deletions(-)
---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


