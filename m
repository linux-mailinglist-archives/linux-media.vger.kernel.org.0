Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04DAD6F08F6
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 18:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243215AbjD0QBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 12:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjD0QBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 12:01:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9787F9
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 09:01:43 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BA2A802;
        Thu, 27 Apr 2023 18:01:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682611289;
        bh=Totd5cRq6R7++FdncLTWyP5HSRi6U9NAp9eh95/NcLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VjKnHdHIQiqI1F3dzF8BTxC9FHHqyFGVUVRr+ewgCRlIZmcpze4TgiodhWYpEmLsb
         hYOqH8LMGX4kiKW8qtGflVdw4171Po8uQrSdG9I6kO8zthKSXj4jzOoB+5Y6jCpZCY
         rpUMtlBEv71MDNlFp6c0Jct1Z7DxQkzr5ex/ub68=
Date:   Thu, 27 Apr 2023 18:01:38 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: v4l2-async: regression due to endpoint matching
Message-ID: <43vsiiq5qvbmpnmcclh5jjemgkgym65iezvpbyu5y7sdrx63lq@v63zg7c7udyi>
References: <8360125.31r3eYUQgx@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8360125.31r3eYUQgx@steina-w>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

On Thu, Apr 27, 2023 at 04:40:46PM +0200, Alexander Stein wrote:
> Hi all,
>
> I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached to the
> MIPI CSI input.
> I noticed that since commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> __v4l2_async_nf_add_fwnode_remote()") the async subdevice probing does not
> work anymore. If I revert that, it is working again, even on next-20230425.

A similar issue has been discussed at
https://www.spinics.net/lists/linux-media/msg223351.html

Unfortunately there was no conclusion as far as I can tell if not that
imx6 is now broken

>
> $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> imx-media:
> ipu2_csi1:
> ipu2_csi0:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@3/endpoint
> ipu1_csi1:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@2/endpoint
> ipu1_csi0:
> imx6-mipi-csi2:
> ipu2_csi1_mux:
> ipu1_csi0_mux:
>  [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000/port@1/endpoint
>
>
> With revert:
> $ cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
> imx-media:
> ipu2_csi1:
> ipu2_csi0:
> ipu1_csi1:
> ipu1_csi0:
> imx6-mipi-csi2:
> ipu2_csi1_mux:
> ipu1_csi0_mux:
>
> I also see these messages:
> > video-mux 20e0000.iomuxc-gpr:ipu2_csi1_mux: Consider updating driver video-
> mux to match on endpoints
> > imx6-mipi-csi2 21dc000.mipi: Consider updating driver imx6-mipi-csi2 to
> match on endpoints
> > tc358743 0-000f: Consider updating driver tc358743 to match on endpoints
> > video-mux 20e0000.iomuxc-gpr:ipu1_csi0_mux: Consider updating driver video-
> mux to match on endpoints
>
> But I'm unsure if this is related. As far as I can see match_fwnode_one does
> match some nodes, but I do not know if they are the correct ones.
> Anyone has an idea what's wrong here?
>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
