Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B005C38C7D5
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbhEUNZm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhEUNZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:25:18 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75847C061346
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:23:51 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id n2so21157316wrm.0
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zBr2qa8weJ1fN+pyrA9yHt47NZiiPugqQIjjkfzP+jw=;
        b=Vo39h2GhwMLbJLo+/rJ8jKdDxxx7yt/+DuSYtdRMJYd/ewYSQQsrwCnOCge0+aOIM2
         9/KcfjejnPY8GM8mZ7TLh9EDtHEL/1jvG9ThrG9zg8eAz/GKa3MaVPVSMLnA4tV2yryY
         wubn8HMprLTyeofXBSRountcrg6j1SBLsPKvAsbxcvpmEVW7xAfjiqMlhxwraaQJlRHQ
         RBb6DN/tULEGgiS/IonVr9QgSxe37CitIuX4+gnFggRx+HHuCHA5loPr60vmuDY9nqZD
         rfQA3gO4qDA/z8bt5atk4ADkTZhfdIHY0OqxfaTHUZQut/UlgKWx4Let826C6h8Ly2d/
         GudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zBr2qa8weJ1fN+pyrA9yHt47NZiiPugqQIjjkfzP+jw=;
        b=A2iVD6QHnloIL+dO4kxQJYnhjQVBuELNmo4fUCoutY9SYcLai/iotJFwXbIErpi0Dz
         r9j7TczW/qXAKgdfnSB/XguGQDd8nEXnoXNtlNe05mb3GbrQT6crnHH9t+pOrHfD/dpF
         /UB/VsVLWQLoht6Mrmd2bSvyEZdKjRRhN+fG87J5KjzUrCG5cb+tBfZfIrcqc3CzwxMt
         WRBFXp1YLQZ8w0Fawt5+JOKJQQxKunBcphmO3xINpMSfdvDTa0bM2JJ0+pdSNdswHJIH
         KSzQBwy3oLJy3RDBDS/mwIDjC0x6ozB0bLDsmqHfhdeYe2L+0WrwhjfcruGSba4Fpvqr
         RIFg==
X-Gm-Message-State: AOAM533L2HWughJMkgb+nX6vTwrBGo85Y2vBI5FFcJQ9AcEF8r3o98qT
        f77VdT1YFLz9rI7cLSAN2uoKc127L/sF9qxK8YKZPw==
X-Google-Smtp-Source: ABdhPJyU8TEmXK/S6OXq7q8k124HIgHp5J7hILQzz4PXVCcZY3JiYAj8Ouwu177Y0/InrwMU7WBJIc4BjzJuyR8pTms=
X-Received: by 2002:a5d:6e04:: with SMTP id h4mr9422676wrz.256.1621603429939;
 Fri, 21 May 2021 06:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-4-daniel.vetter@ffwll.ch> <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
 <d1ef10e8-b774-06e5-92ab-047c58e1ea41@amd.com> <CAPj87rOzV1mC=Nv2zfsYXrD4ARV7cmmJmkUCSwRSw1Ksy0k-aA@mail.gmail.com>
 <39aa30e4-2726-a0ba-3537-3be609dbc0b5@amd.com>
In-Reply-To: <39aa30e4-2726-a0ba-3537-3be609dbc0b5@amd.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 21 May 2021 14:23:38 +0100
Message-ID: <CAPj87rOhByk-azt2jm=YV8WYSQH3g2+aJ83nG+5SywksXH3OYg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/11] drm/panfrost: Fix implicit sync
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 21 May 2021 at 14:09, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 21.05.21 um 14:54 schrieb Daniel Stone:
> > If you're curious, the interface definitions are in the csf/ directory
> > in the 'Bifrost kernel driver' r30p0 download you can get from the Arm
> > developer site. Unfortunately the exact semantics aren't completely
> > clear.
>
> Well it is actually relatively simple. Take a look at the timeline
> semaphores from Vulkan, everybody is basically implementing the same
> semantics now.
>
> When you queued up a bunch of commands on your hardware, the first one
> will write value 1 to a 64bit memory location, the second one will write
> value 2, the third value 3 and so on. After writing the value the
> hardware raises and interrupt signal to everybody interested.
>
> In other words pretty standard memory fence behavior.
>
> When you now have a second queue which depends on work of the first one
> you look at the memory location and do a compare. If you depend on the
> third submission you just wait for the value to be >3 and are done.

Right, it is clearly defined to the timeline semaphore semantics, I
just meant that it's not clear how it works at a lower level wrt the
synchronisation and signaling. The simplest possible interpretation is
that wait_addrval blocks infinitely before kick-cmdbuf, but that seems
painful with only 32 queues. And the same for fences, which are a
binary signal. I guess we'll find out. My tooth hurts.

Cheers,
Daniel
