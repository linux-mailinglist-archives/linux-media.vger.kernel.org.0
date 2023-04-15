Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAAA46E3086
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 12:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDOKUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 06:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDOKUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 06:20:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F07115
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 03:20:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4260D25E9;
        Sat, 15 Apr 2023 12:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681554005;
        bh=h1H2q1kj3V1ZEuPrCXAsJ0amZ8weaEOPqmtHTT9VPFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MneffzJOPqRDi7B1N6ephynJZC4jR3Xf//mApKGXwRBZtXWhjORQr+7eoENr1IiMY
         59zG1uNC2Xuqu1gfLqCbgrL2bnzhZr2yJzbNm4YYM1GiuQ+If8GIBNUdgN+ZvpzQDZ
         upbElUX6CO/GiLDD6Vf+OgImm67DbMxTG3kw6V6A=
Date:   Sat, 15 Apr 2023 13:20:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jenkins <jenkins@linuxtv.org>, linux-media@vger.kernel.org,
        builder@linuxtv.org, Christian Hemp <c.hemp@phytec.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver (#89568)
Message-ID: <20230415102017.GA30043@pendragon.ideasonboard.com>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
 <20230319023423.3173445-1-jenkins@linuxtv.org>
 <20230319220821.273c0a13@coco.lan>
 <20230322233352.GB5583@pendragon.ideasonboard.com>
 <20230323172255.7d67d7ac@coco.lan>
 <20230415110556.25290b53@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230415110556.25290b53@sal.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Apr 15, 2023 at 11:05:56AM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 23 Mar 2023 17:24:30 +0100 Mauro Carvalho Chehab escreveu:
> > Em Thu, 23 Mar 2023 01:33:52 +0200 Laurent Pinchart escreveu:
> > > On Sun, Mar 19, 2023 at 10:08:21PM +0100, Mauro Carvalho Chehab wrote:  
> > > > Em Sun, 19 Mar 2023 02:34:23 +0000 Jenkins escreveu:
> > > >     
> > > > >    checkpatch.pl:
> > > > > 	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> > > > > 	-:98: WARNING: please write a help paragraph that fully describes the config symbol
> > > > > 	-:112: WARNING: please write a help paragraph that fully describes the config symbol
> > > > > 	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > > > > 	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > > > 	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
> > > > > 	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst    
> > > > 
> > > > There are still a couple of checkpatch issues there. Please check.
> > > > In special:
> > > > 
> > > > - either DT file is wrong or patch 2. Patch 1 declares:
> > > > 
> > > > 	properties:
> > > > 	  compatible:
> > > > 	    enum:
> > > > 	      - fsl,imx8mn-isi
> > > > 	      - fsl,imx8mp-isi
> > > > 
> > > >   But patch 2 has an additional one:
> > > > 
> > > > 	static const struct of_device_id mxc_isi_of_match[] = {
> > > > 		{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> > > > 		{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> > > > 		{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> > > > 		{ /* sentinel */ },    
> > > 
> > > Indeed, that should be fixed. Would you mind if I addressed this on top
> > > ? I will be travelling next week, which would delay a new pull request
> > > to v6.3-rc5. That's still within the allowed time frame, but if I get
> > > delayed a bit more, I'm worried about missing the v6.4 merge window.
> > > 
> > > I will actively maintain the ISI driver and will fix this for v6.5 at
> > > the latest if I can't make it for v6.4. It shouldn't cause any
> > > regression for supported DT bindings, and the "fsl,imx8-isi" compatible
> > > string isn't listed in the bindings and won't be used in device tree
> > > sources.
> > >   
> > > > - Instead of udelay(300, could it use, instead usleep_range()?    
> > > 
> > > This could be fixed on top too.  
> > 
> > Sure. Feel free to add patches on the top.
> 
> Jus re-checked the PR. DT is still broken there:
> 
> WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> #894: FILE: drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c:624:
> +	{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> 
> total: 0 errors, 5 warnings, 6215 lines checked
> 
> Please fix.

You told me it was fine to fix this on top. I have patches to do so.

-- 
Regards,

Laurent Pinchart
