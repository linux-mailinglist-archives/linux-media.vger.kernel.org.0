Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E000366E01
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 16:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242525AbhDUOWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 10:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239469AbhDUOWH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 10:22:07 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8112C06174A;
        Wed, 21 Apr 2021 07:21:34 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id z25so8598563qtn.8;
        Wed, 21 Apr 2021 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T3BKxRMqJzIdOU4CdBKsrHei5q74d7jiI80D7aUMewQ=;
        b=qOm98+y6a5GG6MOsYPlzs73vfKSkBtcoFn1tYwWw4GYyb0/80CrRIP2ZOlLlOoRzmh
         q1U/uF2B+QiDHi1UR13SxkaPXZegOQIK/Zqn0TEF+gojqLHwGq0YlTgpMzLBG0WrouIe
         ML/Yh8qZl1nAgaLSmCTG0mYXldmVfvVrw52aY1zDCjzObcPefk6ooWDnijlrHC21Zvol
         ec91BErgQtta8/RxlZOf51gGs6jAMuqg0KgipHP5W9lbuu79ncL6yYLyTyaQrE+lAaW7
         q39X4SDJIL7ZzixmEpCwD+H3IXxJr0YRyLOxY1hMY5XRjh+MwkBHsTJljcN0/1EiFq1r
         av1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T3BKxRMqJzIdOU4CdBKsrHei5q74d7jiI80D7aUMewQ=;
        b=Pdjnhw0A7j8XKlQyx4WVSO+D3rXByfhCfjYQuXUuKFH43iAIkN//PVjBcr07q2qYqb
         XlS6ncuuKNj6mcaqnngUDxPAp6gOqIgqQQviJpDvLF8PceAJ1hbBKu8mC2czAapXaTLo
         OrepE/u0q0csp7qCeuLjvqpukWBNv808uHQg2vDcEnCqOpeoSwVEj1aNfxWtn9LPmYpz
         OG4U4ormGIYkkXiixN9lZXIORn1Bb9NqIQSj8fi5ms+vlOl4P/dJqe8ZbzBDYjC2tv+e
         SkSvkCdQkU0H+5Iil/Te9Iu+qyeyPw6juUBkImmBmzeHaSeci+L9rAxn5Q1Cz+WXvWCG
         VQFA==
X-Gm-Message-State: AOAM532kA/HkzL5LYG3LMntIJ0W/3IT4UJsiRRUoMofi8ykR+biKNIqF
        8lHTKgvEo3FmFnFfnRK7sR8K230ukxN5UoDE
X-Google-Smtp-Source: ABdhPJxkFhj4gZcSqnX5RZT8f7Fk1A7i8vP0dIniCHZMju5F98bltT2QG69JQZhrP6wCYH+R9ScZhA==
X-Received: by 2002:a05:622a:110e:: with SMTP id e14mr22314324qty.335.1619014893891;
        Wed, 21 Apr 2021 07:21:33 -0700 (PDT)
Received: from [192.168.100.7] ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id j129sm2157129qkf.110.2021.04.21.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 07:21:33 -0700 (PDT)
Message-ID: <16dd7a16a8cc69aa0f81dd6bf47f09e878c71a6b.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Wed, 21 Apr 2021 11:21:29 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104211555040.9436@hadrien>
References: <20210421123718.GA4597@focaruja>
          <alpine.DEB.2.22.394.2104211507280.9436@hadrien>
         <7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel@gmail.com>
         <alpine.DEB.2.22.394.2104211555040.9436@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qua, 2021-04-21 às 15:56 +0200, Julia Lawall escreveu:
> 
> 
> On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
> 
> > Em qua, 2021-04-21 às 15:08 +0200, Julia Lawall escreveu:
> > > 
> > > 
> > > On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
> > > 
> > > > Change line break to avoid an open parenthesis at the end of
> > > > the
> > > > line.
> > > > It consequently removed spaces at the start of the subsequent
> > > > line.
> > > 
> > > The message is hard to understand.  There are a lot of singular
> > > nouns, but
> > > actually there are two changes.  Which change is being described
> > > by
> > > the
> > > above message?  What does "It" refer to?
> > > 
> > > julia
> > 
> > Checkpatch indicated two problems with this function declaration:
> > 1) The line ending with an open parenthesis, and
> > 2) The following line - with the function parameters - has spaces
> > in
> > its identation.
> > 
> > When I changed the line break to put the function name and its
> > parameter in the following line, both checkpath checks were
> > eliminated.
> > 
> > So, the main change was the line break and, also, the line break
> > (it)
> > removed the space in the following line.
> > 
> > Is it better to change the message and explain only about the line
> > break?
> 
> The message should explain about the whole patch.  So if you change
> two
> things, it should be clear that what you are saying covers both of
> them.

Ok, I can do that. In the commit message I described just one issue
because it is only one patch, I didn't want it to look like I was
changing different issues in just one patch.

> 
> But it seems that Matthew doesn't think that the line break is a good
> idea
> anyway.

Yes, I'm sending this email to Matthew too, because I don't know
exactly how to proceed as Hans asked me to made some corrections too. 
I've made these changes because checkpatch has indicated and with this
line break, checkpatch does not indicate any check or warning anymore.
But I can undo that too, I just don't know what I'm supposed to do with
so many opposite opinions. 


Thank you all,
Aline 
> 
> julia
> 
> > 
> > Thank you,
> > Aline
> > > 
> > > 
> > > > Both issues detected by checkpatch.pl.
> > > > 
> > > > Signed-off-by: Aline Santana Cordeiro <
> > > > alinesantanacordeiro@gmail.com>
> > > > ---
> > > > 
> > > > Changes since v2:
> > > >  - Insert a space between the function type and pointer
> > > > 
> > > > Changes since v1:
> > > >  - Keep the pointer with the function return type
> > > >    instead of left it with the function name
> > > > 
> > > >  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++----
> > > > -
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > > b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > > index 1c0d464..639eca3 100644
> > > > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > > > @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
> > > >  void atomisp_setup_flash(struct atomisp_sub_device *asd);
> > > >  irqreturn_t atomisp_isr(int irq, void *dev);
> > > >  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> > > > -const struct atomisp_format_bridge
> > > > *get_atomisp_format_bridge_from_mbus(
> > > > -    u32 mbus_code);
> > > > +const struct atomisp_format_bridge *
> > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > >  bool atomisp_is_mbuscode_raw(uint32_t code);
> > > >  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
> > > >                            const struct ia_css_frame *frame,
> > > > u32
> > > > *p_pgnr);
> > > > @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct
> > > > atomisp_device *isp,
> > > > 
> > > >  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
> > > > 
> > > > -void atomisp_apply_css_parameters(
> > > > -    struct atomisp_sub_device *asd,
> > > > -    struct atomisp_css_params *css_param);
> > > > +void atomisp_apply_css_parameters(struct atomisp_sub_device
> > > > *asd,
> > > > +                                 struct atomisp_css_params
> > > > *css_param);
> > > > +
> > > >  void atomisp_free_css_parameters(struct atomisp_css_params
> > > > *css_param);
> > > > 
> > > >  void atomisp_handle_parameter_and_buffer(struct
> > > > atomisp_video_pipe
> > > > *pipe);
> > > > --
> > > > 2.7.4
> > > > 
> > > > --
> > > > You received this message because you are subscribed to the
> > > > Google
> > > > Groups "outreachy-kernel" group.
> > > > To unsubscribe from this group and stop receiving emails from
> > > > it,
> > > > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > > > To view this discussion on the web visit
> > > > https://groups.google.com/d/msgid/outreachy-kernel/20210421123718.GA4597%40focaruja
> > > > .
> > > > 
> > 
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit    
> > https://groups.google.com/d/msgid/outreachy-kernel/7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel%40gmail.com
> > .


