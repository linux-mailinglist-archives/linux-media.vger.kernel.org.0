Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6DC55FAF3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbiF2IqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 04:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiF2Ip7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 04:45:59 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC0A3CFC1
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 01:45:59 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g26so31101399ejb.5
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lZZnOPLEmO42X4jx26fJVc/Euflfkgs4Cn7W1+Y9mrI=;
        b=kzh7nby9YqzmFGUxUg0W/BiJgp7uYgQv9e1KZpQH1ekBia8ZQynEoalrpc0/oDHRZ+
         rhU7dL3yTph0XKTwthzScJvG2lN8kg7XhgUy320qEoYzc6L2GkjJ4kLJob7NGC5vN8XP
         eUbM7K12juHTKalKGAHGSlLfbhq2k1/lB/vFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lZZnOPLEmO42X4jx26fJVc/Euflfkgs4Cn7W1+Y9mrI=;
        b=apuORheFfngEjDnah0mVlOgAuFsYbL1ysDu3qDIBKvV0oOddj0svq2yFGS8Nt68rdG
         ylgBjc+QPD1Ws8NSp6ka3mxN9KUdTNYq9U7BPFeoWSPHkwCU/c+jMyPKRTBkHnetNw8x
         4s/6Fdy3gvv0mBjacvYxLV5ksPyTOdZxjn5UNcbXSgsUiKdX0Le+d1BBRW3cb+IupqvV
         hem/Hw3nUi08wYaZU0dpxu3LGPh7oesoQEpn2T3GCqGraypdjHeUMztEBuhgT7Gn3iwy
         5jZ8bMCfLgJqvT/CmXvMm0MG+yl9M/JeadqubFXKLs6UsGejG1EKpMtbMSIVROFj+imm
         2FBg==
X-Gm-Message-State: AJIora/yOauQHIp/WuTi+v8ddPdjwr6qPnrn68+3Os/Q3dHgr3h7r6lt
        NR2Fi92B5QKmJFA+Xvr/CLQxQg==
X-Google-Smtp-Source: AGRyM1ufUEr/s78aubfKgIY88aE94tRbyXqBrteD37uFZlEaNDuO382CME/hTbDtgtumDJrsORc9Pg==
X-Received: by 2002:a17:906:b01a:b0:718:cc50:4c6 with SMTP id v26-20020a170906b01a00b00718cc5004c6mr2090703ejy.630.1656492357625;
        Wed, 29 Jun 2022 01:45:57 -0700 (PDT)
Received: from carbon.lan ([94.26.108.4])
        by smtp.gmail.com with ESMTPSA id hz14-20020a1709072cee00b006f3ef214db7sm7510302ejc.29.2022.06.29.01.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 01:45:57 -0700 (PDT)
Date:   Wed, 29 Jun 2022 11:45:56 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YrwRROJbH/P5lYi+@carbon.lan>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-06-29 11:28:26, Laurent Pinchart wrote:
> Hi Petko,
> 
> On Wed, Jun 29, 2022 at 10:55:43AM +0300, Petko Manolov wrote:
> > 	Hi guys,
> > 
> > First, i'd like to apologize for the noise and sending this email directly.
> 
> Your support request is directed to the linux-media mailing list, CC'ing
> appropriate developers is a good practice to make sure we notice, there's
> nothing to apologize for.

Well, it could still be annoyance.

> > I am trying to hook Sony IMX492 sensor to v5.10 imx8m-mini based platform.
> > The capture driver does not support Bayer GBRG 10 and 12bit pixel format, so
> > i had to add these.  I also stumbled upon a bug in mx6s_capture.c which, i
> > assume, is completely out of interest here as it's related to a vendor tree.
> 
> I'm surprised you stumbled upon one bug only :-) I always advise to stay away
> from BSP code as much as possible.

I am certain there is a bunch of these, but this particular one was hard not to
notice immediately, being NULL pointer dereference. :)

> > I got as far as sensor is registering with the capture mipi csi driver and,
> > if HW is properly set up on both sides, should be streaming.  While my
> > confidence is pretty high about the IMX492 setup i can't say the same about
> > the recipient part.
> > 
> > So here is my question: how stable are NXP's MIPI CSI2 and CSI2 bridge
> > drivers in v5.18?  Would it be better to switch to this version instead of
> > hacking madly at the v5.10 vendor code?
> 
> I consider them more stable than the vendor code. If there are issues there,
> we can help fixing them.

I might be mistaken, but at least in terms of media drivers code in NXP's 5.18
seems either pretty close to mainline or maybe the same.  What's your advice,
shall i use their (5.18.x+fslc) branch or take only the device-tree, if needed?

> > I've already published the code here.  Once the development is done the
> > intent is to mainline Sony IMX492 sensor driver.
> 
> That's great ! I'm looking forward to that.

Sure, that's the goal here.


cheers,
Petko
