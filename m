Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A278D30AFCD
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 19:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhBASxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 13:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbhBASxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 13:53:52 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD6DC06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 10:53:12 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id m76so11169436ybf.0
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 10:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dn7NIYZ1VyGeswbauJ5wCpEsYIDY7X20TQIV2GLEjbU=;
        b=ugP9zrEpKSVIKJBuTv6mc2xj6XqD4AzNQEmzIaqZomT0/mFWgaFPwWrWEmve04cKc0
         GTa6Yx0em4l5blB5yfp519mVpu9LwAv88QMcTDAbOwvYHd9RI6PBNcF8VikKBCVh/hva
         vipIftMXenvq5ah7NV9Vq5SkAratg5dmjP1KtUvtl+2XKrj9Qz51V2rNVtJIlqWvLKtS
         WzqfB3EEj8XvKwIuOoCAinVVjyemL/dIQJrDiLI8KA5vbKUAr43mXzrDM6UaHjOAeanA
         +c9ZeqfAXqvH3SWo9oPN7nQ1n3VN3WDtDigiV89FxDKattgsjrf/2SWJgdOZGvAytvYS
         9aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dn7NIYZ1VyGeswbauJ5wCpEsYIDY7X20TQIV2GLEjbU=;
        b=JiU40Ev//bdzEOqBXYocTMSotResT1+O9hQ4GsPb8lzqQ6jpozETk9FAlKSgiDovbP
         FjWSpk6DVD2uvUyjcb9+lw7A6eD0dni8tdNYwMMf2MDayDlg0ork5+7253MEv/3k4A7X
         7wcimeb47BoBa08AqqLP3ppkyA05aqAMCIWtWwcFD/cf9U54QBoxF3JidQ1+bwMlhLxo
         xqE2cYleGq0blTGHzV3T6kHf14LBINTBZC9h9qjtJJmfpZou8qPA0qrbpqWg2thrKWSS
         4MYoWaDtCOziQwY5JQtisMhCj2hFUz+k3/U0ItybDAsoK38cLzoFKiFAhTxgFSmXPjH7
         VRbQ==
X-Gm-Message-State: AOAM533BQthTaf/Ohq+DP2S6ja8WxkRZ2n4t629+ucUyImt7oOv6B0kN
        KnrIndthsUzPl4tEbE5h3sah/XHwmzUQ8SxiU/9VBRW6d7c=
X-Google-Smtp-Source: ABdhPJzWYBbUyHyOmia9zwtoa5PtP+rHUVAhRrATOwH3/baAs8af9wz6oBa3LlumRKITWBCpzhPq7dGOJPqOLuuvTQI=
X-Received: by 2002:a25:f54:: with SMTP id 81mr25797461ybp.76.1612205591569;
 Mon, 01 Feb 2021 10:53:11 -0800 (PST)
MIME-Version: 1.0
References: <CAMfZQbzay0+tyYvZmF_L=iYfp+F02iz3qz=a=J1Yuf55P=RebA@mail.gmail.com>
 <350a927bafbc6cf3e690db6f33bebbdafeb96d6d.camel@ndufresne.ca>
In-Reply-To: <350a927bafbc6cf3e690db6f33bebbdafeb96d6d.camel@ndufresne.ca>
From:   Fritz Koenig <frkoenig@google.com>
Date:   Mon, 1 Feb 2021 10:53:00 -0800
Message-ID: <CAMfZQbyipb18qLJwhSwA1QS+63BrRnkFQ6mLBPs-xQBWw3aEoQ@mail.gmail.com>
Subject: Re: V4L2 logging for multiple streams
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 1:45 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 15 janvier 2021 =C3=A0 20:33 -0800, Fritz Koenig a =C3=A9crit=
 :
> > Hi,
> >
> > I'm trying to sort some issues with regards to decoding multiple
> > streams at once.  Logging can be helpful with messages like this:
> >
> > [105188.500450] video2: VIDIOC_STREAMOFF: type=3Dvid-out-mplane
> >
> > but when I have:
> >
> > [105188.498697] video2: VIDIOC_STREAMOFF: type=3Dvid-out-mplane
> > [105188.498715] video2: VIDIOC_STREAMOFF: type=3Dvid-cap-mplane
> > [105188.499116] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=3D0x5, id=3D0x0,=
 flags=3D0x0
> > [105188.500450] video2: VIDIOC_STREAMOFF: type=3Dvid-out-mplane
> > [105188.500467] video2: VIDIOC_STREAMOFF: type=3Dvid-cap-mplane
> > [105188.500611] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=3D0x5, id=3D0x0,=
 flags=3D0x0
> > [105188.501879] video2: VIDIOC_UNSUBSCRIBE_EVENT: type=3D0x5, id=3D0x0,=
 flags=3D0x0
> > [105188.502276] video2: VIDIOC_STREAMOFF: type=3Dvid-out-mplane
> > [105188.502331] video2: VIDIOC_STREAMOFF: type=3Dvid-cap-mplane
> >
> > I can't tell which stream VIDIOC_STREAMOFF is associated with.  Is
> > there a logging option that I'm missing that would help indicate which
> > stream that ioctl is associated with.
>
> I suppose this is m2m driver ? I think it would be nice to trace some ins=
tance
> ID, otherwise indeed, if you have two stream on the same m2m device node,=
 the
> traces get confused.
>

Yes, m2m.  Instance doesn't seem to be a concept at that level.  The
driver itself holds an idea of instances (at least on venus).  I was
able to add debugging to trace instances in vdec.c, but I don't see a
generic way to add it.

-Fritz

>
> >
> > Thanks.
> >
> > -Fritz
>
>
