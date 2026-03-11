Return-Path: <linux-media+bounces-55291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGHzBBT4sGkRpQIAu9opvQ
	(envelope-from <linux-media+bounces-55291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:05:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10A25C331
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28B231214E6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DE419DF6A;
	Wed, 11 Mar 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0xJz/Is";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcrOiqBi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E231F9A8
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205512; cv=none; b=Cwxos6/uEwkW3CSISHSQcbaFCSkUS9ssAwsR+abkJ0UaF1NCE68RxjtMVQHtX3lozNZrhvbeUNT/zh4pr3FEjrmO9UJGYEZLCA8GD9YBkMxSoR6rKo7GE+w6mQgz1TdaxZFjJL8ut+eZbdjMIBXbuoDgMg2laWP+yUUixu00hWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205512; c=relaxed/simple;
	bh=WLBYfBbL0PscObHTLm/32A4l5Dw99Vfb2rVx+JD2Q4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PT8RAhW20CcxIeNAlijx6jDtmKoDHeRKnqpIiAWY4RrNDs3PSA8cewl4lknkrToynapD6UICSipkznSWKCQ5pNsCAIIUp0kabrYK84IUd8l0w/rb9OrDCrQ26i2v1mqTrk5Oi9JX4CnBgQCLKxBoz9rj1W/oK5xUwniux1ULgXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0xJz/Is; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcrOiqBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJODUH3417778
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KMD0R97wgP/xtcKq5e63Hu
	Wsr2b0nJw2weUNmmftZvI=; b=f0xJz/IsrwkBhWC5aVSqd793lsubd3gEpygN52
	Eur1IYWYLhIULdfBLIs0rxbMWvlYvexPt79ys19d5HURJHkeBON3OhvTEMk2oEO5
	uK74foEizcKmMzlodHbM302bt1NzPvWfACfV5O1miuVl/Mk1eqFYGtEhT5d2dg2q
	4A9/KKGQP1MwoAYQBhDl/1VU+AJQdLklGzyefV6xSqyx6qrubyDNKjIBDw59Vm+U
	BgQ0+N3CkLOMdJuKjUMRoB7i8y25Nkk6gd4zb2Y7mV6bY8gq11iF+yJx7GhjUgAU
	Wo2pSjefatlpBl86U+oX801asRLorCKOa+dhbqge31OESimQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2bepe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so2075366985a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205507; x=1773810307; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KMD0R97wgP/xtcKq5e63HuWsr2b0nJw2weUNmmftZvI=;
        b=kcrOiqBiQZwCDfdk+ymqtCJgNCA7YL7xxkNyyno18sDYJEwYlAqr2pCrnwlMQyW8li
         KORnRsXcpr2LPnyRT/JQlWzSQwqDKyD+UpSHMX9PcD8F/QAd1CoCb/qhdRQehK7203sa
         nSpRhWLr6cJauDNuw6rqRTyyi9LYPXCyZfUJPtU4BRvHQunqS0Ba5qnKHeCD6904S/oj
         DEZzxtmQqWsuwAf6eWnbJfsT/C/C55Hz56Ym+HiwFrQ4cvUs67VtC4Px8GWE+1VdEr+D
         n/LxFAZ9DXi70WwfZ1jOSj/3tw2vuqtLkEc6/OCfIMtFVs/NI9y2efdbHBPGoZJ7juyx
         cDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205507; x=1773810307;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMD0R97wgP/xtcKq5e63HuWsr2b0nJw2weUNmmftZvI=;
        b=WXZY8E9PPILbfBHlGxjJELWaXHtYaaliumPSARrtrftqe/iQOszS8C5DdGFqlzDzOB
         AxQtsBZLW3UiGdRg/eUtM2/JRSbReT3FytOQP/ZV20CIZoCLWblIlqHnw/LEXdgNVId7
         +uuYc2Jh9njfo13b/afQHB6CYwA4bPLqFJTP4Cegqay7XiFjRxM14ZHuSczqUO1G7McO
         dkBWKKo5esj056YzbGfP/UgZBlyQvp8Nvc51FawMIWVMrTsnRRzovNMyWXDPGLZKQJNC
         4ZQi1Bofvm4U1KrXzIwmeUNRmLoT9q8oDTC4+LMnPvsQqV/aR1TAP7EErkcwke6HRbV+
         WFiQ==
X-Gm-Message-State: AOJu0Yww2hk4iJV5RMw1+V84AOHizKXs5V4f9nS0GstCVnZRC1/aiNyy
	byLbsuA6FqegF88uY8kheU9+L2aObbq9K7nWpJIFBYRTY/ccHvNzKjR8c63z6ykmXTviR1j17F8
	iepXuXEdyCHSACPonBd/xdfQxKBHxqPCkQ30AscpNEAXhx2d9uKmN54DzOFK/Obc5Uw==
X-Gm-Gg: ATEYQzyBBLVFBD0PKhFXQv44kJRuZd7MVCdrxCqA5hu79uD6m2t+8f2Myu4x3lRUF3k
	MCBY854S9GxTs/XKXUMjlx9kAlg/GlY+UZXPSFuVfoJdPH2Mj/LgVYFzZV5NaU1dpxtEf5YHKEt
	2xF1i0TBYb42P7C6NUPr9kwbqOCBO8m7WkuQLMxqJCBS4JUz2oeSQGroS0FEf00JAuZiqzkIJuA
	OxeYpWgJ1VTYUtMm7jENrb1u7MftPehfjGvOKPXgJBA/rxK8ZQ2JHaCzGINrpFgAST4LgP5A75g
	3maS6McTP5/dVSl17fHNthT8yxFZenYaYTfzmYqdN09LGr7hcxnaf3iZhLlWabO2ycLpEer1igd
	nJ+9I7Mn2TvjMStbFQ9y1uv7ogK3C1gW1Jh1MgoiEQ3Auzo02N4P90rxDq4xeZJkVXcj0oSQw9L
	8h60KAn3YZ0SxTo9kuCL8lHzH41aqaBeLJxio=
X-Received: by 2002:a05:620a:4153:b0:8cd:8884:2509 with SMTP id af79cd13be357-8cda1a5162bmr166018885a.55.1773205507441;
        Tue, 10 Mar 2026 22:05:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:8884:2509 with SMTP id af79cd13be357-8cda1a5162bmr166016185a.55.1773205506952;
        Tue, 10 Mar 2026 22:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635805bsm199240e87.65.2026.03.10.22.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:05:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] media: qcom: iris: rework platform data handling
Date: Wed, 11 Mar 2026 07:05:01 +0200
Message-Id: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP73sGkC/4WQzWrDMBCEX8Xo3E31a1s+5T1KD7K8agSxnUiyk
 hLy7lXsHgpN6WVhFuYbZm4kYvAYSVfdSMDso5+nIsRLRezBTB8IfiiacMprynkDPvgIp6NJbg4
 jDCYZsMq2FFs5MNOQYjwFdP66Qt/eNx3wvBR22p6kNxHBzuPoU1dNeE2vo4kJA/kZ21UlVDHGN
 GSclrhFu6M/Qbz4ZA8wKG2E621tZN9l+dtdU8bo5lv6iwVau1ravhfM4F8GwTbDllmKQBxbrig
 4LVrkGhupmy4r8qh28DHN4XOdL7O12/dS7bOlMgMKllsllNBOy3Y/x7g7L+b4GGNXzkrN/H8SL
 yRjHRW1EbaV9gnpfr9/AYt3gS7gAQAA
X-Change-ID: 20260227-iris-platform-data-c5c80e84d1a7
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WLBYfBbL0PscObHTLm/32A4l5Dw99Vfb2rVx+JD2Q4E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsPgAOZID3+cj/b2jCnfUk03IfuloVu227Il5X
 VgsEkOsNhKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabD4AAAKCRCLPIo+Aiko
 1YJjB/9S0urxMH2XznubL8P9t+ohVy0BlbjZRg8Au2eZr3GocuzED7yrNefBn7EaDHrmPFU/+0J
 38GiCaF3qO4D9Ba7fQDr1iCRdAvbAwl1iYUoSMCf+urOeleIvABb3nlOVJiQMHP+5GeyflmaYoZ
 0xJQgXXdgdom8BvOjLW+LNur9NC6H4L3EwNWZg7o6TcY+QXTTV8jPJtVc5LYfw/HqPMm/RyYAvX
 eAuJ2J6HHn0XO5oIXeppYbLCu5VNnnhWSnbsjxNi9i5ej+Fd7rLB4DimOUJgrd0lrnmAPEB73WX
 BQ54jaa1txbOX/ZzfeM7u0/DYXQw/NgNjUtY1brTIjnGZV/g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0f804 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ubImqinWzueDJ8YnIyYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jy1kVAi2RW0TeaJQeK0l4oPe29kq1Cn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfXzOG5YtCtxVKg
 c73T7Xl1OywoZ545uNcZOdALa7q2rmKpq3QlYUO223TghmSM6t5Wo+iQoKwCo8hp5i4HTl+jnif
 mWuZcYPdV9VyJbldiG51ngSCMXbRL5BcrJuCW0C04mAihMNDQEmu+0sEQGVt4X9ruZ1tizO7tyQ
 UiX+cEABc/yXzr1Kozjc0CRRP71A2WvQUs0OvdJhg0xfSH9oYZ17Xk75NqY9OdyU5aHpGxBqMsp
 9laIpuPl6AzvJ2TzFeKAKlzLG1Zu2Go1Ub3/VYLLyLLgUUMTPkO0QPzUvnQIfYOGDIqEevWGdob
 /ynidVMiKhJfeU1SfDaZhU3mZ8WFSz/R4zrW3E11rdlLj8QHeeiBVIwULLIXJXNHCbHybQTIQ35
 bW4o+sLfU6KePzAbzWxuRy5MDntcV8DBZ8p0l06wWl6BuIRNUDkzHeFG7loL6ejtO0xzaeFVFzJ
 6mR2i9bCLGV3CMuHZSA==
X-Proofpoint-GUID: jy1kVAi2RW0TeaJQeK0l4oPe29kq1Cn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110040
X-Rspamd-Queue-Id: 8B10A25C331
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55291-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
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
Changes in v3:
- Dropped the config_params / subscription_params patches for now,
  let's get more different platforms in first, determining the common
  base and the best way to handle the differences.
- Dropped set_preset_registers callback, call
  iris_vpu_set_preset_registers() directly (Dikshita)
- Renamed HFI ops to hfi_sys_ops and hfi_session_ops (Dikshita)
- Dropped (unused) hfi_response_ops from struct iris_core (Dikshita)
- Renamed hfi_response_handler and get_instance callbacks to follow
  other hfi_sys_ops callbacks.
- Link to v2: https://lore.kernel.org/r/20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com

Changes in v2:
- Fixed build error in the interim patch, the fix sneaked to the wrong
  patch in rebases.
- Link to v1: https://lore.kernel.org/r/20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      media: qcom: iris: drop pas_id from the iris_platform_data struct
      media: qcom: iris: use common set_preset_registers function
      media: qcom: iris: don't use function indirection in gen2-specific code
      media: qcom: iris: split HFI session ops from core ops
      media: qcom: iris: merge hfi_response_ops and hfi_command_ops
      media: qcom: iris: move get_instance to iris_hfi_sys_ops
      media: qcom: iris: split firmware_data from raw platform data
      media: qcom: iris: split platform data from firmware data

 drivers/media/platform/qcom/iris/Makefile          |   6 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  88 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 ++--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 166 +---------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  43 ++-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 357 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 ++++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  90 +++---
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 124 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3.c  | 210 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 678 insertions(+), 755 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
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
prerequisite-change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497:v5
prerequisite-patch-id: 6d85e3db422bc7f16246249288a17b92f6edbc09
prerequisite-patch-id: 579d712ec3f942ba0c362e242c71361c151092b5
prerequisite-patch-id: fa4629a3909fbae3917d8c067cce4f673ee857c0
prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
prerequisite-patch-id: 5b50917dcfef01db13af320cbd1cba15fd5fa16f
prerequisite-patch-id: 8948139735836adb9fbc51d93b969911dc5b38e8
prerequisite-patch-id: 7ec91bd0149f347c479c906e73cabaa28601ab3d
prerequisite-patch-id: c711522b63f640b7504767b3af7adc05a0b36cac
prerequisite-patch-id: 42b9cd5e0fd6fd99eae267c78b239333adff7637
prerequisite-patch-id: 11c487545e2462ff0a515d689863c3f7f25f9449

Best regards,
-- 
With best wishes
Dmitry


