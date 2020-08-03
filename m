Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC923A3EB
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 14:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHCMRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 08:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgHCMRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 08:17:41 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762B4C06174A;
        Mon,  3 Aug 2020 05:17:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A4A40294816
Message-ID: <10100d9c36cac880b846e454aa4b4df6de96ed41.camel@collabora.com>
Subject: Re: [PATCH 0/3] KT0913 FM/AM driver
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Santiago Hormazabal <santiagohssl@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Date:   Mon, 03 Aug 2020 09:17:30 -0300
In-Reply-To: <20200803020921.64151-1-santiagohssl@gmail.com>
References: <20200803020921.64151-1-santiagohssl@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Santiago,

Nice work and welcome to the kernel community.

On Sun, 2020-08-02 at 23:09 -0300, Santiago Hormazabal wrote:
> media: adds support for kt0913 FM/AM tuner chip
> 

I don't think this line above should be there.

Also, this seems to be v2. You are missing a "PATCH v2" prefix
on the patches subject, and a v2 changelog on the cover letter.

Some examples for you to look at:

https://patchwork.linuxtv.org/project/linux-media/cover/BN6PR04MB06603B2CD7F2C56B322AF882A3710@BN6PR04MB0660.namprd04.prod.outlook.com/

https://patchwork.linuxtv.org/project/linux-media/cover/20200717145324.292820-1-jacopo+renesas@jmondi.org/

The vN+1 subject makes it easier for reviewers to keep
track of submissions, and the changelog makes it easier
to track the changes.

Thanks!
Ezequiel
 
> Adds a driver for the KT0913 FM/AM tuner chip from KT Micro. This chip
> can be found on many low cost FM/AM radios and DVD/Home Theaters.
> The chip provides two ways of usage, a manual mode (requiring only a
> few buttons) or complete control via I2C. This driver uses the latter.
> It exposes the minimum functionality of this chip, which includes tuning
> an AM or FM station given its frequency, reading the signal strength,
> setting Stereo (only on FM) or Mono (available on AM/FM), Mute, Volume
> and Audio Gain.
> I left some TODOs on the code, like supporting the chip's hardware seek
> feature, using a RW/RO regmaps rather than a single volatile regmap,
> show the FM SNR as a RO control and the FM/AM AFC deviation as another
> RO control.
> The module I've used comes from SZZSJDZ.com, a now defunct company.
> However, it's possible to buy this chip directly from Aliexpress or
> similar sites.
> I tested this on two systems, the first one being a Raspberry Pi 4 with
> the unstable 5.x kernel, but later I moved to a Banana Pi 2 Zero where
> I used the (current at this time, 8f2a4a9) master of this repo for testing.
> I've also compiled the v4l-compliance from sources (c7f0328) and it passed
> all the tests. The output of that is at the end of this note.
> 
> Note: This is the second set of patches for the driver, where I (tried to)
> address the comments that the reviewers added on the previous set.
> 
> v4l2-compliance SHA: c7f03287bbd64c168975e7ff3192e6fd3b507686, 32 bits, 32-bit time_t
> 
> Compliance test for kt0913-fm-am device /dev/radio0:
> 
> Driver Info:
> 	Driver name      : kt0913-fm-am
> 	Card type        : kt0913-fm-am
> 	Bus info         : I2C:radio0
> 	Driver version   : 5.8.0
> 	Capabilities     : 0x80250000
> 		Tuner
> 		Radio
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x00250000
> 		Tuner
> 		Radio
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/radio0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK
> 	test VIDIOC_G/S_FREQUENCY: OK
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 1
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 8 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for kt0913-fm-am device /dev/radio0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Santiago Hormazabal (3):
>   dt-bindings: vendor-prefixes: Add KT Micro
>   media: kt0913: device tree binding
>   media: Add support for the AM/FM radio chip KT0913 from KT Micro.
> 
>  .../bindings/media/i2c/ktm,kt0913.yaml        |   56 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  drivers/media/radio/Kconfig                   |   10 +
>  drivers/media/radio/Makefile                  |    1 +
>  drivers/media/radio/radio-kt0913.c            | 1196 +++++++++++++++++
>  5 files changed, 1265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ktm,kt0913.yaml
>  create mode 100644 drivers/media/radio/radio-kt0913.c
> 


