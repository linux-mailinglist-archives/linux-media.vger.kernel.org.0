Return-Path: <linux-media+bounces-48450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FDCAEE8F
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 06:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8181303658C
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 05:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15A526ED59;
	Tue,  9 Dec 2025 05:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy8WoOjt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39FB35959
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765256708; cv=none; b=EQVR6Wafg4Zmeq5geZv0qO38CvN7/73V0+EpxqqHDdNU7CmfiCJPEAjrOHAVA5/MYNaO1qlbDKa8fgWPE8j5qmNMHDXWtdkqQrMoYKl1SmQPlMN4NFxe1oo3G0relq/yXJl8bDvmxnj4yYWLSedEhIGvfKzeLTCbgrjgjFrxjQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765256708; c=relaxed/simple;
	bh=VKhBrbL8+x7gZTdCSaDw+vQZP0w+LS9ZNtIwIazQC8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bi1OlOVeuPexNIfa1whJ+kDKMcJkR9++FHYdzBaTwIdryVE4GeipObVVQx2kB++7Diu16z+XF5W5PVaxV1QoW3LtfKbfe/J3D9HZ7xFRGBZGCEzXiRfpPe4ch/Z18nVehoeh/Z674j0z3MRqdJGx2CjdJZ2quFHUXUnkmgZI4JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cy8WoOjt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-349b711d106so1946625a91.1
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 21:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765256705; x=1765861505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzG8Lv4izKRI54Zm6ylE8MVuW7xDTVLoZHgEtwEeF6Y=;
        b=Cy8WoOjttFuzy1qnzvW6tUZZj1E/P24labtUXtU+32wvPTJKM45MoztD9KFt6Ybljc
         zXOOE5cyjGV2Vek9n5l1UDnLB/3YkiC4jIvBnNVHoj/yBgqKV1/OCgDNymSzzzsUFLNQ
         5NQ2bRV6BH1F/BAUS5OJLynAOX+e4+pV3rRpdHhhZWog1sPc7D/tagisJ/bO+AQNZftu
         SB4gchKlSR354cX18GeUpGd3/n3AxXgGNuTQHl7UQVyCN/ITkuaQeeJiyI6NpleU28sa
         GiGdnju1zVk2YSlvSMaoq0QCyzjFoqQsYVMto8o1KaVrr25SGC6fMTAixUbPzWR5AScO
         urAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765256705; x=1765861505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PzG8Lv4izKRI54Zm6ylE8MVuW7xDTVLoZHgEtwEeF6Y=;
        b=u3EaFPNhCm1PMiqEjQSfIr7Ach4tndxon3IE5OCOuOCYuKRBJtXC5/dAUoXLqcQQ9q
         gf0HW5/Muz2bup28Ljiy3fg6xrSYCNawUn/OyWJI7XD07LEt0shFGhA3rq/zKIug31p/
         juAFyqZ7jve+Orjj2nuXwXpZVXrR6kLSjWQlbYG+ZfdZOQwauJRYNbaLOQSdN6Rk6q5B
         zug5om4xFhFfuWZrBSc6b2cqEkhRdyD3/5Vl62aCLbFbnf70ijWYnQY9aUEyUepQJTa4
         /M3yj6Q9J3ZwsEFhOPKJBdG9OUk6DFQjITp5+kN1ug6yyqmZ/A0hCTQHV+TndTF87C3f
         x2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU6c7h4vmRMfQ1jpmSMr+rD6IV77dJNCB0XnRi8cEYBVexgBnAecB5vjBBWPQzqEzeAFk+THynMj6EOwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+XrOd9mUtn2NW+oNjvLxCMOc2UIPUffiJxDUDASORSCT174G
	Lg5Qnl/0JzVFNTV1/z9tWA6nmizzm3UGDzF744ZqvuHSWmD4iks+qQ4lZ38V77zb4Z/PnxOlhlD
	h44+iUvxNtbl6DnJxqmq+Lq3FY/CUQoE=
X-Gm-Gg: ASbGncv4L+M1XyqDR/Nkse39e/9xbNQKkHD/5SrwNxRHaZTfrkWLTG8qbD9+fWmCVhx
	XRBRtHtNBCWxu5zqX93kd3sNfJRPlWO9AkGyW/1XKwD4mc3cBug96ClwBm2e0KdDmqIguFdCbw5
	AN503fw6R19CVldL6xLQ4bK2P0u8gpZ/aobihDkLBgZKhYuI2Y3svq627z6ragwHwu4GyPaRNCQ
	NC7Po4pKAN+fOrMsUmGYp5teKie7RqT/QCmaIM2Vrnd8tKrlc1nZWCfWyM3JtMyKBVAwy48NKtA
	ekYU7uMUaD6JjRM4snMF/zqw040vKg==
X-Google-Smtp-Source: AGHT+IF4/0KQEKnckCeRJBgFdqGYlMBtQhhst8qo1Oi7W3fS23tGCjRE/JpGn/afPX5JTKnOqWZ64GwPT5WOPuU4V+c=
X-Received: by 2002:a17:90b:558b:b0:341:124f:474f with SMTP id
 98e67ed59e1d1-349a26c129dmr7703718a91.32.1765256704776; Mon, 08 Dec 2025
 21:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120084926.18620-1-opensource206@gmail.com>
 <832f4621-53af-465a-a5e9-f7d65a082481@linuxfoundation.org> <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
In-Reply-To: <CAKPKb8-qyqMmp6c9OnO+AapRRJyE8ygtQUyuUqK8+C0LvMTYTg@mail.gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Tue, 9 Dec 2025 10:34:51 +0530
X-Gm-Features: AQt7F2pNh_idA69Mx7pk1hiY3an5uKdGz79q8wJhjRra0ARyg6uvKhym7EOGrGA
Message-ID: <CAKPKb8-8ctSewOwBk7fFUMVnb-F_gXnyXS8gd9xJ-fpnW1_ZYA@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: vimc: add RGB/YUV input entity and improve
 pipeline support
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 8:41=E2=80=AFAM opensource india
<opensource206@gmail.com> wrote:
>
> On Thu, Nov 20, 2025 at 10:08=E2=80=AFPM Shuah Khan <skhan@linuxfoundatio=
n.org> wrote:
> >
> > On 11/20/25 01:49, Pavan Bobba wrote:
> > > This series extends the vimc test driver with a new RGB/YUV input ent=
ity,
> > > pipeline enhancements, and documentation updates.
> > > Pavan Bobba (5):
> > >    media: vimc: add RGB/YUV input entity implementation
> > >    media: vimc: add support for V4L2_FIELD_ALTERNATE in vimc-sensor
> > >    media: vimc: debayer: add support for multiple RGB formats
> > >    media: vimc: capture: support custom bytesperline values
> > >    docs: media: vimc: document RGB/YUV input entity
> > >
> > >   Documentation/admin-guide/media/vimc.rst      |  39 +++-
> > >   drivers/media/test-drivers/vimc/Makefile      |   3 +-
> > >   .../media/test-drivers/vimc/vimc-capture.c    |  15 +-
> > >   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
> > >   drivers/media/test-drivers/vimc/vimc-core.c   |   3 +-
> > >   .../media/test-drivers/vimc/vimc-debayer.c    | 113 ++++++++--
> > >   drivers/media/test-drivers/vimc/vimc-input.c  | 210 +++++++++++++++=
+++
> > >   drivers/media/test-drivers/vimc/vimc-sensor.c |   9 +-
> > >   8 files changed, 352 insertions(+), 41 deletions(-)
> > >   create mode 100644 drivers/media/test-drivers/vimc/vimc-input.c
> > >
> >
> > Kieran and Hans, Do you have any feedback on this patch series?
> >
> > thanks,
> > -- Shuah
> >
>
> Hi Kieran and Hans,
> can you please review?

Hi team, can someone please review?

