Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DAC35FB35
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 20:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353159AbhDNS4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 14:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbhDNS4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 14:56:10 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55839C061574;
        Wed, 14 Apr 2021 11:55:47 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id h3so9673151qve.13;
        Wed, 14 Apr 2021 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OeVselHKPVLOZzCiq1K08wuQKbTOdMwo4rrb+WFfGok=;
        b=lFCnI3hp3u4Er12GAIRoPmvUADqyOluplFCmLhhcA1pMyCvN8uXDqqBRLRFOlidy7C
         CJZruXSU4BLU9OqaNUUpSFZurnqPU5hb/H695wM4wPWxe6MkllA7tlVmkz7gromzUMb/
         C728BhxLQdAD5I8vsVv+axhY1MfsjVfTftkTsXav+T7xzEUJQN6snq7WfjJRRMQbfXJD
         2FVfhEnrjQ04jyjJIWRYKKG3gACrKqjrxM3USPSAg3wU/8fYMnVJIeynLmhHqs8q+zO4
         Iev9h6wXtUPn+B2m5lnubTvZfyC5EoyqniLu2lldL0eMiy0PLD2W98+MxtI9nAc8LH9Z
         1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OeVselHKPVLOZzCiq1K08wuQKbTOdMwo4rrb+WFfGok=;
        b=MgnIdoZuGBwSBuOU1+NuBjRU74EXrxoVdyUA0Fio9zmH4XzUI3Z1rWgUqm9eZkkm8Y
         t7ZcTurgMa6+2umTG5KPIiqjC5vbajoIrNng4qnSo0KM4qesdR+MeiqyHlQcUuuJdKyB
         CVUMmvKxrPVmsED9mvzx1A3uDWRbdSYAGTDJBT8X9tJ2ICJvtUNqRHEl8nD6BX+/mIAe
         6liqVuwt9hf5Z2p7QWMwiz47y2zGlSy6m65D4HjPHhU94hd21wt+L/VzxxlBDkKxxCjC
         fb8e/GheTgAk7Y5erzCYiLcvfwqHJ0sLGHoRlmsNmfUSM7kNEtwWRpFIG63jlkuriajq
         d7nQ==
X-Gm-Message-State: AOAM533WoB74xg9lqmySSjUrmEydQfZsA493hAnx4jHrjkiwAWN7BT9i
        iwI19523ESitanXSlKoOkpU=
X-Google-Smtp-Source: ABdhPJxPjdO48mAHhc0Yfeh7RAPvqjOKezklCtvAm9WAh/pkkNf2x4r2npZxG766uML6g4JZzR6N+A==
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr40641329qvb.50.1618426546599;
        Wed, 14 Apr 2021 11:55:46 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:66e0:478a:8197:7396? ([2001:1284:f016:a037:66e0:478a:8197:7396])
        by smtp.gmail.com with ESMTPSA id x82sm259362qkb.0.2021.04.14.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:55:46 -0700 (PDT)
Message-ID: <fae832b2555f1d971b45fcdfe34952aa03a42e4d.camel@gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: pci: Format multi-line
 comments according to coding-style in file atomisp_cmd.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Wed, 14 Apr 2021 15:55:42 -0300
In-Reply-To: <20210414183325.GD3@paasikivi.fi.intel.com>
References: <20210414182755.GA2799@focaruja>
         <20210414183325.GD3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qua, 2021-04-14 às 21:33 +0300, Sakari Ailus escreveu:
> Hi Aline,
> 
> Thanks for the patch.
> 
> On Wed, Apr 14, 2021 at 03:27:55PM -0300, Aline Santana Cordeiro
> wrote:
> > Format multi-line comments according to the coding-style.
> > Issue detected by checkpatch.pl.
> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 109
> > ++++++++++++++----------
> >  1 file changed, 65 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > index 592ea99..6113785 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -67,7 +67,8 @@
> >   * At 15fps this means 133ms. We set the timeout a bit longer.
> >   * Each flash driver is supposed to set its own timeout, but
> >   * just in case someone else changed the timeout, we set it
> > - * here to make sure we don't damage the flash hardware. */
> > + * here to make sure we don't damage the flash hardware.
> > + */
> >  #define FLASH_TIMEOUT 800 /* ms */
> >  
> >  union host {
> > @@ -562,7 +563,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
> >                          * and driver needs to keep old
> > sequence_temp value.
> >                          * NOTE: There is assumption here that ISP
> > will not
> >                          * start processing next frame from sensor
> > before old
> > -                        * one is completely done. */
> > +                        * one is completely done.
> > +                        */
> >                         if (atomic_read(&asd->sequence) ==
> > atomic_read(
> >                                 &asd->sequence_temp))
> >                                 atomic_set(&asd->sequence_temp,
> > @@ -1247,7 +1249,8 @@ void atomisp_buf_done(struct
> > atomisp_sub_device *asd, int error,
> >  
> >         if (IS_ISP2401) {
> >                 /* If there are no buffers queued then
> 
> This should begin with:
> 
>                 /*
>                  *
> 
> And the same for the rest. Apart from this the patch seems fine.
> 
Hi Sakari,

I'm going to send a v2 correcting all the multi-line comments that are
not beginning like this.

Besides, there are single line comments with different styles, a few
like this:

case 1:				/* comment */

and the other like this:
				/*
case2:				 * comment
 				 */

Should I standardize these ones to the first case?

Thank you for yout attention,
Aline

