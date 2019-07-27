Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45BEB77BCE
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 22:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388385AbfG0U21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 16:28:27 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:38464 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388361AbfG0U21 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 16:28:27 -0400
Received: by mail-ua1-f49.google.com with SMTP id j2so22550807uaq.5
        for <linux-media@vger.kernel.org>; Sat, 27 Jul 2019 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fMbbodNFydEAI5BujyMFcssC10KaMXYZ3lyhVnD926Y=;
        b=vMnxLpkdgdUc2CI2y6ZVuiiXtai1AIDM6sDFaXaRvE6nnH08RX7WSrB+lffet418/9
         yNo/1hMoClPTpE4/haUfghN1+MP2hCq0QaKcrAU6W1Y6/5VZXHOPOvnuYcbFhcoR0/Gf
         MSVUuaH3ImCkJQx8JnjOkjZVP/Wj+7NIVR5bTQLgidlILhwy42vV4QhRZzMNdDhSNMl0
         29NxRVFBl7+IbUMD8hiVT5oa6dksBtpb25ghEFuRb1hYByxXi8Ge7mzWySNxaizDnl3i
         Ndzwylwazs0sYNkzpGRjezgU7ul2wApJeB4rQ8pI9GYGGDwmK4gU2O+4buGY4H3lIMS5
         fOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fMbbodNFydEAI5BujyMFcssC10KaMXYZ3lyhVnD926Y=;
        b=t0l2Wu5uyj7Cev3w9qpCNeZ103080fQg18AQtX5PCIQBa+sY44FVIhwAHQXi9FCwJk
         vnI4UnINzfsTphxJ3bus0XIAyHuuXDahd0LxwTBZpuwllcKglbbFxiLOhkZX9kcd+DJ/
         3RF9sHW666NG+N+reP8OStF9dRQi3mwkFPLC8mkra5gcj+oSjB0aLt82XjLyc2SRGe6i
         MUIgool2k5bSJseP64xaPjaNHZH5b5qaM8TEoh/ItMzz1ARfV4POH7i9o3csszsRa8iW
         e5/Iks4tcbGnEQ7Dw9IC64hymH43CQECcJPhQywNqm8GWsGptDgtVvkMzj5NYuBBxZby
         hZeg==
X-Gm-Message-State: APjAAAWxZOhChE9iQF1jTSR3qeVPmKwTibf0IHnO/81NdzuYkgbruYH7
        A+c0Yk9AsVcGLNiNVeLZ8WGzP3KHivdQOIcXEE4=
X-Google-Smtp-Source: APXvYqwrjQJA8B9x9gg9okOVliBBNpOOHdoiXDuIqJhFgzfq2FsCps6s6i+sidtFuAwOZz9/YcuAhWqGPwfrTWAJvsA=
X-Received: by 2002:ab0:7555:: with SMTP id k21mr1732245uaq.0.1564259306034;
 Sat, 27 Jul 2019 13:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <84ab52c4-9ea7-c526-c628-47d678ccf926@gmail.com>
 <CAAEAJfDgEVMWbYkEaVp0mp4hQXbhZq8xJQM8xqCXGmyq7OaP9w@mail.gmail.com>
 <2586e6ca-da28-ac87-35dc-dfa6ae66f67d@gmail.com> <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
In-Reply-To: <35ebabef-46cc-f4d0-3e88-3d8f4243c685@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 27 Jul 2019 17:28:15 -0300
Message-ID: <CAAEAJfCzcUw6j8GohnSNtD-ReLexmj6-qdmSm7_r342buy6-sQ@mail.gmail.com>
Subject: Re: tw686x driver (continued)
To:     =?UTF-8?Q?Mark_Balan=C3=A7ian?= <mbalant3@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mark,

On Wed, 24 Jul 2019 at 09:25, Mark Balan=C3=A7ian <mbalant3@gmail.com> wrot=
e:
>
> Hi Ezequiel,
>
> (sorry didn't include linux-media in first email)
> I'm not sure yet if I have my supervisor's permission to declare our
> tool as open source, but I'll tell you the possible code paths that I
> think may be leading our tool to think what it's thinking.
>
> First off, it detects a write access to desc->virt without locks inside
> tw686x_memcpy_data_free, after it is called in the calling chain
> tw686x_probe -> allocate an interrupt line -> tw686x_video_init ->
> tw686x_set_format -> tw686x_memcpy_dma_free. Further,
> spin_lock_init(&dev->lock) (line 319 of tw686x-core.c) isn't
> correspondingly closed in the function. Is this intended?
>

Yes, it is intended.

> Second, there is a possibility according to how I have traced a call
> chain that tw686x_init is going to the error: label since
> tw686x_memcpy_dma_free is getting called inside another possible calling
> chain, going tw686x_init -> tw686x_video_free (error: label) ->
> dma_ops->free (i.e. tw686x_memcpy_dma_free). I would assume this would
> not be intended either.
>

I'm not sure I understand what you think it's not intended, sorry.
