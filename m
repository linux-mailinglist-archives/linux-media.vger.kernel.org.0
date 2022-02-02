Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B929A4A71B2
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 14:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbiBBNjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 08:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiBBNjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 08:39:24 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F8AC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 05:39:24 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id h8so11259311qtk.13
        for <linux-media@vger.kernel.org>; Wed, 02 Feb 2022 05:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wvI8+fq5NwJhv1RzuvS43KW6WaST1oKIsOMEW+n/iGc=;
        b=hrt2BrenUTn0oqko/tbsQQYhVqjxWCMpOP/ZNT0r/p9GgTZsX6A3BDmt+Fj6LBBS0B
         MTORenJWPL0Rwh1r7EeM1hZ6STgTsc8wilzirJRhzWBWlRnLcnvqDA84bT0ZqT0Kistd
         ILzRWkunV21Keqdi5VGACOykMkNDXcg2l2PCFN90gXdV76U7/CuLLGTkWiCz5jFxrNrB
         kwu/XkljmPXTv66WM3tbd1VxVyhMkZTKvmQ/3xFwaClO3ZhSqzZkHI4O4mZOI20s46Pk
         467+s82j5w6UrBLA5JrygGAKovLEIIWWE0vDVlUwuwfR3L35jrRnzcdVFdByoUEstQYc
         FCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wvI8+fq5NwJhv1RzuvS43KW6WaST1oKIsOMEW+n/iGc=;
        b=aK99EgCPUQLAKUviX3uYhxnT7+chJfJRjTB626fJ+ZIexQjwhxyp1jlS5bCMbNvagl
         1QFif3MC2ckYzMcCjk/sCvw291pMaG2qul3Fsq2HZhMBIwKI2yZ/YMd2841YKfytb4Dv
         Mh++qOX2oexdE50xP4fwhmLygc9NuLoulDhFRAhhbbeHd7aVr93RV5IE5lDj9MDXBCDK
         ZpIGTpa8mMA0uWYLfD9RQ2Sx7zm6M+vJY7Kn17Zt0ScSs/4ekyZa3aPMFjvZQDZLVC03
         ZT2zBcEE4FJmYq/Ns9JbQVDDNq9oCwOGNB+0c5X0OOVF3A4rSqBpvzEhuWd2FR0Vg8N8
         vwKA==
X-Gm-Message-State: AOAM5335chBHN/LdRoomSrSMFBudtuHvn2V0i/xrmizhZge4RlPTdVrM
        nA3YisWF3UamGal6AnA9LI35Lg==
X-Google-Smtp-Source: ABdhPJy/CcKF7rXg24vQZYNDLntdEpC/WRxoncO2P5Zy7ES0AUM5g1+xFsPlM/ptyCgjXG4wPz1+DQ==
X-Received: by 2002:ac8:7c55:: with SMTP id o21mr10501554qtv.659.1643809162967;
        Wed, 02 Feb 2022 05:39:22 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id a22sm4487180qtx.38.2022.02.02.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:39:22 -0800 (PST)
Message-ID: <ea89b3035a34ce017057439fef42ea7884967955.camel@ndufresne.ca>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adam Ford <aford173@gmail.com>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Date:   Wed, 02 Feb 2022 08:39:21 -0500
In-Reply-To: <CAHCN7xKSwdmPYXcQ24dpUyapOP8+54pc3YJZgj74opTneocujw@mail.gmail.com>
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
         <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
         <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
         <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
         <CAHCN7xKSwdmPYXcQ24dpUyapOP8+54pc3YJZgj74opTneocujw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 02 février 2022 à 05:01 -0600, Adam Ford a écrit :
> On Mon, Jan 31, 2022 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
> > 
> > On Mon, Jan 31, 2022 at 8:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > 
> > > Le vendredi 28 janvier 2022 à 12:43 -0600, Adam Ford a écrit :
> > > > On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > > 
> > > > > Hi Adam,
> > > > > 
> > > > > Jernej and I had to deal with user report which show a stride issue with the G2
> > > > > on Allwinner H6.
> > > > > 
> > > > > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-h6-and-r40-boards/?postID=166086#post166086
> > > > > 
> > > > > We quickly found that the stride alignment set to 16 needs to be 32. Though we
> > > > > noticed that this is only needed when using the G2 postprocessor (NV12), while
> > > > > it worked fine with tiles (NV12_4L4).
> > > > 
> > > > Out of curiosity, would it hurt to make the G2 alignment to be 32 even
> > > > if it's not required?
> > > 
> > > Aligning tile to 32 can be complex, I don't think the code is ready to handle
> > > padded tiled buffers. About the post-prob, I'd like to first understand why is
> > > this.
> > > 
> > > > 
> > > > > 
> > > > > We were wondering if you, or anyone here on the list could test this on IMX8MQ
> > > > > and IMX8MM. We'd like know if this is specific to the older G2 on H6. To trigger
> > > > > this, you need a video with a resolution like 1552x1080 as used in the report.
> > > > > We can help you get one if needed.
> > > > 
> > > > If you have a video you want me to try and instructions on how you
> > > > want me to test it, I can give it a shot. The imx8mm doesn't have a
> > > > video display driver yet, but I think the imx8mq does.  I am not as
> > > > familiar with that board as I am with the 8mm.  The testing I have
> > > > done to date has only been done with fluster.
> > > 
> > > If you have fluster/gstreamer ready, and some display, I suppose you can try and
> > > kmssink (worked for me with the vendor display driver). To get the same video,
> > > you can probably download temporarily that youtube video with youtube-dl,
> > > careful not to share the file, this is copyrighted content, but it ease testing
> > > and debugging, so I suspect it falls in fair use (INAL).
> > > 
> > > youtube-dl -f 248 https://www.youtube.com/watch?v=TUVcZfQe-Kw
> > > gst-launch-1.0 filesrc location="Dua Lipa - Levitating Featuring DaBaby (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec ! videoconvert ! kmssink
> > 
> > Sounds good.  I have a few tasks to do before I can get back to this,
> > but I'll try to do it later today or tonight.
> 
> From what I can see, the HDMI driver for the imx8mq isn't available in
> the kernel, so I cannot get video.  The NXP branch which has video
> doesn't have the hantro drivers in question, so this isn't going to be
> an easy task, because I cannot get video out of the imx8mq right now.
> 
> On the i.MX8M Mini, it's missing the DSI driver which is the only
> video output supported by the Mini, so I can't get video out of it
> either.  The NXP branch has the same limitations.
> 
> I could potentially attempt to run the video through the decoder and
> then video convert to some still images or a different video format to
> playback or review on a different device.  Let me know your thoughts
> on that.  i am downloading the Dua Lipa video now, so I could
> potentially try something when its finished.

Ok, that would be best you can try indeed, normally running few frames through
software converter and recording as mjpeg could work to reproduce this. Thanks a
lot of this and sorry for the difficulty, let's hope the display driver
situation on these boards get better soon.

> 
> adam
> > 
> > adam
> > > 
> > > regards,
> > > Nicolas
> > > 
> > > > 
> > > > adam
> > > > 
> > > > > 
> > > > > regards,
> > > > > Nicolas
> > > 

