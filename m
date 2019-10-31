Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE2EEB11E
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 14:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfJaNYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 09:24:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36492 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaNYC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 09:24:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id v19so4384578pfm.3
        for <linux-media@vger.kernel.org>; Thu, 31 Oct 2019 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3/3zefGdd/m7PrcI6IIG3Bg/D+mngne/UflLyB/7dd8=;
        b=bRmgPup583Mc6OobDi/6C5sQsjDtV2HyjRVNLtJtqZ4S0SRGxQYqnKcIiBTJfjxTde
         9RNI0VlfO0aYbT0P/KtvSXja9GmpA9OkorPOD2UvwTIL9dLdSl8PWSwgFwFl43VhD8DY
         XqZZha0G9zgo79ITCjc5VL1KOtqkBFYVLgMLsio+vdnggwYRyGzPcgdgRnQWbKARadTc
         WGKuTK5tDnFNP8vhICOtWb7mqYAphf4pt6Zc29T+O7U+QjcPSezoCqxWSzSZoVE9Joy9
         OAE8B7zHEYbTP3ruUpx7UNfkqsIPfBkp/H99wgigHfXjsx9i25ot7RLsQ1uExSmKPSLY
         +7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3/3zefGdd/m7PrcI6IIG3Bg/D+mngne/UflLyB/7dd8=;
        b=nGGD3QE8U/Qt8PbPdCdasWWNLnHPChHizB+0+8l9FbS3Xu4eNy6LVNJpGtDVSWwFT/
         3i6VGKyQuEVtIwlL7v7SYJc2BpBFqPuuuMnJdwkPiIaGIGQykPQIs0UFpQ33wS3zdxRa
         5qL92aHMbpFivwUg7dRxzKmA200e+BV8+pMsMhNjnpgvWbpRUUgaBhYwnTGN9cdGHtal
         VOiR4gNNAZrtCa2xih7E//Uk6jx+CojVY0/I8/FTV1/MfuIRqIA4vHCKvz5L86qZWn94
         b+hI86mbTOz/rAcWCNndI8qUbKloXukrHTXC00lRMvfZ9wrukOdRgGIG6Vun+L3d8qd3
         g/Fg==
X-Gm-Message-State: APjAAAWv3BDaQaJqPcBXY5pUKf3y/gqO8mUk0v2nzGdJvxVf9zs8s9R1
        5yOGvjUNKTxnOA8N/AyAN/Pd
X-Google-Smtp-Source: APXvYqyPg398pV24unnlRJA8FSF5mvJIArjEkUPaba1ia8tYVRPfcaewJy2LErl1WsFc3V1vvL88Nw==
X-Received: by 2002:a17:90a:eac8:: with SMTP id ev8mr7184114pjb.99.1572528241163;
        Thu, 31 Oct 2019 06:24:01 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id q11sm3173306pgq.71.2019.10.31.06.23.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 06:24:00 -0700 (PDT)
Date:   Thu, 31 Oct 2019 18:53:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 0/2] Add IMX296 CMOS image sensor support
Message-ID: <20191031132352.GA24273@mani>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191031131644.GA8917@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031131644.GA8917@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu, Oct 31, 2019 at 03:16:44PM +0200, Laurent Pinchart wrote:
> Hi Mani,
> 
> Thank you for the patches.
> 
> On Wed, Oct 30, 2019 at 03:19:00PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This patchset adds support for IMX296 CMOS image sensor from Sony.
> > Sensor can be programmed through I2C and 4-wire interface but the
> > current driver only supports I2C interface. The sensor is
> > capable of outputting frames in CSI2 format (1 Lane). In the case
> > of sensor resolution, driver only supports 1440x1088 at 30 FPS.
> > 
> > The driver has been validated using Framos IMX296 module interfaced to
> > 96Boards Dragonboard410c.
> 
> I've just been made aware of your work. I also worked on an IMX296
> sensor driver in parallel, which I will post to the list. My driver
> doesn't hardcode the resolution but computes register values at runtime,
> so I wonder if it could be a better option. I'll post it now.
> 

I'm fine with it. The reason the driver is simple in the first place is, that's
how my usual workflow is. Start small and build it big ;-)

Anyway, I'm happy if your driver gets in.

Thanks,
Mani

> > Changes in v4:
> > 
> > * Fixed issues related to gain settings and few misc cleanups in driver
> > * Documented port node and removed maxItems, default prop from dt binding
> >   as per the review
> > 
> > Changes in v3:
> > 
> > * Fixed the reference to video-interfaces.txt in binding.
> > 
> > Changes in v2:
> > 
> > * Switched to YAML binding
> > 
> > Manivannan Sadhasivam (2):
> >   dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
> >   media: i2c: Add IMX296 CMOS image sensor driver
> > 
> >  .../devicetree/bindings/media/i2c/imx296.yaml |  94 +++
> >  MAINTAINERS                                   |   8 +
> >  drivers/media/i2c/Kconfig                     |  11 +
> >  drivers/media/i2c/Makefile                    |   1 +
> >  drivers/media/i2c/imx296.c                    | 715 ++++++++++++++++++
> >  5 files changed, 829 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> >  create mode 100644 drivers/media/i2c/imx296.c
> 
> -- 
> Regards,
> 
> Laurent Pinchart
