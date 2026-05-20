Return-Path: <linux-media+bounces-62271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDk+MyWkDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:08:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BC58D4BD
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9413E300348E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA333DC4AF;
	Wed, 20 May 2026 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZABe7eP6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C873C9EE6
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278879; cv=none; b=OBv/DEaxTq9m0qGN9vIEXps0nCoJk06IdHghLvuvAGZXZEsDbUBzZU2kDB9hrxwLibcxetIqcF2jje/xpQw/KBxjc/qfYh1hweHp+wGrTa73uUFFYkq5IQDSbqlni9W3YpubcCWygpknfpOplwTxs6wt8WEMy4NeNzNr8YANnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278879; c=relaxed/simple;
	bh=K7S1CtiPgq3ZC5Qk3eU/2mEdZjNCSQbQc8u/8sPrRLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZfbrrtTmSJK6PFiQVslGK1Ia2EOYaJVmPIG1I3AajYQ5TunVdRdcPQ3f3/2tBDyITsas6FjfU2UXs9YwxJlEPtAJxUYS/KBPY7OyI5xDD5ZH/47CmaDWnMgDjZ7pg66lXFS1eDnlKDVuHLsvtirU2LCotAF+R+OsOaJfjJF2EjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZABe7eP6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so56620135e9.2
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779278875; x=1779883675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDNnhHb8Qm04rZoJG+MlOQ1DbBhaAyXc63fG+VcOjY8=;
        b=ZABe7eP6BtmFQBZx5nZA5jnLUkIwI02CxQHOIItLIaO/Y6V/4RWfvpEtOLaBtrYC0x
         bSHTw396aY5PngZ0rTmzHrbnWL5Qv1LCGbMvuXhgIKj/qgA7KeBLb7/FKa8VjwTRmlqx
         7jZfp7XLyI5sy2A+AuQhoOs6MtUgzls6AJLmoN+ydKlsuVOsl0WuF6FVeHD57jxmZ5v1
         aztfoHP8LEwh1veYJQ2MptOyfqBY/yPCkxQmU2hMiqObMMxx2GyjNjVmNBPPgwSBe5UA
         2sfCVGlOYo6dqvtfbb5lz/Q+C1HXQhRAq9nydLqH1GOhIWsa+WwroW5W+qFErlIExnCn
         WfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278875; x=1779883675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDNnhHb8Qm04rZoJG+MlOQ1DbBhaAyXc63fG+VcOjY8=;
        b=o+NamGr7e5M1F5JjBfyobk1lfZa73QRIBjisEDHmpAZrKEJiFoUHvSMdLWyFxAnD4n
         /C80IlcUhrTZlcCAzQ/7tZrHf8g2M/BTQcr3dUaMvN6tvu/wg5Z0skcH5xs9D+sM+E7k
         RYNTO2wo1y7kFvE4NV842GknwaxVDQu7Oxn77wMxd6zuC9NqUnEfRowUd+0Fvt2a2mXQ
         nMNanToRtAbZQaKR3dQk4mm0qtaZ/a93yCafXC5sPWTXnjsWo34GQTOKqHxkIVtf25ot
         R3LvoGiig4sWYVTSGd064FXl+LfbT3qfqass33H8j4GsGw1gsZU93vpnd6hGcTtG2KYl
         0lmw==
X-Gm-Message-State: AOJu0YytzvZHtHn0D5pX1iIBA4QaHM4MiqZE0UH2ceLi8NOIX3DXER/k
	r+L7aNIUPP18C10ObArAVC099TrbtjTIApnJx1qr1j2x5IHfew1+80B3KNnY
X-Gm-Gg: Acq92OGmOvunfd1gtpWVUsr772lTEsCaBTCcTAvHUDBjIs3BIb/M9LjMrQ8oueLt0IQ
	JvNeCo4GwYvXfaqwt01dCVqxUyBT8z7TXKYu5I74s00g4XoNH26hSDF4VVhL7kOZw2lTARG0Zq5
	waCL7GFJLOXuilyoPbPnWcStEExf1GrlvGe8AhTbqK1i4s0MsFu3WBYXemnEC4mJHVxRRNw1H1f
	lcMoSdNMLZTbia21lUsxC2n/lFX+DX+8YzFCnB4nvvVB+zZO+gvK9TGdv8/sy5Yhl3aYTlz1Yz5
	1Lo2g/rCRR5ly7l1btO/x6Uk1JfCHANL8YfrM/lA9VoK3XnfTjYaQnofDoEJx6FJEZTzzyeShs7
	OjwbcYebXNDFGSLCeP07zDt4fsCF8YXb7Fls9DjSnB5a9DAZmpcMCG3KLqVWW5SeNWsua4Oegkm
	F3mEcWlq2pDpA6hv3TizulkAJ/BCg9N+atjclzXudQYAfPDmc9mFL9H2nmn7lOqYaUWtciZ8fmz
	6XV/7EPNdKlZQ==
X-Received: by 2002:a05:600c:13ca:b0:48f:eb8b:9988 with SMTP id 5b1f17b1804b1-48feb8b9a84mr212625365e9.23.1779278875136;
        Wed, 20 May 2026 05:07:55 -0700 (PDT)
Received: from localhost.localdomain ([151.19.174.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm409849755e9.8.2026.05.20.05.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 20 May 2026 05:07:54 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: linux-media@vger.kernel.org
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [ANNOUNCE] libva-v4l2-request: RK3588 VDPU381 VP9 decode (fork)
Date: Wed, 20 May 2026 14:07:46 +0200
Message-ID: <20260520120746.51732-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,xs4all.nl,ndufresne.ca,kwiboo.se,collabora.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-62271-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavonelawyer@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 054BC58D4BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Now that the PM runtime teardown cleanup [1] has made stateless VP9
decode usable on RK3588 VDPU381, I would like to announce a small fork
of bootlin's libva-v4l2-request that adds the userspace side. VP9
Profile 0 output on this hardware is pixel-identical with libvpx,
verified frame by frame against the software reference with
`ffmpeg framemd5` on a 1080p59.94 reference clip (3000 consecutive
frames, all matching).

  Source : https://github.com/dongioia/libva-v4l2-request
           branch rk3588-vp9
  Kernel : Linux 7.1-rc2 + [1] (queued for stable)
  Tested : Radxa Rock 5B+, mpv --hwdec=vaapi-copy on 1080p VP9.
           CPU drops from ~113 % software to ~56 % with hardware
           decode and NV12 readback (Cortex-A76 @ 2.4 GHz).

The substantive change against bootlin's tree is a port of FFmpeg's
range-coded VP9 compressed-header parser (vpx_rac + read_prob_delta +
fill_compressed_hdr equivalent), with the `interp_filter` probability
read gated on FILTER_SWITCHABLE per VP9 spec § 6.3.10. That gate alone
is the difference between "green chroma after the first alt-ref" and
pixel-identical output on this hardware.

A second change moves the V4L2 OUTPUT / CAPTURE format setup, REQBUFS
and STREAMON out of RequestCreateContext into a helper that is also
called eagerly from vaCreateSurfaces. It keeps probe-pattern clients
(mpv --hwdec=vaapi, VLC's glconv_vaapi) from failing fast on
vaDeriveImage before any decode has happened.

Known limits, for full disclosure:

  - VLC and Chromium's native VAAPI path are not yet usable through
    this driver. Both import the V4L2 CAPTURE dmabuf into a GL texture
    via EGL_EXT_image_dma_buf_import_modifiers, and on Mali Valhall
    + Mesa panthor the imported texture does not refresh between
    frames for the linear NV12 layout exported here. The descriptor
    is structurally valid; the broken surface is downstream. mpv
    --hwdec=vaapi-copy (CPU readback) is the supported path for now.
  - H.264 and HEVC entrypoints are advertised but unverified on
    RK3588 in this fork.
  - VP9 Profile 2 (10-bit / HDR) is exposed but not tested with the
    current kernel patch set.

The bootlin tree carries the same architecture, so the same eager-init
refactor would presumably help there once VLC's vaPutSurface and the
Mesa panthor side are in place.

I am happy to send the work as a series for review against bootlin's
tree, or to keep it as a distribution PKGBUILD first while review
catches up — whichever is more useful. A PKGBUILD against this fork
is up at beryllium-org/sbc-pkgbuilds#4 [2].

[1] https://lore.kernel.org/all/?q=20260518145414.64514-1-pavone.lawyer@gmail.com
[2] https://github.com/beryllium-org/sbc-pkgbuilds/pull/4

Thanks,
Francesco Saverio Pavone

