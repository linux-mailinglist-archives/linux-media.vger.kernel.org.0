Return-Path: <linux-media+bounces-64786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3e2aNjioLmqM1gQAu9opvQ
	(envelope-from <linux-media+bounces-64786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1D68116D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:10:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Q74uaNl4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64786-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64786-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4AE63001A4D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 13:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D7E3A4F58;
	Sun, 14 Jun 2026 13:10:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5939DBFC
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:10:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442609; cv=none; b=FWLbDd2qsI0fPa8iDS83JOQkvH/hSVmfZIL8tqWPnE7pX27Je7y7orVMKW3XuO79O3GIF03vZJfoFciGs5vZRjPcbovzGwEmMt07r7hcOLXBGjoxtVHKHAJpfBd7/CaCZIdZeNakiZwKoPSlJ+ydXbEkMW/PF9m+6QYXctCerqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442609; c=relaxed/simple;
	bh=ww3m6zmHNNiE/AdkpiZDuVVO/n5Rq3f4RU9rP/1BweQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2pP0WzQ8DMkn4nYw5CHQz26XvDXNY+f/85cDCEJpDeXd2rIlhjpfZqnsAcVTo4viU9IQ+RDXQ7k9eU0LFTKMb2OvFMcJlrZO7Aw/t42nKdRgUCNyhjF9rFA192buSwS/KbDwt/2CH9dPLEtXhgHwLdIa6gkzmmDMM8as64TsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q74uaNl4; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf7b7d188so30454126d6.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 06:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442607; x=1782047407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8QN1oqmeXkeOy6RyRuiD7b4Q+mpnATm3FAvEoUlIOM=;
        b=Q74uaNl4cajwK8UC8htuzAq3wLhue9iIuzSI+KeBl2F+bduTetCRb88AatgTi9J1XQ
         wNNvNTViPfkwMYXBOsx0iP2tRK45lxj07cUZNrDSLyXYcJ7u4GKO6wFcaI3o8ZbmAWPZ
         3czZ2bEfIl8+JH/AoWdbDG9Q/QEHrZUqseiMKn8cyOEVSGiIlrIDs2xAvqyxMztlvugl
         AMDLoe7sAnjxXsk+oWoE+nLsJXHtYaWUKLWndn4kNTcMpVvL9BmZCOTJAL0luEBbWAhK
         4b1G88cmxyIOCmWw8MdAOXiq+vvgoVDpJyorJGLNKBdpqdYsb+cPDYsVaQOKaOo/9jBx
         Rppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442607; x=1782047407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8QN1oqmeXkeOy6RyRuiD7b4Q+mpnATm3FAvEoUlIOM=;
        b=kWio49zoahmdgs5RVuvs6pSIO1UEFwuTcp0fJCsIPg7hZ69dtzpzaWo8OHi5unvwfu
         4csTQRNbu21YLVIq1nDW4Iv6NOUPPhvw3cIGwLraVi1CLS48KBNBhdXDngTYWarFCaVe
         vDtoKcuDtbqM7m00zFYA+b1huYdNjCaIvO3lqpthC58ukppXFOj1XDr3vdCo9DTMUgRn
         BQj5broF1sTLcpAo+gb4NXC1jav4v0jdH5veLc6XfxO7ss9zRvkxPYlwDFPYq/yKSorE
         S4ZrmFSwP1K/KcLfkBlZ/9c5zU11j5Tk64GZ9Ref8QdiPboYhc5lzuyY69mBmP0RsFXb
         2ZAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6+Ayrbl/aq3ZvIqNC8QNUDGFWkrzyu9uhf0BdyfQ/iB1pRNuDoqA7EbLTr9TQ+KBGehVYxJBfIu/U9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkw1Dor56ol/ELl1pf1CfxLcDVTY7IFUgFLUPMvx8HL9ewFfGV
	2brev/9XP1FfAmWbYlndQBke2vE6RI+0uXS87i5/LeZW9tqFvZbw/2k+
X-Gm-Gg: Acq92OEQVmhtxH4t30yfo3PwjzkMLINcXmgdjBI5/KDWD0hgb2Zw2vHIr5WMa485mBN
	iI3MEFgSKQu2CQNpQRwTCW2ifYaLLt6yytspEdZYVCsyIa/DBkNMXAvrmzna8F3t6joCIgd9PLE
	BfuwOi/03JCBrtbdLJ9N2XBRwpuDGKmJrKYBzJjYrzxeWLJMPEXrgxLJORZGnXwuTkldPlDkssv
	AqJi6DgGpUNNPdRO9J352mDkZPi4R6NhvH5ig4KZnQlPcXOQ2mmLuXRKE5Cjh/risLKK96QNU5i
	JlzESkYHD0Uj7IXEEXhDRrLMLEXoVsLkZ1K5uNuPJwXA0NemCJ0ARHgH1pqiZdQAfDaTrcz1zO7
	o0/a4tJFIPixkJksjhi0TimmoR92qhVRHXg3UGrp63EwovGLCW8VjyJuN9tCvptDRtfGirLwEHG
	nveHu6GMhm/xjen4rhKegS4ASumun01hYceqRcswU7Vj9ZXaHUbcF+G7H1VMqGNYWLDYKat2hsg
	r3+TPpjZY5cOooF31CUyIXLK4w9bKdaFFC1xPhn/0c=
X-Received: by 2002:a05:620a:2904:b0:915:9fba:878f with SMTP id af79cd13be357-9161bab4562mr1530615785a.5.1781442607439;
        Sun, 14 Jun 2026 06:10:07 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:06 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] media: v4l2-ctrls: bound stateless HEVC/AV1 tile counts
Date: Sun, 14 Jun 2026 09:09:57 -0400
Message-ID: <20260614131003.2524025-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64786-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:sebastian.fricke@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0E1D68116D

The stateless HEVC and AV1 V4L2 controls carry tile counts that several SoC
decoder drivers consume as loop bounds and divisors when laying out
fixed-size hardware descriptor buffers, but std_validate_compound() does not
bound them. A process with access to a /dev/videoN stateless decoder (on a
typical desktop or SBC, the active-seat local user via the logind/udev
uaccess ACL, no extra capability) can set a HEVC PPS or AV1 frame control
with a tile count far beyond the array capacity the drivers assume, making
them loop past their fixed buffers.

Patch 1 caps the HEVC and AV1 tile counts to the uAPI array capacity in the
core. Patches 2-5 add matching bounds in the consuming driver loops (and
bound the driver-interpreted HEVC pic_parameter_set_id / AV1
context_update_tile_id indices the core does not reject). Patch 6 adds
KUnit tests for the core validation.

I did my best to reproduce these with the hardware I have, but apologies
in advance if I missed something because the soft repro.

Test matrix: patch 1 + patch 6 run the real std_validate_compound() under
KASAN on x86_64 (rejects out-of-range counts, in-range pass, stock and
patched); all objects build clean W=1; the ARM SoC decoders are not
reachable on the x86 host, so the per-driver writes are not reproduced here.

Michael Bommarito (6):
  media: v4l2-ctrls: validate HEVC and AV1 tile counts
  media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
  media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer
    capacity
  media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard
    divisor
  media: mediatek: vcodec: bound AV1 tile-start copy to the array
    capacity
  media: v4l2-ctrls: add KUnit tests for compound control tile
    validation

 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |   5 +-
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  22 +++-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   8 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  29 +++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 119 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  27 ++++
 9 files changed, 213 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


