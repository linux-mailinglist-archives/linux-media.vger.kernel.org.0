Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF11D6C6D53
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 17:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjCWQYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 12:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjCWQYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 12:24:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4789AF9
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 09:24:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6BF662710
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 16:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642EFC433D2;
        Thu, 23 Mar 2023 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679588676;
        bh=HBTTxUCl+aJ6lcEdmbLTbHuZWfDQGiODcXheefaBm1Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aUhWczG/JYWqJXjN+5BdWuXHcr/hV9LzdlNwNJzoniIK3r0EgyfiyREghxIXxaTOh
         dW7z5+yerVvp+dpdv68KKFR8tXV+rUGegXa9Gwa31g6H5PZi+8ApEVyctzt+ighB97
         f2dlXLtpv5ZSRs3iE1p5oHcnDjqoI8b6RfcdUxu4gdsHBHONQ1UIJP58I5/omKQ3jo
         KyMQdYGCGNtZR9e2cgOmENDfuiMQqZlOtgDNxY+5RA7Y83eSN27gaVQhe3V0+Wjofr
         VeSTLPXLlU6oOy0xTSxS7iC6/IeIRb2WdFTNXQJjEC+zIpo5Mw5lixaYWui/NGdpHa
         dji/FVSeDB8pQ==
Date:   Thu, 23 Mar 2023 17:24:30 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jenkins <jenkins@linuxtv.org>, linux-media@vger.kernel.org,
        builder@linuxtv.org, Christian Hemp <c.hemp@phytec.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver (#89568)
Message-ID: <20230323172255.7d67d7ac@coco.lan>
In-Reply-To: <20230322233352.GB5583@pendragon.ideasonboard.com>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
        <20230319023423.3173445-1-jenkins@linuxtv.org>
        <20230319220821.273c0a13@coco.lan>
        <20230322233352.GB5583@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 23 Mar 2023 01:33:52 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Sun, Mar 19, 2023 at 10:08:21PM +0100, Mauro Carvalho Chehab wrote:
> > Em Sun, 19 Mar 2023 02:34:23 +0000 Jenkins escreveu:
> >   
> > >    checkpatch.pl:
> > > 	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> > > 	-:98: WARNING: please write a help paragraph that fully describes the config symbol
> > > 	-:112: WARNING: please write a help paragraph that fully describes the config symbol
> > > 	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > > 	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > 	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > 	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst  
> > 
> > There are still a couple of checkpatch issues there. Please check.
> > In special:
> > 
> > - either DT file is wrong or patch 2. Patch 1 declares:
> > 
> > 	properties:
> > 	  compatible:
> > 	    enum:
> > 	      - fsl,imx8mn-isi
> > 	      - fsl,imx8mp-isi
> > 
> >   But patch 2 has an additional one:
> > 
> > 	static const struct of_device_id mxc_isi_of_match[] = {
> > 		{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> > 		{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> > 		{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> > 		{ /* sentinel */ },  
> 
> Indeed, that should be fixed. Would you mind if I addressed this on top
> ? I will be travelling next week, which would delay a new pull request
> to v6.3-rc5. That's still within the allowed time frame, but if I get
> delayed a bit more, I'm worried about missing the v6.4 merge window.
> 
> I will actively maintain the ISI driver and will fix this for v6.5 at
> the latest if I can't make it for v6.4. It shouldn't cause any
> regression for supported DT bindings, and the "fsl,imx8-isi" compatible
> string isn't listed in the bindings and won't be used in device tree
> sources.
> 
> > - Instead of udelay(300, could it use, instead usleep_range()?  
> 
> This could be fixed on top too.

Sure. Feel free to add patches on the top.

Regards,
Mauro

> 
> > - There are two nitpick checkpatch warnings related to blank lines.  
> 
> I've seen those two and ignored them as the current code matches the
> coding style used in many places for such inline function stubs.
> 



Thanks,
Mauro
