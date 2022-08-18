Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE8F59878B
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 17:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343948AbiHRPd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 11:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343679AbiHRPdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 11:33:24 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3954525C5F
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 08:33:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gb36so3885232ejc.10
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=o4zb7yXdUay5VxHoR2njWtR04SdLNZmXJ6cJubyH1go=;
        b=DWg9ltEezrfPmVdEAOkYgoN0x6JXrAX45IEB6dBtbSGBgBguofozTWK6QPeW8ozytA
         mbDmVbdK7lOp0Q7P098kzyRhB+YPWVAuR6Bi2vpJw+0CTHjanaK5Cbk9u9rOw6kwJqh7
         8Or1c6wSzFmuBMBOm1KNoEoI60wgz0b4Hhxwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=o4zb7yXdUay5VxHoR2njWtR04SdLNZmXJ6cJubyH1go=;
        b=SyH5RCPMfv0OppBybFSCsZlylvvkO3pUajSp/TLpsNPIlxnJu17a1H7vXm6e1NI/as
         kG1UUlIugypkMOTMG3TlJh+5e5+JZ8uCB/2Wp0Hhi8okRTX+H1o3vdyZpL89QJ6LUJyy
         YQH5dRTPQnwfRSPP/xU8/Vz4Dg3JK6FHDYUAe26PFyRi6ODPbQuFqCeZ1ddhYHk7Pz1z
         HpJwTy/baEZzy2m1eIZ17QWXIKgNfOuNhzOXNfEwLsVmSN+yOre2O7/qjTJ1osa5OD9y
         IwHu9QhCyUYjGV94YXudMhATcNg4tI7W3sEH6LIiSHqiKnEctVsddom7gx0lIjyxvBh5
         MQzw==
X-Gm-Message-State: ACgBeo3X/Tm8j0m1FY2ZkNQFcgd3Q+8Qel4Id547hS7nerN65QJCk70v
        eRZsyIWNOJik35C6jY9gVw+4nmdqwxmTnQ==
X-Google-Smtp-Source: AA6agR5iyD2JjWk8GKYhVih2IJJrDudjzHaKChyxArRMlimdlSA8BhzGO8KOO+oFfpYtZR/u/ZejNA==
X-Received: by 2002:a17:907:948f:b0:731:3f2e:8916 with SMTP id dm15-20020a170907948f00b007313f2e8916mr2355689ejc.442.1660836797126;
        Thu, 18 Aug 2022 08:33:17 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906300600b0073ae9ba9ba8sm967492ejz.3.2022.08.18.08.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:33:16 -0700 (PDT)
Date:   Thu, 18 Aug 2022 18:37:23 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: imx8m-mini csi-2 limitations
Message-ID: <Yv5cs6Rj3XsqyKsz@p310.k.g>
References: <YvpPusE1rOzmgPYN@carbon.k.g>
 <Yv4GEUTj4rMiagAX@p310.k.g>
 <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818105131.gurtn74av2ilr7bi@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-08-18 12:51:31, Jacopo Mondi wrote:
> Hi Petko
> 
> On Thu, Aug 18, 2022 at 12:27:45PM +0300, Petko Manolov wrote:
> > 	Hello again,
> >
> > After digging down NXP's documentation and reading some comments within 
> > kernel drivers (sorry Jacopo, you've left some nice comments in 
> > imx7-media-csi.c, hence you're spammed now :) i came to the conclusion that 
> > mipi-csi to csi-bridge data
> 
> No worries.
> 
> I tried re-reading all the discussions, but memory still fails me here.
> 
> I recall I had an issue with the CSIS bandwidth and somewhere I suggested that 
> it might be due to the CSI-2 specification version that the peripheral 
> implemented. I can't find that email anymore though :/

Well, only bumping up the frequency (to 1ghz) between the CSIS and bridge does 
not work out of the box.  The latter stopped generating IRQs, which kind of 
ruined the day for me.  It would be better if i know if that's at all possible, 
before start debugging the issue.

> Yes, there has been quite some discussions about how to mix-and-match the 
> settings between the CSIS (mipi-csi) and the CSI (csi-bridge) [*]
> 
> If I recall correctly there are at least three configurations at play:
> 
> - The CSIS pixel mode selection
> 
>   MIPI_CSI_ISP_CONFIG[13:12]

Got this one.

>   The driver currently forces dual pixel sampling mode for YUV422 and report a 
>   TODO:
> 
>   * TODO: Verify which other formats require DUAL (or QUAD) modes.
> 
>   Here you're trying to transfer RAW12 data, which is indicated in the 
>   register documentation as one of the formats suitable for DUAL/QUAD mode 
>   transfer
> 
>   - I'm actually not sure how and if RAW12 gets expanded to 16 bit samples by 
>     filling the 16-bit word with 0s or it either gets packed in 6 bytes with 
>     no paddings. Figure "13-33. Pixel alignment" seems to suggest that, but 
>     I'm not sure I really got that diagram
> 
> - The CSI-bridge
> 
>   - CSI_CR3[3] SENSOR_16BITS
>   - CSI_CR18[20] MIPI_DOUBLE_CMP

Ah, i did not set CSI_CR3 when i (quickly) tried to go to 16bit data width.  
I'll give it another try based on the above.

>   The comment in imx7_csi_configure() explains how different versions of YUYV 
>   (2X8 and 1X16) are handled, and why SENSOR_16BITS and MIPI_DOUBLE_CMP have 
>   to be enabled when the csi-bridge has to be instructed to sample 16 bits 
>   samples from the RX queue.

OK.

> I guess the key would be here to find out what combination of SINGLE/DUAL/QUAD 
> sampling is opportune for RAW12 (I would try with DUAL first and then QUAD) 
> and then configure the csi-bridge bus sampling mode accordingly (likely in the 
> same was as it is done for YUYV_1X16)

I've come across this comment in imx-mipi-csis.c left by you earlier this year:

"Neither of the IP cores connected to the CSIS in i.MX SoCs (CSI bridge or ISI) 
support quad pixel mode, so this will never work in practice."

I guess, if true, it doesn't make sense to waste time on quad mode.

> When it comes to bandwidth limitation, can you try to reduce the sensor output 
> size to make sure you chase one issue at the time ?

I am at Sony's mercy here.  The datasheed it full of holes and i get feeded 
small bits of information at irregular intervals.  I asked them to provide me 
with register setup for much slower data rate & pixel clock (at full speed the 
damn thing is streaming at almost 7gbps), but i'm still waiting...

> [*] Is "CSI" the most abused acronym of history ?

Maybe.  I already hate spelling this acronym even in my mind. :)

> > So i guess there are two questions:
> >
> > 	a) can the csi-bridge (and mipi-csi) be persuaded to do two-bytes for
> > 	raw12 format;
> 
> See above :)
> 
> > 	b) what's the maximum frequency for csi-bridge PIXCLK?
> >
> 
> Not sure about this one.
> 
> I've anyway cc-ed Laurent and Xavier, which can surely be helpful here

Thanks a bunch, the above information is very helpful.


cheers,
Petko
