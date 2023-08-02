Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1682D76C777
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 09:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbjHBHwR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 03:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjHBHvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 03:51:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3AB1BF0
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 00:49:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5221b90f763so9248359a12.0
        for <linux-media@vger.kernel.org>; Wed, 02 Aug 2023 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690962586; x=1691567386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+48yjNcPZcMVyQFx4ZlIu6o8sk/iOGxKYrIaAkAlls=;
        b=QNzLPadHXhELzGANvaLoKthCqZAe4tfBlC/SHhieo6Y8TcIng5cFsUv3ZRiC3SogS6
         sC+V8EhPS1BTcQmVXGB85B3HgmgsBud+URcOy4UCUgCRIfGfJ46TFp8b6TgB7e4fTUTw
         NY6ySn7FgYU4q6B9zWkITvo7X4q/les1jFI6qsVcXDkCA8oRlNp0F19En2reYWVWm1yo
         czsssb7DeiITchTn/vonY2EXhSVTrhQyjKyfijs4cQVtutCGYhTRcUCc5bssgp406mUC
         Y0NHwAi5PqEll9bycM7NFf5FqX/zofvch+hVCI7cnzz/akw2x6diDahadIk+OvSVEjAA
         vH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690962586; x=1691567386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+48yjNcPZcMVyQFx4ZlIu6o8sk/iOGxKYrIaAkAlls=;
        b=jXXmLnJKLiXm+snETKLXuHxghTsbxf9htaxfzkiZlHi12OLJgYe3eGWt8piYVJQ1UG
         2AFeKc23tUIz67/sTmdV0XArN1ZVRA9dgeGy5do/bBt4PexyaS9k3ToIb+xX8lLnp89/
         1uDE7vPTGy0wCo8/GG1O6AmZfAP5FVbfqj8hbkUCcvcFXlxPQAoJ4oI0YagDJQoerOqU
         ash7uNUna9ktdjGWTHU1MtVPCaDT1IkOfPeO85jp73KCDvXuOhhRUxeM/1R0mHXOAnd8
         4LX1aShQV1VAPT/UnPYvSB49Q7Wps3UmjhGmj4Nssftyyb0vDsvA1ZQ7OCqe5nfxWa4h
         Dbsg==
X-Gm-Message-State: ABy/qLYjC7R5T4w0fbY8sVSHt1hMS6t9wWfiE8LgNbNJl8Cn0z70Eep1
        XLoPRPYI56l4IdjZqFUZI0HqQg==
X-Google-Smtp-Source: APBJJlG4YVCbwyGeqXKDVY2av9OgwcVqvF1hlTZ9rCtJQg4REuJF0AHBbV4KIULMDWIUK4bCaEJtMA==
X-Received: by 2002:a17:906:212:b0:98d:f4a7:71cf with SMTP id 18-20020a170906021200b0098df4a771cfmr4195886ejd.62.1690962585722;
        Wed, 02 Aug 2023 00:49:45 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id c22-20020a17090603d600b0099275c59bc9sm8694261eja.33.2023.08.02.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 00:49:45 -0700 (PDT)
Date:   Wed, 2 Aug 2023 10:49:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] [media] adv7511: add new video encoder
Message-ID: <8bab054d-2e28-4189-8f7c-9982d959c891@kadam.mountain>
References: <591910e0-15db-4055-85ef-d4ca99649120@moroto.mountain>
 <1f43956c-296a-b1ad-6a36-19a3f0ffeb6b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f43956c-296a-b1ad-6a36-19a3f0ffeb6b@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 02, 2023 at 09:27:17AM +0200, Hans Verkuil wrote:
> Hmm, this is old code and when digging into this I noticed inconsistencies
> in how it is used and how it is documented.
> 
> It's used by the v4l2_subdev interrupt_service_routine callback. The header
> include/media/v4l2-subdev.h claims that it is called from IRQ context, but this
> isn't true in most cases. It's used primarily to pass on interrupts meant for
> i2c video receivers/transmitters that arrive at the bridge chip to the actual
> i2c device. And that happens in work handlers that allow the use of locking.
> 
> I found one exception where it is also used for an IR (infrared) receiver and
> there it is actually called from IRQ context. It doesn't use i2c or sleeps/locking
> in that case, so it is safe.
> 
> But what confuses me is that you state 'This looks at functions which are passed to
> request_irq()', but adv7511_isr isn't passed to request_irq. So why is this warning
> raised?
> 

Actually you're right.  I was thrown off a bit by the name.

Was the exception cx23885_irq()?  Because that's what Smatch is
concerned about.  That calls "v4l2_subdev_call(dev->sd_ir, core,
interrupt_service_routine," and Smatch thinks interrupt_service_routine
can point to here.

Thanks for looking at this.  It's a new check I'm working on and it
still has a bunch of issues.

regards,
dan carpenter

