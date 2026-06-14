Return-Path: <linux-media+bounces-64799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2EAO2PPLmqs3QQAu9opvQ
	(envelope-from <linux-media+bounces-64799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:57:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA868173D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 17:57:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mj00RsYd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64799-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64799-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7522430071D8
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175F727AC45;
	Sun, 14 Jun 2026 15:56:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84B386453
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452575; cv=none; b=BCYa9Xi4CD+SY43V5i82R2EU+Bqu84K5MGOYsZ/P/waP6/COWBYhSc7aH0nb0/VYiKycOLQHB6PAKfkjNtbUyKqqN9vfJEaMp2a1HGAFRnN/mawqZiWH4YWtm5o4cVz4RzQLQMwtYL+e4gJJweT0UeuGhYL6GpButCA7jqv372U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452575; c=relaxed/simple;
	bh=tVPqm+88/MGsyYDFQSKa03GedhxJEBM5kC1842fbWvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCF8aT2d217YV0zsIfn5PzNArWJEFT9VmvS+o/PCqn8Lzv1zVW2w8QqdVSzqkmzpAs910+5pPYiLk5sVuMGVTlJ9BtBlZTs17Nro3kl8mb91TvG2m1jg/wFBeg/4k0vYMAAV5zoFgqhIbPTf8d6+SOPbzXXecKYFSn8AEJcsffA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mj00RsYd; arc=none smtp.client-ip=209.85.219.51
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8cceaa6f75bso41054006d6.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452573; x=1782057373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0kPJubfXi7k53ak7UhChAyiQgIHcIYyeOvCqkt9GAU=;
        b=mj00RsYde/S6UTT1SiVccJ++VH4dpnuADpeplD0VS4Qo0Q0EposmqQ+c5BcCFbIor6
         7vmrcA0lz61x+wTXiRjpxlw9s5w1A+XI5S35Dg+Y6NSZB3kRQaAJ8yk2wmJk20GVivtN
         7U75oBkOaV9nZYAgKRLE7sOyZ33E77iExurb6+o5R0tMP5+yQCDX21usI6hGICjJC8+m
         TIQJ2ORRf3CTigwR8T69oWDwRFlkHi82hF6JIUNN2gtBWW8gaAwSmHYDJ0clLm8Y9wSi
         p6157gWsUHZETYNB3EqYDmwXUjbn72I6p4bnVwav6BPQcQ+5GkTNSEsNO7rogVPc2vSV
         bY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452573; x=1782057373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0kPJubfXi7k53ak7UhChAyiQgIHcIYyeOvCqkt9GAU=;
        b=bKNPyujsH8HUVFdvEahpXJ5PsbUkIFPiYDqrdhDLywx+YlpAGCVXThXIZ/hkE1gNVk
         dX3wuTQHb0DX/ai43s33xnTVrixsDCZrK50Z+Qfrm9Q43kDLxlwI3+qDAkWullEPGEF9
         Dch55VoCQOttoI7Lcvlbc1GS/eOs5XdvtAFJZ5yfUubuPGf1TiZU7vM6e7PbGEF2nhDg
         900cdnVTHXMor3dXsz903X7+2nz94M88WwHFC9agtEsgsXSDVKE2Bn+oMqZNwB5IY9T6
         3kIOLSfv3F0pTBkmYVvnCNmVuizkbDVePLCW3/u0y4Gi8YkQiM1b6YR49GmI5wcH6vL6
         rDHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zDkxjTVyhTk6fiiNPUa7FJig/8GAeAjUhXVWEEZ3NLpyDSVAURd0EF96nWwmpcdH0vMHLy80SL+g9Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv2uJA9kMrxFGoPaiNWkeiL8CbLoUyAoEh+EawaQgnYComcu7u
	Zc3XBY/v1+qEOVIQ47NwkyyB3cKVAYghiMpaqk4KrCwvYnOOa6dxFaXc
X-Gm-Gg: Acq92OHvAj26ZyQBnqTsyldbBykjIwpFSFPm1nG0F2WTfFHRkc7eoJBJUThTRm9fzNV
	+Tl3i4S/pZqoHOn7X1Tp2i8w7LAl8BwNBWipQPGEaTdJxIWTHYy3uuUw+C0F7HHYFuXE57TWgM9
	CgnMN0dHg0E5fmNcm+5d1SSUCUXfwFw3fOcjN4ApM58hQt4eJf5lDl/LRdp9YGK3bFsOZn9eCm8
	FioZ5PVRo+6gNVYKE8U3olAQbRUWipo5nBXcki4/MzqnwD38Pq1jJI5i4Sy0rSH7tV0XUwQ5ova
	UgLqpW6vq/rHwAQXZoD01TKZUf46+am0vJhJLTrSGJ8g3CE6yiOjbhB3R7uiZtzeNZHoq4poaI9
	F+xtKPMscsg2HZQEWmfbYcf3pvT6Sv8qp1lZ+3dkVjDND+FojD4Lz/OJb73I7tce0hEXovcnsj6
	OBu0O13jtJwnUkd+jHZhrs7nWp5HNp/yfZgzeKUFgf2K3BShbVDwWS/PhHCkbRlzStjM9yrY24a
	jhVgpuLi92qMtGK8jvkl3x3q78KgMLMUjHvhw2ickE=
X-Received: by 2002:a05:6214:1c4a:b0:8ac:a6a5:1f41 with SMTP id 6a1803df08f44-8d44e97d5d1mr119072016d6.27.1781452573124;
        Sun, 14 Jun 2026 08:56:13 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:12 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
Subject: [PATCH v2 0/6] media: v4l2-ctrls: bound stateless HEVC/AV1 tile counts
Date: Sun, 14 Jun 2026 11:56:02 -0400
Message-ID: <20260614155609.3107600-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64799-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EFA868173D

The stateless HEVC and AV1 V4L2 controls carry tile counts that several SoC
decoder drivers consume as loop bounds when laying out fixed-size hardware
descriptor buffers, but std_validate_compound() does not bound them. A
process with access to a /dev/videoN stateless decoder (on a typical desktop
or SBC, the active-seat local user via the logind/udev uaccess ACL, no extra
capability) can set a HEVC PPS or AV1 frame control with a tile count far
beyond the array capacity the drivers assume, making them loop past their
fixed buffers.

Patch 1 caps the HEVC and AV1 tile counts to the uAPI array capacity in the
core. Patches 2-5 add matching bounds in the consuming driver loops (and
bound the driver-interpreted HEVC pic_parameter_set_id / AV1
context_update_tile_id indices the core does not reject). Patch 6 adds KUnit
tests for the core validation.

I did my best to reproduce these with the hardware I have, but apologies in
advance if I missed something because the soft repro.

Test matrix: patch 1 + patch 6 run the real std_validate_compound() under
KASAN on x86_64 (rejects out-of-range counts, in-range and the zeroed
default pass, stock and patched); all objects build clean W=1; the ARM SoC
decoders are not reachable on the x86 host, so the per-driver writes are not
reproduced here.

Changes since v1:
 - Patch 1: only reject AV1 tile_cols/tile_rows above the array capacity;
   do not reject a zero count. v1 also rejected tile_cols < 1, which made
   std_validate_compound() return -EINVAL for the zero-initialised AV1
   frame control that userspace and v4l2-compliance submit, regressing the
   visl compliance run (reported by the linux-media CI). The divide-by-zero
   that a zero tile_cols would cause is guarded where the divisor is used in
   the rockchip decoder (patch 4), so no functional protection is lost.
 - Patch 6: drop the "zero tile_cols is rejected" KUnit case (no longer the
   core's behaviour) and add a benign case asserting the zero-initialised
   AV1 frame still validates, plus a tile_rows upper-bound case.
 - No changes to patches 2-5.

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
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  22 ++-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   8 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  29 ++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 130 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  27 ++++
 9 files changed, 224 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.53.0


