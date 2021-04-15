Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC03360962
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 14:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhDOM1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 08:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhDOM1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 08:27:52 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA22C061574;
        Thu, 15 Apr 2021 05:27:29 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id h3so10771126qve.13;
        Thu, 15 Apr 2021 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=do6UEgvEb56r/+VgD7/HgsidFuR+UH9N0ozm3NJagw0=;
        b=Lyel7gM/m++uSGzmmS63UAQWZsHsVGwX87FUyMfcYkVP2cjVdV6MgV7CVp8NfAmwWg
         bw74WCvnkF+0/WQqKUz1MCunjyHPdweogZ0G6B2mkGpRD64omUoC6kk+SimvYA1gBG+b
         MuBkQj92eb/fmrs93vrxzXuKeqwB3bb02MBO+XMhtWz2dtc6CFNssJVvF+5Sxi/dFqz4
         Z7zo9k7euTRv1jA/sJ+2NKWGfUyfqgLqd+ILJ5ueAib1wNKN22bYoJj26HEzbLR2BIkO
         3O66Uk0Ntjs2L1ZMWnb+wUho9vFU3abMZ9G7CmFW1am08VWUPXAWxkIHcvJ2HNpqr++e
         oTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=do6UEgvEb56r/+VgD7/HgsidFuR+UH9N0ozm3NJagw0=;
        b=iKReQhs0jUtsuGF4ruyi8GHqW0Q4XDpzYpyHwCynKbjRkaTd14Y/oN76v+Iwns8I1X
         kA2zMABvL/fbbz2qjWpDOxd0yH2v8AWnXDmSVub6Kx9wR8RfFKVY9EC+oA1WjUD57QYV
         f7WB5YlURnb6UU6hBtfd+gEiQ0MVdCdbnao8dT0Qd9ovBWWv16q9srPMi+Yf0/tdUj0o
         ShQCJmTgcMT+v1cboWNa46/30o60GiIw7cvCWio1ExzvhyvnaO/UCaZV80Fk/3v1JH7n
         j8bDtritE7bZdqTReTlrlQ5x02Wxn+pqt9hMqnkWJrYYkKyPewhDLTr9/09vQTKIUmOI
         JtxQ==
X-Gm-Message-State: AOAM530+ypR2r1luX0tUl/Nlfi6ZggjxBt9LHkIGKhvPFL7jICx+Yd2Q
        PxsRFCgrqnDmJtTqc8D6Dmw=
X-Google-Smtp-Source: ABdhPJzJg6ubE+tkPGWGlrzUH7nz6/eBOm4dpi4itSqomhewIpeF5AF5sUm62T4KmMlWmafPF23sng==
X-Received: by 2002:a05:6214:18f4:: with SMTP id ep20mr2771195qvb.5.1618489649151;
        Thu, 15 Apr 2021 05:27:29 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:fda3:4e59:60ec:90e5? ([2001:1284:f016:a037:fda3:4e59:60ec:90e5])
        by smtp.gmail.com with ESMTPSA id g3sm1674684qth.66.2021.04.15.05.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 05:27:28 -0700 (PDT)
Message-ID: <138704cf6fb32f66295b2ffd9d5c376d1b6826bc.camel@gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Format comments
 according to coding-style in file atomisp_cmd.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Thu, 15 Apr 2021 09:27:25 -0300
In-Reply-To: <20210415054851.GA6021@kadam>
References: <20210414204244.GA8287@focaruja> <20210415054851.GA6021@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qui, 2021-04-15 às 08:48 +0300, Dan Carpenter escreveu:
> On Wed, Apr 14, 2021 at 05:42:44PM -0300, Aline Santana Cordeiro
> wrote:
> > @@ -90,18 +92,14 @@ struct camera_mipi_info
> > *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd)
> >         return (struct camera_mipi_info
> > *)v4l2_get_subdev_hostdata(sd);
> >  }
> >  
> > -/*
> > - * get struct atomisp_video_pipe from v4l2 video_device
> > - */
> > +/* get struct atomisp_video_pipe from v4l2 video_device */
> 
> This code is obvious and the comment doesn't add anything except
> noise.
> Just delete it.  Same for a lot of the other one line comments
> describing functions in this patch.
> 

No worries, I'm going to delete it all.
Can I send a v3 just with the issues detected by checkpatch?

Thank you in advance,
Aline

> >  struct atomisp_video_pipe *atomisp_to_video_pipe(struct
> > video_device *dev)
> >  {
> >         return (struct atomisp_video_pipe *)
> >                container_of(dev, struct atomisp_video_pipe, vdev);
> >  }
> >  
> > -/*
> > - * get struct atomisp_acc_pipe from v4l2 video_device
> > - */
> > +/* get struct atomisp_acc_pipe from v4l2 video_device */
> >  struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device
> > *dev)
> >  {
> >         return (struct atomisp_acc_pipe *)
> > @@ -269,7 +267,7 @@ int atomisp_freq_scaling(struct atomisp_device
> > *isp,
> >                             ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE;
> >         }
> >  
> > -       /* search for the target frequency by looping freq rules*/
> > +       /* search for the target frequency by looping freq rules */
> >         for (i = 0; i < dfs->dfs_table_size; i++) {
> >                 if (curr_rules.width != dfs->dfs_table[i].width &&
> >                     dfs->dfs_table[i].width != ISP_FREQ_RULE_ANY)
> > @@ -307,9 +305,7 @@ int atomisp_freq_scaling(struct atomisp_device
> > *isp,
> >         return ret;
> >  }
> >  
> > -/*
> > - * reset and restore ISP
> > - */
> > +/* reset and restore ISP */
> 
> Obvious
> 
> >  int atomisp_reset(struct atomisp_device *isp)
> >  {
> >         /* Reset ISP by power-cycling it */
> > @@ -338,9 +334,7 @@ int atomisp_reset(struct atomisp_device *isp)
> >         return ret;
> >  }
> >  
> > -/*
> > - * interrupt disable functions
> > - */
> > +/* interrupt disable functions */
> 
> Obvious
> 
> >  static void disable_isp_irq(enum hrt_isp_css_irq irq)
> >  {
> >         irq_disable_channel(IRQ0_ID, irq);
> > @@ -351,9 +345,7 @@ static void disable_isp_irq(enum
> > hrt_isp_css_irq irq)
> >         cnd_sp_irq_enable(SP0_ID, false);
> >  }
> >  
> > -/*
> > - * interrupt clean function
> > - */
> > +/* interrupt clean function */
> 
> Obvious
> 
> >  static void clear_isp_irq(enum hrt_isp_css_irq irq)
> >  {
> >         irq_clear_all(IRQ0_ID);
> 
> [ snip ]
> 
> > @@ -1918,10 +1914,7 @@ irqreturn_t atomisp_isr_thread(int irq, void
> > *isp_ptr)
> >         return IRQ_HANDLED;
> >  }
> >  
> > -/*
> > - * utils for buffer allocation/free
> > - */
> > -
> > +/* utils for buffer allocation/free */
> 
> What?  This one seems actively wrong.
> 
> >  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
> >                            const struct ia_css_frame *frame, u32
> > *p_pgnr)
> >  {
> 
> etc.
> 
> regards,
> dan carpenter
> 


