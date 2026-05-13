Return-Path: <linux-media+bounces-61324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL8BOmTaA2qR/QEAu9opvQ
	(envelope-from <linux-media+bounces-61324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 03:56:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13C52C1A9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 03:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46B7F30A9679
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 01:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F71E385D62;
	Wed, 13 May 2026 01:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etbZ4xs/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4033839B8
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 01:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778637353; cv=pass; b=j2D1IRiYBpHED2bnq2AZ+o/g34QkNgirWt1ta2Kk9oURm7Va0dXhkYlrzKb6Mae2Hu6lrDHh8raUamdEkdGR/cv5PnLblYBQoHqzu0nZcKNdzOtsCHf94MrO3MvEu9tl2dpBLHRXr/FbHQZF9T9AU+97dtUfRv2To7RF1hXWAJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778637353; c=relaxed/simple;
	bh=9tiV4ZhfIE1AVrGBMXro5/HVKMSjT0yIr89kHRQQJAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGyxB5EqTAD+DdOwbsAws6JiLD8FGbCxapqZzZqsEIuZmAqTQcWITWoWho/brR+EWMWnF0Y/QMuTyX6r/5BXGdD89SpE+ozZNoNUPzTxvPXQ8Qh/4L4QlWGAqWnLiJJWYHfG+C3GqEvt3j/2sfaVGmXHTu//hxumEMBnjY6G4l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etbZ4xs/; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bd6f65c781so56785107b3.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 18:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778637349; cv=none;
        d=google.com; s=arc-20240605;
        b=FW9lg5+W02hNdfdj2RkaGTw1nqZ8bUsUhlNJAUF+2M1G++F0s3fyC86jH5W/wyJx3D
         0Q+JFw8WvHHJ3Bouff/t4pZBZXqbITQP07gZff/a5DIPjV2daijNJ56HEhVpFhKYV2pm
         jbce07txMpUZxt7dzO6hA3AVkv0EvMXzUEJr+yugshrqjitWfdAelc4oHs4l+63Jcmay
         zL7SS1WG7TvAS32XI/WYhIYvRttpE0VsH307UGPPXWsQi6moOMY8Q5QwzECmkOa16Fgd
         HvYE3AtPRhZhNO1ARwawYwuK8QdrkxEXO+D6FcVPu39Dr42pEcyrQor2Pq9mKRwbQx+C
         UEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5xRhLCcP3JBRN1MwY6Q9q9IhNYwNr7l9QAT6ZuSm7sQ=;
        fh=aoSQUmbS3v0w+2awI5BeXUzA6v14GheNbh6us8YJAcU=;
        b=Z9q3tkGsPFawLyKSxpiTOgGdtFEiYXX0Bdut8MFFFvhasBtP2VsGpSkPRC9VhetQiX
         EB7/CLMIgPtMpMU5vqXUTET9p+ZW0wrWik38olsqJv3PWM86aWMCWz/YP2VwynthmFkb
         J9mLvTBhRoO7P5G5QQseNCxPPTra20D5b9ong1r2ajVMk/HJ39LOJ1ITg46O6k4x489I
         +Nb8JYzfuqoRaA/vHBw30XqKsMshINO7TTn+442AGjJ7K+dGt03UTEhENxnUv1gnj6HN
         ulpR2SgyUJXMuRZA2cCr1Bh/nlvX4IaiyOO3GeIK7oJVpFvmfrwVJ/rTR7NyKf3LkaMH
         s7Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778637349; x=1779242149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xRhLCcP3JBRN1MwY6Q9q9IhNYwNr7l9QAT6ZuSm7sQ=;
        b=etbZ4xs/Xuj64lWD/6DlKFeKD7HqKekOZTkUIESNbjRKvlyw8ryU4rnynHuhoFIfEj
         rgu5/VIKDYsDwagumYaC4nhQX/IOatDhQBt1j+mJKs0NRxuOVknvFjcCo8A/8mHDMCMe
         mwgPoJTEb0tnfts794fBh55zfoUByFrwNoQ9oLIpd9+o7ldSR3QztmnMgOkw5D5HAEEy
         5gfSzHxZY7R0uf8RUctJjzDgBUyPTSz/N2qVfLyU3S96eSXT5AbR7mUYpRI6Ye4Jv2Qx
         8E1Qz8UvW5KvcoetLBgiAbEScwk2ROkImgqrIKbHnrCQ8GvQFAfsthX/HAMclfXlM1Bw
         KdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778637349; x=1779242149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5xRhLCcP3JBRN1MwY6Q9q9IhNYwNr7l9QAT6ZuSm7sQ=;
        b=azqaKaQt61huWadsMrCp/sD0Zi2BYSWFx14Tr4iNhLt//Ec+0o3xsbxn8eVaJEv6et
         jfJ3rJsJp0n4ClsopBe5euVuAexHv77b9U1A63tVRy4tXbIyymrKemVLxWv6ploX1bWV
         uFOztXdetoGh3fnpqC5GV4UFTcEArc5HoR6XIOXk9lupJm8oWoRCL5l81sSf3M+DjHcx
         fxymf2vOmGtiAbTY9ftgd0sPUjiFJ9eWTstCmdDVntlC1DvFDEiQ7UcXCIfejSM5OL8m
         CzysJB4QY4t9rbRgbekawyRyrloA+ySXA4ZX1ryIr6vrI0+vWaNA2aM8xkgzgnwFsm2S
         umNw==
X-Forwarded-Encrypted: i=1; AFNElJ9qTiR41w6drQRpjxnf+ruwhHrshofxGFPZDeGvT1BJ3qPWTS2trfVfjJJ9IF7aaFa4iShyeQ1RYL5kfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV/j540R+KVTgVJr9x5nxE3VhuPxIbuEhLIXfD32B/h8Wezda
	l4S0yeokjhX1iz6Huj1vfP5TuwKNWBb8494IeWpe22mHaWsqbQmL4/Dx1+Gp54U4w4a+MdI48PJ
	H4wdYQ+PW+F5kMLX0CODud+Q0VE6xIKg=
X-Gm-Gg: Acq92OG4kdz0BGpIFsUZey2gUufCgfXssuglP7zrMWoaLxNVCmLZ/M3MguojdqDl6MA
	HmScrP9ib5MHvh1W6zPrww86zds7ur5wHdMNHRpQfQbPLfDF0+GoSTc8Zw45swmyz1rDUhGQrrX
	3bLa+RkNMoUDDrdQ9aDQR29rjE6NJTIQ5KUhpCjZhsNz2s6lU58WRm9Vx1vvw7ZMzaL72jsQAz+
	dI3NDvb/fUc2hZRGRAZ/VIbw+Zwe5rFn0y+Z/rIpOKL8BplGGjAkFI1pjfcFmVyL8qxFZSW6Mdm
	KVFJLQ5ntnql3/ROZdSjLyT+EKskATDZQq2GTiMt0y06BpyJkMayP08BxydNT7u52DVojO5d
X-Received: by 2002:a05:690c:e28d:20b0:7ba:ded4:df69 with SMTP id
 00721157ae682-7c6985e165dmr12151727b3.1.1778637348672; Tue, 12 May 2026
 18:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512020718.108044-1-kartikey406@gmail.com> <d1bc8d7d-3a4f-4ede-8266-81cc66bf11b5@collabora.com>
In-Reply-To: <d1bc8d7d-3a4f-4ede-8266-81cc66bf11b5@collabora.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 13 May 2026 07:25:36 +0530
X-Gm-Features: AVHnY4LCDlccPve3ZLzzDvN9woFw3uS561jxG504DrY4p0Whnei59B3Wu16XydA
Message-ID: <CADhLXY7N0eLpA30eV4Rb=F4vzCf9XYtDjMpxBSJtGeMWNi6Cwg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: move cursor resv lock acquisition to prepare_fb
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, simona@ffwll.ch, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9D13C52C1A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61324-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,collabora.com:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 12:04=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> I'm getting lockup with this patch applied and now see that
> virtio_gpu_resource_flush() also locks BO.
>
> Easiest option might be to add uninterruptible variant of
> virtio_gpu_array_lock_resv(). Could you please try it for v3?
>
> --
> Best regards,
> Dmitry

Hi Dmitry,

Thanks for testing and catching the lockup. Before I send v3, want
to confirm the approach:

  1. Revert v2's prepare_fb / cleanup_fb / plane_state changes;
     keep the lock acquisition inside cursor_plane_update like
     the original code.

  2. Add virtio_gpu_array_lock_resv_uninterruptible() in
     virtgpu_gem.c, mirroring the existing helper but using
     dma_resv_lock() instead of dma_resv_lock_interruptible() on
     the nents=3D=3D1 path. Declare it in virtgpu_drv.h.

  3. In cursor_plane_update, call the new helper and check its
     return. The signal path is closed; -ENOMEM from
     dma_resv_reserve_fences() remains and is handled by freeing
     objs and skipping the cursor update for that frame.

A skipped cursor frame on ENOMEM is the remaining failure mode in
.atomic_update; this avoids the lockup with virtio_gpu_resource_flush()
that v2's broader lock scope caused.

Does that match what you had in mind?

Thanks,
Deepanshu

