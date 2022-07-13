Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5F8573B72
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 18:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236215AbiGMQpO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 12:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiGMQpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 12:45:12 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AFA26542
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 09:45:09 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id n12-20020a9d64cc000000b00616ebd87fc4so8723051otl.7
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=I7OsLXqH/9Te2vd5tdFip+Lxyy07Bn8K3zDG4t0Ezcc=;
        b=hAx+fSrAw38bjYwAO1Esy2LLER4aocavVMjR9aB3tMBTWR0qAncmKsogUxpydf8s3N
         QCMWVRcIRLjkPfSfqRjPpD60mMtAPFOYBd+f5PMPvzzrrmjGCMyFCkSXfQkPJyGZ57Cb
         6xQ3xGUlRysPLHADNHM+sB0orRw8bZnSs00Zr8aO+d7iMty6aTKL8Ypsx/V8WLYdBWtR
         9ki5UC6Ha/HsXR7wVH33LG67FCZhInQrbkWjwcB+NxloRNrBLaXxVWFnY3NOF3MqDPEc
         dENbPWO0A7v5HmywQK3mL5EKScFDyxG93o8gI+A90kZNmlg3zakGQNOfZ6aP/QhMBCsB
         ZO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=I7OsLXqH/9Te2vd5tdFip+Lxyy07Bn8K3zDG4t0Ezcc=;
        b=juPkT3MXytqhMefPxV2ynt5x6OvCF1kolZLLVQ4It/3G9jb8JdvC0Ow8kxU7qNAn+G
         sG+vfwzYxMS10tgviHAvOl+pxU1+rm9R+i4TnwJQY7nkJpmUuj3DfLmUapblsEYda7H+
         sf0iGHzW7a6om+dceH0ktvEzPSX86R9bGvUU6Y2kbptElxcKZso4m9vC4eMehkPTO/58
         csqk2bn/tBVAFbw0uklaL9hoQtGX5/SCnNYDboDRwac3kp9bvd5k8xhv+8TfgXBoOZGr
         qThAmFbuQwdLZg6s37k1RG+YwWf6NBvVN/YzAR1DUsAdIvIFnKo+rx17ME+1PFnmHLj8
         XEbg==
X-Gm-Message-State: AJIora/i1wZVvMxxnp76hCfEBMoD2rsjd63Iwbq+qgFhnFdVCNT+wZwF
        WBDSMLPZBkSGGOUgqRbtXIrXKg==
X-Google-Smtp-Source: AGRyM1sZyletAlpOLLvqspKneS9GbsFMhbPODCXHsv0X3czopt/lO/s2OwjXWhLFoptQ5UEqamDkNA==
X-Received: by 2002:a05:6830:3686:b0:61c:4a56:5c8b with SMTP id bk6-20020a056830368600b0061c4a565c8bmr1723947otb.49.1657730708440;
        Wed, 13 Jul 2022 09:45:08 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id u17-20020a056870305100b000f325409614sm6176741oau.13.2022.07.13.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 09:45:07 -0700 (PDT)
Date:   Wed, 13 Jul 2022 13:45:01 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        samuel@sholland.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 5/7] media: cedrus: h265: Add a couple of error checks
Message-ID: <Ys72jfI1QdGm+q0g@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
 <20220620175517.648767-6-jernej.skrabec@gmail.com>
 <YsyWnzdTZ0bC733i@eze-laptop>
 <37675481.J2Yia2DhmK@kista>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37675481.J2Yia2DhmK@kista>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Tue, Jul 12, 2022 at 11:25:00PM +0200, Jernej Škrabec wrote:
> Hi Ezequiel.
> 
> Dne ponedeljek, 11. julij 2022 ob 23:31:11 CEST je Ezequiel Garcia napisal(a):
> > On Mon, Jun 20, 2022 at 07:55:15PM +0200, Jernej Skrabec wrote:
> > > Now that we have infrastructure for reporting errors, let's add two
> > > checks, which will make sure slice can be actually decoded.
> > > 
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > > 
> > >  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c index
> > > cfde4ccf6011..99020b9f9ff8 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > 
> > Now that you've allowed setup to fail, I would suggest
> > to have some documentation/comments on struct cedrus_dec_ops,
> > to set the expectation/rules for each ops, including the
> > call paths for each operation, which of them are allowed to sleep,
> > etc.
> 
> Documentation can be always added, but it should be separate patch.
> 

Of course, this wasn't a comment meant to block the patch in any way.

> > 
> > > @@ -435,9 +435,17 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx,
> > > struct cedrus_run *run)> 
> > >  	 * instead of start of slice data. Padding is 8 bits at most (one 
> bit
> > >  	 set to 1 and * at most seven bits set to 0), so we have to 
> inspect
> > >  	 only one byte before slice data. */
> > > 
> > > +
> > > +	if (slice_params->data_byte_offset == 0)
> > > +		return -EOPNOTSUPP;
> > > +
> > 
> > AFAICS, cedrus_h265_setup is called from .device_run.
> > We've been discussing control validation before, and I think the
> > ideal place to do that is v4l2_ctrl_ops.s_ctrl, if that's
> > at all possible.
> 
> Yeah, this particular check can be moved to s_ctrl handler.
> 
> > 
> > Driver's mem2mem device_run are executed in the context
> > of a work_struct and the failure won't really get reported
> > up the stack.
> 
> Well, at least there will be a notice in dmesg. Not ideal, I know.
> 
> > 
> > >  	padding = (u8 *)vb2_plane_vaddr(&run->src->vb2_buf, 0) +
> > >  	
> > >  		slice_params->data_byte_offset - 1;
> > > 
> > > +	/* at least one bit must be set in that byte */
> > > +	if (*padding == 0)
> > > +		return -EINVAL;
> > > +
> > 
> > Maybe this is something to check at cedrus_buf_prepare(),
> > when the buffer is queued?
> 
> I don't think so. This check is HEVC specific, but cedrus_buf_prepare() is not 
> and we need to have slice control ready, which I'm not sure is the case for 
> cedrus_buf_prepare().
> 

Hm... this is indeed a special case. The buffer contents
depend on a control, and both buffer and control are part of the same
request.

At least the decoding job would fail, and would get signaled
by the dequeued CAPTURE buffers and the V4L2_BUF_FLAG_ERROR flag,
which makes perfect sense.

In general vb2_ops.buf_prepare() is called for each
buffer (either through VIDIOC_QBUF or through MEDIA_REQUEST_IOC_QUEUE),
so for some buffer validations .buf_prepare() _might_ work better 
than .device_run for validation.

In any case, the patch looks good, I don't think these
comments should block the patch:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> Best regards,
> Jernej
> 
> > 
> > Thanks,
> > Ezequiel
> > 
> > >  	for (count = 0; count < 8; count++)
> > >  	
> > >  		if (*padding & (1 << count))
> > >  		
> > >  			break;
> > > 
> > > --
> > > 2.36.1
> 
> 
