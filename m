Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F3E562259
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 20:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235988AbiF3SwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 14:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiF3SwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 14:52:09 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21C42BB3A
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 11:52:07 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id g26so40723253ejb.5
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Do7RjztahZ4fYoSqpcyDDxtngxR6k87sqG5r92OIfls=;
        b=r9nNrQsY2NJaHt8wKiJPrxsb+41RBpUzJA6RHYPowULXJKg1FhgfqtF0Tk18WORIFj
         PzRv6GwNeonnjmXZ2QTIVD/Ge8Q9hsSDzEUraFXyJ0KNQaXAb1KJSLoOBgBDSTlZtYec
         IEL2JRbei9Oa02qPfQq5fPvwoGHnpHvnLh0jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Do7RjztahZ4fYoSqpcyDDxtngxR6k87sqG5r92OIfls=;
        b=zmJCYyOdQZhHvWKlHJ4LOxulwhNrdi/pm8fH/3m6Mg8OY5VscKt16Ipnk2r1peWK+F
         bRfA25xyD6gDsNuamLX+hxI9YokTly4J8/OO8opQ5zyrhQMzqzwIURiSQZ77wD5lYKMh
         loavgLpHy0pF347zRjJ0pcYgLymdhuNqRJhoO9nUXSYAbfcUfpS45Dssiw8yvM7ATeZG
         bc+AZ6Zjj9csEVmFM3qhGV6lfs5VhaETPkHWohgVXS5I/Xu1fRW+IhU0Cy/uaFl/hcBJ
         riiUI5rbm/KGPy/ahED4AlsGL5QS1M+CJ8XyeYvC+BmGEATi6HQkfp4EDA9SnEn8P+yd
         C/ug==
X-Gm-Message-State: AJIora/9HXGBAtjGjh/9cjKYwv6Ewp/mwSzwLs/vHBJCaBu9bUSjl1jO
        jE/KxNlmnNnKvvmsq//iU4SVTg==
X-Google-Smtp-Source: AGRyM1vgAukM0oFmJB+q4Opa+rdj/EMLW04Gz/sKernFFxIuFiClpUkZefL+B4sTpX1v6PsCaavbCg==
X-Received: by 2002:a17:906:2001:b0:6f3:bd7f:d878 with SMTP id 1-20020a170906200100b006f3bd7fd878mr10029787ejo.133.1656615126542;
        Thu, 30 Jun 2022 11:52:06 -0700 (PDT)
Received: from carbon.gago.life (78-83-68-78.spectrumnet.bg. [78.83.68.78])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm9361324eji.159.2022.06.30.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 11:52:06 -0700 (PDT)
Date:   Thu, 30 Jun 2022 21:52:05 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <Yr3w1T7s/7DTgZVd@carbon.gago.life>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <YrwNKiJA+cnm7pGr@pendragon.ideasonboard.com>
 <YrwRROJbH/P5lYi+@carbon.lan>
 <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrzzbwYr+ztrXbgZ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-06-30 03:50:55, Laurent Pinchart wrote:
> 
> For an i.MX8MM I'd try running the mainline kernel directly. If that doesn't
> work, I would backport the camera drivers from mainline to the v5.15 NXP
> kernel. As far as I know, the v5.18 branch isn't an official BSP release (I'm
> actually not sure what it's for).

The 5.15 NXP kernel got released sometime in June, but the CSI capture drivers
are pretty much the same as in their older versions.  So sad...

Nevermind, i'll share any good news here as well as the imx492 driver code as
soon i am certain it can successfully stream in at least one mode.

BTW, the 'fec' section in Variscite's var-som-symphony DT is broken for v5.18
(mainline) kernels. I am not certain whom should i send the patch.  Would that
be Rob Herring or should i just use 'git blame' to identify the victim? :)


cheers,
Petko
