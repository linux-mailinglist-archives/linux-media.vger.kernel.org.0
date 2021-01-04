Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9320F2E959E
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 14:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbhADNJy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 08:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADNJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 08:09:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A4EC061793
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 05:09:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 500762E0;
        Mon,  4 Jan 2021 14:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609765751;
        bh=ytzEZPMjImbs14xCLsXgpNvQ805jokY97SYanJCiK+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xs/0tyWizN3yykZmNfc9uI5hExNdpkR2hsw2iQYYwDP5H8AqagE9q0eDHOw6UszwI
         0nNIuJV+1rfDzwN/JFU+RG6V4kOODdRVglgIhFTQoeb7wySl13vW8iqPBFgVxLzPqx
         /FgqWomQCjds+8157ZDqI00nDC/FTzFZkTf3wGjs=
Date:   Mon, 4 Jan 2021 15:08:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
 <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Mon, Jan 04, 2021 at 08:34:48AM -0300, Fabio Estevam wrote:
> On Mon, Jan 4, 2021 at 3:05 AM Laurent Pinchart wrote:
> 
> > That's not right, csi->is_csi2 is a flag that indicates if the current
> > input to the CSI comes from the CSI-2 receiver.
> >
> > It looks like the i.MX6ULL is missing the MIPI CSI-2 receiver and thus
> > also the corresponding video mux. The WARN_ON() should thus indeed by
> > bypassed, but only for devices that don't have the video mux. I wouldn't
> 
> Unlike i.MX7, i.MX6UL/i.MX6ULL do not have a MIPI CSI-2 IP block.
> 
> They only have a parallel CSI interface, and no video mux is present.
> 
> So the csi->is_csi2 check I did seems correct, right?

I don't think so. csi->is_csi2 tells if the currently selected input of
the video mux is the CSI-2 receiver, not if there's a CSI-2 receiver
present in the device. csi->is_csi2 should of course always be false
when there's no CSI-2 receiver, but it can be false when a CSI-2
receiver is present and the currently selected input is the parallel
input.

> > be surprised if other adaptations would be needed in the code.
> 
> Yes, I found other paths that miss the csi->is_csi2 check too.

-- 
Regards,

Laurent Pinchart
