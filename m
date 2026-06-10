Return-Path: <linux-media+bounces-64447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z8i8BEdtKWqxWgMAu9opvQ
	(envelope-from <linux-media+bounces-64447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:57:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CCD66A01F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:57:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MiZehJDV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a6upENw8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64447-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64447-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89A330A1B01
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9343E40DFDE;
	Wed, 10 Jun 2026 13:52:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9D40B379
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:52:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099525; cv=none; b=cRwbRAwxmolqQQ637P2iDW94zN4Jb/J2lGwtsharzvBswVKZNuUy6Od94rJMyim1BbEnPoMs9bSigdhMTh7X5QaVC67+w70aFG/cniVydoIIHA5TbuUDkG7XfDin8nNiQdjcVCY0CBZ82/7d1upVZKbY01i/sCTMDzJpJ3UwgnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099525; c=relaxed/simple;
	bh=pp9dgz0yukQUWlUt7ZRKpzaY/a7dCUbCaIYOS7V8cLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YMOirz6k7HgV/jkeeSnDVh/uFolRbzys6LqHbUQbtPFidOo7xYUYrhhEij582sBH9DFMgFstFsFWqi04mUAmFAyDASLvcyPwedcfjq2+b9FGVpHs/Ld7HluH9pT+APNR93cJ0a4Y7Y6atcUy6VhRzveZAmYFn8ESt6ow8af0Luw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiZehJDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6upENw8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBmVX1169773
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NlTmsn/m7zfSgLrH+2nGZ0
	l+g6bSyN54SiEufG8TQAA=; b=MiZehJDVariSxt4ZJ6FL1px1ExmB8qrs/r8d8z
	MGvt9SVGlLPyxp+dMuUJ9izquzhyw+nKLNK1+iibKnxQ+nG3LAbU7b44ybHEjkrA
	yvx3EExODDkQV1jmp9mRVsfXWS/QMr4Uz/sukNpszz90lB4go1jcn/cYwrfjWsE3
	K+jDndp0iaarsKZTYQ++i976pOd2sf0SXQL8GSE9g1dzOttkrNNOJgVI4YF9WR6z
	ppM/PQnUNcsZ8xOVTNXCSGm/OAzfuRrtXi48ylckMLut18WF3+6qJ5e6xBivwTyu
	X08fYWpopSm1FNnt4YKn6AOVFVnJMJvH5lJ/GOAFwIwDhMRw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s31u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 13:52:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a95e1250so2108616241.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099519; x=1781704319; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NlTmsn/m7zfSgLrH+2nGZ0l+g6bSyN54SiEufG8TQAA=;
        b=a6upENw80Cb9KKGkYy6xcEDOe1sm/cLLcCyoHhR/g887lQycli08ymMs1aVtbYUjpd
         pAhIc31TM0d/Hm52f4Bn3UdgRH0yL40dB06/FvTEqdOimPwZ/o8WY2JCQ3cswjLzcm5a
         Cs/40Ka8qsIi24Ob1b7JcCsCszabVp1SnAND4mgCTKiOaCugyQN5ESTnS9sXoWaSFvLH
         q1kAKOCg2CFNw7Y/BepB8mhal+OrY3+Q8qJkAUx8ZyYi6VmdYoAu27PzPxs+CLqwFg08
         9HL3oLz2VB//yZ7utML5NSE8lPglDOAd3U9QUK4RcIqXtwSkQSMFLEpq+t8cD3J0R4mI
         b5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099519; x=1781704319;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlTmsn/m7zfSgLrH+2nGZ0l+g6bSyN54SiEufG8TQAA=;
        b=piKyPX3JX0oTUJD+dMcOaScd03D1DR0/WpirNqZDiBR+MLqDqkclvnkII3Tgdekw4t
         i6NNPpMgIDFGxjhqkCVYPmaCtAe0r2X0wLWHbsq9b8H74gBRnKS0AmOWPbx1ABJ6uCsD
         ag4mB0MWkf/S663mLEPNvDFkKMoPvKxmGPtOuiPa9D6QZ38cQ5TMDVr0Ya2amwxg753p
         McbqvTbgjlnT+UQ0ZsJcNL7pX8g7x88e0NCuDldIwSFA/UtI3Xn3WDQy+PoQZOGjqWWz
         d5om/C3JxfyeZ5d9kI+WYCpoO1wwALRGg6eC33vpbQ8vzhmQ60XTeiQngSSIUZNfFXW/
         zkNA==
X-Gm-Message-State: AOJu0YzElZsfn2ekOQUIkye4jQ2zGHxV4nTiRB+tXPFSd0LghLg9TrIB
	km/HKrJ0s5SvI94M6FX+UaSvhsDT4WXpg5G/Ia58usFDIi77RxEnNjmMVRrMtnR+1GRvjvJz1I4
	9H47MSibaLElMU3aIy9hyahnFaxiO5bnueAqHflP780FVht7yHh9dNM4PSRQ09ic2+JpbzNd0PA
	==
X-Gm-Gg: Acq92OFzMGIISCcL6sSOF+3OlzyvWqymgwFSv5li80Kf+g4O4Yey9j0FzzZXv5SHOO/
	Q4d+xPSMMe7oUsCv43tVfj4GNY39khHGx5DiEK4FOAhc5PVaGz89QlClDPYIdloRe/zRGjsKrq1
	xoKnKAskJTVLx4MJtF+5m6k2s9TzfyEGXYpI+Sr2XdvSo9GRAGcZFWwIalJEBiAlMBgQShJgSb7
	0ZzPr9hCOTe0/oBlZ1TikEgV4gdWZ7n0dgsENUvu5sumeQS1AdSLXPoFPZnBKyoVxsJmjEwneMG
	umM7UW0coS5GGNygY2IkIMjZfwBm3ITb0WSuTfKPHxli/+lfbLBg3Wl3tCJH/YUXWFY0dcRZv3u
	8VHOWbncM1HAjV2+fSRsC8fumEXex/xvB+PLN17CosETwc5wBfGD7epoj2t/CCM3TJ+Sv/Oyhj7
	19SdBdF+gkIVjcknb9T140/qMhmk0PrqtRgisgdwkMKPpMig==
X-Received: by 2002:a05:6102:c91:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-6fefc8be762mr12288251137.23.1781099519313;
        Wed, 10 Jun 2026 06:51:59 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-6fefc8be762mr12288204137.23.1781099518554;
        Wed, 10 Jun 2026 06:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf674a7sm62760161fa.3.2026.06.10.06.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:51:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:51:56 +0300
Subject: [PATCH v7] media: iris: Add Gen2 firmware autodetect and fallback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260610-kodiak-gen2-support-v4-v7-1-bc3ef14edb89@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPtrKWoC/4XOQW7DIBAF0KtYrEsKBLDJKveouhjCkKDUxgFsp
 Yp89xJn0S6aVkJIHw1v/o1kTAEz2TU3knAOOcShhvalIYcTDEekwdVMBBOaSWHoOboAZ3rEQdA
 8jWNMhc6SQuuZUp4r8JbUz2NCH64r/Pb+yAkvU/XL45FYyEgPse9D2TUDXstrD7lgIvfxU8glp
 s+11izX+f8a1MMot5q1jm+9sd0+5ry5TPBxX7Kp1yrP6ltTXDzVVNXAdEZ3UmydkE80/UP7o5u
 umoGOWw+taZ35RVuW5QtF8CGvjgEAAA==
X-Change-ID: 20260429-kodiak-gen2-support-v4-a7f055f15afb
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=28895;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UegTPtgL8Mu4YPmcxouziWiwgEUhDxZkUUxw5dBkj+w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5Zm9l/2fTZpSbe++71ezqVzUWNpbOQETZ0CUbYwheJjX
 UuL7hl0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAisyey/zNf2D1Dxqs69J6I
 d3zLa8aN+kzW+7lf+f/hf3PggcemQyvZ1Axn7ihQfrbMx3Xlo4D3v9bG7JJ09n6qwFD6Yo1Fh/j
 laQuF5Sa0y2lWX6z8+yKv592L4tUpp3N+rWeTefDccKeq14s8Jc/OkK5WCYbUgE/X3DM0imsY1y
 iJTprZpbJkWVn0tBrZnd93T93P8KHswl/u5jWa6xelJjNrnZbWe/TFPaN5Y899ayXV3id2G+2Cj
 ybmPNUv/R3GI94z0ahqs9/Lq1eFCxV+3U1s5K2rKL4pfPrqIg72v7UvC1MqZ8c0eCmaPtxZYmzU
 /JNtdff3nHP8C455Mr0ofn+4W+LysrwUdx3TTPV3uvdFAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gRq6015_VgKpiL6ALIiwQpmdA9lCXwCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX/CaOaIGIqmDK
 pf+5gTuFHtzPAdzflEjPT94xw2aqUtPSvck9nC+FM1YxPUgUqKJyZm4mfR11jgi5xHfLQ1lWY5R
 PzIT8VJ5mncoB236j3UffA7yE5fY5aAMJpNAdVLXPLOkvs7WIZ/YwpyX9BX5p/ytJjlYIlSJQpE
 1S6+tR3iSRHFw07Jq247+x8+0cXomOIFjPKpxRwTfIutWrw7Hy4oq1FM9ndKJpyRbXu3+7AtlmS
 eIy7x6iIv2NX3AOxDIvAuphcmEgLxPQ+qksKA5cGe7m4GBXqb3Le6UON5U13tajQ/ZRpyY2mWn/
 xQkTmazXk6TBrtR4TPJ34TBUedfqAwlHJJsXOMK0wGc6HyNC9LhA0oKZ3mL3rtyT9baZpbt+84r
 cJFD0q0aa2Avm4oV67xQHgwq0WRCHRAjZ2m3YdxyUINV98/tfmdJighV7OTBbfUhig/tIL7kIjC
 Cbopjh4rnjJGaEs+igw==
X-Proofpoint-GUID: gRq6015_VgKpiL6ALIiwQpmdA9lCXwCI
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296c00 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=hmjWW6jIjcQxAEn7rd0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64447-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53CCD66A01F

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the driver detects the
firmware generation at runtime before authentication by inspecting
the firmware data. The firmware is classified as Gen2 if the
QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
---
Changes in v7:
- Rebased on -next, dropping applied patch (note, it depends on both
  -fixes and -next).
- Reworked the matching code, making sure we don't look past the end of
  the buffer (Bryan)
- Link to v6: https://patch.msgid.link/20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com

Changes in v6:
- Rebased on Bryan's tree, fixing dependencies
- Fixed a conflict in Hamoa support
- Link to v5: https://patch.msgid.link/20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com

Changes in v5:
- Inherited the series from Dikshita per her content
- Rebased on media tree, solving the conflict
- Made iris_vpu20_p1_gen2_s6_desc static, following the rest of data
- Dropped the patch "media: iris: Switch to hardware mode after firmware
  boot", it is a dependency of the series, but it is applied to the
  fixes branch.
- Link to v4: https://patch.msgid.link/20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com

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

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 119 ++++++++++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 6 files changed, 120 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..965384fdd339 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,20 +16,109 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	static const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	static const char *vfw = "vfw";
+	const size_t vfwlen = strlen(vfw);
+	static const char *vf = "video-firmware.";
+	const size_t vflen = strlen(vf);
+
+	for (size_t i = 0; i + mlen < size; i++) {
+		const char *found;
+
+		if (memcmp(data + i, marker, mlen))
+			continue;
+
+		found = data + i + mlen;
+		size -= i + mlen;
+
+		/* vfw => Gen2 */
+		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
+			return true;
+
+		if (size < vflen ||
+		    memcmp(found, vf, vflen))
+			return false;
+
+		found += vflen;
+		size -= vflen;
+
+		/*
+		 * video-firmware.1.x is Gen1.
+		 * video-firmware.2.x and video-firmware.10.x are Gen2.
+		 */
+		return size >= 2 &&
+			(*found >= '2' || (*found == '1' && found[1] != '.'));
+	}
+
+	return false;
+}
+
+static const struct firmware *iris_detect_firmware(struct iris_core *core,
+						   const char **fw_name)
+{
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	if (core->iris_platform_data->firmware_desc_gen2)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+	if (ret) {
+		*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = core->iris_firmware_desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+
+		return ret ? ERR_PTR(ret) : firmware;
+	}
+
+	ret = request_firmware(&firmware, *fw_name, core->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (has_both_gens &&
+	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	return firmware;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +126,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_detect_firmware(core, &fw_name);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
+
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -66,18 +157,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +184,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..55a4fa356985 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -289,11 +289,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..961dce2e6aa9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..74626b35d9cb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
  * - different num_vpp_pipe
  */
 const struct iris_platform_data x1p42100_data = {
-	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a2782..7fe31136df21 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..372408b894c1 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb

Best regards,
--  
With best wishes
Dmitry


