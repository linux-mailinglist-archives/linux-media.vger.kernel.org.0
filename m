Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCBD6C5A79
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 00:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjCVXd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 19:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjCVXdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 19:33:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4FC22134
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 16:33:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 437CE9A8;
        Thu, 23 Mar 2023 00:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679528026;
        bh=i1iyjHLcTwP/iwQf0fNgvzT+BIVCB4OJiM/sjyc+LLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oHnOkS9kX9iFedlyTlQwa9foe08dPnSpu9S9lwgntKR8RYScx8rgjdBarX1v40lgG
         UVEvSBtIaCvPC9Y66JeSb271Q/5d+Gd/I4M5B6REzLF3Y1Av3zl1c4HvG0OuH9Z+ja
         C9kTFQFVxR5ATZzSlVztoWmZTI4MHkyTT7wx6cc0=
Date:   Thu, 23 Mar 2023 01:33:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jenkins <jenkins@linuxtv.org>, linux-media@vger.kernel.org,
        builder@linuxtv.org, Christian Hemp <c.hemp@phytec.de>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guoniu Zhou <guoniu.zhou@nxp.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver (#89568)
Message-ID: <20230322233352.GB5583@pendragon.ideasonboard.com>
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
 <20230319023423.3173445-1-jenkins@linuxtv.org>
 <20230319220821.273c0a13@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230319220821.273c0a13@coco.lan>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sun, Mar 19, 2023 at 10:08:21PM +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 19 Mar 2023 02:34:23 +0000 Jenkins escreveu:
> 
> >    checkpatch.pl:
> > 	$ cat patches/0002-media-nxp-Add-i.MX8-ISI-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
> > 	-:98: WARNING: please write a help paragraph that fully describes the config symbol
> > 	-:112: WARNING: please write a help paragraph that fully describes the config symbol
> > 	-:761: WARNING: DT compatible string "fsl,imx8-isi" appears un-documented -- check ./Documentation/devicetree/bindings/
> > 	-:1128: CHECK: Please use a blank line after function/struct/union/enum declarations
> > 	-:1178: CHECK: Please use a blank line after function/struct/union/enum declarations
> > 	-:1928: CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> 
> There are still a couple of checkpatch issues there. Please check.
> In special:
> 
> - either DT file is wrong or patch 2. Patch 1 declares:
> 
> 	properties:
> 	  compatible:
> 	    enum:
> 	      - fsl,imx8mn-isi
> 	      - fsl,imx8mp-isi
> 
>   But patch 2 has an additional one:
> 
> 	static const struct of_device_id mxc_isi_of_match[] = {
> 		{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
> 		{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
> 		{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> 		{ /* sentinel */ },

Indeed, that should be fixed. Would you mind if I addressed this on top
? I will be travelling next week, which would delay a new pull request
to v6.3-rc5. That's still within the allowed time frame, but if I get
delayed a bit more, I'm worried about missing the v6.4 merge window.

I will actively maintain the ISI driver and will fix this for v6.5 at
the latest if I can't make it for v6.4. It shouldn't cause any
regression for supported DT bindings, and the "fsl,imx8-isi" compatible
string isn't listed in the bindings and won't be used in device tree
sources.

> - Instead of udelay(300, could it use, instead usleep_range()?

This could be fixed on top too.

> - There are two nitpick checkpatch warnings related to blank lines.

I've seen those two and ignored them as the current code matches the
coding style used in many places for such inline function stubs.

-- 
Regards,

Laurent Pinchart
