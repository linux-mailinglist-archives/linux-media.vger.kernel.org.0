Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C630669010
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 09:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240757AbjAMIFk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 03:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240744AbjAMIE7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 03:04:59 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E960E5274A
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 00:02:13 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AF382100061; Fri, 13 Jan 2023 08:02:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1673596931; bh=ed4q+I5Pn+XedhcXiikkeSvc0nvC8gCNtWo8bWaNTek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NqAUxbCH1iHMQ56POWYrJV9xhjZLjylK6T3BCVkO9iiuf2KdvjS+Oo4qglpJlHguq
         ZHbsx0V7NSNgNUYtCL9CUMHL8XYjmn0TFGPNE0VvRkx1IUaJjINp7pdzppW6+WJZyn
         OZQ/xPVyeUyDU0L7g6Vx6TH5l8poPwn4cLkUR2+0Gpzo0IMvzyXYFT3FrGjwOEgioo
         wFRwb3HeHnGYnxhVremo6vOi+eJXVETv8KuI5t3p6/FZDW43ji3qe+0kLpI3QM9aK+
         xbCVtPZM4nD2bnycmt1twyVUEtjfj1kdk8t/SbzO4aUFOglD0ZIWXOccJIlYTwW0uV
         QRQLCfNdF8QeQ==
Date:   Fri, 13 Jan 2023 08:02:11 +0000
From:   Sean Young <sean@mess.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] media: Drop empty platform remove functions
Message-ID: <Y8EQA+wQMeZlA1MY@gofer.mess.org>
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
 <20230112215955.qemcxbwxcmdqutnw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112215955.qemcxbwxcmdqutnw@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 12, 2023 at 10:59:55PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Dec 13, 2022 at 04:35:49PM +0100, Uwe Kleine-König wrote:
> > this series removes all platform remove functions that only return zero
> > below drivers/media. There is no reason to have these, as the only
> > caller is platform core code doing:
> > 
> >         if (drv->remove) {
> >                 int ret = drv->remove(dev);
> > 
> >                 if (ret)
> >                         dev_warn(...)
> >         }
> > 
> > (in platform_remove()) and so having no remove function is both
> > equivalent and simpler.
> 
> I didn't get any feedback in reply to this series yet. Gentle ping!

I've sent the the ir-rx51.c patch to Mauro on the 30th of december to
pull. He will probably merge it at some point but who knows when.


Sean
