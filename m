Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7CB4A8E08
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 21:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355187AbiBCUfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 15:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243317AbiBCUdo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 15:33:44 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9925C061794
        for <linux-media@vger.kernel.org>; Thu,  3 Feb 2022 12:33:09 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id u24so8432672eds.11
        for <linux-media@vger.kernel.org>; Thu, 03 Feb 2022 12:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5oNl6s957qlPTmERZqTbxGOneWeouvQaTRsBpRS3u6I=;
        b=K/yCIjj0sjCFks6s8dssWbsBPGd9NCm2rBMDaBBw6sGIqdVn6wqS3SYZxw3h7bHkzA
         T0OD+1pLp/wsTF24lSDrdO1A3gQOs830qmK2YxqJjeoWrOgWJciX3zDUzuYgJUITCDWv
         S4A1JFw5nVHkNr91AFcCd3UfSsdI+fdjP8Q29qrwOwZ8g+mfIiAYcYPfty4473qbjzod
         3nud0P94A8pEnd31Ud3AjMUAMPiVt42ZUO5yCTwgIpxqNfdl5Rue9fWcNWI2I3fsQ7aC
         oYRYrLkFQfW2uCN8fyGW2GWQe//MXK7WhwEpsH2wySjIo2KYGeim6iZQURS+ePV6nloi
         szFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5oNl6s957qlPTmERZqTbxGOneWeouvQaTRsBpRS3u6I=;
        b=QORE8adxCxwCDCr6t0J4Z4uXdTLa1c2I4Lq+we0fVGs28drqTQYcB9vNYSpwQmSr2j
         R8NpFeg5OpZJZmFy0HMKGdFq/LX7XreohgwH2LxeeFcle7/auuEW3mEXpCRjWB+vXPs/
         sElG6ZiDoRrAtV47c0nq3pJXnOgT30FPuoj3A0gMyXycrCHuFTcuTwEIBY9+Z2yuX6wS
         hYF0e0dXkTfAoM5kEKW4iM2EzlSFdcUG1CMR3c6y61PPznB48OpWAotgBBaGfIy7pVgY
         E3Zi6VDA4vOXGqyZAfbymyiLuSGkZm+fru3uWcReHFMf2StRXiidLJ+QFIYPhNRaniL5
         2Qlw==
X-Gm-Message-State: AOAM530BYpWWkZxrzrlO3wyL20tAbkg+9UUZ14e4Rxn6YT6OGpgso9vd
        bpWSiGwWMfEN1TRK6Rs2Vu2u01bzwSxpOveU0aJTgCCG608=
X-Google-Smtp-Source: ABdhPJzR52ZTnRaUhgSxkAF6qgyIHTJTwiD3Ykrf1OzRQXUvPtT7x/i95hOfL+YlVXYOLTml6AaLztXNDr/WAofE2fQ=
X-Received: by 2002:aa7:cfd1:: with SMTP id r17mr15531654edy.439.1643920387874;
 Thu, 03 Feb 2022 12:33:07 -0800 (PST)
MIME-Version: 1.0
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
 <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
 <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
 <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
 <CAHCN7xKSwdmPYXcQ24dpUyapOP8+54pc3YJZgj74opTneocujw@mail.gmail.com> <ea89b3035a34ce017057439fef42ea7884967955.camel@ndufresne.ca>
In-Reply-To: <ea89b3035a34ce017057439fef42ea7884967955.camel@ndufresne.ca>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 3 Feb 2022 14:32:56 -0600
Message-ID: <CAHCN7xLODYVO9ZZZV42RMU1oRCYKhTBiCSnT-6-_uSWH3b77WQ@mail.gmail.com>
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

On Wed, Feb 2, 2022 at 7:39 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
>
> Le mercredi 02 f=C3=A9vrier 2022 =C3=A0 05:01 -0600, Adam Ford a =C3=A9cr=
it :
> > On Mon, Jan 31, 2022 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Mon, Jan 31, 2022 at 8:29 AM Nicolas Dufresne <nicolas@ndufresne.c=
a> wrote:
> > > >
> > > > Le vendredi 28 janvier 2022 =C3=A0 12:43 -0600, Adam Ford a =C3=A9c=
rit :
> > > > > On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufre=
sne.ca> wrote:
> > > > > >
> > > > > > Hi Adam,
> > > > > >
> > > > > > Jernej and I had to deal with user report which show a stride i=
ssue with the G2
> > > > > > on Allwinner H6.
> > > > > >
> > > > > > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-=
h3-h5-h6-and-r40-boards/?postID=3D166086#post166086
> > > > > >
> > > > > > We quickly found that the stride alignment set to 16 needs to b=
e 32. Though we
> > > > > > noticed that this is only needed when using the G2 postprocesso=
r (NV12), while
> > > > > > it worked fine with tiles (NV12_4L4).
> > > > >
> > > > > Out of curiosity, would it hurt to make the G2 alignment to be 32=
 even
> > > > > if it's not required?
> > > >
> > > > Aligning tile to 32 can be complex, I don't think the code is ready=
 to handle
> > > > padded tiled buffers. About the post-prob, I'd like to first unders=
tand why is
> > > > this.
> > > >
> > > > >
> > > > > >
> > > > > > We were wondering if you, or anyone here on the list could test=
 this on IMX8MQ
> > > > > > and IMX8MM. We'd like know if this is specific to the older G2 =
on H6. To trigger
> > > > > > this, you need a video with a resolution like 1552x1080 as used=
 in the report.
> > > > > > We can help you get one if needed.
> > > > >
> > > > > If you have a video you want me to try and instructions on how yo=
u
> > > > > want me to test it, I can give it a shot. The imx8mm doesn't have=
 a
> > > > > video display driver yet, but I think the imx8mq does.  I am not =
as
> > > > > familiar with that board as I am with the 8mm.  The testing I hav=
e
> > > > > done to date has only been done with fluster.
> > > >
> > > > If you have fluster/gstreamer ready, and some display, I suppose yo=
u can try and
> > > > kmssink (worked for me with the vendor display driver). To get the =
same video,
> > > > you can probably download temporarily that youtube video with youtu=
be-dl,
> > > > careful not to share the file, this is copyrighted content, but it =
ease testing
> > > > and debugging, so I suspect it falls in fair use (INAL).
> > > >
> > > > youtube-dl -f 248 https://www.youtube.com/watch?v=3DTUVcZfQe-Kw
> > > > gst-launch-1.0 filesrc location=3D"Dua Lipa - Levitating Featuring =
DaBaby (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec !=
 videoconvert ! kmssink
> > >
> > > Sounds good.  I have a few tasks to do before I can get back to this,
> > > but I'll try to do it later today or tonight.
> >
> > From what I can see, the HDMI driver for the imx8mq isn't available in
> > the kernel, so I cannot get video.  The NXP branch which has video
> > doesn't have the hantro drivers in question, so this isn't going to be
> > an easy task, because I cannot get video out of the imx8mq right now.
> >
> > On the i.MX8M Mini, it's missing the DSI driver which is the only
> > video output supported by the Mini, so I can't get video out of it
> > either.  The NXP branch has the same limitations.
> >
> > I could potentially attempt to run the video through the decoder and
> > then video convert to some still images or a different video format to
> > playback or review on a different device.  Let me know your thoughts
> > on that.  i am downloading the Dua Lipa video now, so I could
> > potentially try something when its finished.
>
> Ok, that would be best you can try indeed, normally running few frames th=
rough
> software converter and recording as mjpeg could work to reproduce this. T=
hanks a
> lot of this and sorry for the difficulty, let's hope the display driver
> situation on these boards get better soon.

I ran about 15 seconds of the video through the decoder, then encoded
it with the JPEG encoder into an avi.

gst-launch-1.0 filesrc location=3D~/dl.webm ! parsebin ! v4l2slvp9dec !
videoconvert ! jpegenc ! avimux ! filesink location=3Dmjpeg.avi

I can send you the AVI if you like, but the output image looked good
to me when I played it back on my desktop computer.

Please let me know if there is anything else you need me to do.

thanks,

adam

>
> >
> > adam
> > >
> > > adam
> > > >
> > > > regards,
> > > > Nicolas
> > > >
> > > > >
> > > > > adam
> > > > >
> > > > > >
> > > > > > regards,
> > > > > > Nicolas
> > > >
>
