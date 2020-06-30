Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7F820F54A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 14:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387945AbgF3M7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 08:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387860AbgF3M7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 08:59:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934C7C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 05:59:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1A2D12A1886
Message-ID: <c2e7408b627cf76d4939a7eef216bba9d5b0b7c6.camel@collabora.com>
Subject: Re: how to use stateless-mpeg2-vp8-h264-v4 on imx8m with vpu?
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Tue, 30 Jun 2020 09:59:20 -0300
In-Reply-To: <9722da8a-42bf-e7e5-b6dd-8a3c0eff2f76@puri.sm>
References: <9722da8a-42bf-e7e5-b6dd-8a3c0eff2f76@puri.sm>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, 2020-06-30 at 13:16 +0200, Martin Kepplinger wrote:
> Hi Ezequiel,
> 
> On the Librem 5 (imx8mq) I try to decode a (h264) full hd video file
> using the VPU.
> 
> I'm running the following tree that doesn't change much, but adds the
> VPU dts description:
> https://source.puri.sm/martin.kepplinger/linux-next/-/commits/5.8-rc3/librem5___vpu
> (output of "v4l-ctl --all" at the bottom).
> 

OK, this means the VPU is enabled with the Hantro driver, so far so good.

> 
> I now run your version of ffmpeg:
> https://gitlab.collabora.com/ezequiel/ffmpeg/-/commits/stateless-mpeg2-vp8-h264-v4
> (with minor build fixes) but simply doing "ffplay <file>" seems like not
> using /dev/video0
> 
> Is this supposed to work? If so, do I need to know anything about ffmpeg
> to be able to test this? How do you verify that the v4l2 mem2mem device
> (vpu) is being used?
> 

Not sure what state the branch is on, and also IIRC you should use that together
with mpv for proper zero-copy operation.

I think the libre elec community can help you with that, as they maintain
proper ffmpeg/mpv branches.

Do you need this to work with ffmpeg, or is GStreamer also OK?

Thanks,
Ezequiel

> thanks a lot,
>                                 martin
> 
> 
> 
> purism@pureos:~/ffmpeg_sources/ffmpeg$ v4l2-ctl --all
> Driver Info:
> 	Driver name      : hantro-vpu
> 	Card type        : nxp,imx8mq-vpu-dec
> 	Bus info         : platform: hantro-vpu
> 	Driver version   : 5.8.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : hantro-vpu
> 	Model            : hantro-vpu
> 	Serial           :
> 	Bus info         : platform: hantro-vpu
> 	Media version    : 5.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 5.8.0
> Interface Info:
> 	ID               : 0x0300000c
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : nxp,imx8mq-vpu-dec-source
> 	Function         : V4L2 I/O
> 	Pad 0x01000002   : 0: Source
> 	  Link 0x02000008: to remote pad 0x1000004 of entity
> 'nxp,imx8mq-vpu-dec-proc': Data, Enabled, Immutable
> Priority: 2
> Format Video Capture Multiplanar:
> 	Width/Height      : 48/48
> 	Pixel Format      : 'NV12' (Y/CbCr 4:2:0)
> 	Field             : None
> 	Number of planes  : 1
> 	Flags             :
> 	Colorspace        : JPEG
> 	Transfer Function : Default
> 	YCbCr/HSV Encoding: Default
> 	Quantization      : Default
> 	Plane 0           :
> 	   Bytes per Line : 48
> 	   Size Image     : 3456
> Format Video Output Multiplanar:
> 	Width/Height      : 48/48
> 	Pixel Format      : 'MG2S' (MPEG-2 Parsed Slice Data)
> 	Field             : None
> 	Number of planes  : 1
> 	Flags             :
> 	Colorspace        : JPEG
> 	Transfer Function : Default
> 	YCbCr/HSV Encoding: Default
> 	Quantization      : Default
> 	Plane 0           :
> 	   Bytes per Line : 0
> 	   Size Image     : 4608
> 
> Codec Controls
> 
>         mpeg_2_slice_parameters 0x009909fa (unknown): type=103
> flags=has-payload
>    mpeg_2_quantization_matrices 0x009909fb (unknown): type=104
> flags=has-payload
>                    h264_profile 0x00990a6b (menu)   : min=0 max=4
> default=2 value=2
>     h264_sequence_parameter_set 0x00990ce8 (unknown): type=110
> flags=has-payload
>      h264_picture_parameter_set 0x00990ce9 (unknown): type=111
> flags=has-payload
>             h264_scaling_matrix 0x00990cea (unknown): type=112
> flags=has-payload
>           h264_slice_parameters 0x00990ceb (unknown): type=113
> flags=has-payload
>          h264_decode_parameters 0x00990cec (unknown): type=114
> flags=has-payload
>                h264_decode_mode 0x00990ced (menu)   : min=1 max=1
> default=1 value=1
>                 h264_start_code 0x00990cee (menu)   : min=1 max=1
> default=1 value=1
>                vp8_frame_header 0x009910d0 (unknown): type=301
> flags=has-payload


