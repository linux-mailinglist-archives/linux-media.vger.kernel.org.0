Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72C276C971
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbjHBJ0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbjHBJ0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:26:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68896E7
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:26:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-317716a4622so6041142f8f.1
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690968370; x=1691573170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyik+TZ3vmuOeL3qHw1bnZpewOZIKIcdIsCzNp04tEg=;
        b=vCnnK84JpF67wjLutDsqwsSLfbCDkT70d8j8dV9cSQJgoytiD0+PuBDUbbOMTQuEYm
         Lz8U7B5IA+1IIv3obew5S4JWiKBcyBzmPDyjOFSBJXWJG6P4YjpmkbsfMgwpR2ibQzrY
         XC6O+Zvr1jMTwEAtO9nwL1he8fCUWqkxZwC1HNEjXMyKnDO2y3k83DTT8dLnRpfBvxDs
         y+dEIQwJxPeEOqU3uoNmrU/CMbnSf6SrFnORmc1J87gKoFh0clnE8cKTkblZEu/+KKC+
         GhR5XjP/gSZ9M5oM0jz+tbCFMrK+jwWrvgG4h9Y1nPj4oGeA80ns8NxY5rGSKKA8/X3X
         nd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968370; x=1691573170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyik+TZ3vmuOeL3qHw1bnZpewOZIKIcdIsCzNp04tEg=;
        b=gESxAsu2CZEeDujUP4c6V+vG7NfPfLcl+4UTEH78EjIz+ZqaH0jrrGii5aICRXMD6J
         Zsq4gT5aWkYmJO4CkYFbUAQMoTKWPG/MHKcWMuMhGZfu7K0J2gvPOnbVndCh6LRKI8pJ
         TUFjJJo9v47eezFyOkdBshCPsYcfqQfqiHGz4CHcd0VXzrEhx7jM6JD+Fco/kjsyIdWH
         K5FKRGEjH4uGvXxCkLhGgkGOQ/1Kc/ZcADMLz5z1sziBIZj1rzp8KjJ8j+IlanehU1HU
         BxpzzXNdwrt7CZYxa8AE1XwqK2VYAr3Vl0Jd2YHyRBBaUtUKvn9sHxDMDG1WN6/1UClh
         5WOg==
X-Gm-Message-State: ABy/qLZl0gAhrpVsfXVb6Pp7NWMkXNCqX3nqZeXmYsoO3szMhxK+Zuh6
        RUppZ6PX0RWoioBJZ1b952bfHJ6PHI1gyVe/3go=
X-Google-Smtp-Source: APBJJlFnTSJ3Ye5Xa7SaD9lPL8+AVBP998AL39+S2BZmZ2yrJ9KSO45jspHUBtgAIqCU3YOWrUI94g==
X-Received: by 2002:a5d:440e:0:b0:317:43e0:3f47 with SMTP id z14-20020a5d440e000000b0031743e03f47mr3947650wrq.36.1690968369938;
        Wed, 02 Aug 2023 02:26:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b00313de682eb3sm18513077wrp.65.2023.08.02.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:26:09 -0700 (PDT)
Date:   Wed, 2 Aug 2023 11:59:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] [media] adv7511: add new video encoder
Message-ID: <01d8ddac-64a8-46c3-a4b9-32de1d605df5@kadam.mountain>
References: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
 <1f43956c-296a-b1ad-6a36-19a3f0ffeb6b@xs4all.nl>
 <8bab054d-2e28-4189-8f7c-9982d959c891@kadam.mountain>
 <23dabcf0-d633-05b0-abbd-de4aed60dea4@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23dabcf0-d633-05b0-abbd-de4aed60dea4@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 02, 2023 at 10:08:53AM +0200, Hans Verkuil wrote:
> On 02/08/2023 09:49, Dan Carpenter wrote:
> > On Wed, Aug 02, 2023 at 09:27:17AM +0200, Hans Verkuil wrote:
> >> Hmm, this is old code and when digging into this I noticed inconsistencies
> >> in how it is used and how it is documented.
> >>
> >> It's used by the v4l2_subdev interrupt_service_routine callback. The header
> >> include/media/v4l2-subdev.h claims that it is called from IRQ context, but this
> >> isn't true in most cases. It's used primarily to pass on interrupts meant for
> >> i2c video receivers/transmitters that arrive at the bridge chip to the actual
> >> i2c device. And that happens in work handlers that allow the use of locking.
> >>
> >> I found one exception where it is also used for an IR (infrared) receiver and
> >> there it is actually called from IRQ context. It doesn't use i2c or sleeps/locking
> >> in that case, so it is safe.
> >>
> >> But what confuses me is that you state 'This looks at functions which are passed to
> >> request_irq()', but adv7511_isr isn't passed to request_irq. So why is this warning
> >> raised?
> >>
> > 
> > Actually you're right.  I was thrown off a bit by the name.
> > 
> > Was the exception cx23885_irq()?  Because that's what Smatch is
> > concerned about.  That calls "v4l2_subdev_call(dev->sd_ir, core,
> > interrupt_service_routine," and Smatch thinks interrupt_service_routine
> > can point to here.
> 
> Indeed, that's the exception. I wasn't even aware of this myself until I started
> grepping the code.
> 
> I wonder if there is better kernel support for things like this, i.e. the irq
> from one device is hooked up to another device. Typical for PCI devices where
> the i2c devices on the PCI card route their interrupt lines to the PCI bridge
> device.
> 
> An alternative is to change the sd_ir handling so that it doesn't use
> the interrupt_service_routine callback and then change the documentation for
> the interrupt_service_routine callback to allow sleeping. It's rather ugly
> the way these two modes are mixed today.

I wouldn't worry too much about it...  This check isn't anywhere near
being published yet.  Ideally, I could silence this in Smatch.

This is a flaw in Smatch where it treats all function pointers of a
given type as the same.  So every time ->interrupt_service_routine() is
called it thinks they can be treated as equivalent.

The main issue so far as this check is concerned is that it thinks
(struct spi_message)->complete functions are equivalent when they're
not.  So I probably will add a table of function pointers like that
where it's hard coded that they aren't called from interrupt context.

I'd like to fix this in a better way, but in this case it's really hard.

regards,
dan carpenter
