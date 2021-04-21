Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89398366D15
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241346AbhDUNqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234093AbhDUNqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:46:22 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31EEC06174A;
        Wed, 21 Apr 2021 06:45:49 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id d1so8759059qvy.11;
        Wed, 21 Apr 2021 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cgojrNNZjRZwYXB5OUDjGB+Ew4bhwzHNZQha1xmd6w0=;
        b=MD1WYPKTWXuOLajkl84SBgTiMpFh+CicHcq/I9+voqaGO1qtt2CWimCFdQE14LvBIg
         PXb/9Ercp6B88ys5kt4I6nzk+nsNNKUQUtScy4oL5SQf3EwDI4e5NNKXeSGcS+2Zoe1R
         dB9KgwvF/gU+7ZeXrZd42ZuBC84aX4OXLfIBncTGhsEPkbc7bnb29Kfg++u/n+xlL2S6
         4e4gQ13wVLCDS7XLSvIAp2ghs5vSRydZ8LggaRkN+mKcYmTasjVHqntAWiPAZKoq3bDc
         1OjkHcJTfoibRPB5cct6MzRzFmnE22Azxk1kFCxiu39QavdEvKAfQ3/6YGp75K/6GZMI
         4GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cgojrNNZjRZwYXB5OUDjGB+Ew4bhwzHNZQha1xmd6w0=;
        b=i14nFoEwP7D+3Mh+LM0Os6bL63cavv4CYnszRzNF59mLAGoblc9FxXYCmbipHVIcA2
         6xA/57JMs2baTLh6JgZHPaMUVYHWdm5vsjk8sCMf1cHwX1rtoOmb5irhN0u2/UqfTjTY
         9QHGI3HjUzN1gWQy4yxNHzYYxVwPKVNN0Qlry+dvu8zbCqaNAGMSt9Gto30dhEeJuG46
         7nCYm4l8ROVKVqTSQLQueuSFTu3eEXO9LGbOb48mz569VHDfjfVwlUnGgHc6JaSYOJuL
         9BXIYuAJgsEZIgPI80KTNFhZ/+DcDpCDpzFbeD6viABPh9Gsc64kzwkE+Fgl3vtWH1wM
         iB/g==
X-Gm-Message-State: AOAM530vZnbyhs7il7jgJFyODM+N7FYqgJmYEZU1+5emk2bhacFvRRoI
        Glafgaovjr9pdzJSRmMq5kq03t9XDD53h5g8
X-Google-Smtp-Source: ABdhPJxrotJtp/CB74NbgdiM0FZ4jvoYXYwhMzBHpJrgyzKf0q3RLZ64tV6i0Yv85aJ7haWefGbS2Q==
X-Received: by 2002:a05:6214:7ed:: with SMTP id bp13mr32473406qvb.17.1619012749172;
        Wed, 21 Apr 2021 06:45:49 -0700 (PDT)
Received: from [192.168.100.7] ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id a30sm2050286qtn.4.2021.04.21.06.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 06:45:48 -0700 (PDT)
Message-ID: <7aeac7041a6f6d7b3d8563f0d0bf0a4d31f379b0.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Wed, 21 Apr 2021 10:45:43 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104211507280.9436@hadrien>
References: <20210421123718.GA4597@focaruja>
         <alpine.DEB.2.22.394.2104211507280.9436@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qua, 2021-04-21 às 15:08 +0200, Julia Lawall escreveu:
> 
> 
> On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:
> 
> > Change line break to avoid an open parenthesis at the end of the
> > line.
> > It consequently removed spaces at the start of the subsequent line.
> 
> The message is hard to understand.  There are a lot of singular
> nouns, but
> actually there are two changes.  Which change is being described by
> the
> above message?  What does "It" refer to?
> 
> julia

Checkpatch indicated two problems with this function declaration:
1) The line ending with an open parenthesis, and
2) The following line - with the function parameters - has spaces in
its identation.

When I changed the line break to put the function name and its
parameter in the following line, both checkpath checks were eliminated.

So, the main change was the line break and, also, the line break (it)
removed the space in the following line.

Is it better to change the message and explain only about the line
break?

Thank you,
Aline
> 
> 
> > Both issues detected by checkpatch.pl.
> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> > 
> > Changes since v2:
> >  - Insert a space between the function type and pointer
> > 
> > Changes since v1:
> >  - Keep the pointer with the function return type
> >    instead of left it with the function name
> > 
> >  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > index 1c0d464..639eca3 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> > @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
> >  void atomisp_setup_flash(struct atomisp_sub_device *asd);
> >  irqreturn_t atomisp_isr(int irq, void *dev);
> >  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> > -const struct atomisp_format_bridge
> > *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge *
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> >  bool atomisp_is_mbuscode_raw(uint32_t code);
> >  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
> >                            const struct ia_css_frame *frame, u32
> > *p_pgnr);
> > @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct
> > atomisp_device *isp,
> > 
> >  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
> > 
> > -void atomisp_apply_css_parameters(
> > -    struct atomisp_sub_device *asd,
> > -    struct atomisp_css_params *css_param);
> > +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> > +                                 struct atomisp_css_params
> > *css_param);
> > +
> >  void atomisp_free_css_parameters(struct atomisp_css_params
> > *css_param);
> > 
> >  void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe
> > *pipe);
> > --
> > 2.7.4
> > 
> > --
> > You received this message because you are subscribed to the Google
> > Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it,
> > send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit 
> > https://groups.google.com/d/msgid/outreachy-kernel/20210421123718.GA4597%40focaruja
> > .
> > 


