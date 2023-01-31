Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8B7682B51
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 12:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjAaLSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 06:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjAaLSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 06:18:45 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AAD245229
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 03:18:43 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 3BCDCECE3C;
        Tue, 31 Jan 2023 03:18:43 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DbW9TOqNa2nm; Tue, 31 Jan 2023 03:18:42 -0800 (PST)
Message-ID: <cc70eb77c85ea5166f6386dd64b2481e992aaee4.camel@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1675163922; bh=X3Ne67v0Jvg4IrE91jxCHNMwg1O178vbdpIWvtt7Fio=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=DS1oB1RpRb13Q96pOV+mf2IbWZYmjE3F5Fus02PsX5PMcRXRnKCIFRG5cJG/XAfsc
         KArhVEKXiXozVM8ReyRn4SAqrSr06OMiNqCXqgzEMYJZgznnsK+xyxJc57Agb02trn
         BmN3ItQZIkqtmcWz8ijqkLiZYQiLHB2p5Nd++O/jaCq4cpiJPnWdJvIoC6fHsP1NWk
         k3zA+Y3LngGi+8pamlBbdfRvNNoKyzFfBSHSEFactWHcvyjNX9k70+qR4644U3K6im
         UdgGBpAht11YdUHUZQLVa/tsN+S57S02pOIeUmrWCtze1lnXikiDGvFxfoXeeSQ6mh
         vVdYwHy2dH1nw==
Subject: Re: [PATCH v2 0/8] media: nxp: imx7-media-csi: Move to subdev
 active state
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Date:   Tue, 31 Jan 2023 12:18:37 +0100
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

thanks Laurent,

Tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>

                    martin


