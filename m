Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8F263A90B
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiK1NL7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:11:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbiK1NLp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:11:45 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2211CB36
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:11:42 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id d20so4585620edn.0
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tn1qSVBoDTJ4D3/zFOyAR+oU/01EqgsNQhmHNHWkoo8=;
        b=AgJgHBvqKXk0BiiIRmePSA6jurvxDPthRK56k5sSs7X82DfUvTlPo3KNX8NMLSwjqJ
         SyGj6XBlVI4NY7QRSiKZnYVmnrf4tBzEJ3Yh5La4q9fZAq++7eiSBRHnCGtPv1fhaC0m
         pxyzZtJx38lwdR+d1l8CvKDsHJt8M3ExqfFmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn1qSVBoDTJ4D3/zFOyAR+oU/01EqgsNQhmHNHWkoo8=;
        b=vyJo0kEn3QdmUywoA7FtU1wqbR2XVYErA5Dcn9ahgf48N23UQj05/JTy6L6JPq2yXr
         Czn8IwqGNwibTxlRpsRTDq5PELT+6je3c8lswpSgBYqyNLxNKLwCwjcI3qnj1CjDZxau
         NvEeUKFU/ir1D11m4FDZRMu2IDtpwxTkTV3cVqFgMk5iIypswD0vDrxIlAZTxPpJ5nyN
         DGxqLWbSuQ8jGKi9UqLWjUEYzprcDhwUkcptDOLyLyN8Ax6j8i6h06s+fnVlYm00sU8+
         PyWhldN8K0lkFSSLGyR4BlojxCKgazeSNm4SM2NP5lBqycA1RNUUfIVAm6yV+Ox1pVr6
         VVNw==
X-Gm-Message-State: ANoB5pnzhFUk3vuNpFta+VmMkZ04YV7SNCvUXzPNpl46JrgwiaP0K1Sd
        PawWggEIYvykYz6YzV7FnsavUw==
X-Google-Smtp-Source: AA0mqf62mQ8isAz4SrWRI59Df86428hl0cLjacgHKmaQSH7m8NLw6RPRqoJcDvFtPD+GodfiTVrccg==
X-Received: by 2002:a05:6402:d6:b0:458:b42e:46e6 with SMTP id i22-20020a05640200d600b00458b42e46e6mr47607846edu.375.1669641101306;
        Mon, 28 Nov 2022 05:11:41 -0800 (PST)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id cn8-20020a0564020ca800b0045b910b0542sm5148074edb.15.2022.11.28.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:11:40 -0800 (PST)
Date:   Mon, 28 Nov 2022 15:11:39 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi
Subject: Re: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
Message-ID: <Y4Sziw2nt8gSyjSv@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <166963953216.1079859.6469563044691422088@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166963953216.1079859.6469563044691422088@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-11-28 12:45:32, Kieran Bingham wrote:
> Hi Petko,
> 
> What device/ISP are you testing this sensor on?

I'll tell you, but only if you promise to not laugh too much.  Deal?

i.MX8M-Mini

I hope nobody will notice the above line...

> Quoting Petko Manolov (2022-11-25 15:31:15)
> > This patch adds dt-bindings documentation, driver source, etc for Sony imx492
> > image sensor.
> > 
> > imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> > monochrome square pixel array and approximately 47.08 M effective pixels. 12-bit
> > digital output makes it possible to output the signals with high definition for
> > moving pictures. It is programmable through I2C interface. The I2C client
> > address can be either 0x10 or 0x1a depending on SLASEL pin. Image data is sent
> > through MIPI CSI-2.
> > 
> > Petko Manolov (5):
> >   DT bindings for imx492
> >   media: i2c: imx492: driver's header
> >   media: i2c: imx492: driver's source
> >   media: i2c: add imx492 config entry
> >   media: i2c: add imx492 entry for make
> 
> Could you squash patches 2, 3, 4, and 5 into a single patch please?

This is the exact opposite to what the networking folks would prefer, but it's
OK with me.

> Also - I think you'll need an entry in MAINTAINERS.

Right, that one too.

> I can't see any reference to the selection controls:
>  - V4L2_SEL_TGT_CROP_DEFAULT
>  - V4L2_SEL_TGT_CROP
>  - V4L2_SEL_TGT_CROP_BOUNDS

These are in a very early phase of implementing.

> Do you have the datasheet or sufficient information to be able to implement
> these controls?

Of course not.  We are brute forcing our way forward by mostly reverse
engineering another solution that has an FPGA on the other end of the CSI link.

> --
> Kieran
> 
> >  .../bindings/media/i2c/sony,imx492.yaml       |  101 ++
> >  drivers/media/i2c/Kconfig                     |   14 +
> >  drivers/media/i2c/Makefile                    |    1 +
> >  drivers/media/i2c/imx492.c                    | 1092 +++++++++++++++++
> >  drivers/media/i2c/imx492.h                    |  555 +++++++++
> >  5 files changed, 1763 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx492.yaml
> >  create mode 100644 drivers/media/i2c/imx492.c
> >  create mode 100644 drivers/media/i2c/imx492.h
> > 
> > -- 
> > 2.30.2
> >


		Petko
