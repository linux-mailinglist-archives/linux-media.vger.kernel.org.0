Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2681B1696
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 22:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgDTUDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 16:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgDTUDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 16:03:13 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F16C7C061A0F
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 13:03:12 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id d7so9968299oif.9
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 13:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkPZ7h9fC8BsOerRtlvvnGLGiIv/zlO9wzpVyiPuKMc=;
        b=epMez4Fb+Up3S68NxnNFOnpWEwXbOSZwcG9xUal/jTDNtl0iDX0wvM5AwLgguZaKk2
         VYiybnTi3K8r0kl1VPunCd4l2bsjDbbKTzFmV1hgY2nOq/gsbdPWi7WojRJ+V6X/rzI3
         4ZQNYR9i+OPhgunhzWKNyCGbB4XPliIPsiItVM7mu3ewb1H1TAmJ1rVPxEhBr8s3VS18
         iNYMMgqi30l7tdT7l0HAlR1GysStmNhd18nwLoNUx3H4B/4f9jhLdR9Fn6CS4gz2TS6B
         0nrFlUVXbZVSJNeFvvPSzvXcUAGTrzGa9Xe5yMq4DFw/GTN5OEgwAiMLSjCRbN/7BT5n
         Md1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkPZ7h9fC8BsOerRtlvvnGLGiIv/zlO9wzpVyiPuKMc=;
        b=geaCHHwP0WtiTWkKTMP9Td6rPHca6dUjWVlVSSV45qrW6ztnFWc7Pnt39Q6tiL0A0R
         nDApbIllNmcxCSIq3N4DI273SskwFszUIiQzJ17OjJt6B+slZdOHDtg/8YznZRpV5QOR
         DvixBZgaD7Bg8acHj/mKMHEm81n5vDz2D5xz5SL/s1a6zJOVYW/EtwZlUUKu4zRmGa6x
         7MrERa9MCptpWj4aEULUXFVQdZRCUUTKdNvbqwSBX2shC6lZz/XJDBAa4sZmXwsLSusp
         uRMeEFDRp7Og6ORIYnf8kVQi5QbK/knoz93FzMSEvt0rsBPz+LTuACoIMmNmh2MFmoh3
         Nk7g==
X-Gm-Message-State: AGi0PuYs7Dxsk3301oMDIluWoBMHLIc4TMPQJhOOGxKBPPnoy9a6cUjE
        609WmozPUesqD5ZvTDzZlE9c5+jIP3bijiuj5uQ=
X-Google-Smtp-Source: APiQypIwVI9p4MlBEyhyixaqkXiOCrtfwwoAxrfYr78XacAYYcYpXHd5Bvtvjn31sF8pY4LFI/+4l+vg7yswC53Kbsw=
X-Received: by 2002:a05:6808:3d5:: with SMTP id o21mr869258oie.40.1587412991962;
 Mon, 20 Apr 2020 13:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com> <20200420121942.GA22485@gofer.mess.org>
In-Reply-To: <20200420121942.GA22485@gofer.mess.org>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Mon, 20 Apr 2020 13:03:00 -0700
Message-ID: <CAKxU2N_s2VrcG9_5JFHTED+9Ufncg9+XEZc=E27L0YGFefQE2A@mail.gmail.com>
Subject: Re: How about a v4l-utils-1.20 release?
To:     Sean Young <sean@mess.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 20, 2020 at 5:19 AM Sean Young <sean@mess.org> wrote:
>
> Hi Gregor,
>
> On Mon, Apr 20, 2020 at 02:05:07PM +0200, Gregor Jasny wrote:
> > Hello,
> >
> > It's been a while since we released v4l-utils 1.18. How about a 1.20
> > release?
> >
> > Do you have anything that should go in before?
>
> There is nothing from me. There are few patches on the list from Rosen Penev,
> cleaning up various stuff found with clang.
I have two more series to send.

One of the previous patches introduced a regression where it cannot be
compiled with C++98 (no std::lround).
>
> Otherwise I guess there is the meson build system, but I don't know how far
> out that is.
meson is pretty useful as far as running clang-tidy is concerned.
Otherwise, it works fine.
>
> Thanks,
>
> Sean
