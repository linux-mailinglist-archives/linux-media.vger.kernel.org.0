Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24E0918B19A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 11:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCSKhl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 06:37:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38916 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgCSKhk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 06:37:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id h6so2167086wrs.6
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2020 03:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aMbbH78vtzNz6FzaZNsYSrHCSvTRdF6ZhflOWvgdIeE=;
        b=CyyRdX/Lh/aUkCw68SQUP3hmsgUYmQhf2vpEB9rExMW5rww5ebA/N1aIjEEM0ruURG
         VX54Sbh8Web7QVaQzpste8uj1KBUnehlsJtiJd/w6gfZzSlq5HESNtSIJNP8AHXSMxwI
         VQlxh9AsgbDdif/OCrtfQdzb2GaKPb29cVF28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aMbbH78vtzNz6FzaZNsYSrHCSvTRdF6ZhflOWvgdIeE=;
        b=TQf0PkHRg6IBvh4c5IEpWSasShCXQlpbEmVAu2DikmJ3ET9HmoMzwz6acIPPD9nEtP
         FNHwE/I0IC9EX1ECMpCpGWHV0X3E2WZQ5tM4NCdZCwC3pB+dbs1j+K2+Rq1z8xKBlsFe
         DvaZ744ZSQ/zDfO9uFh8PZ6c/S4aeshfjAD7c7gyKcphJNUUYK1i7v8szxvFr8QF4NeA
         xGXuw6ckLocV+DF3+BJsU2NvwT4fdknAYAMygT9QVJNFOxyszxYJiGl8l64NuBDbPlsM
         MrWd+tKLgFI57nNByUYYAYDXyWdjZt+sO5bWkfVEUv9S8KKIIunRAYdiexwYH/rluX8Z
         LzXA==
X-Gm-Message-State: ANhLgQ1yOLfosL1/Tgtd/XTi8UtAXB+GRmaRZRoiLFOmHOjQ+TaPKXd3
        MxnV6EDsdg+iZQuqsRt86nMqaQ==
X-Google-Smtp-Source: ADFU+vs4Y1GwgEZ9kTelPFUjLmBSBjvyy3vq98PvugmhHtxCAwTqdmcrRy04mUNrc7Ia6XpFx59A4w==
X-Received: by 2002:adf:bbcf:: with SMTP id z15mr3663283wrg.340.1584614258485;
        Thu, 19 Mar 2020 03:37:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id i8sm2765825wrw.55.2020.03.19.03.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 03:37:37 -0700 (PDT)
Date:   Thu, 19 Mar 2020 11:37:35 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc:     Lucas Stach <dev@lynxeye.de>,
        Jacob Lifshay <programmerjake@gmail.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>, linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
Message-ID: <20200319103735.GD2363188@phenom.ffwll.local>
References: <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14115064-24e5-da2c-38c6-f3ba0d447b18@daenzer.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 18, 2020 at 11:05:48AM +0100, Michel Dänzer wrote:
> On 2020-03-17 6:21 p.m., Lucas Stach wrote:
> > That's one of the issues with implicit sync that explicit may solve: 
> > a single client taking way too much time to render something can 
> > block the whole pipeline up until the display flip. With explicit 
> > sync the compositor can just decide to use the last client buffer if 
> > the latest buffer isn't ready by some deadline.
> 
> FWIW, the compositor can do this with implicit sync as well, by polling
> a dma-buf fd for the buffer. (Currently, it has to poll for writable,
> because waiting for the exclusive fence only isn't enough with amdgpu)

Would be great if we don't have to make this recommended uapi, just
because amdgpu leaks it's trickery into the wider world. Polling for read
really should be enough (and I guess Christian gets to fix up amdgpu more,
at least for anything that has a dma-buf attached even if it's not shared
with anything !amdgpu.ko).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
