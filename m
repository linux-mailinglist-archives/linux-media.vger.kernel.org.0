Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4E566649
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 11:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiGEJkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 05:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiGEJkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 05:40:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5624E11A3C
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 02:40:26 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lw20so20655600ejb.4
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eVDIofOrUUcwMYGlHAM16/DdXg5h/K6bRiFH8cfnhcM=;
        b=gc4SemvwlGzkkzLoURTEA41vG8g+/bTrhyDi1XIPLHNXPXRYxtYvMWnSqHs3XPdDWX
         AQgPxXv4Jj+VnyZbLFfeJS425hmOkJdl9EsE2Tka2Nj6HiP4pfLaaNbBAK6hwzkAKh1O
         x3LqdTcGAfPTH+t0nPbKVlG8iQaJP29mLM0FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eVDIofOrUUcwMYGlHAM16/DdXg5h/K6bRiFH8cfnhcM=;
        b=yGO11u9Rn687ms61x0o0wa/cIrFIt2oFrfEgi+vmIolAyII4CGJgvTGvzdDrFOdT37
         +wgVBbHcbuSIaTEYjQO5oEug5pR9TS4THgwnF/DlP7HHh3MOZkGr4UZ4soU0omdb/6jb
         C7UjGG/FrzCoq0kwtnLB4/ZzVi2Rr53gUqbDgQvZgBExNj+2yEPH1zZFPAkS7z3tJQIi
         DWOJArPtQ1hLkunPbQM4ToeAYzYGAyX6QYsgyMw64eVRWEaY1/7ALp5up3yIetnzcidB
         XOFM0kJHyMIIHo2/rR+rvKRywx14eavhtYdtuaEek87eLOduJKd/Uc8B0qj9w78f/BuD
         STaw==
X-Gm-Message-State: AJIora+jrYcGW4UGsYjBSKIH6yGLtBwqZR6wqhmKpZeujQz9VY9AUBmx
        SEhu4GCIztb6db8KNtkYDDEG5Bg+u8+RRw==
X-Google-Smtp-Source: AGRyM1vzsU2kifoKgR2rS3njXY+ag6q8a1tiVieSmxxxXRRPNZ6P8nKVI8xF+rhe9m/vJfvikNiwbw==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id 29-20020a17090602dd00b0071212933dd8mr32669296ejk.448.1657014024922;
        Tue, 05 Jul 2022 02:40:24 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id y20-20020a17090629d400b00704cf66d415sm15602892eje.13.2022.07.05.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:40:24 -0700 (PDT)
Date:   Tue, 5 Jul 2022 12:43:29 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsQHwUCLlombAj85@p310.k.g>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
 <YrwRROJbH/P5lYi+@carbon.lan>
 <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
 <Yr3w1T7s/7DTgZVd@carbon.gago.life>
 <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr38wcjA24QkZSRQ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-06-30 22:42:57, Laurent Pinchart wrote:
> On Thu, Jun 30, 2022 at 09:52:05PM +0300, Petko Manolov wrote:
> > On 22-06-30 03:50:55, Laurent Pinchart wrote:
> > > 
> > > For an i.MX8MM I'd try running the mainline kernel directly. If that doesn't
> > > work, I would backport the camera drivers from mainline to the v5.15 NXP
> > > kernel. As far as I know, the v5.18 branch isn't an official BSP release (I'm
> > > actually not sure what it's for).
> > 
> > The 5.15 NXP kernel got released sometime in June, but the CSI capture drivers
> > are pretty much the same as in their older versions.  So sad...
> > 
> > Nevermind, i'll share any good news here as well as the imx492 driver code as
> > soon i am certain it can successfully stream in at least one mode.
> > 
> > BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for v5.18
> > (mainline) kernels. I am not certain whom should i send the patch.  Would that
> > be Rob Herring or should i just use 'git blame' to identify the victim? :)
> 
> scripts/get_maintainer.pl is your friend for that.

Done, sent a patch for review to lkml and Rob.

Banged on var-som-symphony DT enough to get imx492 detected (on 5.19.0-rc4) by 
its driver.  imx-mipi-csis also looks happy enough.  Both drivers finish their 
probe() successfully.  However, i don't see /dev/video0, any ideas what might be 
the reason?


thanks,
Petko
