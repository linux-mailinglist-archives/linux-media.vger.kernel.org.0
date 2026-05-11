Return-Path: <linux-media+bounces-61158-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEmBCu4UAmrangEAu9opvQ
	(envelope-from <linux-media+bounces-61158-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:42:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D89513A6B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 19:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA0B630D4C85
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7804144B692;
	Mon, 11 May 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hknY5BJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B4449EA4
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519537; cv=none; b=CvOs5taUEG3THYIElXaHjSoCVRLQQs+WYDtTASr755eD0a4c6sdiDEVPOqDrqmfXgyDv1oKI4O/nmAfJDJknsq0uSxlnSWvPFpPeaiudyDpH3Yi3FeOaJxWRiJg6tLy8QLJKolaFyR1cM6TSvTyJsx+2RxVBuvrQ8b5AdekKiok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519537; c=relaxed/simple;
	bh=3LLaazElOMKyi+EA4lRpSGDokD+YpjiONdAqGB1Oq10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dwlLcGfzNsBS+yKxkUywW6jfHTQ5t310rj28kkdt9ucsQMM7QtF2qyKAwl6YnsHTG/IizvPUYhkFAVD1bQWuriK9uN1cbrXu1iAh0ZxN/jKWFrhlUkttOdyPV7HVkczZLUVs3OpfpZBIq+jYbNcxFgr5d+dGiPcmds8fyhOCaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hknY5BJ6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4867564e87.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519534; x=1779124334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=hknY5BJ69gnOQP+dVrFcKWlluF5XxgPXR3dOHEkrH2kvxuVE/mgaigBPJkxF9oOBpI
         yewrRnP4S0RFs4EuUnK8aldzI2ZfKlnVgqGg0/VXgfLADDTWaM0TpYSwMrTO7/vfOxJW
         59cLGwqqSfW2AdQo9o2MRH0GmeYs9UNlTuF4QiYfIAZaAkc8zf3ceyXBxBLIGgXgZPLo
         X4C0zd/Ame3xlYpmSARk9d6+jVSfJkn0/+8xKTRwkoCBjPsYhyzadHNVr+rOIAbbhlNm
         xf8y4HKqyYuHCCe2uSzdvZr5V5KQyDLjO1eewJrT/vWvCbDUw91iNzyWSQZB4A4oJnbY
         A+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519534; x=1779124334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
        b=X8e72JoiQ3XA6rC8hpelTiFuPq3xaWR8hhm5g6nvnKdVNwfqba3lG4bE02DvUsFTQD
         rRUNbHnPCM5IZMllgrZPql9FNMPL9pmCp7eUeNl3M7eSlprK4O+G/6g8NX6YooQxwpZF
         rVslwoyWJh4QuWlaODgPTfvzSLesUlkgIYRqe0YbTP6I27qrdwbZ8OqXSrFbd+heMxP7
         cQtHeQDiXcVgvMvQ43qeZQeTAKMNPqdIeqp1xS0hBzDnT5379n6DG2Ji66ghBejqgAqr
         wROPqmuryTOFY7t5Gwi6LvJqt8M8fg8KIYdI1Sk5vzQR4ITFHVhLjLr4mTh1KjjfjWzt
         G90Q==
X-Gm-Message-State: AOJu0YzOOrNSlExvRVva13vNepamIBmfURasx79ekbOn6mHMwhb8/F/3
	Ka4DuRV3dcBLsmTFX6DotyLVvihUzyOPJmSwgAwDWwFcvkdtXo0WhEB5GjK5wtg6WBofowqaK1A
	=
X-Gm-Gg: Acq92OHh9/kXkcZh0QiGWgEfV+d6DDsJZwMDXIRPSu9Ql0ef+D6AHIk51hHWH0uIX7C
	bchfx3vrUhkhg3nccqG5mwR3rvR3HsxNB1SfzWThJnNXXozoVm95+bbJo5i9ePQsQ8ftj+SFuJN
	ivYWx+Ly+mwKqu/4q2Gnh2KZ0W5cknBfGbmlxmoCuug0ne8zWlACj2M45phUQPk8/0i0Zv2lDn4
	ehV3fKMOQfBYc2od0z3HCi4iT2wqaGqBENoFWHf5iBlnEH+AO+YwY3H8y0MYQYFKE32jpUaAjHy
	O5j6irSj+m1KIQSS4yj6yAMM6gmsLw0HreAQUODMvXmXtei/1jSGcjcFP7zJX7eHAyfwQ26frK2
	XKoOZ0xNSpSdSWe/55iu893MXDqtPfnuAtdQftOT62bG+YuzWUktZWVopylA3tYTVs8SLsjLvXF
	8oRMF0DCbPF0pMKIbmkW+kzcNyEjWghaIMSo1jqLsyzekAza28rsRGCYkCNTS5
X-Received: by 2002:a05:6512:3d9f:b0:5a8:6931:ddea with SMTP id 2adb3069b0e04-5a887add27dmr10425983e87.3.1778519533815;
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:13 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH 0/6] media: vb2: Return queued buffers from start_streaming() on error
Date: Mon, 11 May 2026 20:12:05 +0300
Message-ID: <cover.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 13D89513A6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,gmail.com,linux.intel.com,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-61158-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffer ownership to the driver via buf_queue()
before calling start_streaming().  If start_streaming() returns an
error without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count != 0) and the
queued buffers leak.

This was previously fixed for uvcvideo in commit 4cf3b6fd54eb ("media:
uvcvideo: Return queued buffers on start_streaming() failure").  The
same pattern exists in six sibling drivers that still return an errno
early (USB disconnect, signal-interrupted mutex, or media-graph /
format lookup failure) without draining their internal queued-buffer
list.  Each patch reuses or extends the helper / cleanup label that
the driver's other error paths already use.

  airspy.c          - moves mutex_lock above the !s->udev check and
                      jumps to the existing err_clear_bit label, which
                      already drains s->queued_bufs.
  msi2500.c         - rebuilds start_streaming into a goto chain that
                      drains the queue on every failure (including
                      previously-masked set_usb_adc / ctrl_msg paths);
                      parameterizes msi2500_cleanup_queued_bufs() with
                      vb2_buffer_state so the start_streaming path
                      passes _QUEUED.  Rolls back isoc_init via
                      msi2500_isoc_cleanup() on ctrl_msg failure.
  pwc-if.c          - calls pwc_cleanup_queued_bufs(.., _QUEUED) before
                      each early return; state matches the existing
                      pwc_isoc_init() error-path in the same function.
  rtl2832_sdr.c     - calls rtl2832_sdr_cleanup_queued_bufs() before
                      each early return and at the err label.  Adds an
                      explicit success return so the cleanup at err no
                      longer runs on the success path.  Parameterizes
                      the helper with vb2_buffer_state.
  dcmipp-bytecap.c  - replaces the bare -EINVAL return for failed
                      subdev lookup with a goto err_buffer_done.
  sun4i_dma.c       - replaces the bare -EINVAL return for failed
                      csi-format lookup with a goto err_clear_dma_queue.

These sites were located by a Coccinelle pattern that matches
`return -ERRNO` inside a start_streaming(struct vb2_queue *, unsigned
int) callback without a preceding vb2_buffer_done() on the same path.

Build-tested with drivers/media/ allmodconfig.  Not runtime-tested on
any of the six devices.  Maintainers with hardware are kindly asked to
verify nothing regresses on their device.

Valery Borovsky (6):
  media: airspy: Return queued buffers on start_streaming() failure
  media: msi2500: Return queued buffers on start_streaming() failure
  media: pwc: Return queued buffers on start_streaming() failure
  media: rtl2832_sdr: Return queued buffers on start_streaming() failure
  media: stm32-dcmipp: Return queued buffers on start_streaming()
    failure
  media: sun4i-csi: Return queued buffers on start_streaming() failure

 drivers/media/dvb-frontends/rtl2832_sdr.c     | 19 ++++++++---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ++--
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
 drivers/media/usb/airspy/airspy.c             |  8 +++--
 drivers/media/usb/msi2500/msi2500.c           | 32 ++++++++++++++-----
 drivers/media/usb/pwc/pwc-if.c                |  8 +++--
 6 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.51.0


