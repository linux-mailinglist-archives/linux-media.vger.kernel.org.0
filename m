Return-Path: <linux-media+bounces-65991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AgV3EE6ZQmqp+QkAu9opvQ
	(envelope-from <linux-media+bounces-65991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:11:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 910FA6DD2B8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:11:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pMrnWvdc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65991-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65991-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B03A8317FA1D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2187943E9F6;
	Mon, 29 Jun 2026 16:03:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C853E63A6
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:03:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748990; cv=none; b=hpx/kDiMLcl2PAF/Bf6uHrs6gORyT51BPNfF8ZS/vNVdhTFvCfW/ZY3K3ZD9veMopaein0yWsVewcAO8CDbtgPbjVvgCiHDpb90dfrSPhybojDi8AqwV2sVLUW6dG/8XdpH4w0QH1xoCws7jyij0DAFun9SAIfoLySA+FWblMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748990; c=relaxed/simple;
	bh=46Waxsw4y5xIlkfwy1Z8/Bsq4LQTCWdmF37e8s/CRnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1hzcUSQPH8OqoMZUYeolRP15h7Puwpg9v5rSH0bnxPEvR0uR9VcDQj/BQMOy40M/l+lyYLbMw1gd28ZMhH/TktYCfpINDHEzc4fpzFHEKWJzskpFU/vqzDYnCgKPXjOg3FVC2ysViwyAjmSLVX7GPbPFy85x7InqX4LNGex9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMrnWvdc; arc=none smtp.client-ip=209.85.160.48
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-447bb8bb754so2584926fac.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748988; x=1783353788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ditgnvogD1JFYlE4VIZYSL2JGqb9CgnfjGcMgMIKTQw=;
        b=pMrnWvdc3mn8syy97EY7M6T3zgE0qxF4yqXKGwpf+Kje1Jr+Ib9YOpesz+gyMVUo8X
         w9iOXj9syKuItw19cFlcWvhXD78xUNk/wiQFieGg0Nz0sH8BGUCqKt8m5C016xRLLeI0
         AEgM7g+GrJ508icUyMtSiQTDu0cJ6Q+mIlI3I2m2BKAEmRdALActkcf34uk4rTq+xSx+
         6BrIC1c2sKHUtqAOQZQLWcYnXfmFn4AbrS3v0Dt/mByn++th3W/3HXXhz6feBje1KMV7
         pPbCtlzMmTPPaZet+GhOCO1VK4SN8y5f4v0nJTnZ8UUylL459Xal+Zh9ifEvWnywzkpD
         gyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748988; x=1783353788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ditgnvogD1JFYlE4VIZYSL2JGqb9CgnfjGcMgMIKTQw=;
        b=kkMhUqXEf3Gwk88fx9uQsJbE9ttmh7iy5GHLYSwmL5hMvfICpsXsw34iEdArJg4Q/I
         77Nc2JJrnC/iXdgsQrtxYRLlKkbfsD4LPlSyrPR+6WlRBKEkrX7Cu/Jy4iBb3dLKAxYm
         52UWNGwbw+Bl59QF4tAXtlvpWRteWqpwLohMNYoFIb1iwYu/LjgnSoIRPh/muPxE7SSw
         F3ui0cwWywGScEfqvYFM3wDCdqoCDPEfgkZGcP2NwL+F14NxXLlkHxABkTommt1o3u6L
         zL//EpIniLNJn9lvpryo/BHM1f5xunGHDQSgU8T/efsInOFZKBGwodvlic8UctCjAE2C
         SQbw==
X-Forwarded-Encrypted: i=1; AFNElJ/pQh6maWXp0X+j262PvSsfTn0WtSwkyvDarx/YWXLcpbJpF7cYI02sCvH4jFNpvHXPKc7+YWRmtcft7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZgneM2Mfom/lnbo8m/UVMc7/V8apPT6N2SUS2ftZudVsNPrEk
	THSqXkfFbXxOkgkkqKJdfrOxtTVRQz5D5NQMG59B4yQ6OBqtUaJGSBr3liWt+w==
X-Gm-Gg: AfdE7ckJBIUaRnvraj/HuIfeFlJpMOn42pUaoL2i50etn2KmBQp1W7qScoVKumGlKk/
	phWxAxhET2BKiTOdNpSsJYq/HM0WOuM9sjTiH2GQ5MLRjJzqZ94mh3LCnHocD+m99M3BRyMDOFq
	RcQGek57qX29CC8ZxcuT9y2mwzGTs+hcMQL6CG8HF9+jVfLgiPENMGDuHghJbz6xd4JP3fNhkcL
	/gR/0IaBz1OCKZEnNgWLYhvspXCAqEM6UV1rOAgrxHwkoo2tfpZHCZNyaYrDwcNO4ajOsKuKJ44
	+v2dw4ESAyBUs1YxlXaC7EzDfONYjfUqg3trjBMyVoC/eTqpbmcHeJBQ8h95OgHwnYoTwM+XwfM
	C7GR0Xp8iQSNbVFuPLOCsjzCwLk8lz0NmLFSnKfbU8/quhby5/f6ZFjQPk4M8y/B8FBba8hqffT
	7PskfqdUcsD1WBEOTc7L+CVGnv/JjVVlMEkCcJx0wEl+lPhj7VxnK0w6R3QgoqEg==
X-Received: by 2002:a05:6871:341f:b0:43b:9d2b:1701 with SMTP id 586e51a60fabf-447aa98242dmr17158871fac.7.1782748987377;
        Mon, 29 Jun 2026 09:03:07 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db9370c9sm145868fac.1.2026.06.29.09.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:03:06 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] media: hws: add HDMI audio capture support
Date: Mon, 29 Jun 2026 12:02:59 -0400
Message-ID: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65991-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 910FA6DD2B8

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



