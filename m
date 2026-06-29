Return-Path: <linux-media+bounces-66011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EjUzLy+5QmrbAAoAu9opvQ
	(envelope-from <linux-media+bounces-66011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:27:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950F6DE0A5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gg+yEY2g;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66011-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66011-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 801EB30559D7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60E038839E;
	Mon, 29 Jun 2026 18:26:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509A386C2C
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:26:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757614; cv=none; b=nZGYnDnGrMkTYdrgByhZ2+dScXuINiHoqfWwSAYdV/jz7GhstYsWQSJKyCVdKo7Yylrb0OnUZUiBGZ2AyOv0V1R0VybncUwce/vFQGPiWAdPN+bJ2eSSFM63bEaDEan2s5PcNADH0mNMAfWGE2Y8z1T6hLW/CMiB0EDLbxkPd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757614; c=relaxed/simple;
	bh=Y/GuS498i2D/k1Pw79jMyihw6xjIrBVbThjdilvBQcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JopdQZLB/RUIXV40lZkIsagAQRou6Q8geG1WqndSOK5NUXPxyA+abADXyz6pufGOuSifqZG75wlrHgWaI49blsoV1F9wvCBnH18/e0dJZiO8MXRRCfOBU9BB/gVrGhSVpH91qHgCTIoB8BxMS5wRp4eFZfias87V/eoRw8nTdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg+yEY2g; arc=none smtp.client-ip=209.85.210.47
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9cd40e582so588273a34.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757611; x=1783362411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06TGjrqxyf8RGWX0j/eTJGbBQbo2enj1xSoNYQUZNdw=;
        b=gg+yEY2gQdeQ1o3s7O7D5P1NpoYGsQ8yLmCJqRy1eW3pIQ8ZUs9NvARiUCqv4rVrzM
         bYjCsye2xu1aEgfPKQ4z52PD5JOVjWxy3ufjmjk/U2wYYwWI3wdFwyw1sCquc376K5Gt
         kehQrdxK76IDf+dgIX/I4m8Vl0a51nlsSU8LKEZCxd6MAMwEd9Z9zjcxBrr89mE/s9xG
         /Uw8GXHSpFif3Ljfqtv1ecs3rRQOKukh+UN0eVyEGUQ2ZHDWOPqdOhI3iQtx5tsgkZTp
         NbhdZtNY7S7QrqsDzeksV6zDv42NHR2zuXLjp9+516jnF5L12YiiwYtV3HbPQMkqTfnA
         4bPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757611; x=1783362411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06TGjrqxyf8RGWX0j/eTJGbBQbo2enj1xSoNYQUZNdw=;
        b=DPHIuVK4tzWCr2+4RDwmaLn7AzUDlnHBIP3YNPCbr7N4w9hsB+iHq2+NeO4xogYJS/
         lttuoLSRFl0mk8xQ+n9iD1iTmAR48FqHmuBFkRxksL6cXQcqV/71KiohwwImq3pBOdJb
         vj0m6FDryyX3JIwxTnzZkX6fea05tcCUf4SC9grOro5tXr56HxRX55UqPrTkYIVd7jXg
         I0i2OoZjzkxIwd2zNS0G1fVLKmND/c0vBusa2VhV34GsCw2Nq7sv1GS+tAfkwXQzpCkI
         jqByRtQxwX7OGkxsRKwWAY+ZaJptl9128XK2kE4Kl3H46FU4zmDGkQgU+PeBlllYv1cW
         LGNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ExPn9tSga1qzl96lL0+lMuPOrn+d0/SEo3a5G0EP8JzUf7INnEHaaY+HjzaLYWzbuo/X/8DyDiQExzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6vLww7we7xFcdZorzwvjpi/jfketv8u+BjLw9Msx10x6q6Ic3
	9/sx5JWFUxjwwOE3mbAebK5fXZ8HzHiQlXeUp18Aqe7phnl7nrgRPmvg
X-Gm-Gg: AfdE7ck1c26HvThA4R1kVJIydcGueXulKCoGhJgzfwB2mxHjufMPp1n57/njvDUNgov
	kTDDoJkOsCO16glthYLdblZaIrcCMi1gPr75CpBHcScMo5wlTxTucV/+zeUxUDzAGhpdZELHEG5
	caK8NH/38GVEt/+ZFwrL0VKeXiBQZfQUA4Cw9IbAJ45tRLJ7KcvC+Lt1UvcsR8jmYBeF6NIrdaw
	AUGmSyy06e+hdRjUrNCTzf7Y2hjUju4Gt9UZ5ttm8vMOTIG822CeMbK/flD6DKojf9nf13hf9yy
	WVlWBVIxvLTkYlwIVEef0KzFjlYGQb4EjI+jFcYudYJ/s9L9C6uOVOVTtRnPb4VYPEk0qpSsg8b
	1wWL1IfpB8AGfN7+QbqDz2tZ0neajVKw/M6apKtihGF5KoVwaY8XODv/+/HvEovjW5pxjT+sw18
	vBzwyTdKfyUMfkGWFMXwzc132+8+WfOKoheWDby6NsAcafvdBilCs7ctwQVH3cQw==
X-Received: by 2002:a05:6830:4901:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7e9ec586d01mr500530a34.2.1782757611201;
        Mon, 29 Jun 2026 11:26:51 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm396875a34.16.2026.06.29.11.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:26:50 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/5] media: hws: add HDMI audio capture support
Date: Mon, 29 Jun 2026 14:26:44 -0400
Message-ID: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66011-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4950F6DE0A5

From: Ben Hoff <hoff.benjamin.k@gmail.com>

This series prepares the AVMatrix HWS PCIe capture driver for HDMI audio
capture by making the video DMA programming use the hardware BAR remap
windows consistently, adding the shared scratch DMA arena required by the
remap model, adding a video bounce path for the shared remap window,
hardening queue ownership, and wiring up ALSA PCM capture support.

This driver is derived from a GPL out-of-tree driver. The baseline used
for comparison is available at:

  https://github.com/benhoff/hws/tree/baseline

This series supersedes the earlier standalone submission at:

  https://patchwork.linuxtv.org/project/linux-media/patch/20260620173448.36279-1-hoff.benjamin.k@gmail.com/

Supersedes: <20260620173448.36279-1-hoff.benjamin.k@gmail.com>
Assisted-by: codex:5.5

Validation:

  - Build checks passed with W=1 for the HWS driver as a module
    (VIDEO_HWS=m) and through the built-in directory target
    (VIDEO_HWS=y, producing drivers/media/pci/hws/built-in.a). C=1
    builds completed for both configurations

  - v4l2-compliance 1.32.0, 64 bits, 64-bit time_t, passed
      Total: 51, Succeeded: 51, Failed: 0, Warnings: 1

  - HDMI audio progressive validation passed. Coverage included ALSA
    capture-device enumeration, advertised hardware-parameter checks,
    48 kHz S16_LE stereo capture from an HDMI playback, WAV
    header/size/nonzero-sample checks, captured rate/channel/format
    verification, no reported XRUNs, no kernel warnings/errors during
    capture, repeated start/stop capture cycles, 100 consecutive short
    captures, and 1000 consecutive device open/close cycles.

  - ALSA period/buffer matrix validation passed at 48 kHz S16_LE stereo
    with HDMI playback tone. Tested period/buffer frame pairs were
    256/1024, 256/4096, 1024/4096, and 4096/16384; each case checked
    that arecord accepted the requested hw params, capture completed,
    the WAV artifact had valid header/size/non-silent content and the
    expected rate/channel/format, no XRUN was reported, and no kernel
    warning/error appeared during the case.

  - Mixed audio/video validation passed. V4L2 MMAP streaming was kept
    active on an HWS video node while ALSA captured 48 kHz S16_LE stereo
    audio from the matching HWS PCM device. The test checked that audio
    capture completed, video streaming stayed active for the full run,
    the WAV artifact was present, non-truncated, and non-silent, and the
    kernel log delta did not contain warnings, errors, DMA faults, XRUNs,
    overrun/underrun reports, or HWS timeout/stall diagnostics.

  - video tested with enabled_audio=0

  - pm_test=devices passes with and without D3hot.

Full platform S3/deep suspend is not considered validated, my system is
unstable that I can't resume for deep suspend even without the driver

Changes since v2:
  - Add missing Signed-off-by tags to patches 1, 3, 4, and 5.
  - Wrap the long commit-message paragraph in patch 2.
  - Add commit-message descriptions to patches 3, 4, and 5.
  - No code changes.

Changes since v1:
  - Repost as a properly split patch series. The previous posting was sent
    as a single cover-letter email with patches appended.
  - No code changes.

Ben Hoff (5):
  media: hws: program video DMA through remap windows
  media: hws: add shared scratch DMA arena
  media: hws: add video bounce path for shared remap windows
  media: hws: harden video DMA queue ownership
  media: hws: add HDMI audio capture support

-- 
2.54.0



