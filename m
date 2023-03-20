Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE206C14EF
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 15:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjCTOiE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 10:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjCTOiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 10:38:00 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D55528223
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 07:37:39 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id eg48so47493608edb.13
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679323058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah+O3agW2G50K8T4sY9tg2Yu5T7tjCj76ax5y4SpCcs=;
        b=Qi7D8nCCoE/MNAFXpIMX/dVQnOeD0XwI9K5TWQpV/Fv5/fiSm5p80nvXFApIOG0MJX
         eYQQRmsal4nqmc4yfTlh0+1geRW3SnxlT/R6MIyLX/y7nuO9HanGC1hqRDQd0WlijYHX
         LxM1KbVfTgcTHrmwHWmA0B/0r/4mXe1hiDoKOSWyLv8MrpFc38QVK7CBwlJqNUZP5hbP
         NVQArP7GfomwTqZexgbxhhGWN5AI/LOvIpac6Ogt4vj9IelAe3vQzz3UUL5FjvAl2V2Y
         EWxPIk3TktB2Cj8qYY+C2+XEb6nrQZ51XKwVw/o2cHs+YpMKXdQxhWLBA3+kbdZiHkjO
         wuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah+O3agW2G50K8T4sY9tg2Yu5T7tjCj76ax5y4SpCcs=;
        b=5nnnSAcge+XrsR9xeXHsmNjZksjGrlagUgHFqmcvm3FyyRWefIZFORhsNLOHvVG+ll
         zwZnGSqVHy6UQb+B5BxFV9QD4SUM7f9zNIFvZCNqdBAgF4tE4/9Uke8V1fAJcW4sMny6
         zjuSRvtvPpSeDVyiz2RqT37IytWkIUZQ6VMnJ2dfSS3eVydjF3ViN+zPfL/oTsCwdw6H
         fHFnR/hpU7pX4jWQCrBGvQWq3AqEjCDWnR3HZXGqecSf46QPN8dlfwzB+I0Nwo1Z0uzY
         iSQ86zeaWuOWZnkyoJJUa5g2JZExo+W+WFJBrIAXzF0WfSFdPfwQ9SDvH8cZcAFcQIRl
         XH8A==
X-Gm-Message-State: AO0yUKVr+thgWuvOLTsNQX8oDz177Ozj0Y5bx0LSXWgwissfpFgYknLO
        NCoA8sckqZM8RhpiV0XO00ez2eQizFg=
X-Google-Smtp-Source: AK7set8n5TdTbmrmysoNrtgjV9F19hLjW/bhqosdK5yts38DjEvep0fW6DGuAsawSYNx5tILQSY07g==
X-Received: by 2002:aa7:c855:0:b0:500:4a5d:af41 with SMTP id g21-20020aa7c855000000b005004a5daf41mr9763795edt.25.1679323058105;
        Mon, 20 Mar 2023 07:37:38 -0700 (PDT)
Received: from archbox.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b009321cd80e15sm4136198ejd.73.2023.03.20.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 07:37:37 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [RFC 0/2] VP8 stateless V4L2 encoding uAPI + driver
Date:   Mon, 20 Mar 2023 15:37:36 +0100
Message-ID: <2153569.irdbgypaU6@archbox>
In-Reply-To: <b6468072-834b-c948-3a27-e34fc80d203f@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com> <4586871.LvFx2qVVIh@archbox>
 <b6468072-834b-c948-3a27-e34fc80d203f@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Monday, 20 March 2023 11:07:19 CET Andrzej Pietrasiewicz wrote:
> Hi Nicolas,
> 
> 
> W dniu 18.03.2023 o 10:20, Nicolas Frattaroli pisze:
> > On a related side note, since I let this run all night with different
> > parameters I can happily report that it seems to be quite stable, no
> > problems encountered at all.
> 
> Thank you for reporting. In the (expected) case this turns into a
> patchset proper I would kindly ask for your Tested-by then.

Will do, I'll be closely tracking this patchset and might also throw
a patch your way to enable it on RK356x at some point, since that has
the same Hantro encode IP as well as far as I know.

> Can you share what you used for the nightly tests, both in terms of
> testing harness and unencoded video material?

The source material I used is the "Original" quality of the short film
"Wanderers" by Erik Wernquist: https://vimeo.com/108650530

You can click on "Download" and choose "Original" from there, which
gives you a 4:2:2 10-bit Apple ProRes .mov file. It's quite high
quality and includes some interesting segments, such as the asteroid
field shot, as well as plenty of grain, both of which really stress an 
encoder.

My testing harness is a little primitive, the precise gst pipeline I
used is in this command I ran:

for i in {0..63}; do echo "q $i"; \
gst-launch-1.0 filesrc location=~/Wanderers.mov ! \
qtdemux name=demux demux.video_0 ! decodebin ! videoconvert ! \
v4l2slvp8enc min-quality=$i max-quality=$i ! queue ! matroskamux ! \
filesink location="/mnt/usb/w2/vp8_wanderers_q_$i.mkv"; done

I figured I'd try out all the quantiser levels this way. It is worth
noting that the resultant mkv files are somewhat odd, I had to remux
them with ffmpeg (with -c:v copy to copy the vp8 bitstream over) to
get mpv to seek properly in them and show bitrate information in the
stats overlay (shift+i by default). There's probably a gstreamer
thing I'm unaware of to make it properly generate the matroska
container as well. Either way, not a problem with the encoder, just
the muxer.

I'm pretty sure videoconvert gets rid of the 4:2:2-ness and 10-bit-ness
of it, since I don't think this hardware encoder is capable of handling
that, which is fine by me.

However, since this does nicely transcode to a 10-bit video with a
software encoder of your choice, Collabora might also be interested
in using this footage for any upcoming 10-bit patches to the video
decode side of things. :)

> Regards,
> 
> Andrzej

Kind regards,
Nicolas Frattaroli



