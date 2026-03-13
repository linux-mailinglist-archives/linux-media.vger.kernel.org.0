Return-Path: <linux-media+bounces-55777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG4BE9RvtGm2oAAAu9opvQ
	(envelope-from <linux-media+bounces-55777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:13:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E511C289943
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A184301F39A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F363E3C48;
	Fri, 13 Mar 2026 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnM/sS1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6f9IBU9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A913E1212
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773432778; cv=none; b=CHMVinq9di/jVZtdSJiI9onzZqYtWXrjblBAIA5zYPEo07lzl7Vnc+8CRtsmsMrY12dPiR9ZWktEQNVLoMCeVmSG5Ntr5DQ/V8A2CWLXsIjCbH6BWUgTZfsvZKe54XpK/AoBKV5coPVNiq0VpXeiF9saqIh+101O0tpnxzTb8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773432778; c=relaxed/simple;
	bh=e8SsnqStN+w6K0Ii2fABN7FkqZy2d/+9juw9iMD38hU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LxLLSMl1bwQDI/NCy8Pc9e+F5bjdud30dcECLvVBVB1YmWv4pnp65TVM9Mw4DHHnE8LuYJ4vOPSiw+ZP0k3zPueH2SsgPeyZXvhgRiry99gbduzti61v4psnbjWx+qPIpAQ29w3EmANn67Fm/6+1Vjyj79SCBZn3LkAo6sUEbds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnM/sS1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6f9IBU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DFXFZQ437728
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/UVyp1dlFlNTdlhuhB+gxM
	blyto3CIoI2HjnIEEDWcY=; b=YnM/sS1EhgOpcc3m6BtjEEgvzizRc2cVZUZWN4
	hP+KhaHKFWTnK4RI6tsSo+kgwaLyPnrnZ7LfW410Cv4sAt0mvBk3kGJlYjIluKSp
	7E+MqjB8L01oLcdPdcMeWuogPl701Ov/NlL73Yhw5/3v9SscR4HgGczK+/KyT5eY
	NulKxkysEav/UMOa7IqrBUSmBZc5V3R6MYwR09z/Dst9RurvQZWtk4eaU3L4TJ0b
	hhDfch1si0Kgjv9VfSK7D3mg4GWMYd8DyJvwgKpLZBI49S2eG5YhI4bhTTBDKY7r
	jZnZOWrjz3LO0fWYAHFxI3/bC0TAX3xDd4VY69+wx03s7AHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvnax90k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:12:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so1485604885a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773432775; x=1774037575; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UVyp1dlFlNTdlhuhB+gxMblyto3CIoI2HjnIEEDWcY=;
        b=H6f9IBU9OR3t8HwtAgAF1GC0QffbXz6Ffmwaja9qC4fwh+8k0U4rDxjVfZytrYnCf4
         S4tBIEgkOFpISrceZp3XBOR/Bz5MfH+B1bN1Z8yu1QFWW2Y7YT/iE8tjRunSnrIfMAIs
         hgysrPjE93AZGBN+PynzTBYkYxBgTGO8uSRyjKsIkAtf8ZktVLe4NQCmfdqsUenH1HbG
         9MKFSlQgXP8exScRN4+jijNidN/yqYGJX+qSidbI6mfrclYx7BHIH198e7y4fP+6rC40
         pta/VLflurhm/19e7CAtGYNzkVcVop2vYLBmZvgDYXpsC8yAtk0BxvZWgwWJCn5WAgup
         TLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773432775; x=1774037575;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UVyp1dlFlNTdlhuhB+gxMblyto3CIoI2HjnIEEDWcY=;
        b=oKbrwr0c3Mr31jfp8oE3HMSAnOCXZj7/whXoVESebQBDY4q96FQuZPi5FKs4w9/b9U
         uLqH+Nl0YyoHn/zbPAcnjmhDnJlmQ5ekz2SJl1nw5tMq4Uh4PO0+IVqjIxgKTqUJMu6b
         uSSwmfmWEeUIFTmksqID1vpd7aAnWHTxnepii6tU4C5Ugo6jk9AqjZnobQCi9WBBeTtZ
         pU2xYmGbxTnwBut5mvp+DSyMhSON5D+q95TLFb3OiIFyYCNGsZRS4eyaVy6dv9FLvNNJ
         V0f4q+hcN9mfcTEG9uwh6jWHel5AQtnS11+nog0gFn18UQVcCwJZxEflIFUPkbgB8tTy
         Tyew==
X-Gm-Message-State: AOJu0YwvQlyRFXST+u52aDOy6Y8clmu+23OY+f33yM8BCauMDBe3/RvN
	4M1ogvPdsj6EWgqQfz58Viml/3VAzCv4dXZkcvbgGvXArVoAmMR95diOxebJwU1Tk24u2/y+ZGK
	0koTUHtxJ5KZtL27EovXSUwC+uFj58KP7vnQgrJUnNMbADI2qbZFIFzWxxGZDuuGhSg==
X-Gm-Gg: ATEYQzw6C73vasH9h6+rGzqI7YliNWoqS+pJe+/HiMFAQSzxsxjwxrpgHdmPNjG7z8v
	4dlHTBNklmojJERv5zbSENAiz4x6IeBktM6P+48/OPvd3i8Qq83L1xiXqVMzVaczYMsP1L28dNZ
	H2Kl2qZph9Ek/3j87N4AkWJYQShDrjxThEgk7KqDP4MnbOJ47hZzYtyiDCqAN71Ebg1Ip/KB0Y4
	DnG0mSljlVwKh14dhQ6/5kZXqgST1Xpq+mOZdRuqqqkzO09gDqkNVkSjrSkAkMS779nR+Un4NIE
	Sr5Cblh6oDr7SPR83FvZzEoHwGcAEEzmc6Sq55EBnR8Zuze/ZAkRgU68fYXitZx7Ck6eLvp5Xp+
	FqwNNJx8HAQNmeyXER0HHjn9sjThjGsbJnGH2DhygFJdGRdYDAyq+VeLUDixPZFFU5G+lFzqJuo
	8KzZfetDKgG+JXQ/JZEbzGdzbQ9a3R11xFw9s=
X-Received: by 2002:a05:620a:1724:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cdb5bce7bcmr634961785a.71.1773432775001;
        Fri, 13 Mar 2026 13:12:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cdb5bce7bcmr634957885a.71.1773432774404;
        Fri, 13 Mar 2026 13:12:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm1681259e87.17.2026.03.13.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:12:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/8] media: qcom: iris: rework platform data handling
Date: Fri, 13 Mar 2026 22:12:48 +0200
Message-Id: <20260313-iris-platform-data-v6-0-1763bb837fd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFvtGkC/4XQ32rDIBQG8FcJXs/OP0ejudp7jF0Yo6vQJK2at
 KP03WeTwQpr2I1whO/3cc4VJReDS6iprii6OaQwDmWQLxWyezN8Ohy6MiNGmCSM1TjEkPDxYLI
 fY487kw22wiriFHTU1KgEj9H5cFnQ9491ju40FTuvn6g1yWE79n3ITTW4S37tTcouosfapiqlg
 lKq8eyGKa3V/hCOOJ1DtnvcCW24b6000DYz/E1LQilZc1N7tphIL8G2LafGbQU4XQNrZ1kEp14
 xQbDXXDmmXQ26bmaB7qvtQ8pj/FrON9Nlt59LqWeXmikm2DIruODaa1BvY0q702QO92PsyrOoM
 /tfYkUy1hMuDbcK7IbEfyVO6VOJF8mXHqEsdOC6DQkeJf5UgiJR0KzuPGgityTxvyTukiKgwHg
 o1hPpdrt9A6p2Rfi+AgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7230;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e8SsnqStN+w6K0Ii2fABN7FkqZy2d/+9juw9iMD38hU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptG/D0Q3p3pEQFOoUrWvOWhp4//1hWHM6Y0HRZ
 qwdVJ0c9tCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabRvwwAKCRCLPIo+Aiko
 1e7DB/0SJjp4ryd0vdwHNF7JSNC4QaLQCTAU23BYamdIpAEq4vMORrGj5MLg0DZ5W+E89Fd523l
 hUqki8r4VnvZEw3LbuxTHQ7j4g8cZMZ4lTX4NDgO/ANTlHFnJt0eGl4el2PCBi+Y68lvEI9UAiF
 MMEv5XgWpjy6MUAKfPQjxhMFZR6+tO3+CNexgC2ZkZHZcPwox38P+GrSfU9vYmeKgT5tbD/ucEl
 QWgmch4AtZ5nHeEEcZaPRmkJ0xstzhtaF1U1d587rCG51+cKdowVqNnnllh8CDuf5okff0j/tAz
 jdBdjDO32FGtAC5Su9igQEDBs9PSlcvGVQ/POpSVVHZ3sjrW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0St_StBaDNjoVcdgbz2uFdk9qKHzQB5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE2MSBTYWx0ZWRfX+QGWlwq53e/s
 TGsURqMAPlg7tKhMMrUm8SykkdlQCW8aIUdcnoNmtpYUlDPA9O1F3GzVmGCu7h+CVQKWJ368dUU
 NVlqkHk3BuZcZzMxGuz6HZA2yuSbT3gBJOA0YVgjGwt1ML9nkfUcTNs5KsHI1KBt2gH2Mag+Vfm
 BGmeo1nt2Hj6u5CDjutWIaKmrLB2394BX+q0BBTsuMBloHjB2vwrvwG5sK1aKKwIhU9KrJvfrZB
 kbK4U0U6b01wiOXBsyYqnFJkcQ4IgLpCDChG2rhG7zgR2sHEWAQoqI4TomsTJ66JLdmRF7g/bSG
 4XpkbuLJH8KisZx94U2b5kQdg+vEZ+VDZemg4B/OyhxgDAm15gjl+h9GvCPlYfIAWCchgGJhH32
 l5pm7hbdpOL+YDP+ICAr6ZW5XHvg19VCGzYEUboecvFmIiy79gC0L6wHzeEFcUqhyj0OpMPMadD
 CWOmroUGB29W3+RE+1Q==
X-Authority-Analysis: v=2.4 cv=X5Ff6WTe c=1 sm=1 tr=0 ts=69b46fc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HrKxlkJzL26_eGTrpt8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0St_StBaDNjoVcdgbz2uFdk9qKHzQB5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55777-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: E511C289943
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
Changes in v6:
- Moved get_vpu_buffer_size() back to iris_platform_data, it will be
  handled separately, when adding support for Gen2 on Kodiak (Dikshita)
- Renamed iris_platform_vpu3.c to iris_platform_vpu3x.c (Dikshita)
- Renamed generic VPU2 and VPU3x constants to stop referencing SM8250
  and SM8550 (Dikshita)
- Link to v5: https://lore.kernel.org/r/20260313-iris-platform-data-v5-0-180484af4490@oss.qualcomm.com

Changes in v5:
- Added missing kerneldoc for struct iris_core (Dikshita)
- Dropped two more unused defines, leftovers from the split
- Link to v4: https://lore.kernel.org/r/20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com

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
 drivers/media/platform/qcom/iris/iris_buffer.c     |  86 ++---
 drivers/media/platform/qcom/iris/iris_common.c     |   8 +-
 drivers/media/platform/qcom/iris/iris_core.h       |   8 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  54 +--
 drivers/media/platform/qcom/iris/iris_firmware.c   |  11 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |   6 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  13 +-
 .../iris/{iris_platform_gen1.c => iris_hfi_gen1.c} | 168 +--------
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |   6 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  41 +-
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |  11 +-
 .../iris/{iris_platform_gen2.c => iris_hfi_gen2.c} | 416 +--------------------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 115 +++---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  11 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |  93 +++--
 .../platform/qcom/iris/iris_platform_sm8250.h      |  29 ++
 .../platform/qcom/iris/iris_platform_sm8550.h      |  31 ++
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 126 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 214 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +-
 drivers/media/platform/qcom/iris/iris_vb2.c        |   2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   6 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   9 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 29 files changed, 682 insertions(+), 821 deletions(-)
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


