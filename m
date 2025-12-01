Return-Path: <linux-media+bounces-47989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53473C983A0
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 17:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36373A3AB8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD5A335064;
	Mon,  1 Dec 2025 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DercMkVd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404C3346AF
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606253; cv=none; b=hEcdT0zxA3fUpzYPPrmCKrYoHSaCXYgCpMVAvdF2nXs1Qy6c20gbcxpZKV6l/9zU//hSFhowXR0xVO70LraolPXGubLpb9FIJpemdQOh2pPH63CHqd2DG//Uoo8T5tDKUbMHGcsJzVjte5XNqs4G7Ymgvu8d0tILCpbscd5cv8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606253; c=relaxed/simple;
	bh=1ZYMqjwBnfl897xiSXiJfpMH4OTfdxEwAfQV2db7y6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br4iJmjxMpZrhrWhQO2K3wD3TK70KaR+CR9SThMmLVvVJlKw/SeFdrVWvlJixq6MQftTgC5o7li2r/12kpbc7tKklyVxRmdEb4kmLZ+OioCegF3yP6ju0CmHtc2IvaCkWYPfz5r60hASag05VjYLyceJVNuTFFSn3RNG4D9To8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DercMkVd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p9411226-ipngn12302marunouchi.tokyo.ocn.ne.jp [153.160.235.226])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 481E3110;
	Mon,  1 Dec 2025 17:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764606116;
	bh=1ZYMqjwBnfl897xiSXiJfpMH4OTfdxEwAfQV2db7y6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DercMkVdczhus/hJshBxJ1O7kQGCCnbF2OWPMSuorB66z2VhyjkusRr3soCdg5VTJ
	 rrV8aYSlNIYfcteqESOrye1+4qj9/ndOD+DhN9sR5mttXthigLzg5d3UDP0k/Bt0SL
	 Mh0FnEtOO+xYlSMTXqIJlj93TjRaq535fJetFLE0=
Date: Tue, 2 Dec 2025 01:23:49 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matthias =?utf-8?Q?Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Cc: linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: imx7-media-csi: Adding BT656 format
Message-ID: <20251201162349.GC32430@pendragon.ideasonboard.com>
References: <CAO8h3eEz=-LfrHcsGMcQ3kQHZKZgkQw9gwygBmeC1ASdMHg3YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO8h3eEz=-LfrHcsGMcQ3kQHZKZgkQw9gwygBmeC1ASdMHg3YQ@mail.gmail.com>

Hi Matthias,

On Tue, Nov 18, 2025 at 04:39:57PM +0100, Matthias Weißer wrote:
> Hi
> 
> I am hoping for some basic help here regarding a feature I want to add to
> to imx7-media-csi.c.
> 
> (taking the maintainers in CC, hoping this is okay)
> 
> If this is not the right place to ask my stupid questions please advice.

This is the right place, and your question isn't stupid.

> I have a custom board with a TW9990 analog video decoder connected
> to an iMX6SX. For the TW9990 I use a slightly modified version of
> tw9910.c. I use the following DT:
> 
> &i2c3 {
>     tvin1@44 {
>         compatible = "renesas,tw9990";
>         reg = <0x44>;
> 
>         port {
>             tw9990_1_to_parallel: endpoint {
>                 remote-endpoint = <&parallel_from_tw9990_1>;
>                 bus-width = <8>;
>                 data-shift = <2>; /* your board wiring */
>                 hsync-active = <0>;
>                 vsync-active = <0>;
>                 pclk-sample = <1>;
>                 bus-type = <MEDIA_BUS_TYPE_BT656>;
>             };
>         };
>     };
> };
> 
> &csi1 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&pinctrl_csi1>;
>     status = "okay";
> 
>     port {
>         parallel_from_tw9990_1: endpoint {
>             remote-endpoint = <&tw9990_1_to_parallel>;
>             bus-width = <8>;
>             bus-type = <MEDIA_BUS_TYPE_BT656>;
>         };
>     };
> };
> 
> Issuing this command
> 
> # v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=50 --stream-to=frame.raw
> 
> enables the TW9990 and it starts streaming the analog video signal in
> BT656 format to the iMX. I verified that using an osscilloscope.
> But I see no interrupt generated by the CSI module. I am sure I have to
> add BT656 format handling to the driver but have no idea where to start.

The driver indeed doesn't seem to support BT656. 

> I have also verified that the hardware is working correctly by implementing
> a simple capture driver, not in the context of v4l2, but with my own very
> hakish uio implementation.

Does that mean that you know what register values to set to get it
working ? If so things shouldn't be too difficult. The driver should
call v4l2_fwnode_endpoint_parse() to parse the endpoint and get the bus
type (external sync or BT656). The information should be stored in the
imx7_csi structure, and the registers should then be configured
accordingly (likely in imx7_csi_configure()).

Interlaced mode seems to be implemented in the driver, so if you're
lucky the above will be all you need. If there are issues with the
interlace implementation (I don't think it has been tested as
extensively as progressive mode) then more work may be required.

> Some maybe helpful outputs:
> 
> # media-ctl -v -p
> Opening media device /dev/media0
> Enumerating entities
> looking up device: 81:1
> looking up device: 81:0
> looking up device: 81:2
> Found 3 entities
> Enumerating pads and links
> Media controller API version 6.6.52
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:2214000.csi
> hw revision     0x0
> driver version  6.6.52
> 
> Device topology
> Streams API not supported
> - entity 1: csi (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: SINK
>                 [stream:0 fmt:UYVY8_2X8/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "tw9910 2-0044":0 [ENABLED,IMMUTABLE]
>         pad1: SOURCE
>                 [stream:0 fmt:UYVY8_2X8/640x480 field:none
> colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: SINK
>                 <- "csi":1 [ENABLED,IMMUTABLE]
> 
> Streams API not supported
> - entity 10: tw9910 2-0044 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Decoder flags 0
>              device node name /dev/v4l-subdev1
>         pad0: SOURCE
>                 [stream:0 fmt:UYVY8_2X8/640x480 field:interlaced-bt
> colorspace:smpte170m
>                  crop.bounds:(0,0)/640x480
>                  crop:(0,0)/640x480]
>                 -> "csi":0 [ENABLED,IMMUTABLE]

-- 
Regards,

Laurent Pinchart

