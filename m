Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B116451FD
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 03:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiLGCYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 21:24:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiLGCYs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 21:24:48 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E30051333
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 18:24:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id h10so19322441ljk.11
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 18:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6MkG4HGkQbTP03PcHKbnpM5QhOaXYj9JGt3HHXaEmrM=;
        b=ckFiU4pwBWT9Lad2+d5p6PnoMOMcBDhCKx9phnleRDUrXYEOIYE5epSYNn+YI8CNA9
         qEQic9ef9zE1tsq9Gn3/1yEFCwqT2cXpfHIyXw08efWaMZmLpdJPx2Vdj1bjptGQdQYt
         qtJPFHqxQphiy/CsGgbVipGs22wfWzRvB1tAS1JlM8mUB7SSV9n1N308PxRT2+ncgYop
         mhWX4FxrgNLv75n+JV6c3n/tclFqjXbruldBX0O7KbJVSm4TURn9oB4uuI0Tvcbs9Te9
         A1+RuR8U7b+NeOuaBLFWlRxunSGsbDTE0J4xcCUcohGHB5rDAMC/VIItY/sxCys44nT5
         tDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MkG4HGkQbTP03PcHKbnpM5QhOaXYj9JGt3HHXaEmrM=;
        b=SJdQ+Cl2n/XF3pwTIsoZKSNuWAQ0K4XM5hT8Z14D7pXZFmskf/R7sKiMuHgYM/kENs
         yuXpZgvpw3bLElOWKYODnLZK374hnl0iMwv8C4r7qhVieYp4GkQ2LVZPdSUIOY48iRUb
         o8Cc7+ubw5uWi56ErXHe61PWfPjDeM8Crb/oV2cBcePtLaZMy5NDmCv5hewD1ivea1Dx
         8GDSQ5rwMVQcEujSBC5GQoqIhLdyReLFrR41DTDxXu2bTjUr8g0UKCq2rklT2HLIvdAx
         aahkg5/Vxt76ZT+1qQg2k0INl4AsDtwc1fzUI0i+vrN1S2u/qSLL/RWVeuoPWQ19KZB+
         nqxg==
X-Gm-Message-State: ANoB5pnVKg991gfItG8ga6SwZfdKAGGtyJzNzkglj0iGdHSExPrmaxgT
        7Tbr63B4t1rDB/AnDlaj0N1V58/I+dMbjmc7
X-Google-Smtp-Source: AA0mqf4jlgajfPJnMbprUw8hLloSTCqSGVkfFwD4LBbjEMBCsUNZmguF2MOXPZiv5WevVg9nkoYTtQ==
X-Received: by 2002:a2e:a5c8:0:b0:26f:c0f4:2360 with SMTP id n8-20020a2ea5c8000000b0026fc0f42360mr21802990ljp.374.1670379885970;
        Tue, 06 Dec 2022 18:24:45 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id u25-20020ac258d9000000b004b57a253deasm790534lfo.162.2022.12.06.18.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:24:45 -0800 (PST)
Date:   Wed, 7 Dec 2022 03:24:44 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     shangxiaojing <shangxiaojing@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
Message-ID: <Y4/5bFxTc4Q5xVy+@oden.dyn.berto.se>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
 <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
 <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
 <0c95c17e-7fc9-3225-2c57-d7fc8ba00f39@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c95c17e-7fc9-3225-2c57-d7fc8ba00f39@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shang,

On 2022-12-07 09:45:07 +0800, shangxiaojing wrote:
> 
> 
> On 2022/12/7 5:04, Laurent Pinchart wrote:
> > On Tue, Dec 06, 2022 at 03:22:53PM +0100, Niklas Söderlund wrote:
> > > Hi Shang,
> > > 
> > > Thanks for your work.
> > > 
> > > On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
> > > > There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
> > > > device:
> > > 
> > > Out of curiosity, what exactly is a bpf mock device?
> > 
> > I'm curious as well, is it something like
> > https://lwn.net/Articles/906236/ but for I2C devices ?
> 
> Yes, I'm using the tool provided by Yongjun, and now it can support for the
> tests of spi drivers and i2c drivers, which is still in the preliminary
> validation phase.

Is there a public repository for the MAX9286 work already available? Or 
any other V4L2 related device?

> 
> > Is the implementation public ?
> > 
> 
> Will send the test set to the community after the further verification to
> the tool.
> 
> By the way, here's an introduction to the tool, but now only in Chinese:
> 
> https://github.com/ChinaLinuxKernel/CLK2022/blob/main/%E5%9F%BA%E4%BA%8EeBPF%E7%9A%84%E8%AE%BE%E5%A4%87%E9%A9%B1%E5%8A%A8%E6%B5%8B%E8%AF%95%E6%A1%86%E6%9E%B6.pdf

Thanks this was helpful!

> 
> > 
> > Regardless of how this has been tested, the fix looks good.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> Thanks for the review!
> -- 
> Shang XiaoJing

-- 
Kind Regards,
Niklas Söderlund
