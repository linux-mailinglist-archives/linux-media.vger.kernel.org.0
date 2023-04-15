Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026E16E3135
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 14:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjDOMHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 08:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjDOMHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 08:07:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE8B4EDE
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 05:07:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE21D615B0
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 12:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A37C4339B;
        Sat, 15 Apr 2023 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681560468;
        bh=wS7CQZHzQCZYA1CdR0ckECU3rPCjh00RXRDAxfc0nk4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ks/p0Xk/npBUH8s9eQl0sJLu/Zdo9Cww9hfKitBubxoVrGx2ztYhsqvRI/LNCiSOv
         yVcG1d+Yh6b+cLq1Nj3KyXHePsUfw66lP88QdNSd3+C6BggbD+6AgvEMBmPU4zz/uC
         0sWD4fszIYZwqHStyq3BwLBesuZSU7vOrUF7Iudhd4JQL7ecBHtTz/D0Pmu3pWFK7b
         d0udNv+3qIMG87ZGqLbXAW+9SkHd6wWDr5VGT4EWCgwxOVveRbx/FKoghbEt5HMzrE
         KCmXTKPYPFgJnSs7pZBiXxROiMZxLBvJx7bFibBq14xyZUyfd4pFzgFgzXMDCEyHmZ
         FDH9nUi+S7sAw==
Date:   Sat, 15 Apr 2023 13:07:42 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jenkins <jenkins@linuxtv.org>, linux-media@vger.kernel.org,
        builder@linuxtv.org, Christian Hemp <c.hemp@phytec.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver (#89568)
Message-ID: <20230415130742.029cbabc@sal.lan>
In-Reply-To: <20230415102017.GA30043@pendragon.ideasonboard.com>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
        <20230319023423.3173445-1-jenkins@linuxtv.org>
        <20230319220821.273c0a13@coco.lan>
        <20230322233352.GB5583@pendragon.ideasonboard.com>
        <20230323172255.7d67d7ac@coco.lan>
        <20230415110556.25290b53@sal.lan>
        <20230415102017.GA30043@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 15 Apr 2023 13:20:17 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Sat, Apr 15, 2023 at 11:05:56AM +0100, Mauro Carvalho Chehab wrote:
> > Em Thu, 23 Mar 2023 17:24:30 +0100 Mauro Carvalho Chehab escreveu:  
> > > Em Thu, 23 Mar 2023 01:33:52 +0200 Laurent Pinchart escreveu:  
> > > > On Sun, Mar 19, 2023 at 10:08:21PM +0100, Mauro Carvalho Chehab wrote:    
> > > > > Em Sun, 19 Mar 2023 02:34:23 +0000 Jenkins escreveu:
> > > > >       
> > > > > >    checkpatch.pl:
> > > > > > 	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> > > > > > 	-:98: WARNING: please write a help paragraph that fully describes the config symbol
> > > > > > 	-:112: WARNING: please write a help paragraph that fully describes the config symbol
> > > > > > 	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > > > > > 	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > > > > 	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > > > > 	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst      
> > > > > 
> > > > > There are still a couple of checkpatch issues there. Please check.
> > > > > In special:
> > > > > 
> > > > > - either DT file is wrong or patch 2. Patch 1 declares:
> > > > > 
> > > > > 	properties:
> > > > > 	  compatible:
> > > > > 	    enum:
> > > > > 	      - fsl,imx8mn-isi
> > > > > 	      - fsl,imx8mp-isi
> > > > > 
> > > > >   But patch 2 has an additional one:
> > > > > 
> > > > > 	static const struct of_device_id mxc_isi_of_match[] = {
> > > > > 		{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> > > > > 		{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> > > > > 		{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> > > > > 		{ /* sentinel */ },      
> > > > 
> > > > Indeed, that should be fixed. Would you mind if I addressed this on top
> > > > ? I will be travelling next week, which would delay a new pull request
> > > > to v6.3-rc5. That's still within the allowed time frame, but if I get
> > > > delayed a bit more, I'm worried about missing the v6.4 merge window.
> > > > 
> > > > I will actively maintain the ISI driver and will fix this for v6.5 at
> > > > the latest if I can't make it for v6.4. It shouldn't cause any
> > > > regression for supported DT bindings, and the "fsl,imx8-isi" compatible
> > > > string isn't listed in the bindings and won't be used in device tree
> > > > sources.
> > > >     
> > > > > - Instead of udelay(300, could it use, instead usleep_range()?      
> > > > 
> > > > This could be fixed on top too.    
> > > 
> > > Sure. Feel free to add patches on the top.  
> > 
> > Jus re-checked the PR. DT is still broken there:
> > 
> > WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > #894: FILE: drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:624:
> > +	{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> > 
> > total: 0 errors, 5 warnings, 6215 lines checked
> > 
> > Please fix.  
> 
> You told me it was fine to fix this on top. I have patches to do so.

Those patches aren't at the branch. Please add them to the branch you
want me to pull and send another PR to trigger Jenkins to test it.

Regards,
Mauro
