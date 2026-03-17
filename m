Return-Path: <linux-media+bounces-56102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDkKN5N7uWmxHAIAu9opvQ
	(envelope-from <linux-media+bounces-56102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:04:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BCB2AD8F9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1E873123CE6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814422F2619;
	Tue, 17 Mar 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nITphPjl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278F2F3614
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763268; cv=none; b=Xt7iGxXBcgTmhoEZBmWSRApSHJSknhK51bOXyN/MVCBDA7Afk0UyXHH0iuNO0BEGVkLycWeWyPhN0C2Ll5RyQBGvcDK2oQL9VOVYQhsYP0AME3RUk7kOthvkGKmMLkBPK7iYXN/e9rfgb2PPzZ9L2wQMt8Fv1Vtvynymtv7gOiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763268; c=relaxed/simple;
	bh=quIvLsOl0lXDTko0nQTRlkm4qKzR4vrnIgiwG2WQ9Mo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=oELrR9TIucC1MBwOAVg6SIB74l1DvwQyDPI4BcM5ZebuZxKDKH4wkUvSjbrPGNkiqB9MrL1LFb/3MXLdBF54nSLW2dkXaW4o440A7ZEFD4beBOVrmdJv1ZT5CoTXDZSczvNYBMNpUxCi/MZWrTt/bXPWRE0JORU8QtklvMHMIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nITphPjl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFD8C2BCAF;
	Tue, 17 Mar 2026 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773763267;
	bh=quIvLsOl0lXDTko0nQTRlkm4qKzR4vrnIgiwG2WQ9Mo=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=nITphPjl/ShlbDJisKafTauy7rtWeh87pSrLI45Eva74e2or+bSeVU2Exzx+5TQ+/
	 RcDPzpsHB1UDcdfFJhhbSnNiY1weoDh/vdUuhCxwcRXk3M+6UBxE8FTSbp1LLQcRkx
	 uigIE31UYpvoDlS0wbweiCAZf2VetwmUMBGjSkYXfHXb6NS3uzyiLqv4dv8xg0RQhk
	 iUdbHAcKQ2I7cY0InvvW/OxepSuUsvxhQcsMRzYM47j9YHZKY9JEh3yfpg9kVKQnyP
	 bx0INIwLyymc8SUxNo40Z/8ZbTBS12P+zBW0SIWkzDIYg7oZm1xLGUIBax5r931fvU
	 s0Grr/xefcW9Q==
Message-ID: <1860c0a2-e44a-477b-bc73-2bee2071bc73@kernel.org>
Date: Tue, 17 Mar 2026 17:01:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1 0/2] media: pci: AVMatrix HWS capture driver
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
 <CAMSzxxScAW+sR6OzXt4NxOFx=Q0LDFko9d_xY4zoROYOZMzzdA@mail.gmail.com>
 <12a06e89-eb67-4be7-8b0a-9ea71ab4cf7c@kernel.org>
 <dcbdb336-3598-42d1-af23-bdfccc3210bf@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <dcbdb336-3598-42d1-af23-bdfccc3210bf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56102-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 20BCB2AD8F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/02/2026 13:53, Hans Verkuil wrote:
> Hi Ben,
> 
> I ran the patches through our media CI and I got a number of failures:
> 
> https://linux-media.pages.freedesktop.org/-/users/hverkuil/-/jobs/92826923/artifacts/report.htm
> 
> Looking at it it is mostly missing 'static' for several functions, and
> some unused variables.
> 
> Can you take a look at these issues and post a v2?

Ping?

Regards,

	Hans

> 
> Thank you!
> 
> Regards,
> 
> 	Hans
> 
> 
> On 09/02/2026 12:47, Hans Verkuil wrote:
>> On 08/02/2026 01:35, Ben Hoff wrote:
>>> Hi all,
>>>
>>> Just following up on this new driver patch sent Jan 11.
>>>
>>> Happy to address review comments or adjust the approach if needed.
>>>
>>> I’m happy to maintain this driver going forward.
>>
>> It got lost in the flood of patches. Thank you for reminding me.
>>
>> I've delegated it to myself in patchwork, so I hope I'll have a review
>> for you with two weeks tops. Ping me if you didn't hear from me after
>> two weeks.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Thanks,
>>> Ben
>>>
>>> On Sun, Jan 11, 2026 at 9:24 PM Ben Hoff <hoff.benjamin.k@gmail.com> wrote:
>>>>
>>>> Hi all,
>>>>
>>>> This series introduces an in-tree AVMatrix HWS PCIe capture driver.
>>>> The driver supports up to four HDMI inputs and exposes the video capture
>>>> path through V4L2. Audio support is intentionally omitted in this
>>>> revision so the series can focus on the video pipeline and PCIe glue.
>>>>
>>>> Major pieces include:
>>>>   - PCI glue with capability discovery, BAR setup, interrupt handling,
>>>>     and power-management hooks.
>>>>   - A vb2-dma-contig based capture pipeline with DV timings support,
>>>>     per-channel controls, two-buffer management, and loss-of-signal
>>>>     recovery.
>>>>
>>>> The baseline GPL out-of-tree driver is available at:
>>>>   https://github.com/benhoff/hws/tree/baseline
>>>> A vendor driver bundle is available at:
>>>>   https://www.acasis.com/pages/acasis-product-drivers
>>>> The vendor is not involved in this upstreaming effort.
>>>>
>>>> Prior RFC posting: https://lore.kernel.org/lkml/20251027195638.481129-1-hoff.benjamin.k@gmail.com/
>>>>
>>>> Current status / open items:
>>>>   - `v4l2-compliance` passes for each video node, and I have exercised
>>>>     basic capture in OBS and run this driver in a steady state mode
>>>>     daily
>>>>
>>>> v4l2-compliance (from v4l-utils git, v4l2-compliance 1.32.0):
>>>> v4l2-compliance 1.32.0, 64 bits, 64-bit time_t
>>>>
>>>> Compliance test for HwsCapture device /dev/video1:
>>>>
>>>> Driver Info:
>>>>         Driver name      : HwsCapture
>>>>         Card type        : AVMatrix HWS Capture 2
>>>>         Bus info         : PCI:0000:17:00.0
>>>>         Driver version   : 6.18.3
>>>>         Capabilities     : 0x84200001
>>>>                 Video Capture
>>>>                 Streaming
>>>>                 Extended Pix Format
>>>>                 Device Capabilities
>>>>         Device Caps      : 0x04200001
>>>>                 Video Capture
>>>>                 Streaming
>>>>                 Extended Pix Format
>>>>
>>>> Required ioctls:
>>>>         test VIDIOC_QUERYCAP: OK
>>>>         test invalid ioctls: OK
>>>>
>>>> Allow for multiple opens:
>>>>         test second /dev/video1 open: OK
>>>>         test VIDIOC_QUERYCAP: OK
>>>>         test VIDIOC_G/S_PRIORITY: OK
>>>>         test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>         test VIDIOC_LOG_STATUS: OK
>>>>
>>>> Input ioctls:
>>>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>         test VIDIOC_G/S/ENUMINPUT: OK
>>>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>         Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
>>>>         test VIDIOC_DV_TIMINGS_CAP: OK
>>>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>                 info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00980903)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
>>>>                 info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00980903)
>>>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>>>         test VIDIOC_QUERYCTRL: OK
>>>>                 info: checking control 'User Controls' (0x00980001)
>>>>                 info: checking control 'Brightness' (0x00980900)
>>>>                 info: checking control 'Contrast' (0x00980901)
>>>>                 info: checking control 'Saturation' (0x00980902)
>>>>                 info: checking control 'Hue' (0x00980903)
>>>>         test VIDIOC_G/S_CTRL: OK
>>>>                 info: checking extended control 'User Controls' (0x00980001)
>>>>                 info: checking extended control 'Brightness' (0x00980900)
>>>>                 info: checking extended control 'Contrast' (0x00980901)
>>>>                 info: checking extended control 'Saturation' (0x00980902)
>>>>                 info: checking extended control 'Hue' (0x00980903)
>>>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>>>                 info: checking control event 'User Controls' (0x00980001)
>>>>                 info: checking control event 'Brightness' (0x00980900)
>>>>                 info: checking control event 'Contrast' (0x00980901)
>>>>                 info: checking control event 'Saturation' (0x00980902)
>>>>                 info: checking control event 'Hue' (0x00980903)
>>>>                 warn: v4l2-test-controls.cpp(1159): V4L2_CID_DV_RX_POWER_PRESENT not found for input 0
>>>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>         Standard Controls: 5 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>                 info: found 1 formats for buftype 1
>>>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>                 warn: v4l2-test-formats.cpp(1485): S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
>>>>         test VIDIOC_G/S_PARM: OK
>>>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>>>         test VIDIOC_G_FMT: OK
>>>>         test VIDIOC_TRY_FMT: OK
>>>>         test VIDIOC_S_FMT: OK
>>>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>         test Cropping: OK (Not Supported)
>>>>         test Composing: OK (Not Supported)
>>>>         test Scaling: OK
>>>>
>>>> Codec ioctls (Input 0):
>>>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>                 info: test buftype Video Capture
>>>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>         test CREATE_BUFS maximum buffers: OK
>>>>         test VIDIOC_REMOVE_BUFS: OK
>>>>         test VIDIOC_EXPBUF: OK
>>>>         test Requests: OK (Not Supported)
>>>>         test blocking wait: OK
>>>>
>>>> Test input 0:
>>>>
>>>> Stream using all formats:
>>>>         test MMAP for Format YUYV, Frame Size 640x480:
>>>>                 Stride 1280, Field None: OK
>>>>                 Stride 1344, Field None: OK
>>>>         test MMAP for Format YUYV, Frame Size 1920x1080:
>>>>                 Stride 3840, Field None: OK
>>>> Total for HwsCapture device /dev/video1: 51, Succeeded: 51, Failed: 0, Warnings: 2
>>>>
>>>>
>>>> Thanks for taking a look!
>>>>
>>>> Ben
>>>>
>>>> Ben Hoff (2):
>>>>   media: pci: add AVMatrix HWS capture driver
>>>>   MAINTAINERS: add entry for AVMatrix HWS driver
>>>>
>>>>  MAINTAINERS                            |    6 +
>>>>  drivers/media/pci/Kconfig              |    1 +
>>>>  drivers/media/pci/Makefile             |    1 +
>>>>  drivers/media/pci/hws/Kconfig          |   12 +
>>>>  drivers/media/pci/hws/Makefile         |    4 +
>>>>  drivers/media/pci/hws/hws.h            |  175 +++
>>>>  drivers/media/pci/hws/hws_irq.c        |  268 ++++
>>>>  drivers/media/pci/hws/hws_irq.h        |   10 +
>>>>  drivers/media/pci/hws/hws_pci.c        |  722 +++++++++++
>>>>  drivers/media/pci/hws/hws_reg.h        |  144 +++
>>>>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  755 ++++++++++++
>>>>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   38 +
>>>>  drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
>>>>  drivers/media/pci/hws/hws_video.h      |   29 +
>>>>  14 files changed, 3707 insertions(+)
>>>>  create mode 100644 drivers/media/pci/hws/Kconfig
>>>>  create mode 100644 drivers/media/pci/hws/Makefile
>>>>  create mode 100644 drivers/media/pci/hws/hws.h
>>>>  create mode 100644 drivers/media/pci/hws/hws_irq.c
>>>>  create mode 100644 drivers/media/pci/hws/hws_irq.h
>>>>  create mode 100644 drivers/media/pci/hws/hws_pci.c
>>>>  create mode 100644 drivers/media/pci/hws/hws_reg.h
>>>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
>>>>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
>>>>  create mode 100644 drivers/media/pci/hws/hws_video.c
>>>>  create mode 100644 drivers/media/pci/hws/hws_video.h
>>>>
>>>> --
>>>> 2.51.0
>>>
>>
>>
> 
> 


