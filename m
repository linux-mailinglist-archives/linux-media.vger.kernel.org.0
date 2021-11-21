Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7BF4586F9
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 00:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhKUXWK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Nov 2021 18:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhKUXWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Nov 2021 18:22:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97818C061574;
        Sun, 21 Nov 2021 15:18:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19BB91B40;
        Mon, 22 Nov 2021 00:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637536738;
        bh=McZgC/deWXww4aL8oX2F+WUR/Bzdo6jjFrZIF8hZlds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qH1EKstKy2tYGbAkNhichO3ubrxu4p03S1R1A8BozTFG8No6CU8Gz7bLjywOEzn77
         VtIBqgdBr0L3/bQss/GNFfTOMB/Hv73Osec20yhPLjbBfEGiNwVymqX6U4+WmyQJmR
         FsT29e/NFQ/9ENUVHzy8f6vpGfrO7cjHPMRx/W2k=
Date:   Mon, 22 Nov 2021 01:18:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC V2 5/5] arm64: dts: imx8mm-evk: Enable OV5640 Camera
Message-ID: <YZrTy9+rmtmyCXR4@pendragon.ideasonboard.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
 <20211023203457.1217821-6-aford173@gmail.com>
 <YXn9aibI1C/+eP5L@pendragon.ideasonboard.com>
 <CAJ+vNU3-81Jr_uWcpyCzMECD4ZS7TbDP6ugi02mEf3JMNvRp5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ+vNU3-81Jr_uWcpyCzMECD4ZS7TbDP6ugi02mEf3JMNvRp5Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Fri, Nov 05, 2021 at 09:00:03AM -0700, Tim Harvey wrote:
> On Wed, Oct 27, 2021 at 6:34 PM Laurent Pinchart wrote:
> >
> > Hi Adam,
> >
> > Thank you for the patch.
> >
> > On Sat, Oct 23, 2021 at 03:34:56PM -0500, Adam Ford wrote:
> > > The schematic shows support for a camera interface, and the NXP
> > > kernel shows it is an OV5640.
> >
> > The camera is an external module though. Should this be a DT overlay ?
> >
> 
> Laurent,
> 
> I wanted to ask you about your comment here. I would agree that for
> something like the OV5640 on the imx8mm-evk which is an add-in board
> via a connector should be a dt overlay. I'm investigating using
> overlays for features like this on my boards vs creating hierarchical
> dts files and I see that the kernel allows building fragments with
> '/plugin/' but I don't see any such overlays in the kernel tree
> currently. Would overlay/fragments be accepted?

I believe so (otherwise I'm not sure why the build system would allow
compiling overlays). Rob may have a more authoritative opinion on this
topic.

> Are there any examples
> in the kernel tree already that I'm missing?

Commit 7a4c31ee877a ("arm64: zynqmp: Add support for Xilinx Kria SOM
board") has been added recently.

-- 
Regards,

Laurent Pinchart
