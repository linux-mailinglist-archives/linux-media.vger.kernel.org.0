Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B3624A2A5
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 17:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgHSPRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 11:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgHSPR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 11:17:26 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC3FC061342;
        Wed, 19 Aug 2020 08:17:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so1251757pjx.5;
        Wed, 19 Aug 2020 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zmZ0nR+0stasAUqGKga9eB9ZFWY9muOXfNZAhE4dBCo=;
        b=cV1u7p0wvXmqtQLXfxc15Ws4Qo4Zt6uUGQKQdnWwMiD37QPnpsYZ35tUxZW0DLjC2F
         +DRi5ji/RLdDM5HuTLrg/vCsSsZSIr6f5Y/sG6t3cHpJsMcZJABAyXLH0INlx2A1IQu1
         3HOcqdKTiqaVmjLVvF1LqSYOn4IjbEqAfyzY5pVuanO01IeEzMcJGd0jBFJrjAbks2TV
         PfbjuFX4KkVmeoNUatXXTq9sbXlWbvfmIGeCSCxKNMOnUN8ni6M9HyGDqjcD/PKfHVcr
         haMoVmXzA9dWws5GrRZemCI1FNXhC+9VcZwhEnPuDE+Hj+0zrnjO1jE595bSr3jFEtiu
         xrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zmZ0nR+0stasAUqGKga9eB9ZFWY9muOXfNZAhE4dBCo=;
        b=r3HQV7LH//YpR95iVvyTzHeljd+zdFa+hwiKNQIrs/3Op/kgg/ZkDyEDs9YpY2xBVT
         lu3aZK8OOrwcrWTRTze3spz0G94OFAICPTzQ4OohiR+Wf8gqADiTPtStHfSCgUGGnKBO
         9/BCM6SNNMkGsJHFWrDZIUclwb08F/OiXU0BS4WRs82gZ7HG9m0c2c3KLVhflcIr/aRJ
         LBCF7+yDEbM97Qqn0eZFQOSu8hqLSCC1Wk/1npRvsTK9a1af6FXU7WsOV966DtAyYm9z
         tM9qNJJx6gugiQyVjNkrnAonJcae+5Fti9pTaZJsbenR/XwUD5Y02xnlTF7Jd5F7hIf2
         ZNbA==
X-Gm-Message-State: AOAM533rHsTkFDpgbcFIr84q7nuBtTniIs7hHJZLroZefvIq3b8G4fht
        jQMXoX+DeyeXadpHfBP9vw==
X-Google-Smtp-Source: ABdhPJyIOb9pNzAosEPNXQ9tef9OxRKUmm6zMqaUbTiiSDJ2RtWwlz1pjDLcFQ9c9klXpmg53OhF9A==
X-Received: by 2002:a17:902:eb51:: with SMTP id i17mr19791500pli.278.1597850246185;
        Wed, 19 Aug 2020 08:17:26 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
        by smtp.gmail.com with ESMTPSA id g23sm28739438pfo.95.2020.08.19.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 08:17:25 -0700 (PDT)
Date:   Wed, 19 Aug 2020 11:16:56 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
Message-ID: <20200819151656.GA106705@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mr. Verkuil,

On Wed, Aug 19, 2020 at 04:26:28PM +0200, Hans Verkuil wrote:
> Hi Peilin,
> 
> On 10/08/2020 07:05, Peilin Ye wrote:
> > precalculate_color() is reading out of `sin` since `tpg->hue` is not being
> > properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
> > than or equal to -192.
> 
> Thank you for this patch, but there is something I don't understand, namely
> just *how* tpg->hue can be out-of-range.
> 
> From what I can see vivid sets hue via tpg_s_hue() when the V4L2_CID_HUE control
> is set. But that control has a range of -128...128, so ctrl->val should always be in
> that range.
> 
> I would really like to know 1) what the value of tpg->hue actually is when it goes
> out of range, and 2) who is changing it to that value. Can you do a bit more digging?

Sure, of course! I will try to figure that out first.

Thank you,
Peilin

> That said, it makes sense that precalculate_color() avoids reading out-of-bounds.
> 
> > 
> > Fixes: 63881df94d3e ("[media] vivid: add the Test Pattern Generator")
> > Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=db50123c788e2cc5a9d90de569c398b66293ee48
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > index 50f1e0b28b25..52205fe096f7 100644
> > --- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > +++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
> > @@ -930,6 +930,9 @@ static void precalculate_color(struct tpg_data *tpg, int k)
> >  		/* Implement these operations */
> >  		int tmp_cb, tmp_cr;
> >  
> > +		if (tpg->hue < -128 || tpg->hue > 128)
> > +			return;
> 
> Rather than returning here, I prefer to just clamp tpg->hue to the valid range.
> 
> I'd be willing to merge a patch that clamps tpg->hue (it certainly doesn't hurt),
> but I also would like to understand how it can be out of range in the first place.
> I have the feeling that this is a symptom of another problem elsewhere.
> 
> Regards,
> 
> 	Hans
> 
> > +
> >  		/* First convert to YCbCr */
> >  
> >  		color_to_ycbcr(tpg, r, g, b, &y, &cb, &cr);
> > 
> 
