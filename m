Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47CCA566ECB
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 14:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiGEMzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 08:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237002AbiGEMyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 08:54:41 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4062873D
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 05:28:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r18so15037732edb.9
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8M8W3el23nTdsEVF7vUfbGyLGfsRauW/NFEt/AQw2YA=;
        b=tWw+e/DdWDygSY37p0tZze+64WDqzncXLkboCNCE9GXHGvbyB+72Zsno/FPEqY95lD
         9XtYHj4L9ByLVSW/vvRey2s3vrhQ+w3Y+knB5VzHtZ2Kywe6L8FCcbG+Vo8xJVl65iVp
         NhzgaQQZUkWzuuWvnqq3ienSNd0vVc/TOOg+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8M8W3el23nTdsEVF7vUfbGyLGfsRauW/NFEt/AQw2YA=;
        b=oOOB6eebgS9j1ykKVfD8f8/9mG22ioWGXYd60HBhM+H4JG7OdMSmwubezgnNwAdM6x
         ApRT/9WogzEfYhq6R8aLvuQLsy1SZmqVLBggUul7ER+qkH9rtx53ipgvaDi/ahiJINrf
         EQ4IrHrGFn/R3VtRDJRCBwUS2M7SIHQnFlD/r35XnSVia2tU4VIHlOk0ig7Eg6ApH2on
         xoxqKEUjRMpjnV5/kfKrPyCEiXpQyNN7uqECijn+yQgrAqxro/ROWVw0tq9Jwbt0Xw3B
         ybh1nHC6lcVqGH0dRGKhnUNnwLqajO4+WmjHh8izwUDq5i8LLCRXNZPbyt6GJ1NMJMYF
         BJ+A==
X-Gm-Message-State: AJIora/WhcWHdrKABLnvRqLTN2SrIf6FDAhjQusq0t9tiKoyilcD9oVI
        CkeKuBFh8BPpUcAKZh96th6ncGxZ9RDJow==
X-Google-Smtp-Source: AGRyM1u16TAeGBzvprCxI4Xmw1s+jP1VMuNusGXs1B9XzwQl5efAZH0C7suQJy7/NDgjO+iSnif3QA==
X-Received: by 2002:a05:6402:510b:b0:437:28b0:8988 with SMTP id m11-20020a056402510b00b0043728b08988mr46905098edd.260.1657024057325;
        Tue, 05 Jul 2022 05:27:37 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ek5-20020a056402370500b0043a253973aasm5524088edb.10.2022.07.05.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:27:36 -0700 (PDT)
Date:   Tue, 5 Jul 2022 15:30:41 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsQu8XxEj2zKPsJG@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
 <YrwRROJbH/P5lYi+@carbon.lan>
 <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
 <Yr3w1T7s/7DTgZVd@carbon.gago.life>
 <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com>
 <YsQHwUCLlombAj85@p310.k.g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsQHwUCLlombAj85@p310.k.g>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-05 12:43:41, Petko Manolov wrote:
> On 22-06-30 22:42:57, Laurent Pinchart wrote:
> > On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> > > On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > > > 
> > > > For an i.MX8MM I'd try running the mainline kernel directly. If that 
> > > > doesn't work, I would backport the camera drivers from mainline to the 
> > > > v5.15 NXP kernel. As far as I know, the v5.18 branch isn't an official 
> > > > BSP release (I'm actually not sure what it's for).
> > > 
> > > The 5.15 NXP kernel got released sometime in June, but the CSI capture 
> > > drivers are pretty much the same as in their older versions.  So sad...
> > > 
> > > Nevermind, i'll share any good news here as well as the imx492 driver code 
> > > as soon i am certain it can successfully stream in at least one mode.
> > > 
> > > BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for 
> > > v5.18 (mainline) kernels. I am not certain whom should i send the patch.  
> > > Would that be Rob Herring or should i just use 'git blame' to identify the 
> > > victim? :)
> > 
> > scripts/get_maintainer.pl is your friend for that.
> 
> Done, sent a patch for review to lkml and Rob.

Still waiting for the storm to come... ;)

> Banged on var-som-symphony DT enough to get imx492 detected (on 5.19.0-rc4) by 
> its driver.  imx-mipi-csis also looks happy enough.  Both drivers finish their 
> probe() successfully.  However, i don't see /dev/video0, any ideas what might 
> be the reason?

Please ignore the above.  I had to enable VIDEO_IMX7_CSI for the right driver to 
get loaded.  What a mess.


		Petko
