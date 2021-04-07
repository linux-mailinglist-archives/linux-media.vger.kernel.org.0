Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3302135674E
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 10:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349714AbhDGIzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 04:55:53 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34578 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349751AbhDGIzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 04:55:40 -0400
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
        id D3F8425BE42; Wed,  7 Apr 2021 18:55:28 +1000 (AEST)
Date:   Wed, 7 Apr 2021 09:55:17 +0100
From:   Carsten Haitzler <raster@rasterman.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
Message-Id: <20210407095517.c25902cb0222ca36a2bcbfa8@rasterman.com>
In-Reply-To: <20210407114404.13b41822@eldfell>
References: <20210407114404.13b41822@eldfell>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 7 Apr 2021 11:44:04 +0300 Pekka Paalanen <ppaalanen@gmail.com> said:

> Hi all,
> 
> with display servers proliferating thanks to Wayland, and the Linux
> kernel exposing only a very limited set of information based on EDID
> (rightfully so!), the need to interpret EDID blobs is spreading even
> more. I would like to start the discussion about starting a project to
> develop a shared library for parsing EDID blobs. This is not the first
> time either, other people have suggested it years and years ago already,
> but apparently it didn't quite materialise as far as I know.
> 
> Right now, it seems that more or less every display server and other
> KMS application is hand-rolling its own EDID parsing code, even for the
> most trivial information (monitor make, model, and serial number). With
> HDR and color management support coming to Wayland, the need to parse
> more things out of EDID will only increase. These things are not
> exposed by the kernel, and most of these things have no use for the
> kernel either.
> 
> My personal motivation for this is that I don't want to be developing
> or reviewing yet another partial EDID parser implementation in Weston.
> 
> I recall ponderings about sharing the same EDID parsing code between
> the kernel and userspace, but I got the feeling that it would be a
> hindrance in process more than a benefit from sharing code. It would
> need to live in the kernel tree, to be managed with the kernel
> development process, use the kernel "standard libraries", and adhere to
> kernel programming style - all which are good and fine, but maybe also
> more restricting than useful in this case. Therefore I would suggest a
> userspace-only library.
> 
> Everyone hand-rolling their own parsing code has the obvious
> disadvantages. In the opposite, I would expect a new shared EDID
> parsing library and project to:
> - be hosted under gitlab.freedesktop.org
> - be MIT licensed
> - offer at least a C ABI
> - employ mandatory Gitlab CI to ensure with sample EDID blobs that it
>   cannot regress
> 
> Prior art can be found in various places. I believe Xorg xserver has
> its battle-tested EDID parsing code. Ajax once played with the idea in
> https://cgit.freedesktop.org/~ajax/libminitru/ . Then we have
> https://git.linuxtv.org/edid-decode.git too which has code and test
> data but not a C ABI (right?).
> 
> It does not necessarily need to be a new project. Would edid-decode
> project be open to adding a C library ABI?
> 
> edid-decode is already MIT licensed and seems to have a lot of code,
> too, but that's all I know for now.
> 
> Would there be anyone interested to take lead or work on a project like
> this?
> 
> Personally I don't think I'd be working on it, but I would be really
> happy to use it in Weston.
> 
> Should it be a new project, or grow inside edid-decode or something
> else?
> 
> I believe MIT license is important to have wide adoption of it. C ABI
> similarly. Also that it would be a "small" library without heavy
> dependencies.

I'd say it needs nothing more than libc - I can't see the justification for
more than that. If this is the case along with the above you have given, then I
see no reason for it to not be used by everyone other than the usual user
complaint of "too many dependencies (of a compositor)". :)

I'd definitely consider using it.

> What do you think? Could anyone spare their time for this?
> 
> Who would be interested in using it if this library appeared?
> 
> 
> Thanks,
> pq


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com

