Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907504088BB
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 12:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238896AbhIMKGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 06:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238888AbhIMKGt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 06:06:49 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDDDC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 03:05:32 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 43BE61B0009A;
        Mon, 13 Sep 2021 13:05:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1631527529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZO5s9843i9LTQIaW6xmZUAsj/s9AnsuvBs12qiCuFvY=;
        b=nuOmQXssQQ8KdbgO/q9IWL70n+37VU+58nOCNIpq5IIrDFBqx0jnvLpGeajiAMeln+01eJ
        2rK8M1hvv6ywzz0smsQ/6hCtzdMnbSkqMjV4/9eNPiE5LV9LFjEdBQ0+GDwDy4G9AG6EoX
        /SIKW6Mh/hjVhbQV1Kff1+8+bg4uQSY6pwYy1RPabBhIZeY5VmoyPwB8c8BLJDGYS0Xzsb
        7lxo7DBovih4aJgG2f9E71ySXxS3rdyTyGAi7FANlXklO5GJjrneu1sph9iW3DmnI1d7NW
        8HXVGYJSJ+mnqM4EA2F37cyOyHMjKCa5uT7krxC2l2Ng3wGq2ELtfybjcQlQ/w==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CBD5D634C87;
        Mon, 13 Sep 2021 13:05:28 +0300 (EEST)
Date:   Mon, 13 Sep 2021 13:05:28 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Seongyong Park <euphoriccatface@gmail.com>,
        linux-media@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
Message-ID: <YT8iaJ6NLwg8129+@valkosipuli.retiisi.eu>
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com>
 <20210805145504.GC3@valkosipuli.retiisi.eu>
 <4f18b09b-993b-6fc7-6ee2-59e2b738d21f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f18b09b-993b-6fc7-6ee2-59e2b738d21f@xs4all.nl>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1631527529; a=rsa-sha256;
        cv=none;
        b=ik5xWEctGW0y6onITNDasV8MrbhWg3hzF2kvWQZgKGegHG5qNg13QBMqq8l1S0CbkxB4xD
        bliR9+tCcPXvCFRybtAC/8/KSLFp/Ap+MfLFrRdI0E8+HBgI4DQ3SHVOa4eAQBgZm2q4l6
        Rh1C4l9Eev7HUjMpQ43a75E7rns1EODidRnE5nYSe+tzi7BL40pxO6e+gElTBe9xUPxhaF
        xxpfJ80TmyN62wCI/anF4mPsm1ju2ga1lFNf1FSskuZZ3mnXuYtYD/2w/IRJsO2scRF73w
        Jp3HUxFSNSYV03I6PhXzYp7JUG4LAN1uTiK/uYcMrEQ/IANHbtz1BK1moL1etw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1631527529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZO5s9843i9LTQIaW6xmZUAsj/s9AnsuvBs12qiCuFvY=;
        b=tvuvoQ1CjQVYq/8I7QR8b02IUqjdWjX0w4xiJLGKSPf1yUzmj/1EkiC/0WanEjay1jH4yL
        bYmrLY7ZQbmb4ITfsxsnEj03gIfHm3Xg8gkAoRQkptY+ZkituoKgtL6jGVdJfJs1tCCP3b
        12S8DMArZGT1ToWgE+L/+3yZTgrE1q5b2F6gZvjHUoVGRMgzww0WKivKLgFqWz65UuqvHb
        e1s8YtEciuXC5B5O1AA6fsa+U3xF4PsTt3i6/tRz3amtVmNW6SrMjgOiuLcZVk8A7aAMy4
        9ZQJrwCg6Z4NbZ8srPEMbnJRYsm8anBU6/7Jm8EeSXE+ZQU3N6wHiyAf5GRE1Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Seongyong,

On Mon, Sep 13, 2021 at 10:57:04AM +0200, Hans Verkuil wrote:
> On 05/08/2021 16:55, Sakari Ailus wrote:
> > Hi Seongyong,
> > 
> > On Wed, Jun 09, 2021 at 12:24:51AM +0900, Seongyong Park wrote:
> >> On MLX90640, Each measurement step updates half of the pixels in the frame
> >> (every other pixel in default "chess mode", and every other row
> >> in "interleave mode"), while additional coefficient data (25th & 26th row)
> >> updates every step. The compensational coefficient data only corresponds
> >> with the pixels updated in the same step.
> >>
> >> Only way to know which "subpage" was updated on the last step is to read
> >> "status register" on address 0x8000. Without this data,
> >> compensation calculation may be able to detect which sets of pixels have
> >> been updated, but it will have to make assumptions when frame skip happens,
> >> and there is no way to do it correctly when the host simply cannot
> >> keep up with refresh rate.
> >>
> >> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> >> ---
> >>  drivers/media/i2c/video-i2c.c | 13 +++++++++----
> >>  1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> >> index 64ba96329..2b50a76f3 100644
> >> --- a/drivers/media/i2c/video-i2c.c
> >> +++ b/drivers/media/i2c/video-i2c.c
> >> @@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format = {
> >>  
> >>  static const struct v4l2_frmsize_discrete mlx90640_size = {
> >>  	.width = 32,
> >> -	.height = 26, /* 24 lines of pixel data + 2 lines of processing data */
> >> +	.height = 27,
> >> +	/* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */
> > 
> > This device should actually use a multi-plane format as the data isn't
> > Y16_BE as the driver declares. That said, the format would be device
> > specific and using one would require specific support from applications.
> > 
> > I might just declare it produces fewer lines while an application that
> > knows the device could access the extra data close to the end of the
> > buffer.
> > 
> > An alternative would be to use that multi-plane format and keep driver
> > support for the plain Y16_BE as well. But I think this would be a bit
> > heavy-weight solution.
> > 
> > I wonder what Hans thinks.
> 
> I think it is a bit overkill as well.
> 
> Wouldn't it be better to just add a new pixel format for this device, and
> document it properly? I would keep the existing Y16_BE as it was to avoid
> breaking userspace (since adding the extra line breaks the ABI IMHO), and
> add a new format that properly documents how to parse the contents of the
> buffer, which includes the last line with the status register.
> 
> Sorry for the late reply, it looks like an attempt was made to CC me, but
> the email address was wrong, so I never received it. I only noticed this
> when I started to review this patch.

Yeah, my mistake. I thought I had an alias for you but apparently not. I do
now.

I think that'd be fine, albeit equally heavy-weight. But also correct.
Documenting what's there is also important.

-- 
Regards,

Sakari Ailus
