Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1C34A6F4D
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 12:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245663AbiBBLBX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 06:01:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232455AbiBBLBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 06:01:23 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3310DC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 03:01:23 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id g15-20020a17090a67cf00b001b7d5b6bedaso5646009pjm.4
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 03:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qyYOsEOUq36I4BRWfhOWsG13whbc23zT0YarYsaZNnw=;
        b=XbMhdnOmtyjukFBxlZzVW708GqcsW4IaiHe4xQzd3WzPrjHBluEzGeTakgCDBTfRnj
         SwAeT5Vyga+c9jmoVOpGRWlLPcMXf3jGYSFLX8E+HjrK/fLlpB5QkNbViYsrjjlI7ttm
         eph6kMQHu66UeZE9/a+tJn8xaVYcw1HuIdAQXw7jizodHdXIdjYJvmEC+2vIXMApx6nN
         1jiKFN+nk3b4FGK+aAEQGnBO/OJS2MYpRlAHH2T0QUdnSF0bdwE+Y2bSuYPvd9pwZOri
         y42ZC+MGHz/+883/RYKDa5R9mfix3tkzA9cwVKw05QFa7xWDx+A8VUJFDpDHzHKx4MyF
         X+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qyYOsEOUq36I4BRWfhOWsG13whbc23zT0YarYsaZNnw=;
        b=BPxbnCtmwT4qRFD/TJpGnjtaS4BEvFOXKGs4vwMXTyMGFvhUbop8gSzUOAZu3aNU+f
         8zQV6LSReuCP5gfJstMua01pxQ4d7fDmyiiUO4D5EyEJ+ZyE5vhyJAdg3KEgg6y7DewI
         RBIEXSpADcUDqpMRzxlAqgpwDmn0Ly36VnOsQVChaIhrss+t1HxbvvsBJriR0C5t4QzS
         k8sz2VIWqpNLV90sUZCia6BqT8IwAYoZcY1Yw+b733j7W1SM6iIIztw/0F0kv2pl14pe
         vVaEj/RoZhVKXOZ35A2pi3OG93KqoE+rH/IPLadBBPbl5Qgwhkpai4YHoC6tEQoQjrNN
         U8VA==
X-Gm-Message-State: AOAM53277MKQcTgabqYFIzIwWzX3g2CRV8vZuz7eFn/r640WEMYh+tRd
        uXgWOiRhpcoXsxkdEdScOSobS/o3xJCkdFkEg8oblKOK
X-Google-Smtp-Source: ABdhPJzjjOrrXoSjyQ03OxynLYMxWx9FOCtVo+gdKMr2Mu7Qxc3ME8YmRntb/VR7muBBDv3pkYixzEjhW1Uz0LkC7Ks=
X-Received: by 2002:a17:903:1104:: with SMTP id n4mr29881365plh.10.1643799682516;
 Wed, 02 Feb 2022 03:01:22 -0800 (PST)
MIME-Version: 1.0
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
 <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
 <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca> <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
In-Reply-To: <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 2 Feb 2022 05:01:11 -0600
Message-ID: <CAHCN7xKSwdmPYXcQ24dpUyapOP8+54pc3YJZgj74opTneocujw@mail.gmail.com>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 31, 2022 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Jan 31, 2022 at 8:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >
> > Le vendredi 28 janvier 2022 =C3=A0 12:43 -0600, Adam Ford a =C3=A9crit =
:
> > > On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > Jernej and I had to deal with user report which show a stride issue=
 with the G2
> > > > on Allwinner H6.
> > > >
> > > > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h=
5-h6-and-r40-boards/?postID=3D166086#post166086
> > > >
> > > > We quickly found that the stride alignment set to 16 needs to be 32=
. Though we
> > > > noticed that this is only needed when using the G2 postprocessor (N=
V12), while
> > > > it worked fine with tiles (NV12_4L4).
> > >
> > > Out of curiosity, would it hurt to make the G2 alignment to be 32 eve=
n
> > > if it's not required?
> >
> > Aligning tile to 32 can be complex, I don't think the code is ready to =
handle
> > padded tiled buffers. About the post-prob, I'd like to first understand=
 why is
> > this.
> >
> > >
> > > >
> > > > We were wondering if you, or anyone here on the list could test thi=
s on IMX8MQ
> > > > and IMX8MM. We'd like know if this is specific to the older G2 on H=
6. To trigger
> > > > this, you need a video with a resolution like 1552x1080 as used in =
the report.
> > > > We can help you get one if needed.
> > >
> > > If you have a video you want me to try and instructions on how you
> > > want me to test it, I can give it a shot. The imx8mm doesn't have a
> > > video display driver yet, but I think the imx8mq does.  I am not as
> > > familiar with that board as I am with the 8mm.  The testing I have
> > > done to date has only been done with fluster.
> >
> > If you have fluster/gstreamer ready, and some display, I suppose you ca=
n try and
> > kmssink (worked for me with the vendor display driver). To get the same=
 video,
> > you can probably download temporarily that youtube video with youtube-d=
l,
> > careful not to share the file, this is copyrighted content, but it ease=
 testing
> > and debugging, so I suspect it falls in fair use (INAL).
> >
> > youtube-dl -f 248 https://www.youtube.com/watch?v=3DTUVcZfQe-Kw
> > gst-launch-1.0 filesrc location=3D"Dua Lipa - Levitating Featuring DaBa=
by (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec ! vid=
eoconvert ! kmssink
>
> Sounds good.  I have a few tasks to do before I can get back to this,
> but I'll try to do it later today or tonight.

From what I can see, the HDMI driver for the imx8mq isn't available in
the kernel, so I cannot get video.  The NXP branch which has video
doesn't have the hantro drivers in question, so this isn't going to be
an easy task, because I cannot get video out of the imx8mq right now.

On the i.MX8M Mini, it's missing the DSI driver which is the only
video output supported by the Mini, so I can't get video out of it
either.  The NXP branch has the same limitations.

I could potentially attempt to run the video through the decoder and
then video convert to some still images or a different video format to
playback or review on a different device.  Let me know your thoughts
on that.  i am downloading the Dua Lipa video now, so I could
potentially try something when its finished.

adam
>
> adam
> >
> > regards,
> > Nicolas
> >
> > >
> > > adam
> > >
> > > >
> > > > regards,
> > > > Nicolas
> >
