Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04F335F650
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 16:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349754AbhDNOkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 10:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349690AbhDNOkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 10:40:13 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3CEC061574;
        Wed, 14 Apr 2021 07:39:51 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id t11so7014835qtr.8;
        Wed, 14 Apr 2021 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2B1LMPTBMBAU8JXDhbFQ2mBUnwK8BELBWD2+5f+8D7U=;
        b=FiLrkyTDp6GJ98Bu7H48INTpDWgOiffBp7x8jMPGeRWaKcfr6Wjy9rIxsWrwBT1grG
         4CJmyGp3XeYv1b9pjxXkPE7U86VFDyfKu0eYDXEK8nUkwG99ccg3pa99IH9wWhkyb+O/
         Y32m9Gh3xdf3GYS0QFrqzlzN6nnGns0ggN2ZGryzQOaaCFFfFA/6AsgMZpkamHaeubTh
         pF4g2J8zoeLFSuKrLMSAkIaXO7wVtM0h88tfIYoe+4tRKcuBnENHX3lbPSd2UiZ7Rab8
         WQ7NNhX0qo8vhuUxpgVbirIuKT8sdSmBRshkAQG6mLNHzEI1rhPbxCet4CNlEpPdg+79
         uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2B1LMPTBMBAU8JXDhbFQ2mBUnwK8BELBWD2+5f+8D7U=;
        b=V+/h1JjN3/W3qvTJN70gOMspv/v5wtKCe3CInpoh7gnJtNROglr4hYAh76NwPYh7zW
         raRbppGSn3n5k7uLp87HaX9QWPbOM484s0gSd2cft4Sns63+BApjbhiJKRv/A6Cjsg4m
         Me61c1Sbu+znu58jUPUGOs1eE4bF2XLkqVBq+Me6fcW8sOO2ZV9n7zDGH4U7MWXCRK6j
         z3icwCh+2QjPM2U5/+RGzdrw6ytYR22SyqB+nsIDZAJLy0HZtOlr94/MsERSkdUbxl32
         EzNYZ/1+OzG6xQrWF4Rdhd9b/+9pkHMpENYxPQsPDkB+0+klDuJnUZvOTgUHg1O61qOl
         AMcA==
X-Gm-Message-State: AOAM533kiL0Jpvy189t1vkqwlAiMyyCiIAf9dWYYK3YPi5QpfOA4JUxp
        uQPY9QA96db7Jqlb0dw97Do=
X-Google-Smtp-Source: ABdhPJyCfw2axk8SsI63eBuL3QAMPnt5uxawiDA1dOramrBp7UVAaRcUl0Ur1gXGZ/AboH4Hiff+Yw==
X-Received: by 2002:a05:622a:30f:: with SMTP id q15mr4076305qtw.4.1618411190499;
        Wed, 14 Apr 2021 07:39:50 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:7038:c088:ae60:452d? ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id l24sm3425807qtp.18.2021.04.14.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:39:50 -0700 (PDT)
Message-ID: <45412a2374f2fb324973796105d7bf0ef2bfd36d.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_v4l2.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Wed, 14 Apr 2021 11:39:46 -0300
In-Reply-To: <20210414143011.GV6021@kadam>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
         <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
         <20210414143011.GV6021@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qua, 2021-04-14 às 17:30 +0300, Dan Carpenter escreveu:
> On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro
> wrote:
> > Correct identation in block of conditional statements.
> > The function "v4l2_device_unregister_subdev()" depends on
> > the results of the macro function "list_for_each_entry_safe()".
> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > index 0295e2e..6d853f4 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > @@ -1178,7 +1178,7 @@ static void
> > atomisp_unregister_entities(struct atomisp_device *isp)
> >                 atomisp_mipi_csi2_unregister_entities(&isp-
> > >csi2_port[i]);
> >  
> >         list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs,
> > list)
> > -       v4l2_device_unregister_subdev(sd);
> > +               v4l2_device_unregister_subdev(sd);
> >  
> 
> It's really more common to use curly braces for list_for_each() one
> liners.
> 
>         list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs,
> list) {
>                 v4l2_device_unregister_subdev(sd);
>         }
> 
> regards,
> dan carpenter
> 
Thank you for warning me.
I'm going to send a v2 adding the curly braces.

regards,
Aline

