Return-Path: <linux-media+bounces-55394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YECvLWBtsWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:25:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9F26478F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B553300A267
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6659317161;
	Wed, 11 Mar 2026 13:24:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF52D8391
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235444; cv=none; b=p0sshdHH+zcByUtBHijB1SGxjzH7jjBeVeAnuKtuvZr/imaOjH1Ie7esQeJ9VAHsA0E3fMMGiPvvJY0f4Z898x/hoLs69orIAXU4tSzOSeiVoh7gT76awQOEDeqUq89ZLcPwoydHiB92oQBfmifwWXD5qx69OCySt3TLh3k1EFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235444; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1fAJ0FpX0QdHpcmvvjcbA9UWxqWXGV0BeYyNxr9+ObpBrG/9TSInBUivHHWRm4gKiqGQCXpGTKEkjZKmSzleaK/FLXj1b5PCgK15G++mFAUbAiyKOgdSjxvanIWz+Q8T+9YuNtf5fGQVG5kfEfm2oBCBGxW5/bXDTZBQaiAaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so6637337e0c.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235442; x=1773840242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=E0pgXyY4fGx2fn34DvDfkSjoe1sPP9/1UMtianlVei9HP5N6ZSHDc7WnCeJGv65rxp
         BHwDBAQxhKbpPcb7Znk0eBCoMPFMvEHjlYjBDrb4mjW9jGxhZcdnd4I1KkHgGDoJJWxR
         ASAX60QEHzfbUmFi4xUBX6mO7iyO8/FMPeyqXa7n5ONGjIPG0pw/whlBVLZYl2Z6w2ec
         y+g3/i4JRQUtcNKXxkDyRwqQNrlZ0FkmRtzW9gat2kH1oBcI5nEEBD1e2opxtclflOQd
         hr8yBxg8NSw0HblfMAbA5yK7NKdG/7GKBzqzBIs8g1kvx77wSVCelokQcHof1dYw4mOA
         Asgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZMA4grWSfJQ/GPljfOjkuUnMVh5YQBlhjc/GyDaIo8oWMmkFLWS3Q/gsyet3AHAxtqlGji0ntQKr1dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhfDh87rzeE1vtLxsHbjXI4FM75eIm/Ns2fyDQoHmS3hUFXXDb
	XGL99QHifGc3EaIwZ3H3APDCgTcn0aXD1X940xfeBMyrO0ZCiBHUDPNBz8+waCB2eQw=
X-Gm-Gg: ATEYQzwxTHbiezse2+abMW1Zq4Trc9j4+8kKhESKYPrX/j/YMrj8qRccLzZPG88kLWc
	8bI/SsjBqcyTV+2tI6GG0TKD64sj4AZ/UnHsTO6H+Y3JedhVkW8dBnN3cEPngotJkWIIhA//cWL
	FxZOQULyBRyRyKGvZgFuXidnhZ08aeJe7b5U7i5UUZeRY77PD6pC28YE3Aicb50Nn7u2Rl8uIqL
	kykyYeUwW+deXaSs6Yr4pL59iNTyx0minsq6BQ5Bl39/vsnSNa/hT4gFUeEbshbTrPfKW+aW66l
	JFmYmM0dVpvIuFAvsUnWMeg5ts2Pjt3F+gczIVTsqBXVvKBKlc6d0tBFYHzBzqEWngrhYrdp+8K
	KLtCR75OrqvC7L8qD3Rznbo3ro8DAnNajHz3FJjDpPXpFCq390IAeVVkGGcN593EAjtAQK1RUhQ
	gq3WBS3IUGyqBparQvNpUgE5sUABIWqiwrwC94xcYf2US0kero5lx1OliFWEuV45msjJu6xwKtf
	Cg=
X-Received: by 2002:a05:6122:17a8:b0:566:cd52:313d with SMTP id 71dfb90a1353d-56b47667a5dmr944360e0c.16.1773235442187;
        Wed, 11 Mar 2026 06:24:02 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b46350bc7sm1015724e0c.7.2026.03.11.06.24.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:24:01 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so6637326e0c.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 06:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg4kFzS0gAtENredvwGTat2No2iaZWWJAgU/tGX4zL5/a0ATbU0E9559Ptpkaf9XThsMHCzK9uAm+phw==@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C1F9F26478F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55394-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:email,sourceforge.jp:email,avm.de:email,libc.org:email,glider.be:email,linux-m68k.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

