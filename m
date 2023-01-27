Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25E867E560
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 13:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbjA0MgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 07:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbjA0Mfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 07:35:55 -0500
X-Greylist: delayed 3157 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 27 Jan 2023 04:35:44 PST
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456D26810A
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 04:35:43 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 736C5ED087;
        Fri, 27 Jan 2023 03:41:32 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VlvSZ-67GJIF; Fri, 27 Jan 2023 03:41:31 -0800 (PST)
Message-ID: <c38b1842a6e3042c66ab885ea8e46d832d238ce4.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1674819691; bh=oLpeFGeQwcw7WEBaJOEIzBdVIYSFwMztdi1JXlqhKYs=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=PJv/90txFiSkdUcdBa5igD7OzQ8fsMm57TiT1x2eV3rFQXWJbV5iEndxQMDJU4ukN
         s/zZYzb3h5Rs7PfkB8/+5NKGK2UpPNwTg7A+SHf60ZRWhBViuINXZiSja5Zh/T5/sA
         Lgsu3YK+t5c2fsTh2S2Xsei57CS7g1FpH4M/TT07utqXndbeFZkT2Wey0Ff+x+y7BS
         n7LYCPBxEaiwrtvp0ofOVPhEobCxAE0d0tS2Lrfb2RFM3GD9V0PgZpXOtxzEaJzYta
         BFf5y5d1lE+8qTOKxcrnwERV1tyBgZKGP727x/SKcqm5aAIYe0ohJIRZtGbO56f/nH
         XSsmD0m8LINhw==
Subject: Re: [PATCH v1 0/6] media: nxp: imx7-media-csi: Move to subdev
 active state
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Fri, 27 Jan 2023 12:41:26 +0100
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, dem 27.01.2023 um 04:27 +0200 schrieb Laurent Pinchart:
> Hello,
> 
> This small series moves the imx7-mipi-csi driver to use the subdev
> active state. Patches 1/6 to 5/6 are small preparatory cleanups, with
> the main change in 6/6.
> 
> I haven't tested the series yet as I need to dig up the hardware
> first.
> Adam, you offered to test the similar imx-mipi-csis series I've sent
> recently on the i.MX8MM, would you be able to test this one at the
> same
> time ?
> 

a first test of streaming frames on imx8mq with these patches + your
inline fix works fine. just so you know. I can keep testing possible
future revisions. thanks a lot!

                          martin


ps. I know something similar needs to be done for the imx8mq mipi csi
driver.



> Laurent Pinchart (6):
>   media: imx: imx7-media-csi: Drop imx7_csi.cc field
>   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
>   media: imx: imx7-media-csi: Drop unneeded check when starting
>     streaming
>   media: imx: imx7-media-csi: Drop unneeded src_sd check
>   media: imx: imx7-media-csi: Drop unneeded pad checks
>   media: imx: imx7-media-csi: Use V4L2 subdev active state
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 208 ++++++------------
> --
>  1 file changed, 58 insertions(+), 150 deletions(-)
> 
> 
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2


