Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC4E4A9075
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 23:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiBCWKQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 17:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiBCWKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 17:10:15 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A28C061714
        for <linux-media@vger.kernel.org>; Thu,  3 Feb 2022 14:10:15 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id s7so1195004qvb.0
        for <linux-media@vger.kernel.org>; Thu, 03 Feb 2022 14:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7VjpD+SP2BAig8TNSDuuwH4CnhdEhM40oUJnZpFP4TU=;
        b=4Zw26Fk2nBNu5XqRdkCqJWkMJ52dWD5x642Ok6JPOT+1X7k+DVt7hqzccCGjh/b5JN
         faOwhp4dBwJ7Ii/C4YTv+YgOF8xF9ZU5PXxp/m8z60iObXmkpb3/6Z7eW2gQKRSvmbsP
         +B+65PnzHQSb+mt1o9iZFZD0hmwkQxao74KruJcU55rscBrH2T5Ho9Wo4I8Lrwu5yhWg
         HM5W2ANb3grNjR9J0vLQ/eDWlLKgD9W1dLeF/noN9pHRNn7STo2LstWqOfvJhZyjEEob
         GWrzajexDhiQrLQdAD/yvAKu/xUM0ECDiMe4copGFB5bAsUhHfYWUUtnYozOD89Ey082
         oavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7VjpD+SP2BAig8TNSDuuwH4CnhdEhM40oUJnZpFP4TU=;
        b=23NWYvGAAB9q8ZA9ewNCgPVIErdptTBcjkJX15UWJaaYEjPpICrVKqSmo2bYgrukf1
         Eg4uqSlH2oL0OYqaOKGLiHUfOb8VKHmOG54o+Bg+sZPC7+bI2OsHdY/qSNyFSAP3xJZ5
         ZOFYYV9F8MW1scwxJBQzJaHv+3wMrCXvHFD0+oHkoREDcQOZdbt7iIjE41jfDO6dx7Ad
         hQilY6T1k1fUQ2f2zTfZpIVaVcvPPel9/333/C00Ihj9aG3dPdP/IxRyenX2M1w0lJ2x
         cl+4Q1SMjyq4Sug/EFkU1ZZ3yxI5fTW3fkdYfcZeiNbUuTvZkGc9+J/6lgkW0CWc0zI6
         ZHVg==
X-Gm-Message-State: AOAM531Fya0AEQIJdNagIsOZIblzQOZjmwtr66m9WszeLPAUlsZbiPzE
        /yF2AdtXAhpb3wEEJ6nSV6GXPQ==
X-Google-Smtp-Source: ABdhPJx3KFNdWtGCFpfP6JyL2GonyUec/q9jhKhdKz4cr7sD6OHpyBS0woN6paRnNwhmyTcxV4CDpg==
X-Received: by 2002:ad4:5f49:: with SMTP id p9mr13476qvg.18.1643926214100;
        Thu, 03 Feb 2022 14:10:14 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id s1sm74097qkp.40.2022.02.03.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 14:10:13 -0800 (PST)
Message-ID: <bcb5629b5d4d19068d5309e2b66597ea258c1f50.camel@ndufresne.ca>
Subject: Re: hantro: g2: Does the postprocessor needs 32byte aligned width ?
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Adam Ford <aford173@gmail.com>
Cc:     "jernej.skrabec" <jernej.skrabec@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        kernel <kernel@collabora.com>, Chris Healy <cphealy@gmail.com>
Date:   Thu, 03 Feb 2022 17:10:12 -0500
In-Reply-To: <CAHCN7xLODYVO9ZZZV42RMU1oRCYKhTBiCSnT-6-_uSWH3b77WQ@mail.gmail.com>
References: <c86506596c9126da6f2df02eb6680759064774f2.camel@ndufresne.ca>
         <CAHCN7xKxyZGoQdQ=6uOHpd4COV2CV5b=bbCAhv5cyQCspPf8QQ@mail.gmail.com>
         <3fd135621147ae938c357931579ec1110c935afa.camel@ndufresne.ca>
         <CAHCN7xKHPPDPeN2q3uD8b_Wzs_6KrO+_Qh2zHh4id8YZJJjPcw@mail.gmail.com>
         <CAHCN7xKSwdmPYXcQ24dpUyapOP8+54pc3YJZgj74opTneocujw@mail.gmail.com>
         <ea89b3035a34ce017057439fef42ea7884967955.camel@ndufresne.ca>
         <CAHCN7xLODYVO9ZZZV42RMU1oRCYKhTBiCSnT-6-_uSWH3b77WQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 03 février 2022 à 14:32 -0600, Adam Ford a écrit :
> On Wed, Feb 2, 2022 at 7:39 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > 
> > Le mercredi 02 février 2022 à 05:01 -0600, Adam Ford a écrit :
> > > On Mon, Jan 31, 2022 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
> > > > 
> > > > On Mon, Jan 31, 2022 at 8:29 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > > 
> > > > > Le vendredi 28 janvier 2022 à 12:43 -0600, Adam Ford a écrit :
> > > > > > On Fri, Jan 28, 2022 at 12:35 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > > > > > > 
> > > > > > > Hi Adam,
> > > > > > > 
> > > > > > > Jernej and I had to deal with user report which show a stride issue with the G2
> > > > > > > on Allwinner H6.
> > > > > > > 
> > > > > > > https://forum.libreelec.tv/thread/17565-nightly-images-for-a64-h3-h5-h6-and-r40-boards/?postID=166086#post166086
> > > > > > > 
> > > > > > > We quickly found that the stride alignment set to 16 needs to be 32. Though we
> > > > > > > noticed that this is only needed when using the G2 postprocessor (NV12), while
> > > > > > > it worked fine with tiles (NV12_4L4).
> > > > > > 
> > > > > > Out of curiosity, would it hurt to make the G2 alignment to be 32 even
> > > > > > if it's not required?
> > > > > 
> > > > > Aligning tile to 32 can be complex, I don't think the code is ready to handle
> > > > > padded tiled buffers. About the post-prob, I'd like to first understand why is
> > > > > this.
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > We were wondering if you, or anyone here on the list could test this on IMX8MQ
> > > > > > > and IMX8MM. We'd like know if this is specific to the older G2 on H6. To trigger
> > > > > > > this, you need a video with a resolution like 1552x1080 as used in the report.
> > > > > > > We can help you get one if needed.
> > > > > > 
> > > > > > If you have a video you want me to try and instructions on how you
> > > > > > want me to test it, I can give it a shot. The imx8mm doesn't have a
> > > > > > video display driver yet, but I think the imx8mq does.  I am not as
> > > > > > familiar with that board as I am with the 8mm.  The testing I have
> > > > > > done to date has only been done with fluster.
> > > > > 
> > > > > If you have fluster/gstreamer ready, and some display, I suppose you can try and
> > > > > kmssink (worked for me with the vendor display driver). To get the same video,
> > > > > you can probably download temporarily that youtube video with youtube-dl,
> > > > > careful not to share the file, this is copyrighted content, but it ease testing
> > > > > and debugging, so I suspect it falls in fair use (INAL).
> > > > > 
> > > > > youtube-dl -f 248 https://www.youtube.com/watch?v=TUVcZfQe-Kw
> > > > > gst-launch-1.0 filesrc location="Dua Lipa - Levitating Featuring DaBaby (Official Music Video)-TUVcZfQe-Kw.webm" ! parsebin ! v4l2slvp9dec ! videoconvert ! kmssink
> > > > 
> > > > Sounds good.  I have a few tasks to do before I can get back to this,
> > > > but I'll try to do it later today or tonight.
> > > 
> > > From what I can see, the HDMI driver for the imx8mq isn't available in
> > > the kernel, so I cannot get video.  The NXP branch which has video
> > > doesn't have the hantro drivers in question, so this isn't going to be
> > > an easy task, because I cannot get video out of the imx8mq right now.
> > > 
> > > On the i.MX8M Mini, it's missing the DSI driver which is the only
> > > video output supported by the Mini, so I can't get video out of it
> > > either.  The NXP branch has the same limitations.
> > > 
> > > I could potentially attempt to run the video through the decoder and
> > > then video convert to some still images or a different video format to
> > > playback or review on a different device.  Let me know your thoughts
> > > on that.  i am downloading the Dua Lipa video now, so I could
> > > potentially try something when its finished.
> > 
> > Ok, that would be best you can try indeed, normally running few frames through
> > software converter and recording as mjpeg could work to reproduce this. Thanks a
> > lot of this and sorry for the difficulty, let's hope the display driver
> > situation on these boards get better soon.
> 
> I ran about 15 seconds of the video through the decoder, then encoded
> it with the JPEG encoder into an avi.
> 
> gst-launch-1.0 filesrc location=~/dl.webm ! parsebin ! v4l2slvp9dec !
> videoconvert ! jpegenc ! avimux ! filesink location=mjpeg.avi
> 
> I can send you the AVI if you like, but the output image looked good
> to me when I played it back on my desktop computer.
> 
> Please let me know if there is anything else you need me to do.

Thanks, this should be enough. It would seem like this is a limitation of older
G2. Unless it is a limitation of the display on Allwinner, and the stride is not
being validated.

> 
> thanks,
> 
> adam
> 
> > 
> > > 
> > > adam
> > > > 
> > > > adam
> > > > > 
> > > > > regards,
> > > > > Nicolas
> > > > > 
> > > > > > 
> > > > > > adam
> > > > > > 
> > > > > > > 
> > > > > > > regards,
> > > > > > > Nicolas
> > > > > 
> > 

