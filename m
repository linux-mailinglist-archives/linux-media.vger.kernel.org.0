Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614CD36D16F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 06:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhD1Ezs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 00:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhD1Ezr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 00:55:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EC9C061574;
        Tue, 27 Apr 2021 21:55:03 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id h7so3559261plt.1;
        Tue, 27 Apr 2021 21:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZqQhFHRMnmMXoEihqnFM23lMTpYQSELleFFBsJcFYD4=;
        b=Mn0g2d6TBQgvNBBugzJ12Rd8D2+Da73PlHED8xTrQDst2DdIAdoTo5V+zNTbbvcuKa
         h007sxdALGnSpvlCLQfOKVuY0udIEE1eHvoEZhJj6WmwTW4JDUUaqgei01i1qNDtjv+S
         Zt2saGW5VbQL91wYWFfzmYwbUd7JszCGM4H/+gg+Ck27iOWQIhRaNNSXDkvPrghBcgEr
         1sdhlx8oR0ChMKiuUbTm3jxYi/dGcjd1y9TSugQrO67+Oyaz9AeuLFckWLMa8VFA9vzK
         j1aujKebpFlYSmBEjB9uOytL5uuYTVvxMCYIeguy/d3jeRswbDzJ2KNT+QS3ir/rYKSr
         hFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZqQhFHRMnmMXoEihqnFM23lMTpYQSELleFFBsJcFYD4=;
        b=B1Ku0W3Z7X6WLQ0TV2T9bTv0j1V8/9UWIpiimqcGL2C0yPJpiNrfv4JMccu9himdwE
         Wj8/89TLXTrSJ0g9xcGN7LBMv7tbjVqvzzHaK5Jo9520m+2UHOW22UybaIh4uJGVdZKb
         24yJxlp0a5WZToV5/ZQnnBA9OaiuPTHdTzctdmyUn6XQQdIzfk5TwFp317pipxk/d1R/
         22mIyYDur7FZ+UNCpzzmyQfuo0VQgMDZ7QwPbVYyaia/Jwfm4+p8hnL4KVMZKcSxKJCc
         AsOH3rmJlJ83w8a2SFWgdM6jKD7byAYluENSUKRtr4IyZvbk4BYjSPtnhBynged6DpnN
         eNkA==
X-Gm-Message-State: AOAM531rtDaodQ1lXBuUP40seKFM2bSI/ah05bRvMHTWV3T+iZ/pNA1U
        rpxLusvuT8KAYfbp4nkOCWg=
X-Google-Smtp-Source: ABdhPJz8oJFhCYn5LUB6Qaby3t57HY4RYtUP5dfQtRFujwTzA4n2v+vGhY8p9o6GKiOJe1ItGhiPLQ==
X-Received: by 2002:a17:90a:ad84:: with SMTP id s4mr2004969pjq.162.1619585703052;
        Tue, 27 Apr 2021 21:55:03 -0700 (PDT)
Received: from user ([2001:4490:4409:14a:1c7f:16a3:e48a:fdc2])
        by smtp.gmail.com with ESMTPSA id o127sm3973433pfd.147.2021.04.27.21.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 21:55:02 -0700 (PDT)
Date:   Wed, 28 Apr 2021 10:24:54 +0530
From:   SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, saurav.girepunje@gmail.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] media: atomisp: pci: remove unneeded variable
 'err'akari.ailus@linux.intel.com,
Message-ID: <20210428045454.GA20682@user>
References: <20210418144323.GA54920@user>
 <20210418150708.GA1402@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418150708.GA1402@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 18, 2021 at 05:07:09PM +0200, Fabio Aiuto wrote:
> On Sun, Apr 18, 2021 at 08:13:23PM +0530, Saurav Girepunje wrote:
> > Fix the following coccicheck warning:
> > 
> > drivers/staging/media/atomisp/pci/sh_css_mipi.c:39:5-8:
> > Unneeded variable: "err". Return "0" on line 44
> > 
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
> > ---
> >  drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > index d5ae7f0b5864..708903a31b08 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > @@ -36,12 +36,11 @@ ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
> >  int
> >  ia_css_mipi_frame_specify(const unsigned int size_mem_words,
> >  			  const bool contiguous) {
> > -	int err = 0;
> >  
> >  	my_css.size_mem_words = size_mem_words;
> >  	(void)contiguous;
> >  
> > -	return err;
> > +	return 0;
> >  }
> >  
> >  /*
> > -- 
> > 2.25.1
> > 
> > 
> 
> Hi Saurav,
> 
> this ia_css_mipi_frame_specify seems to be unused. On
> header file, before the prototype it is said that it could
> be removed only when all drivers moved to a new API.
> 
> Is that comment obsolete?
> 
> thank you,
> 
> fabio

yes this ia_css_mipi_frame_specify is unused. On header file 

/* Backward compatible for CSS API 2.0 only
 * TO BE REMOVED when all drivers move to CSS API 2.1.
 */

 deprecated{Use ia_css_mipi_buffer_config instead.}

new api also suggested on comment.

saurav
