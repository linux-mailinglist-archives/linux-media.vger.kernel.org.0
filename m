Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B960B2E965E
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbhADNvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbhADNvC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 08:51:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13716C061793
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 05:50:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 239C32E0;
        Mon,  4 Jan 2021 14:50:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609768220;
        bh=lH8IFBJP7rSl4OSWT8Z1OF6yr61MNNTdBfxqkX+asPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJeUeRCp1noWO/PLYcrdG+LzdbZ9rm1X9k8sBnAeKjyf6wGNiSHQ49E2iHpKbm1cW
         LLaC0FWsimORqoJzNO2NIzt1l6maV9piLmWKFs7WdzZhmxyCPcMQRl1/GOOafFSDlO
         PR3ObRF2pb/bQJzjOpnkhyD773WKNSbftkAHwCWg=
Date:   Mon, 4 Jan 2021 15:50:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <X/MdDzJUqTDSbupS@pendragon.ideasonboard.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
 <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
 <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
 <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Mon, Jan 04, 2021 at 01:45:11PM +0000, Rui Miguel Silva wrote:
> Hi,
> catching up with this thread.
> 
> On Mon, Jan 04, 2021 at 03:08:58PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 04, 2021 at 08:34:48AM -0300, Fabio Estevam wrote:
> > > On Mon, Jan 4, 2021 at 3:05 AM Laurent Pinchart wrote:
> > > 
> > > > That's not right, csi->is_csi2 is a flag that indicates if the
> > > > current input to the CSI comes from the CSI-2 receiver.
> > > >
> > > > It looks like the i.MX6ULL is missing the MIPI CSI-2 receiver
> > > > and thus also the corresponding video mux. The WARN_ON() should
> > > > thus indeed by bypassed, but only for devices that don't have
> > > > the video mux. I wouldn't
> > > 
> > > Unlike i.MX7, i.MX6UL/i.MX6ULL do not have a MIPI CSI-2 IP block.
> > > 
> > > They only have a parallel CSI interface, and no video mux is
> > > present.
> > > 
> > > So the csi->is_csi2 check I did seems correct, right?
> > 
> > I don't think so. csi->is_csi2 tells if the currently selected input
> > of the video mux is the CSI-2 receiver, not if there's a CSI-2
> > receiver present in the device. csi->is_csi2 should of course always
> > be false when there's no CSI-2 receiver, but it can be false when a
> > CSI-2 receiver is present and the currently selected input is the
> > parallel input.
> 
> Laurent is correct here. That flag indicates if CSI-2 is the selected
> input for the video mux.
> 
> > > > be surprised if other adaptations would be needed in the code.
> 
> I really only had the warp7 board which only had the csi2 as video mux
> input, never got the chance to test it with a parallel input. And the
> driver expects that we always have a mux. I was not even aware that an
> imx6 would have the same csi ip.
> 
> but from the error outputs looks issues getting the format around the
> imx7_csi_{try, get}_fmt.

Do you still have the hardware, would you be able to test a patch series
?

> > > Yes, I found other paths that miss the csi->is_csi2 check too.

-- 
Regards,

Laurent Pinchart
