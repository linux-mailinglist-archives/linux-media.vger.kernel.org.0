Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD6263AA7F
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbiK1OIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbiK1OIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:08:18 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A88D2252F
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:07:24 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id fy37so26020663ejc.11
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T03xYO0xkCnKq7qYegQtsZ/KwYhW+ESpmdHMTsd0uCE=;
        b=IcaiRUAm65EZmtwBbvzYZ4tHw6+BC41Pf8VaxxeFpn/ekJGtLPq9LBb0azmmT3ENeT
         XdCgaXQEZu6w1kbZlr7acpfM0kevs6dIqezRzrpnzjmhG1C5Ev2xTwhDXVCqBYBiBU9y
         BKFIHWmK7MM4mY+P+nZEe8qVuJPWHBAsnavWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T03xYO0xkCnKq7qYegQtsZ/KwYhW+ESpmdHMTsd0uCE=;
        b=U+bPgjiA6c1vCPBwP/uaFaydxVv7qd1JUxUcY6W5NmxkEFNSSnFD2RKfpK09gb8dGZ
         8sSFeNniVSKx+kZ9+9Uc1MUeGpgXKuVrS4MKW4FrELemGLpGtNvm3FouJ653qIP4uATv
         P5iSZo0VdDyYAeHprkEWMavaFqD5hf+nOJiQsZDNJ6WrEDDngJdQDKpf9qjkkP1lZub2
         YzU+43iyAXRWPX9iTuHY3veCgbrnCWLTwELk6ACnCa+jvEc+9ObbkSzYXSA+2rpsDrIs
         sMFpfTZhM60uHvnqvsSxFqtmNZ66Cv5vzjZif48ln4D89URJppAGJgC7VAoTAFrU1lQ8
         VmEA==
X-Gm-Message-State: ANoB5plJePI7UpI3IKBXMmXc1hSfZpvMMgMzyjGESbMnIfIny97kuAo8
        95Db97wc0Jd1j+Xhzgn3LyHcIw==
X-Google-Smtp-Source: AA0mqf7BKEyBVKqhELMhGIM08T1V3Kt0pd9ZvSwRnqiw6kmizIQGa+/xVtt36fi5vXHZuYBRmT6/UQ==
X-Received: by 2002:a17:906:edce:b0:7ad:dd43:5d18 with SMTP id sb14-20020a170906edce00b007addd435d18mr26761889ejb.389.1669644443456;
        Mon, 28 Nov 2022 06:07:23 -0800 (PST)
Received: from bender.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id e4-20020a50fb84000000b00467960d7b62sm5239973edq.35.2022.11.28.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 06:07:23 -0800 (PST)
Date:   Mon, 28 Nov 2022 16:07:22 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi
Subject: Re: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
Message-ID: <Y4TAmvy6gKNdc0n6@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com>
 <166963953216.1079859.6469563044691422088@Monstersaurus>
 <Y4Sziw2nt8gSyjSv@bender.k.g>
 <166964269270.1079859.9052080973667851964@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166964269270.1079859.9052080973667851964@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-11-28 13:38:12, Kieran Bingham wrote:
> Quoting Petko Manolov (2022-11-28 13:11:39)
> > On 22-11-28 12:45:32, Kieran Bingham wrote:
> > > Hi Petko,
> > > 
> > > What device/ISP are you testing this sensor on?
> > 
> > I'll tell you, but only if you promise to not laugh too much.  Deal?
> > 
> > i.MX8M-Mini
> > 
> > I hope nobody will notice the above line...
> 
> I won't laugh at all. We've just merged the ISI pipeline handler for
> libcamera, which should let you use libcamera on this target (I think).

I think i saw your patch in the ML.

> I would hope sometime in the future you'd be able to use the ISI pipeline
> handler with a GPU based ISP with this sensor too.

Both of the above are present in i.MX8M-Plus, not the Mini.

> How are you managing the image 3a? the imx492 is a raw sensor isn't it ?

Not sure what you mean by "image 3a" and yes, it's a raw sensor.

> > > Quoting Petko Manolov (2022-11-25 15:31:15)
> > > > This patch adds dt-bindings documentation, driver source, etc for Sony imx492
> > > > image sensor.
> > > > 
> > > > imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color or
> > > > monochrome square pixel array and approximately 47.08 M effective pixels. 12-bit
> > > > digital output makes it possible to output the signals with high definition for
> > > > moving pictures. It is programmable through I2C interface. The I2C client
> > > > address can be either 0x10 or 0x1a depending on SLASEL pin. Image data is sent
> > > > through MIPI CSI-2.
> > > > 
> > > > Petko Manolov (5):
> > > >   DT bindings for imx492
> > > >   media: i2c: imx492: driver's header
> > > >   media: i2c: imx492: driver's source
> > > >   media: i2c: add imx492 config entry
> > > >   media: i2c: add imx492 entry for make
> > > 
> > > Could you squash patches 2, 3, 4, and 5 into a single patch please?
> > 
> > This is the exact opposite to what the networking folks would prefer, but it's
> > OK with me.
> 
> Haha ... yes - isn't it great working in mulitple subsystems....

Yeah, easy to get confused... :)

> > > Also - I think you'll need an entry in MAINTAINERS.
> > 
> > Right, that one too.
> > 
> > > I can't see any reference to the selection controls:
> > >  - V4L2_SEL_TGT_CROP_DEFAULT
> > >  - V4L2_SEL_TGT_CROP
> > >  - V4L2_SEL_TGT_CROP_BOUNDS
> > 
> > These are in a very early phase of implementing.
> 
> Ok
> 
> > > Do you have the datasheet or sufficient information to be able to implement
> > > these controls?
> > 
> > Of course not.  We are brute forcing our way forward by mostly reverse
> > engineering another solution that has an FPGA on the other end of the CSI link.
> 
> Understood ;-) (and ... I think what I was fearing/anticipating).

I would have been too easy otherwise.


		Petko
