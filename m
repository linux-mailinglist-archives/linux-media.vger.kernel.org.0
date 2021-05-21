Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B3938C66B
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 14:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhEUMYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 08:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhEUMYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 08:24:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD85C061574
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 05:22:53 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q5so20879150wrs.4
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXzqoTh9Q6otGWSG/m2z4V/r+EdDHQXeOAwek5k1Apw=;
        b=fhGWDMtRWPPjaQRts6ngbU7RFDRPLZxsO/dYPBecxs11qDVpGOrqwFwTAclyPM2NM3
         nJP9nH1WfXkimY2pRXSwkgLLRAM1hH5iq2wdhk6yXFysmb/2V3dCMD+m/r8bCg5pCu20
         ytbeUFu8HYocl8xDkZD07SCx8OTWunCSNaeGb5HErEc3xvmS5tCcs72NgEZ5msvLwMmJ
         TOWwwzflosPbtN0ZPrkoNPsHKONhitwQCzjd2zYdQDaHymQK32IP8XUOxG5tKCfgtJrg
         sUALcf4OR6cFiuK4C+tykpV7nmZrJeviPP7dL+Zbes4wNiRGNZImMKgqKoXmpnF0BBeO
         sm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXzqoTh9Q6otGWSG/m2z4V/r+EdDHQXeOAwek5k1Apw=;
        b=cidfQNwyITwDBebB1b8UtR95ek6OieBBs4pYDWrKcW2RIJMTcwgzOm3kLNipvvxlXD
         MrPD4lI8XXiruTA4aHl7kq0rSVUxSf44nDfiqwu3k6/gJ6J27qc05ShHHpALJ7m3CTpi
         /NVRa6We8g4cpeiEaXVh7FdpQjkmh8O+V6tgmOHPyELaLaw55fzOuhC/7KXViLBPbAgU
         /5DvuwvQ546THcSOoJwSHdKl+Kb3Ku+40pMVUYivwRafhsvcV259XGNe8LhPGUNOCvAS
         dFR6D3piFiSRGijIMiH15Qg1rfayl4Es299TJfehv8cN9vxGpNLzK1HklKfitWIYIESO
         lTow==
X-Gm-Message-State: AOAM53161ceMRAXkVcXDxE+8HrbZ5DESFAt3J/X1IgA9+Wf8X82hpl1Q
        gPXxfd3MR4Oy7Z4DVF8Hga+/zV/GGcFg89b8pelWlg==
X-Google-Smtp-Source: ABdhPJzs6JDh/PVfFHAZiz0tvGCOrZlKRQmwz7h15e9g9pD1J/vW4gLLdrMc8KrEGPgbhOVJa3TJluupr6PSsDmH+Fc=
X-Received: by 2002:adf:e70e:: with SMTP id c14mr9371714wrm.6.1621599771623;
 Fri, 21 May 2021 05:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch> <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-4-daniel.vetter@ffwll.ch>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 21 May 2021 13:22:40 +0100
Message-ID: <CAPj87rMBVRamT+VAVUaUnq3C1KFVqzABi99RKs=1_vyb4YWDnQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/panfrost: Fix implicit sync
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Price <steven.price@arm.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 21 May 2021 at 10:10, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Currently this has no practial relevance I think because there's not
> many who can pull off a setup with panfrost and another gpu in the
> same system. But the rules are that if you're setting an exclusive
> fence, indicating a gpu write access in the implicit fencing system,
> then you need to wait for all fences, not just the previous exclusive
> fence.
>
> panfrost against itself has no problem, because it always sets the
> exclusive fence (but that's probably something that will need to be
> fixed for vulkan and/or multi-engine gpus, or you'll suffer badly).
> Also no problem with that against display.

Yeah, the 'second-generation Valhall' GPUs coming later this year /
early next year are starting to get pretty weird. Firmware-mediated
job scheduling out of multiple queues, userspace having direct access
to the queues and can do inter-queue synchronisation (at least I think
so), etc. For bonus points, synchronisation is based on $addr = $val
to signal and $addr == $val to wait, with a separate fence primitive
as well.

Obviously Arm should be part of this conversation here, but I guess
we'll have to wait for a while yet to see how everything's shaken out
with this new gen, and hope that whatever's been designed upstream in
the meantime is actually vaguely compatible ...

Cheers,
Daniel
