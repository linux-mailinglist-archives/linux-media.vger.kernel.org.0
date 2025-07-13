Return-Path: <linux-media+bounces-37578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E02B032CB
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 22:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71AA4177AC5
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 20:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3982877DF;
	Sun, 13 Jul 2025 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZYlOmJi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84313B7A3;
	Sun, 13 Jul 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752436809; cv=none; b=bVO4hie8bys+mmPCHxcZ9CmqpdU24toRC7rwocEFfLXsNjetJQrGo+wCy+SbmUlCtrCUbSjansHogG0Ld5UV4F2QrgVrGzv3i8jPI9Z9GyB5y2XIlHoLXn0z3SOuPnJT4y68Egk7OwLhr3uXMecV9eXZVY4EqHFgeCUq/Qz9LKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752436809; c=relaxed/simple;
	bh=3tZEHSMIe2JuKkcs+CjA58WHtgn0PycC8PnAWd1rh4k=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=rxRfxVoSOuPoxyXjiKBGjQl/FK1RxdTgq5buDVzUadI3lPKl//fyR9dXrSN92XfYu5YrFXjGhlWWb5Qy5G3iW26iaBQXMDzAKgL29ITMYXCL9yExJkh7kedu8W69lMTrmw3yOrADzHK64NXw/B7a1VnLNu2gUiLtmnoHPunA4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZYlOmJi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4140630e87.0;
        Sun, 13 Jul 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752436805; x=1753041605; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zgas8aX6pTElhKIx/IRpo2TOQqTHn8xnxc+EnP268I=;
        b=bZYlOmJi69V2IE5XQeb418Ywi8XzFmGopXow4rpHcPjFQrZt89VlV8Cw3aLULn8uXP
         DKSlciqYuZj/4qCU9nvdoTKE+MdtrX8xnXkjP9zFk5o39l9IBvc+lbzA4n90pJHZV9Vt
         GhBk0Pr4D7g8+Ta5LrSBOFjlC+f4/MWyyolOR74qL/8zMGxxgms8OfngVssX95oUATJ9
         lPDTIsRXOoAdRxtnO+I1Pcqf1LelFjnOdGEXC1CeRgTnqrkKQmLZKD1q7bdU7smZ03pq
         41X1e5AxNtDhcyaALUGKPBqT0egagxxpcP0NYzIxuC2jqWUN8IC+jcDLDjL9mr3dR4YB
         CWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752436805; x=1753041605;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zgas8aX6pTElhKIx/IRpo2TOQqTHn8xnxc+EnP268I=;
        b=tzi5Bve/q0p8KGlhwxo/k1eFe6IhwEKpZZ6SV4Kmep9ssYdtjOwKiKFOOFOIHwlvRv
         Ykx6tR2KwpwkHfmHzEo1FGadpReb/sfD+MOjvPh0Y/0lV6Z+9Y3067Bj3PVtP9ZG7x8K
         e8D7RKNfsJQ0W5UTy++CVXADPwdju4FVDpNJYvT93aUScYkpEZ0Uol8qMnHLKoDHX2/8
         fYJJP2kzOFQKvvHdElgat3QCKLpkBuoDs+EQXYX1gj4NLKM0zdp6nfLDupyzk+8BCvEF
         gp6YCqtKNoInXO5qHFz1787YCbAdOEG28Io0lKQ0h4eptCp0TE08zHsz3nSBU7WZRic6
         fm2w==
X-Forwarded-Encrypted: i=1; AJvYcCUN4DCR//gECCV+Z2YdccG5Tsm5SYVC/ylsiFZ/1C3pLHRkjvwl7MlyyNwSwqsnh3/945WtMB7/dDrgsAM=@vger.kernel.org, AJvYcCUjRD/nq7peEhdYy4et7jwXVFE7eXNXxqev7O883f5g6hVpyGFVw+aDu7+ZdwA6Ro01rtnZKBQnJHj2bz8=@vger.kernel.org, AJvYcCUyggjf6i+JBPDNz54vygU5cRnusGusCoPuQnsZV5dMeV1fdhkByiRAqogFGCi4Kfixhs0ppZG4wslnhVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL45CQk7GLduX06QVYFTOKl2/9teC8GA1oT7DatCFvuEznX3gf
	NQdOsmBov8VcsLCrh8ZMJ7faUBQLTSYYAIP710j8LFYrfCeLkNiRxPtL4X7OhsUqjqU=
X-Gm-Gg: ASbGncvJQyAPHAKOJc+/Y0dz7XQkyQmz3nyWbpz9s0Nf7jzPCB8m7ct5ydoPVoFY3Dr
	4BAUTU9SsX0JiSbc6QuUgk2FPiVKWgkQ2LTmYrbBIgoCujiOHCQ/mpFY46076/69WoTs0KbuQbe
	RpiFRuS1lB0/vGEaEdS6DGKg0MytdvflbuNzN2c4O8Vx1gSTAPIHBVNwzurz428FVZHveyTQtiF
	2WxSgsMMBqEBvWDGFG6xLXLI+V1vq7JwcX8H3Hqohp6AshmBW5wOuhMeOldrdqU55th6n0SVaxS
	tFpF8GyGqcStqHPDa60NHNBNZQChr0bWcb5NUymEtcOPrO69DjyAyBCgb4HFE8ScLq7JHSGwXgL
	mLRkXV9+Syqmk4eICh20=
X-Google-Smtp-Source: AGHT+IFxABxaGZ89qBgwZDV7CxOPxSBDB3o9rA665o+Vy3jYVVk1Wdz6wBebAWa65+qQwprfYTupWA==
X-Received: by 2002:a05:6512:3b9e:b0:553:510d:f46b with SMTP id 2adb3069b0e04-55a046095e7mr2800438e87.32.1752436804901;
        Sun, 13 Jul 2025 13:00:04 -0700 (PDT)
Received: from razdolb ([185.69.124.235])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60827sm1689220e87.158.2025.07.13.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 13:00:03 -0700 (PDT)
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
User-agent: mu4e 1.10.9; emacs 30.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel list
 <linux-kernel@vger.kernel.org>, laurent.pinchart@ideasonboard.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, etnaviv@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
Date: Sun, 13 Jul 2025 22:54:14 +0300
In-reply-to: <aG94uNDrL1MdHJPM@duo.ucw.cz>
Message-ID: <87tt3fdfpg.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi, Pavel,

On 2025-07-10 at 10:24 +02, Pavel Machek <pavel@ucw.cz> wrote:

> [[PGP Signed Part:Undecided]]
> Hi!
>
> It seems that DMA-BUFs are always uncached on arm64... which is a
> problem.
>
> I'm trying to get useful camera support on Librem 5, and that includes
> recording vidos (and taking photos).

Earlier this year i tried to solve a similar issue on rkisp1 (Rockchip
3399), and done some measurements, showing that non-coherent buffers +
cache flushing for buffers is a viable approach [1]. Unfortunately, that
effort stalled, but maybe patch "[PATCH v4 1/2] media: videobuf2: Fix
dmabuf cache sync/flush in dma-contig" will be useful to you.

[1] https://lore.kernel.org/all/20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com/

> memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> 760p video recording. Plus, copying full-resolution photo buffer takes
> more than 200msec!
>
> There's possibility to do some processing on GPU, and its implemented here:
>
> https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=heads
>
> but that hits the same problem in the end -- data is in DMA-BUF,
> uncached, and takes way too long to copy out.
>
> And that's ... wrong. DMA ended seconds ago, complete cache flush
> would be way cheaper than copying single frame out, and I still have
> to deal with uncached frames.
>
> So I have two questions:
>
> 1) Is my analysis correct that, no matter how I get frame from v4l and
> process it on GPU, I'll have to copy it from uncached memory in the
> end?
>
> 2) Does anyone have patches / ideas / roadmap how to solve that? It
> makes GPU unusable for computing, and camera basically unusable for
> video.
>
> Best regards,
> 								Pavel


--
Best regards,
Mikhail Rudenko

