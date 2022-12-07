Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79311645519
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 09:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiLGIIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 03:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiLGII3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 03:08:29 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45651EED2
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 00:08:27 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x6so19988667lji.10
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 00:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nbAUG5PewXhYzm93zBKheeBvvnKnXmwjvHA0Rv+UorA=;
        b=a9Dp83CZSE3s/GRdGdTEWEtOxv0RJ8dYstajVCUYLmu57hT9a6ueHEvWVIjb6GYVM6
         W2F9fLqi4wFMF/dNijjX9zapY36/19T4xh39XdoRfBdGwjBfg5ghfMOKKJpvuXR8k5sj
         7LTiqd+sWf0ZjRqunMyWPlOExZtsApsVpZDHQf1jD4eSvyJbJi692+Gzz5GiM1CIG1Ey
         C1XdAND3CtLtGAZgvcxTTETx08gWN7DzoOMrYSEOV/LBh/bQFYtjSdjn7n52UPc3FekQ
         jf1cdBpxnzBbQAMKnuZrSE/hmKOuAGzYJDyBDqciWZdt0xHifDGEPBJoc7PdKsKUO+Zu
         nIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbAUG5PewXhYzm93zBKheeBvvnKnXmwjvHA0Rv+UorA=;
        b=adYsCC7QFhJlJPNIknJJP6lNlAUpJdN7F8T1/OeB3w+KgyfaNz/AcoDMkt/ECtfe6o
         Era87GGm7JUsEP/69lE0YrtNoYEtoTQBA5+qIMtLFk31b7/so6mJWYIqRjThv96IKWll
         PDgV9BoNQa6XBds8ocG/5BtVfyFdk8oieXc1C1rGZg0rZkp8csJ9mbS3ZtGHav1Ncipc
         qpsLZ5vbpN983cJdwhO+Du5a74evcxVbvSux0uhunIlP5mNTUE1pk+Lq+IlDPwrlhWgU
         l8xqnZdRpNC2N9W+IJeukRU7Y49ixe3OHNWEfB7p4hlAYpkE97tE7I76DbtyIxzZl78l
         Zo8Q==
X-Gm-Message-State: ANoB5pkOKpMzPB65JfTRzh35ecgK2dLXJmraw+8X3QSP3Am3sGvm7vOL
        QNGCMomniDGmCtfnVinB1rzJog==
X-Google-Smtp-Source: AA0mqf71bZpT02weswnzvPu5VI1Cru+1lUgpEeWBVl2T8N/IXMhu1JlPx2Xa0+NKlER07asKxkaISA==
X-Received: by 2002:a05:651c:239:b0:279:e6bb:fe2c with SMTP id z25-20020a05651c023900b00279e6bbfe2cmr6397640ljn.231.1670400506186;
        Wed, 07 Dec 2022 00:08:26 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id t15-20020a056512208f00b004b4ec76016esm2742953lfr.113.2022.12.07.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 00:08:25 -0800 (PST)
Date:   Wed, 7 Dec 2022 09:08:25 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     shangxiaojing <shangxiaojing@huawei.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
Message-ID: <Y5BJ+V88K21W5vFL@oden.dyn.berto.se>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
 <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
 <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
 <0c95c17e-7fc9-3225-2c57-d7fc8ba00f39@huawei.com>
 <Y4/5bFxTc4Q5xVy+@oden.dyn.berto.se>
 <96f2fbc6-845e-d387-7346-20622697d7d0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96f2fbc6-845e-d387-7346-20622697d7d0@huawei.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Shang,

On 2022-12-07 11:27:54 +0800, shangxiaojing wrote:
> 
> 
> On 2022/12/7 10:24, Niklas Söderlund wrote:
> > Hi Shang,
> > 
> > On 2022-12-07 09:45:07 +0800, shangxiaojing wrote:
> > > 
> > > 
> > > On 2022/12/7 5:04, Laurent Pinchart wrote:
> > > > On Tue, Dec 06, 2022 at 03:22:53PM +0100, Niklas Söderlund wrote:
> > > > > Hi Shang,
> > > > > 
> > > > > Thanks for your work.
> > > > > 
> > > > > On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
> > > > > > There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
> > > > > > device:
> > > > > 
> > > > > Out of curiosity, what exactly is a bpf mock device?
> > > > 
> > > > I'm curious as well, is it something like
> > > > https://lwn.net/Articles/906236/ but for I2C devices ?
> > > 
> > > Yes, I'm using the tool provided by Yongjun, and now it can support for the
> > > tests of spi drivers and i2c drivers, which is still in the preliminary
> > > validation phase.
> > 
> > Is there a public repository for the MAX9286 work already available? Or
> > any other V4L2 related device?
> 
> The test of MAX9286 is build temporarily, and maybe here's no public
> repository yet. V4L2 neither.
> 
> I'm sorry but please wait for the completaion of the verification to the
> mock test tool. And then the tool will push to the community.

No problem, thanks for this sneak preview of what this work can do. Out 
of curiosity, where will this work be announced? I don't subscribe to 
many mailing lists.

> 
> > 
> > > 
> > > > Is the implementation public ?
> > > > 
> > > 
> > > Will send the test set to the community after the further verification to
> > > the tool.
> > > 
> > > By the way, here's an introduction to the tool, but now only in Chinese:
> > > 
> > > https://github.com/ChinaLinuxKernel/CLK2022/blob/main/%E5%9F%BA%E4%BA%8EeBPF%E7%9A%84%E8%AE%BE%E5%A4%87%E9%A9%B1%E5%8A%A8%E6%B5%8B%E8%AF%95%E6%A1%86%E6%9E%B6.pdf
> > 
> > Thanks this was helpful!
> > 
> > > 
> > > > 
> > > > Regardless of how this has been tested, the fix looks good.
> > > > 
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > 
> > > Thanks for the review!
> > > -- 
> > > Shang XiaoJing
> > 
> 
> Thanks,
> -- 
> Shang XiaoJing

-- 
Kind Regards,
Niklas Söderlund
