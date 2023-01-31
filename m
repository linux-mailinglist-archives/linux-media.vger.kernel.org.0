Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3EB0682A4D
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 11:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjAaKS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 05:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjAaKSa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 05:18:30 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BC23864A
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 02:18:23 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 10322ECC1A;
        Tue, 31 Jan 2023 02:17:53 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eXqVw_-UT7WW; Tue, 31 Jan 2023 02:17:52 -0800 (PST)
Message-ID: <3c10605acf31dd10f4e41d3c1ce881fcc40e32ef.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1675160272; bh=XWb62awJdupDiYnvT4Xky3M0D+Ds+FOER09pPTksz2M=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Cgbn+hgq2AeLkAcWiUWZBR7/wzWju4pOnm4seFRgVhY5C26WjjBNxP4r3KgIdfkyH
         F3bmEx/XBOEiIeE1NQvOZ52OoikW2yHfGjxW05PnxPsTzpcM/YMDECWLAvXSRvQvCl
         NiJEip4bCtq5fIsq8Y+iMIG57JOb3fLnhDkQtSlD9VrpjE/wov1TeXpCazTDYVpMNU
         sTREkffMvlE3MP1ASOi47QCETLxzYrHapQ7dGV8h/JIi7O9xLNpBa5+yk6jREILYqo
         PA7Klwvxlu7uL9AnJ7dBuI9bd25sZ1HzFJMyn36GfPFPQKtF5ykXP/EqRGo8p9SF4s
         K406zfWXHu8rQ==
Subject: Re: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev
 active state
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Tue, 31 Jan 2023 11:17:46 +0100
In-Reply-To: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
References: <20230129023429.22467-1-laurent.pinchart@ideasonboard.com>
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

Am Sonntag, dem 29.01.2023 um 04:34 +0200 schrieb Laurent Pinchart:
> Hello,
> 
> This small series moves the imx7-mipi-csi driver to use the subdev
> active state. Patches 1/8 to 7/8 are small preparatory cleanups, with
> the main change in 8/8.
> 
> Compared to v1, I've now successfully tested the series on an
> i.MX8MM.
> The issues reported by Adam have been resolved by adding patch 7/8
> and
> fixing a problem in 8/8.
> 
> Laurent Pinchart (8):
>   media: imx: imx7-media-csi: Drop imx7_csi.cc field
>   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
>   media: imx: imx7-media-csi: Drop unneeded check when starting
>     streaming
>   media: imx: imx7-media-csi: Drop unneeded src_sd check
>   media: imx: imx7-media-csi: Drop unneeded pad checks
>   media: imx: imx7-media-csi: Cleanup errors in
>     imx7_csi_async_register()
>   media: imx: imx7-media-csi: Zero format struct before calling
>     .get_fmt()
>   media: imx: imx7-media-csi: Use V4L2 subdev active state
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 235 ++++++------------
> --
>  1 file changed, 70 insertions(+), 165 deletions(-)
> 

hi Laurent, what tree did you base this on? onto v6.2-rc6 I have a
change missing: in imx7_csi_video_validate_fmt(), before calling
v4l2_subdev_call_state_active(), there's fmt_src.pad and fmt_src.which
assigned. I don't have that.

thanks
                            martin


