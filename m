Return-Path: <linux-media+bounces-52123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGhRBANBgmmORQMAu9opvQ
	(envelope-from <linux-media+bounces-52123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 19:40:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF8DDB80
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99AA530BD848
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 18:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260A31DE8B5;
	Tue,  3 Feb 2026 18:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yem4XMWC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB461AAE17;
	Tue,  3 Feb 2026 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143866; cv=none; b=gD1na8ZKcC2NQiYB5rguV8Ru9CneG4Ag+ibm4jjMHSiCCBOWtZh/DECOdc1BNsa13/jGBaC8MNabkWAZSyK/xFDs28cXwvnl+yYWMtMC/u3vWwuV0cMDkb8kSuHJxMD/lbYDhX9yCFqAvuE4pLk8/5VryKIqDSYkFFJ/FZIFOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143866; c=relaxed/simple;
	bh=fmMDwkQq2iwVDliWxFWk/iFlFtXRM0ZIS2g0y5/ESCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/FPy8Y3addYVyLdui293nx9QlzFS7FXuJsmJFmM5cB8jADa3wDTIuyzPfv84Ley9IWT5+ocQq2EmcjAn3srytei2ABMivSp9zu5phdum5WVsZHCX8IVDdL2088HWiRxs9jMrXSiYadUsjgSGw3Ly7lPOMZJQokaPrqmKn8CY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yem4XMWC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1926A1C6;
	Tue,  3 Feb 2026 19:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770143816;
	bh=fmMDwkQq2iwVDliWxFWk/iFlFtXRM0ZIS2g0y5/ESCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yem4XMWCy+HPKv3z9WNB/Yrho9MJpE6K54IDbeEn2KSp4UtK2RnNAxUWx3MwqXVtn
	 /K2qAsbPno24abpBoYr78k1VDgWaa+0Ove0nxjRFKeOmajX6G1aS5X/mZks/5tHoDL
	 G/paDouT3gO2TopC5Z+HQUvdreLDTTqUFL2WceQI=
Date: Tue, 3 Feb 2026 19:37:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com, 
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com, 
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, niklas soderlund <niklas.soderlund@ragnatech.se>
Subject: Re: [EXT] Re: [RFC v1 00/11] Add iMX95 neoisp driver
Message-ID: <aYI0CrKLGeiZMlD8@zed>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52123-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,diagram.dot:url,linuxtv.org:url,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 2FAF8DDB80
X-Rspamd-Action: no action

Hello

On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
> Hi Antoine,
>
> Thanks for your response.
>
> On 1/28/26 09:17, Antoine Bouyer wrote:
> > Hi Michael
> >
> > On 1/26/26 10:44 AM, Michael Riesch wrote:
> >>
> >>
> >> Hi Antoine,
> >>
> >> On 1/23/26 09:09, Antoine Bouyer wrote:
> >>> Hi all,
> >>>
> >>> This RFC patch series introduces the NXP Neo Image Signal Processor
> >>> (ISP)
> >>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9
> >>> family.
> >>> The series also includes updates to the generic v4l2-isp interface to
> >>> support extended statistics required by the Neo ISP.
> >>>
> >>> The Neo ISP processes one or more camera streams, converting RAW formats
> >>> into YUV or RGB outputs. Its architecture is largely influenced by the
> >>> PISP driver. The hardware supports up to eight contexts, with three sink
> >>> pads (main input, HDR input, and parameter buffers) and three source
> >>> pads
> >>> (RGB output, IR output, and statistics metadata).
> >>>
> >>> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
> >>> parameter/statistics buffers are supported through the generic v4l2-isp
> >>> framework, similar to rkisp1 and Mali-C55. The driver currently supports
> >>> M2M operation; direct CSI-to-ISP streaming is not yet implemented.
> >>
> >> How do you envisage the direct CSI-to-ISP streaming shall be supported?
> >
> > At this stage, this streaming mode still needs to be evaluated on
> > neoisp. We should follow the integration model used by existing ISP
> > drivers to avoid duplicating solutions.
>
> Fair point, but I have had the impression that there are not many
> examples (if any). The rkisp1 driver, for instance, only supports inline
> mode although the HW should be able to do both.
>
> But any pointers most welcome, I won't claim I have the full overview.
>
> >
> > Below are my initial thoughts on the specific points you raised:
> >
> >>   - How shall the final media graph(s) look like?
> >
> > The media entities would remain mostly identical, except for the absence
> > of ISI. The topology would be a direct linkg from sensor->csi-
> >>formatter->neoisp.

If support for inline mode has to be added later, the ISP will need to
be registered in the same media graph of the CSI-2 receiver to be able
to link the two, right ?

How do you envision to control the ISP operating mode, because I'm
afraid if you register the ISP in its own media graph, you're locking
yourself there as implementing inline mode would require a different
media topology with all the implications on the rest of the userspace
stack.

This might not be a problem if you know that the inline vs m2m mode is
SoC sythesis time parameter. Some SoCs will integrate neoisp inline, some
other as m2m. In this case you'll likely need two pipeline handlers
in libcamera, but if that's per SoC-line maybe is acceptable. The fact
you suggests in inline mode there won't be an ISI makes me think this
actually depends on the SoC design ?

However, if you plan to allow deferring inline/m2m mode selection to
the system integrators or even have it as a run-time parameter, then
you should really consider having the ISP in the same media graph as
the CSI-2 receiver and operate the whole CSI-2/ISI/ISP as a single
media graph, where you could select the operating mode through media link
enablement or dts endpoint connections

Niklas (in cc) has addressed a similar situation, where inline and m2m
mode can be selected by link enablement at runtime here
https://patchwork.linuxtv.org/project/linux-media/patch/20251225171054.1370856-3-niklas.soderlund+renesas@ragnatech.se/
(see risp_cs_internal_ops)

>
> OK, I thought that ISI was still around...
>
> >
> >>   - How many media devices are registered and which driver registers it
> >>     or them?
> >
> > That will be part of the evaluation. My initial assumption is that
> > neoisp would be the appropriate component to register the media device
> > in this mode, since ISI is not involved, and ISI currently performs the
> > registration in the M2M configuration.

Isn't the ISP registering its own media graph ?

Can we get a copy of all media graphs on an i.MX95 system including
the ISI and the CSI-2 receiver ?

If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
that's exactly what we're working on with the context framework :)


>
> ... since it is not, your assumption seems very reasonable.
>
> >
> >>   - How can the user decide whether direct (csi2isp) or indirect
> >>     (mem2mem) streaming shall be used?
> >
> > That will also be part of the evaluation. From dts would be my first
> > option, but may prevent using both modes on same platform then.
>
> Of course this depends what the hardware is able to do, but in case the
> HW is reconfigurable easily, I doubt that device tree is a good choice
> to solve that.
> >
> >>
> >> While it is certainly OK to introduce this support only at a later
> >> stage, it makes sense to consider this right from the start to avoid
> >> some nasty changes e.g. in how this hardware is exposed to user space.
> >>
> >> Also, we are facing a similiar challenge with recent Rockchip ISP
> >> hardware (RK3588, RK3576, ...) and it would be great to hear your
> >> thoughts about that.
> >
> > Is there an existing discussion thread available on this topic? I would
> > be very interested in following it.
>
> Not yet, I am afraid. But there should be one or two soon (TM) :-)

It's probably time to have one :)

>
> Thanks and regards,
> Michael
>
> >
> > Thanks
> > Antoine
> >
> >>
> >> Thanks in advance and best regards,
> >> Michael
> >>
> >>>
> >>> This series is posted as RFC because extending the v4l2-isp interface
> >>> may
> >>> overlap with ongoing work. If similar development already exists, I am
> >>> happy to rebase or adapt the series accordingly. If preferred, the
> >>> series
> >>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
> >>> driver introduction.
> >>>
> >>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
> >>> consistent with the existing style in that file.
> >>>
> >>> Testing was performed on the i.MX95 EVK using the media/next kernel in
> >>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
> >>> using the downstream NXP kernel, as some hardware dependencies are not
> >>> yet upstreamed.
> >>>
> >>> Thanks,
> >>> Antoine
> >>>
> >>> ---
> >>> Here are v4l2-compliance test results:
> >>>
> >>> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> >>> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> >>>
> >>> Compliance test for neoisp device /dev/media0:
> >>>
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>>
> >>> Required ioctls:
> >>>        test MEDIA_IOC_DEVICE_INFO: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/media0 open: OK
> >>>        test MEDIA_IOC_DEVICE_INFO: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Media Controller ioctls:
> >>>        test MEDIA_IOC_G_TOPOLOGY: OK
> >>>        Entities: 7 Interfaces: 7 Pads: 12 Links: 13
> >>>        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> >>>        test MEDIA_IOC_SETUP_LINK: OK
> >>>
> >>> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video0:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x04202000
> >>>                Video Output Multiplanar
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x0300000a
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x00000008 (8)
> >>>        Name             : neoisp-input0
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x01000009   : 0: Source
> >>>          Link 0x0200000c: to remote pad 0x1000002 of entity
> >>> 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video0 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video1:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x04202000
> >>>                Video Output Multiplanar
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x03000010
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x0000000e (14)
> >>>        Name             : neoisp-input1
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x0100000f   : 0: Source
> >>>          Link 0x02000012: to remote pad 0x1000003 of entity
> >>> 'neoisp' (Image Signal Processor): Data
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video1 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video2:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x0c200000
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x03000016
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x00000014 (20)
> >>>        Name             : neoisp-params
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x01000015   : 0: Source
> >>>          Link 0x02000018: to remote pad 0x1000004 of entity
> >>> 'neoisp' (Image Signal Processor): Data, Enabled
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video2 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK (Not Supported)
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK (Not Supported)
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video3:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x04201000
> >>>                Video Capture Multiplanar
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x0300001c
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x0000001a (26)
> >>>        Name             : neoisp-frame
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x0100001b   : 0: Sink
> >>>          Link 0x0200001e: from remote pad 0x1000005 of entity
> >>> 'neoisp' (Image Signal Processor): Data, Enabled
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video3 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK (Not Supported)
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video4:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x04201000
> >>>                Video Capture Multiplanar
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x03000022
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x00000020 (32)
> >>>        Name             : neoisp-ir
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x01000021   : 0: Sink
> >>>          Link 0x02000024: from remote pad 0x1000006 of entity
> >>> 'neoisp' (Image Signal Processor): Data
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video4 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK (Not Supported)
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/video5:
> >>>
> >>> Driver Info:
> >>>        Driver name      : neoisp
> >>>        Card type        : neoisp
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x8ca03000
> >>>                Video Capture Multiplanar
> >>>                Video Output Multiplanar
> >>>                Metadata Capture
> >>>                Metadata Output
> >>>                Streaming
> >>>                Extended Pix Format
> >>>                Device Capabilities
> >>>        Device Caps      : 0x04a00000
> >>>                Metadata Capture
> >>>                Streaming
> >>>                Extended Pix Format
> >>> Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x03000028
> >>>        Type             : V4L Video
> >>> Entity Info:
> >>>        ID               : 0x00000026 (38)
> >>>        Name             : neoisp-stats
> >>>        Function         : V4L2 I/O
> >>>        Pad 0x01000027   : 0: Sink
> >>>          Link 0x0200002a: from remote pad 0x1000007 of entity
> >>> 'neoisp' (Image Signal Processor): Data, Enabled
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/video5 open: OK
> >>>        test VIDIOC_QUERYCAP: OK
> >>>        test VIDIOC_G/S_PRIORITY: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 0 Private Controls: 0
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK
> >>>        test VIDIOC_TRY_FMT: OK
> >>>        test VIDIOC_S_FMT: OK
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK (Not Supported)
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK (Not Supported)
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0,
> >>> Warnings: 0
> >>> --------------------------------------------------------------------------------
> >>> Compliance test for neoisp device /dev/v4l-subdev0:
> >>>
> >>> Driver Info:
> >>>        Driver version   : 6.19.0
> >>>        Capabilities     : 0x00000000
> >>>        Client Capabilities: 0x0000000000000002
> >>> interval-uses-which Media Driver Info:
> >>>        Driver name      : neoisp
> >>>        Model            : neoisp
> >>>        Serial           :
> >>>        Bus info         : platform:4ae00000.isp
> >>>        Media version    : 6.19.0
> >>>        Hardware revision: 0x00000002 (2)
> >>>        Driver version   : 6.19.0
> >>> Interface Info:
> >>>        ID               : 0x0300002c
> >>>        Type             : V4L Sub-Device
> >>> Entity Info:
> >>>        ID               : 0x00000001 (1)
> >>>        Name             : neoisp
> >>>        Function         : Image Signal Processor
> >>>        Pad 0x01000002   : 0: Sink
> >>>          Link 0x0200000c: from remote pad 0x1000009 of entity
> >>> 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
> >>>        Pad 0x01000003   : 1: Sink
> >>>          Link 0x02000012: from remote pad 0x100000f of entity
> >>> 'neoisp-input1' (V4L2 I/O): Data
> >>>        Pad 0x01000004   : 2: Sink
> >>>          Link 0x02000018: from remote pad 0x1000015 of entity
> >>> 'neoisp-params' (V4L2 I/O): Data, Enabled
> >>>        Pad 0x01000005   : 3: Source
> >>>          Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-
> >>> frame' (V4L2 I/O): Data, Enabled
> >>>        Pad 0x01000006   : 4: Source
> >>>          Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-
> >>> ir' (V4L2 I/O): Data
> >>>        Pad 0x01000007   : 5: Source
> >>>          Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-
> >>> stats' (V4L2 I/O): Data, Enabled
> >>>
> >>> Required ioctls:
> >>>        test MC information (see 'Media Driver Info' above): OK
> >>>        test VIDIOC_SUDBEV_QUERYCAP: OK
> >>>        test invalid ioctls: OK
> >>>
> >>> Allow for multiple opens:
> >>>        test second /dev/v4l-subdev0 open: OK
> >>>        test VIDIOC_SUBDEV_QUERYCAP: OK
> >>>        test for unlimited opens: OK
> >>>
> >>> Debug ioctls:
> >>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
> >>>
> >>> Input ioctls:
> >>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
> >>>
> >>> Output ioctls:
> >>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
> >>>
> >>> Input/Output configuration ioctls:
> >>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >>>        test VIDIOC_G/S_EDID: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Sink Pad 0):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Sink Pad 1):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Sink Pad 2):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Source Pad 3):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Source Pad 4):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Sub-Device ioctls (Source Pad 5):
> >>>        Try Stream 0
> >>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        Active Stream 0
> >>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/
> >>> FRAME_INTERVAL: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> >>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> >>>
> >>> Control ioctls:
> >>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> >>>        test VIDIOC_QUERYCTRL: OK
> >>>        test VIDIOC_G/S_CTRL: OK
> >>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> >>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> >>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >>>        Standard Controls: 1 Private Controls: 1
> >>>
> >>> Format ioctls:
> >>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not
> >>> Supported)
> >>>        test VIDIOC_G/S_PARM: OK (Not Supported)
> >>>        test VIDIOC_G_FBUF: OK (Not Supported)
> >>>        test VIDIOC_G_FMT: OK (Not Supported)
> >>>        test VIDIOC_TRY_FMT: OK (Not Supported)
> >>>        test VIDIOC_S_FMT: OK (Not Supported)
> >>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >>>        test Cropping: OK (Not Supported)
> >>>        test Composing: OK (Not Supported)
> >>>        test Scaling: OK (Not Supported)
> >>>
> >>> Codec ioctls:
> >>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> >>>
> >>> Buffer ioctls:
> >>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> >>>        test CREATE_BUFS maximum buffers: OK
> >>>        test VIDIOC_REMOVE_BUFS: OK
> >>>        test VIDIOC_EXPBUF: OK (Not Supported)
> >>>        test Requests: OK (Not Supported)
> >>>
> >>> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed:
> >>> 0, Warnings: 0
> >>>
> >>> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384,
> >>> Failed: 0, Warnings: 0
> >>>
> >>> ---
> >>> Antoine Bouyer (11):
> >>>    media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
> >>>    media: v4l2-isp: Add helper function to compute extended stats size
> >>>    media: Documentation: uapi: Update V4L2 ISP for extensible stats
> >>>    media: Documentation: Add NXP neoisp driver documentation
> >>>    dt-bindings: media: Add nxp neoisp support
> >>>    media: v4l2-ctrls: Add user control base for NXP neoisp controls
> >>>    media: Add meta formats supported by NXP neoisp driver
> >>>    media: uapi: Add NXP NEOISP user interface header file
> >>>    media: platform: Add NXP Neoisp Image Signal Processor
> >>>    media: platform: neoisp: Add debugfs support
> >>>    arm64: dts: freescale: imx95: Add NXP neoisp device tree node
> >>>
> >>>   .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
> >>>   .../admin-guide/media/nxp-neoisp.dot          |   16 +
> >>>   .../admin-guide/media/nxp-neoisp.rst          |  189 ++
> >>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
> >>>   .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
> >>>   .../userspace-api/media/v4l/meta-formats.rst  |    1 +
> >>>   .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
> >>>   .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
> >>>   MAINTAINERS                                   |    9 +
> >>>   .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
> >>>   arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
> >>>   drivers/media/platform/nxp/Kconfig            |    1 +
> >>>   drivers/media/platform/nxp/Makefile           |    1 +
> >>>   drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
> >>>   drivers/media/platform/nxp/neoisp/Makefile    |    8 +
> >>>   drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
> >>>   .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
> >>>   .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
> >>>   .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
> >>>   .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
> >>>   drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
> >>>   .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
> >>>   .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
> >>>   .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
> >>>   drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
> >>>   include/media/v4l2-isp.h                      |   13 +
> >>>   include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
> >>>   include/uapi/linux/media/v4l2-isp.h           |   85 +
> >>>   include/uapi/linux/v4l2-controls.h            |    6 +
> >>>   include/uapi/linux/videodev2.h                |    6 +
> >>>   30 files changed, 11880 insertions(+), 3 deletions(-)
> >>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp-
> >>> diagram.dot
> >>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
> >>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
> >>>   create mode 100644 Documentation/devicetree/bindings/media/
> >>> nxp,neoisp.yaml
> >>>   create mode 100644 Documentation/userspace-api/media/v4l/metafmt-
> >>> nxp-neoisp.rst
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
> >>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
> >>>   create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> >>>
> >>
> >
>
>

