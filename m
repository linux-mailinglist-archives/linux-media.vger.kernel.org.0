Return-Path: <linux-media+bounces-43128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B12B9DBC1
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 08:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABACF3B0110
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 06:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA07B2E8B8F;
	Thu, 25 Sep 2025 06:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNsR6weW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EDA3C01
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758783265; cv=none; b=kOknF2zpG4u+E5pTGw2Zf4FUrr2kp7+ZY7SOH27MX48YvOrCV8+jPASytDeXXgW4RRKaoAVxVoq3e4qlcyZNq6/mX8kZvUCpi8T9rT/xKb1cKVCGsPHSk7J81hG7y4By6UKQs+BMIEeR2eshdQIrb8CQa1REZW9jtVJrTRWI0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758783265; c=relaxed/simple;
	bh=17a4zkGgaa//HU7iZsn7gwYHjY/+I8XSpvL2JrgelU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tVo2A/FVzzJQVO3hKlDxhBpKeOCW8pmc6BsNEGjghtmXGM3Q1oNvo5xRYroNpHDM7QO8GeHTAuzn+y8O1RCdSE6G/W2rFWUdWzAPDKrLmWynpBrKvUD1xF+2h8ksRXtUQtHInJkWAWs1K5mHLIkKURZjHQ5LhaxNmUxDjewWCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNsR6weW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77d94c6562fso789193b3a.2
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758783263; x=1759388063; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17a4zkGgaa//HU7iZsn7gwYHjY/+I8XSpvL2JrgelU4=;
        b=RNsR6weWh2KvqIvp+BR4V0wpY5b4C5bwdmAzMHsgDCRHRFZr5LFyUjKq21TVlXm1bS
         dHuW1xn0atSbmycvT9OnUKH5krs3gSd9plNrL7EgEvt+zKH/VCyO1C1jw73AooSY5zRv
         0JGbYlfpXPQ48ZpPDWqJpm8E+gvqlGfyonTP5+0ck5anIK7Z6Svg6Xg7PVzEUtg1SfVG
         W5Q3nqZNbejPZU6Ui4jsazSeHnExoGNkpsi0ICcDvunhFvcJsmSSgN4xs/ecTHio9dsZ
         oFn4ugnLpmaKSUvLjZrGcszh7dWRuN2mE4HA+ANhPR/v5jsUWVFHVltHD14gdZDH0t3u
         keFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758783263; x=1759388063;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17a4zkGgaa//HU7iZsn7gwYHjY/+I8XSpvL2JrgelU4=;
        b=UpJ7sqf+dFJbJ0crpQ1EyPPmlaW0RJCIcvCfxA6lduHRiZ4mPZ+oE79d+tGiYDzW9B
         DbiYpHJypYgPeT62HfBQ5KlU2PLIDt3rKmjj8icYIKItwJNv2QG1IdYX+Bc/wSkay+YJ
         ofIvGXFAkpD3yjktkL7fkSsx6tjzM+XEqzex5rE0NmwdzUczhDulJo5jc+JZh6PoupFM
         tKKktf8QL1n3Axfcd8WUsaYMscEcDpOdGgQ0TDfl+F5cwQNScz4RqIeoy4nOwa1oiN+t
         lbSTkz0J6uJYxHE6vrJPHB4j0xHnu3+3dgttWrV4io54Zy6R9B/U5zbsrhnVdDdjiD1l
         9Pwg==
X-Gm-Message-State: AOJu0YyV7qcy7AhNvSCKSEg/4bQlwwaGur9Chw9Tpb2wXl4GK3A+d3A6
	+5+nfSjZi2Bzwf6/LEeMpDWc6BL8XGkw5IweV8h6i4TUv1o23vpOskjruvDhZ6oOv7RPeNo8EVc
	8HmIF1NaIZ4ViI7BzANlC+dD1qdimafz75Q==
X-Gm-Gg: ASbGncs0tYk1UM/D3j5EaU+3rkbCBbltw/4YeSfMP+bHrAjaum15LfwXIKB5dVEt4Tx
	/gNKnneZvtnH+Nh9NjHqtsbll9F0BQYxC0XFuCiZp0VvONCufN88kgKSHEJ5wTjAfvAO4BBlUGB
	hzehm6vr1Ru58RVS2HjNJQ4kMqB3jtk+8ABJtoq6go4mruCxO6NDLwwMlUJAdvkQ9T61wXVhPhm
	JmPbXi/qPrxx2NS67YwNqPTkqXDOiYAVDaoDZhZjj1MOBM5mtyenGKoJaKLPxE45meGPwXHb+lG
	I88=
X-Google-Smtp-Source: AGHT+IGve+nxiZi2uPfJt996xXcMSvFaismW7B5q4duYfThwjLHRAyytlU46E9wHrdXLrW+X22r1XQ08Q1oHf9XMNCU=
X-Received: by 2002:a05:6a20:a10d:b0:262:1611:6527 with SMTP id
 adf61e73a8af0-2e7d0db0885mr2963565637.35.1758783262866; Wed, 24 Sep 2025
 23:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250913105252.26886-1-opensource206@gmail.com>
 <68c55d70.050a0220.2634f5.389c@mx.google.com> <CAKPKb89xmoyH2gs=B3QhS4HxAUGc0PKvsm2kQ2sEw1zicZS0wg@mail.gmail.com>
In-Reply-To: <CAKPKb89xmoyH2gs=B3QhS4HxAUGc0PKvsm2kQ2sEw1zicZS0wg@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Thu, 25 Sep 2025 12:24:07 +0530
X-Gm-Features: AS18NWBAQBojerw8_MX_zO6XaD8ySEyugyNRZMd79Bf0maY1GbcuINzsSxRoPHQ
Message-ID: <CAKPKb8-WPUJp9bHayp=iWQCA8i5pThnux+JenpX9Dk3tsxh8eQ@mail.gmail.com>
Subject: Re: [v3] media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence()
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 5:30=E2=80=AFPM opensource india
<opensource206@gmail.com> wrote:
>
>
>
> On Sat, Sep 13, 2025 at 5:32=E2=80=AFPM Patchwork Integration <patchwork@=
media-ci.org> wrote:
> >
> > Dear Pavan Bobba:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test virtme32-onlyvivid:test-virtme
> > Error running test. Final Summary not found
> >
> > # Test virtme64-onlyvivid:test-virtme
> > Error running test. Final Summary not found
> >
> > # Test virtme32:test-virtme
> > Error running test. Final Summary not found
> >
> > # Test virtme64:test-virtme
> > Error running test. Final Summary not found
> >
> >
> >
> > Please fix your series, and upload a new version. If you have a patchwo=
rk
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/8442=
9906/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-a=
ll
> > to this message.
>
> This issue appears to be a setup issue.
>
> as per log, i can see below failure
>
> mount: /etc/lvm: mount point does not exist.
> dmesg(1) may have more information after failed mount system call.
> [ 73.430279] virtme-init: basic initialization done
> [ 73.580731] virtme-init: running systemd-tmpfiles
> /usr/lib/tmpfiles.d/legacy.conf:14: Duplicate line for path "/run/lock", =
ignoring.
> symlink(../proc/self/mounts, /etc/mtab) failed: Read-only file system
> [ 88.255808] systemd-tmpfile (96) used greatest stack depth: 12136 bytes =
left
> Error running test. Final Summary not found
> [ 107.331899] virtme-init: starting udevd
> [ 115.941117] virtme-init: udev: Starting systemd-udevd version 257.7-1
> [ 115.946095] virtme-init: triggering udev coldplug
> [ 131.892889] random: crng init done
> [ 166.780537] virtme-init: waiting for udev to settle
> Failed to wait for daemon to reply: Connection timed out
> [ 288.720366] virtme-init: udev is done
> [ 292.359663] ip (139) used greatest stack depth: 11816 bytes left

can you please review this patch?

