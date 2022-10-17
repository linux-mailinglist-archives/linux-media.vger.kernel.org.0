Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2536013B1
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 18:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiJQQmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 12:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiJQQmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 12:42:21 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37615973D
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 09:42:20 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a26so26255431ejc.4
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 09:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lWcG9WS3+/MVrOc+gU6GDpfPccXSEVR6p0l+LcgUhg0=;
        b=XB+k4TXurrzudPHAuVmfdBT+Qe9TN6Dxy2axkHLcXnYJkak5x/fy1gklIiWJjQQ+8G
         DwpahOGDRzSKx14elBrdVXcXIMmXVeMY1Xu+nw7tDM+cL35Y+M4J1MWsiNv+pFayxeKK
         +P1SpPgwI3UOCD3w+9kMupi1wBsGNhDR7/4dotCQzLHln1Z5Tnmb0PeSSOge//Dq5A2b
         jTfMKk0F6Bc1e7J4OyQgQGrI9wqBlvsFc9spLfcDsi21CrjQx8IsxY0tSw1dg7t06d0t
         wriKhZR1JmuwtcAd0mfm7hqspHriik0B9FliH9ex+h8Yb+3qF4i88tWjRX58IlcJEklx
         nrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWcG9WS3+/MVrOc+gU6GDpfPccXSEVR6p0l+LcgUhg0=;
        b=58SkN5yFOD1SyxQyE/pT1Ij6On0WPHVIrqIzmxDRmbcT+/IB3eGY/tCl29cdm75kRV
         6BQjqKdNaq6ecN8m2P9J+FNU2KHmXgxggxwz6a9myoDUZPIGlGBXFyeOTgmFpgh+OXWm
         Cy5BFCfUueva4/JvFrnuPnKU7fKvbtP3zRG0lhdD/tHCJGi45nh6583uRZx5ojvI9U0Y
         OsifQ42aaxhjd/OyZAMiUd3gQpoAMCHt2kaaAWCXHNYSOme9k/T19qQJaOpoii5AUjCO
         cvTCcbfkAZ5YqInz+1cmHB1VGfZP0NSKkzgcTS0m1qsfhAGMPyTEeDgfxq6i4WJPZl8J
         v1+g==
X-Gm-Message-State: ACrzQf07vUnRu1TRHrAAU5+eiiG/0C3/5r7WIpKb52cUs/6TBfK2t8xs
        oVtJg6Y2SsoFQV8k2XLkeW83+IU9lerLoYL3vOVPY2Bq+PqeSw==
X-Google-Smtp-Source: AMsMyM42DlIUUimFkmz8h4VjHPGFnkLlqlE9g/7pXCffiYKRtKriYlYWqUiArHmr7dW4Sf8Te9FI43j+GqIYL90NrTM=
X-Received: by 2002:a17:907:3e11:b0:78d:9918:217f with SMTP id
 hp17-20020a1709073e1100b0078d9918217fmr9073465ejc.742.1666024939202; Mon, 17
 Oct 2022 09:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-3-jacopo@jmondi.org>
 <m31qrk6wgc.fsf@t19.piap.pl> <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
 <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com> <20221017151003.5vqxgfewyjrmrdei@uno.localdomain>
 <Y017fLwL8zqzukl9@valkosipuli.retiisi.eu> <20221017163159.ttozu526qsqiiaaf@uno.localdomain>
In-Reply-To: <20221017163159.ttozu526qsqiiaaf@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 17 Oct 2022 17:42:03 +0100
Message-ID: <CAPY8ntDuK76bZz2Zd6JkmL=mkcK9GfNR5U6EiFFiPrLhKCM5kA@mail.gmail.com>
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Mon, 17 Oct 2022 at 17:32, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Sakari,
>
> On Mon, Oct 17, 2022 at 06:57:48PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Oct 17, 2022 at 05:10:03PM +0200, Jacopo Mondi wrote:
> > > > which is also named analog_gain_code_global, but is documented
> > > > differently.
> > > >
> > > > Could you btw read registers 0x0000 to 0x00ff and provide the data ?
> > >
> > > There is nothing interesting there if not default values. I was hoping
> > > that analogue_gain_m0 analogue_gain_c0 and analogue_gain_m1
> > > analogue_gain_c1 would provide a way to inject gains using the
> > > standard CCS gain model, but those registers are said to be read-only
> >
> > The m[01] and c[01] factors in the CCS analogue gain formula are constants
> > that determine how the sensor's analogue gain setting translates to actual
> > analogue gain. They are not intended to be modifiable at runtime.
> >
>
> You're right sorry, indeed they're constant.
>
> For this sensor:
> analogue_gain_type: 0
> analogue_gain_m0: 1
> analogue_gain_c0: 0
> analogue_gain_m1: 0
> analogue_gain_c1: 4
>
> I should be capable of programming the global analog gain using the linear
> CCS gain model if the sensor is actually CCS compliant.
>
>         gain = m0 * x + c0 / m1 * x + c1
>              = R0x0204 / 4
>
> However, the application developer guide shows the gain to be set
> through manufacturer specific registers (0x3028 or 0x305e) and I cannot
> find much correlations between the manufacturer specific gain model
> (a piecewise exponential function) and the model described by CCS, which
> seems way simpler.

I do see a reference to register 0x0204 as analogue_gain_code_global
in the register reference (page 4), and it is listed as programmable
(7 bits). No idea if it works or not.

   Dave

> > --
> > Kind regards,
> >
> > Sakari Ailus
