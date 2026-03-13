Return-Path: <linux-media+bounces-55559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNPTMuCEs2msXQAAu9opvQ
	(envelope-from <linux-media+bounces-55559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:30:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DD27D1BC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 04:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E03E30C3DAD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 03:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7B734C134;
	Fri, 13 Mar 2026 03:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sq8zlFnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXS1x2OS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73A2D8379
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372628; cv=none; b=LjbGPl1IqnpB204HI9AesKx0yogrh4v53HbbK0osEoAYl2t+60ZUZrMSqASK91Fzdaxlx48/5KStL71FPCFFoW6GpPL3QgXJA875ADmgfO1Nz8enMci3526Dun+RJQr2VtIckZkmpqTJUozwY5KlC/CzFasbrC9EkTZuVmdq4Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372628; c=relaxed/simple;
	bh=wxHCruZ5q/LrW0AdT5hfnEYC5emblvGYZz8n/jBctAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IjBQNaNFySZajNvn8C7uifjVri32GzSpEPvCpgDPUQH/UtGfWv+bXjpb30d1RvUJu43fUqE2Wcs5cahH+83d/BOSat7Yn8K0lyk/dyVpTuJwazKCBKy82qwZ4MPEteDYvwx4xQlP8U1NnCD4asV15PZyMfFjOYJ/MSDfpnyPzRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sq8zlFnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXS1x2OS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHA0lt509773
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DbLHBJ79PvIPPVkmbGTlYA
	nYmeMnhuxrHhnzS51eQ8E=; b=Sq8zlFnz45NJlKUKGnxARa8XPZpN/e47wM6MWq
	w/keLkabZJicbV6Zi0lAdF4gYlT/8N606VWpWl9OSfuoGu1tjZwzTElnxuMWglGG
	QTt2MC5X1faYTM7tVJTBJF4HBiWc2F9k8e50LoJsa83gei2N/RyJdDrEk9Jm7ZWK
	0rimzCt4etZUCuth/1YL9eESHqkAPI/CC0oIYyr8Mh1r7wMhC/j77SmLgMGejJDG
	ABy7DutNFzAsBRVpJIOO78YySFsIJ5n/jhtzn6Qf2LZtOHo3mqhbsb8ibGoA+FqM
	N0WacxH/negGbkTiVRWsYGSogZvisvA/czjipOXFhOWkb2kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w316w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 03:30:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd767c51efso223587085a.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773372625; x=1773977425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbLHBJ79PvIPPVkmbGTlYAnYmeMnhuxrHhnzS51eQ8E=;
        b=dXS1x2OSUwo7fZ10E1P/UnpDnJCetwv702trvvC+4HdFaflznG+CvGX/Njdh6qdy9A
         ixt8X0z2CCtsAa41lessogxm0zsuWVE5GiOdnU6BE91wgYWuf76MB9EKXKi69p1jyfUm
         ApJYpKp4wuTe3cV4mKG283UUJNCBUkW2bndH7aj+iMZyLclx+gbN23SUeQdPGkyiUA90
         8oH8IXCdZxINoiYhUWlyUnyQALvlb534DKXZ5nWa9eN1VK4v7Pg4BfVcjRaQrCa55fcu
         2ksPpGk2c6jAUPFdliezT3WtqQ7dLGtNfhMZfheAmn0mTjPUWq4HBFcFxRWnvceL+zSD
         tBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773372625; x=1773977425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbLHBJ79PvIPPVkmbGTlYAnYmeMnhuxrHhnzS51eQ8E=;
        b=K2ZjSz0Sma43nlTpSF33k51nLL7VS0jfzBr8i3LdJV9Qrj1UGFF2ts7/A8mUHFz9DO
         7P6/c0Gz/4s9U2IUF/fYRPxexjDdUoYVqygUsoG8ppkIseoIqAFxlWmoKp6dbhCuynV6
         kvEXRXLrtJG7uu5vFlfbvv+TAYtNYq5gegWIK4hJ2Vhg4vTB6Geusa48WZCtx+KEOtn2
         U7HL9aadbdiF/aPESuNWlzi2KhBV/8FYnsnPP3LpgtFuHPVN1zSqyT+ANgOOroa7bfbf
         rsuUeie+qaBl71EWTaVnIqt6lJiaCsu3Sn96/odjIcN+3SvbiMX6BQY8LC6jN1l+k7Vi
         Sspw==
X-Gm-Message-State: AOJu0YzdIJ93km/ZKL/gIQWfpYwned9l9xULcHm81n/bmeCsPD4K/Zr1
	vMCgOCT+58NAr0AwQHS6wK+/jIWqewT5hsLO/u66/ll8xQSnWEp1T19Od1HIxsRVOfP5p1g8vje
	wPZZiUVSqv73NH/7ee6IGe3UAabk38luXVbrpwOHhs+CfOMGlldfZ19mKkHa5qKw9SA==
X-Gm-Gg: ATEYQzzUc4j2dwWCa9CHWKaQfMwdYds1SSGj9twAzk8+a4nONmhOZ1jh9TWKYF6PL/1
	Wlot2oO3VmSGjugwuhQem9nl4qHBbMHGhFcD2NJxgL6EZ0lrpR3tAluI2vy6nirvhmw5D0hrkq2
	yOyeymKi5IMpdYVsONLLG/WC0HbGzOe9YwqqiAfD+mXHvkLQjh4fUyoX8D8MjUaxQcoCWSdLBY3
	5JHk+ZNL8qqcmU0LEMgpgJ7d6MF2Wfzx4U/UG2SR0M4zicJV9qVTn3hwv3IZXi0au8KSLfDT7Zg
	8qt5I8NJPpzvkzttTc+ZcJo4RzuNfhMVDBb51sxFYdlMKu+v/UuMZtyK3rYSIlaENl2rcPRPOZY
	XUi7lkRKmVYm+Y+t4pQ/xwWOFA2ZznBOxoWwia2aYNUMRDDnFiG9kZyn+k46XVvHPSbpFno4f5L
	CUzIA5C1KNu96e7h6y43LPbeF+kHCAH2MP1MU=
X-Received: by 2002:a05:620a:4095:b0:8cd:ae40:acce with SMTP id af79cd13be357-8cdb5ba32damr259204085a.78.1773372625362;
        Thu, 12 Mar 2026 20:30:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:8cd:ae40:acce with SMTP id af79cd13be357-8cdb5ba32damr259201885a.78.1773372624823;
        Thu, 12 Mar 2026 20:30:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d93576sm11254901fa.11.2026.03.12.20.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:30:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] media: qcom: iris: rework platform data handling
Date: Fri, 13 Mar 2026 05:30:17 +0200
Message-Id: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqEs2kC/4WQzWrDMBCEX8XoXKX6tSWf+h6lB3m9agSxnUiyk
 xLy7lXsQgtN6WVhFuYbZq4kYQyYSFtdScQlpDCNRainisDeje9IQ180EUzUTIiGhhgSPR5c9lM
 caO+yo6DBMDSq564hxXiM6MNlhb6+bTriaS7svD1J5xJSmIYh5LYa8ZKfB5cyRvIztq1KqOacW
 7rgOKct2h/CkaZzyLCnvbZO+g5qp7p2Ub/dNeOcbb65OwNlta8VdJ3kDv8ySL4ZtsxShKbBCM2
 ot9KgsNgo27SLJvdq+5DyFD/W+Ra+dvtayjxaauGUURCgpZbWW2VeppR2p9kd7mPsylmpi/ifJ
 ArJgWeydhKMgj9I8pskOX9IkoXkS442oHqF/QPS7Xb7BNDu/uYqAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wxHCruZ5q/LrW0AdT5hfnEYC5emblvGYZz8n/jBctAk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBps4TLFz7k7lUrTDMeGZP3MbNXaGccWEhU9w8QU
 vr5EjUHJ5SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabOEywAKCRCLPIo+Aiko
 1UbtB/4rTmwCwTYX7mCvj3VeprPSk3hyx88LX3eDsxx9xFldoubmYrmARZAlo8sM5nfaQCA88Av
 Hkp02xYVyk0h/b6f4kIiZkkZdwaVyqTdZqUYCYWkkRBj0Jcsndk8A9aoYABlCbW2fexFTcRuxE0
 Pe6FeAD9b9g47qgAB1MarhJA/5DhxCKHeMIETwY4FS3GZDyQBsVObKT5pu6/Yu2XKWSOZ3779Tb
 j7oB82k40ODjWb58vGWPqW4juHfMOrfOGTGXo5/WzcDoCqSm4IJA/xgy1LQ4vxyO4ghDe8073d3
 aM69c86EllyCXOf5aHysqPCIlN7OQshiOyHXSLbUsooA2NFQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zW7iM7d1NjO8vmA3pflnpUMwWxjLm3wR
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b384d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ubImqinWzueDJ8YnIyYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX7xzipsb8NIlv
 8acVf9LkKeKVSlKZ6xJRHFSInoF7qwacU1OlNgqb87ATvwAHEj2K82zNGMyDYjMHfH4KjoMOT41
 Y3IpYKMFHWJwPJNu6OxcUq6UdHZ9B60uRRTC2jNWdi26CIieCrngq7kZSg2bvnCvOiu4CY4lNvE
 FW8clRS7s59gnKtc2KQzTCj1OOVXtrQ0VnElfS2LQGf9WASj8u+FsUvBZ5KDy2SZIPr9QNeJfV9
 ArBxZc0KHck//Eo2XP5fm/O31enCW6XEHd3aoersiJ3ttVIL3tVuL9d1l2Ga9TzJdvXccksQ1fT
 zD2wJQBOz6XH5vYJUOv5D1Vq7TqXTPkkzS2DRkNiWmMFmqtrCg4sAR3HcNMxM1wOGUkaNSBnGoO
 bntQzPernqtAVrCQbPGyRp6ymtw+bJJXwf9ot63mU55kp14hQUbGxihEU6fjkyly0fWNphCRkCQ
 lAayPI3yeeh8Iz3Bg2Q==
X-Proofpoint-ORIG-GUID: zW7iM7d1NjO8vmA3pflnpUMwWxjLm3wR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55559-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 310DD27D1BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v4:
- Renamed iris_hfi_gen1_ops instances and related functions to contain
  _sys_ (Dikshita)
- Link to v3: https://lore.kernel.org/r/20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com

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
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
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


