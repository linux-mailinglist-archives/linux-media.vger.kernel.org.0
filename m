Return-Path: <linux-media+bounces-63102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM99N8ixGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:45:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74060BF16
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69122303AB43
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E949536998C;
	Sat, 30 May 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sA8o8aHF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B426F46F
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134218; cv=none; b=U0xxGni/LN5TZzPBvQkJAkxedJKlMDujFxlSwnPz2NKT979DwkP91OvF9kF4ISbrvHc8MQIVn4zcc0Rg7gCCVv8uTTYZQdDxkh7NOFDlUMGa8oi441wGgcq/QTioQVqE3GvBKbDmt1HAylbKziMb4/keVORHcbyO2ttXn3bn9YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134218; c=relaxed/simple;
	bh=eN+Jb4uL3lj4tMVGOtizOY5L33OSaPS33idoHiwUrg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MY+rJE35/7PCj3vnQAkqLXy3X2Dbde+uRRx6DMr7tFLH3LhpaklN8Q1A/4t2KcDpKlVrX/Vc6GDGKT/YPLA8/Uth43xQy48FTZ+AlJe8PCDzlmwc58y9TWQkuuIVpMxj78wy59kifD6MNun7jPAwZYFgH4xKHuBAAIhsmjwkcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sA8o8aHF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf3781ca51so5982885ad.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134216; x=1780739016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=sA8o8aHFkHrs4PriHVZcjKlcXZ18DrDh+X7I/dyF9oaThEIAemKDGHcwjALE/hvVFH
         iJwXxuoLiy7qU1MU7SQfVf1HLV+946+hH4tAOjUDmzWxBIHljWtfQs4Nj1Et9Klrbf3X
         N6cPsehmMxUvULFM9eKxhw8R9tCQWaK8v5DLv3bh0K1mw+HIuJPfmlpqDND8BwwOCal1
         P6PPrnk4CzG59wZibVkfOdMiDEyIDvcut056ON0LK2wafrumapPHZTywwujJkS8rjhG9
         ga6+dOpaDah2kHMNvVdvhHm6LTIyaELXA/tEo/N4ZOqJxI0wpJzVQWSZhYNEBoquoIuY
         9BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134216; x=1780739016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=bONz/E9cj3KugzJkxETXZJiwPneh+VEbXVF1v3Vz/k64A7N5S48eU6mrrM8piCNBti
         MEuj4kK2JkCXnk0WWykpIo/hgA+NO1MHnM/LsyH9shE0570sXTlh9TPnN+dh/esbgoBx
         6elQ6ObaJDX4k/FjhJ1kGVieJkUIDpkScVE9ATxkETKXL6Z1W+TDVfHmtrE1Fh5LbYGV
         rS8CN5CMJ+wXEG21R8tFayyVAMr9PliF5SD6F0jfx0ZYOehQ2i1BFASyR0zCBJ+KQPhh
         kQrh/bq+2eimdyCxc6buqhWw798b6E2y1+tmYZhtu0PqWsC+K9j6pJbiKBZkfdk1R3fa
         Si4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+kE7+WsiB2mMtNz4Z3kp04z5CiAx9OKS0lUB+jQXO8NdrZ5cHXyYJC7eu6pfetk+11oZnhuBXez8MuTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmvMCvCs6qBsxpzcjxTmSc17XlUT2xahjyMZhFb0hYxjx1Hr47
	VoPIB0ZWw5ykHypZX/3W4efX3RJhVh74pJNyQl4kI55UHaHPbPuPFEQD
X-Gm-Gg: Acq92OFOzgEDYbx4PF+rN7JrK/h7NKlTNkBZ8ZMAJv0mQMMFoQ6/vNX9uA6N6ZlU07m
	qXnA6gv8Voq7aUNiRBssUSWmg3/zlclHYsfdxbooMnBO5LaiZMJABNAz0F41Rbc8XMOZ2RHcAyn
	X+2rxTwgHsqDacG3HOCjQWm4vMES3HXwIvhldigr9YGzZ8WWVvfAMGRLX/X+pI2p2sS4SSUlqGB
	+CYA5+RWoJJy1PvNoDQcgvu/wuk9ZC3Ft5K6UtFMG6LZS0dv6FebmyQSvOgX/yy1cI/ta+dJibz
	xg6MulJMSM7cRieQUcRKfG66nHGz431GPtTaXa245o0Vd7dUZw0rLIOamJ+iSIeWbcdge1TIAXh
	GgitGO1uEm4H5WZ7x83Or5SnqteXZ4PlbL363ilKE5KVZwHaKaesP7CCBLOUYqZfZuf0T6jcQAR
	AxbyCuolUql1gFLziXfyAaT5ziDNRlwLc=
X-Received: by 2002:a17:903:46c4:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c0ab926140mr12404095ad.25.1780134216487;
        Sat, 30 May 2026 02:43:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:43:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v6 0/8] media: meson: Fix memory leak in error path in vdec
Date: Sat, 30 May 2026 15:12:46 +0530
Message-ID: <20260530094326.11892-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63102-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3A74060BF16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v6: Changes

The previous approach had some technical issues, so this new version
takes a slightly different approach, I have fixed the DMA warnings
found during basic testing.

I have donse basic testing on the Odroid N2+ and found that
the clocks are not enabling for decoder.

It also seems some Mali GPU configurations are still missing.

You can reproduce the test case using:

mpv --hwdec=v4l2m2m Big_Buck_Bunny_1080_10s_30MB.mp4

Please let me know your feedback so we can discuss and address these
points!

Thanks
-Anand 

V5: Changes

[v5] https://lore.kernel.org/all/20260525095216.12078-2-linux.amoon@gmail.com/
 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check,
  leading to simultaneous hardware programming.
--

V4: Changes:

v4: https://lore.kernel.org/all/20260521073449.10057-2-linux.amoon@gmail.com/

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Thanks
-Anand

Anand Moon (8):
  media: meson: vdec: Fix memory leaks and lifetime of m2m device
  media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race
    conditions
  media: meson: vdec: Handle kthread failure and free codec state
  media: meson: vdec: Condition buffer flushing on queue type in
    start_streaming
  media: meson: vdec: Cancel esparser work during teardown
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: vdec: Fix NULL pointer dereference in ISR handlers
  gpu: drm: meson: Fix DMA max segment size for DMABUF imports

 drivers/gpu/drm/meson/meson_drv.c       |   2 +
 drivers/staging/media/meson/vdec/vdec.c | 179 +++++++++++++++++-------
 drivers/staging/media/meson/vdec/vdec.h |   4 +-
 3 files changed, 136 insertions(+), 49 deletions(-)


base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
-- 
2.50.1


