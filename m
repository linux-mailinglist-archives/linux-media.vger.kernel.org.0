Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C0252BEF8
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 18:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239493AbiERPl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 11:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239506AbiERPl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 11:41:56 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD93A309C
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 08:41:34 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id fd25so3557635edb.3
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bJxVJ55viqLuO7DWJlWK3nPrGo/KubYFY25Zw9MyWU=;
        b=RE8uaXc9BRMzy20QhffCm4CPCunZbxIgnSSrP5AC3ynVfxi/mzhc34TMXZBjBgLW0A
         GWkL6bu26w0erNAxEcaU0QA2bMYY18hHPtrnmvAWDIfFbfj1bOX6PxCRkDEeElolSLg9
         huUKCPMyh0ebxAV9jirGGqXw4ITJQ0Hw7LmLjpjPip+X3F/8ux2ucsDCDmR0cDanb7yB
         I4toIkunf7qsAfZpT5CaUqeHkdR0SsMgLvwJvEdjLPX5hSQQqA82XXdQTvayaJZDXhbt
         TWNCMa1CLIhmflsyXIU/C/Habmp9FTf2NBaARAcJy7Y7LBiZ9ALKK/9zlvbs0THD4gJL
         OJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bJxVJ55viqLuO7DWJlWK3nPrGo/KubYFY25Zw9MyWU=;
        b=E6aucV7N0rLm6uLs34V8a2T0Y/gJ8j7tJ836SrPEVOsg4b1j3osp78qnUVkpqJu39b
         3d4pzXO2xSrN2pV/QSUdM8ga0lQ/Yjj8QvmKWcGngL+hOxHXVTMKEbuRX2O9xq99wxXe
         iytFz0VyARRn/V5A+DAidC0TGjDpKrXeF4hr7EjMo/fdT1Lcgex8H86dxUTJBET7+Bz3
         R41Ij7x/RMtwFaIpMcPOUnPgbq6420O80ivJBG7IDeTM6qQueKjrpt1jlUPwI/yUGnlG
         p3Ui5ta77Cm7W7QK/s9Dgwc3u+oVEeVRLlmNoywbhyNsElmi5LG4EHratxgLq6TS8WBo
         h+OQ==
X-Gm-Message-State: AOAM533KC+OShwbBYh5jiQXSZW/CAZdthXfl9JAdWt8zHYTEPXDihC5o
        Yf0T7sTwTJhowBtE++rSbZ5xiKsIDWshzah2f0D9TO76m+Du/g==
X-Google-Smtp-Source: ABdhPJw6mJ7p8GB3KVP6gJ8BcT0l+cUVXLOWgMOZlMunYCevD8jwlFGagTL+YkXnfr0WhdIMBtKzt9pqqcfYIj+kyMI=
X-Received: by 2002:a05:6402:90d:b0:428:c1ad:1e74 with SMTP id
 g13-20020a056402090d00b00428c1ad1e74mr336173edz.345.1652888492925; Wed, 18
 May 2022 08:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
 <165243859864.2416244.4785590696956344599@Monstersaurus> <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
 <165282888670.2416244.4233841355061128997@Monstersaurus> <CABSdY3+Wf8xmOHs4onE2E5Nhrj+JFcV4-dxjGH_dgiOyDOkujg@mail.gmail.com>
In-Reply-To: <CABSdY3+Wf8xmOHs4onE2E5Nhrj+JFcV4-dxjGH_dgiOyDOkujg@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 18 May 2022 16:41:16 +0100
Message-ID: <CAPY8ntA8VyWwEXLnOdAERLF+pQmEC-MNAVdsSNcpjfAb9GJHtw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video
 Selection 2
To:     Benjamin Marty <info@benjaminmarty.ch>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 May 2022 at 13:57, Benjamin Marty <info@benjaminmarty.ch> wrote:
>
> Am Mi., 18. Mai 2022 um 01:09 Uhr schrieb Kieran Bingham
> <kieran.bingham@ideasonboard.com>:
> > Benjamin, how does it look on your system? I presume setting this bit
> > improves image quality for your use case.
>
> Yes, it fixes the analog noise/grain issue. I have noticed too that
> the image is getting softer, as described by Dave.
>
> Comparison Images from my side (Not the exact same frame):
> https://drive.google.com/file/d/1gdwKUGb7GcvMVJG0uSomhMPeSfDwXId-
> https://drive.google.com/file/d/1oitfhl4txzxOabI-TplpsKMqP2mr0TKy

More exciting images from me, and they are from the same frame (DVD paused)
https://photos.app.goo.gl/ztbW6uf6C8AguVnz7 for some stills from Tom &
Jerry, and the Fantastic 4.
The first image in each case is the register at 0x84 (new setting),
and the second as 0x80 (old setting).

The final images from Fantastic 4 are the most telling. The old
setting produces a lot of crawling noise on the land areas of the
earth, whilst with the new setting that is almost totally gone, so on
that basis I'd vote for the new.

I should add that I am using the I2P block in the chip to deinterlace
the source. From what I understand of the I2P it's a pretty simple
line doubling so that won't overly help image quality, but shouldn't
make a difference in this case.

  Dave

> > From a driver perspective, with no other existing expecatation - I would
> > say matching the datasheet is the correct thing to do anyway.
>
> I'm also agreeing on the driver should be complying with the
> Datasheet. I think it's a "Bug" and not a "Feature" that the Image
> gets sharpened but more grainy when not setting this bit.
>
> Furthermore, I have opened a Ticket at ADV to get more details, but
> I'm not really expecting a proper Answer.
>
> Benjamin
