Return-Path: <linux-media+bounces-65071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eMyGETYEMmoRtwUAu9opvQ
	(envelope-from <linux-media+bounces-65071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:19:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC53696148
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EQaXu2sF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65071-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65071-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B19730422DE
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8982EEE9D;
	Wed, 17 Jun 2026 02:19:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25D2882CD
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662768; cv=none; b=G9rmGOeaHgXKJHfePihGUhbFyQ3s0qtOl6jyIQjN3LPmLuSGgEbThuFE5Sgtz3b/31Rp90WUaJjl4pQ5QoZ25P1Aa/9wWi2ouk0GQEYC6IZSWZuIb3gTfz1Hm/v99KV63sKdOfgo4CvEPRov6bVTYYRvW3bBjgloRHsteKrwjfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662768; c=relaxed/simple;
	bh=UI3cL5ENEGPS0hdo43fO33DH88kzk6rZZp7HX0r/Nqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHGXxrLJafx6kgoFdLstNOBt9t5ROkQhlkgtHpI1rjocUklul03xj9ccXadpGgGe4uC7RfhZRo0OxzjRlMMuhP38RjqpKrDNTX3++Kcdko9BJuz9jU8Zs8kXhkiwdTNhYTk0wtI2nh6XfZUnKcpFfQ+4AjcT9F/+CnP2lo8GvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQaXu2sF; arc=none smtp.client-ip=209.85.222.175
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91562bf6c12so615673585a.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662766; x=1782267566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xIfiVseohRJOgI8N6Y+Kj1p4rISAysOPz5TsHQvMuzs=;
        b=EQaXu2sFzHQbZQZpo3a163xE1Ao3+/8t9cB3YEJ42raJUom1luSX43MxhnTqeQwUK6
         W/5BM871X/+UAq7mcJkNTCv2DKJI33brfDPA7kLZbCYjTNMhpc/yidicJdnNNauKIG4M
         8gjGzOuaeoGcx3jBXMMGvhBsOrLrqMBwURuespSXjOngAypKTL/UUWwjw0WIfeHkWn0Z
         7j6EIk8CU2YR52GM/hEUPTFeYZCvFAHqQEr2wOgkhRVcYwur5EbUcfQ9mX6LuTFRngO7
         O6G9yWp4tl0JmUugWML+F6rC4yDO04NTvywYuecpDRhVDMNjrcrL231kENTWZt1W3xip
         6Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662766; x=1782267566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIfiVseohRJOgI8N6Y+Kj1p4rISAysOPz5TsHQvMuzs=;
        b=oF1xB2W02O2AduXpW/mc66CCUrwl73l3WycPvnIarD1dp5DTfe7+KqWyjqSwIVmcpo
         BYVUJJfFZG1LgHmABxhyb6u8SvdfyDM91ZXTD9RgBRND97nLTnqpZMpn2MSXxu7Sb57O
         4KB26DGNQ3RS/CI9j0pdxNg2AlBZ67pcc0p9P87xy9ZrqmxDAxFPwJGFNEvutVdLdiC2
         FwijgmM78URrYnimFXOYdUPQQzh8Qtel/LGJVic4mV3RI+IPfKIdbCiS/bJdfHIzLM8Y
         +8sjHNGWZ6GfPsTVe3xvTnBUwMl5r0tTH0XaHokS0a+OBKhd3N3aXbSrxoM+5bhamJia
         QDnA==
X-Forwarded-Encrypted: i=1; AFNElJ9Gs5z6ixNRq7LWdFMp2j7QOTNJ/RuolDHvDM3PqR4GxzT0mgK0lTRop8u78owuuaSEhHQNM86lhO18gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRPhULQFt2nbkZNti+M2Yul7os1zdqbUYMQeyTNJOm4c1xsvyc
	hejJgEBvK6xXos8ni5qIQdzNdbJeY/vugPImKlOm54GeunpmvqgkT0kv
X-Gm-Gg: Acq92OEjniXvas9taKg65hO4BZ8boP/veryopmQtg9wzPHDlvbLkgPC8MjAozr+w3FR
	G0Ns/LEkMuun4TozUUqAt9bboGDyRGkg6/Pfq/F0ev/SvwcBlha/TIZLzYCllxYR7v6n38Aj1SD
	6xu1lwhuOaeMNkZjr5uzeX/ISXC8cLo6gYFixWKK+PfE2n6W+oM7Nk1wkLcpFOgeHtuqDqmfzjY
	lp/l6PZEimn0GcBpW2rQPw+Ph1/kNucDiCWBpw2WFXlWcoknOQUj5ItaZvYkjhbpTDfeugiAdVT
	6WM2XEO50xdrCXg7Uov3GGvRzLeh4ripXwrOJaHWq890rnrCl0AqbMDNxNwJnbrOMxcTbSYl3Ip
	zh/FknxjGo52deTXkAoRxqEjLAMSAGXLPEZGy55mIgNmMYaA/aX5GvQbOYDgUGnOBsjTHNuQysf
	dt1jJBfWsbLUN+ThcUf4Ehhza4Oti+4ywtK+ITziwVG+HeJ/YbIUK3J05OVXp2AIG0r2T2w8SCN
	6mykrE+Tg3F1t7yBaLt+k//rCxzPgjwbH4/ZJDMSmk=
X-Received: by 2002:a05:620a:44d2:b0:915:b9f6:718c with SMTP id af79cd13be357-91dbb94528bmr273219585a.28.1781662765542;
        Tue, 16 Jun 2026 19:19:25 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:25 -0700 (PDT)
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
Subject: [PATCH v3 0/9] media: bound stateless HEVC/AV1 tile counts
Date: Tue, 16 Jun 2026 22:18:57 -0400
Message-ID: <20260617021906.2746743-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65071-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,spdxcheck.py:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEC53696148

The stateless HEVC and AV1 controls carry tile counts that several SoC
decoder drivers consume as loop bounds and array indices when laying out
fixed-size hardware descriptor buffers. std_validate_compound() does not
bound them, so a crafted HEVC PPS or AV1 frame control can drive
out-of-bounds writes and an AV1 divide-by-zero in the rkvdec, hantro,
rockchip and mediatek decoders.

  1-2  reject out-of-range HEVC and AV1 tile counts in
       std_validate_compound() (one patch per codec). For AV1 the per-
       dimension bound is V4L2_AV1_MAX_TILE_{COLS,ROWS} and the total is
       V4L2_AV1_MAX_TILE_COUNT.
  3    add <media/v4l2-hevc.h> with bounded tile-count helpers.
  4-5  use the helpers in rkvdec and hantro instead of open-coding the
       clamp; rkvdec also bails before indexing the hardware
       parameter-set table with an out-of-range HEVC PPS id.
  6    guard the rockchip VPU981 AV1 divisor against tile_cols == 0 and
       keep the descriptor writes inside the AV1_MAX_TILES buffer.
  7    reject a rockchip AV1 frame whose tile_cols * tile_rows exceeds the
       submitted tile group entry count or the AV1_MAX_TILES descriptor
       capacity, which set_tile_info() would otherwise read past or leave
       under-described while programming the larger geometry.
  8    bound the mediatek AV1 tile-start copy.
  9    KUnit coverage for the tile-count validation.

Changes since v2:
  - Split the combined HEVC+AV1 validation into one patch per codec, each
    with a single Fixes tag (Benjamin Gaignard).
  - Move the AV1 total-tile bound into validate_av1_tile_info() using the
    uAPI V4L2_AV1_MAX_TILE_COUNT, instead of clamping tile_cols/tile_rows
    in the rockchip driver, which would have corrupted the values written
    to the hardware registers (Benjamin Gaignard's NACK on v2 4/6).
  - Add <media/v4l2-hevc.h> with shared bounded tile-count helpers so
    rkvdec and hantro no longer duplicate the clamp (Benjamin Gaignard).
  - New patch 7: reject a rockchip AV1 frame that claims more tiles than
    the submitted tile group entry array holds (set_tile_info() indexes
    it by tile_cols * tile_rows) or more than AV1_MAX_TILES (the hardware
    descriptor buffer), which would otherwise leave the hardware
    programmed for more tiles than the buffer describes. mediatek already
    guards the entry count; rockchip now guards both.

checkpatch --strict: 0 errors on all nine. Patches 3 and 9 each carry one
"added file ... does MAINTAINERS need updating?" warning for the new
<media/v4l2-hevc.h> and the KUnit test file; both already fall under the
existing include/media/ and drivers/media/v4l2-core/ MAINTAINERS entries,
so no MAINTAINERS change is needed. (checkpatch's SPDX sub-check did not
run in my environment -- spdxcheck.py needs python3-ply -- but the SPDX
headers are present on both new files.)

The tile-count validation is exercised with KUnit (patch 9): in-range
HEVC/AV1 counts pass, out-of-range per-dimension counts and an AV1 grid
whose product exceeds V4L2_AV1_MAX_TILE_COUNT are rejected, and the
zero-initialised AV1 frame control that v4l2-compliance and existing
userspace submit still passes.

v2: https://lore.kernel.org/all/20260614155609.3107600-1-michael.bommarito@gmail.com/

Michael Bommarito (9):
  media: v4l2-ctrls: validate HEVC tile counts
  media: v4l2-ctrls: validate AV1 tile counts
  media: hevc: add bounded tile-count helpers
  media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
  media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer
    capacity
  media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
  media: verisilicon: rockchip: reject AV1 frames exceeding the tile
    capacity
  media: mediatek: vcodec: bound AV1 tile-start copy to the array
    capacity
  media: v4l2-ctrls: add KUnit tests for compound control tile
    validation

 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |   5 +-
 .../rockchip/rkvdec/rkvdec-hevc-common.c      |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |   7 +-
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   6 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  57 +++++--
 drivers/media/v4l2-core/Kconfig               |  12 ++
 .../media/v4l2-core/v4l2-ctrls-core-test.c    | 145 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  36 +++++
 include/media/v4l2-hevc.h                     |  41 +++++
 10 files changed, 306 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-ctrls-core-test.c
 create mode 100644 include/media/v4l2-hevc.h


base-commit: e24a98d6884a6e4203a77a94f070a59fcab95208
-- 
2.53.0


