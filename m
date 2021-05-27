Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD4F392900
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 09:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbhE0H4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 03:56:48 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49541 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235169AbhE0H40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 03:56:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mAqulaPv0VN4kmAqylNZyE; Thu, 27 May 2021 09:54:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622102092; bh=iRozK57aD38922wBPIqM+mPlF2ZSkmLhmWfW+6TOOPw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nnKc9HVxyv2mtu0DezX4xoETYeRiqFmVXF2LuqjUIhHPYk5s0S7TKUrQovHjlP22Y
         2ws0+e6HpMHwZ59YXAHwv06qjAos2iXkB53xYYGhCnfmvoteuzOezEV7GmSNEEsGGG
         Z9j8vIL8LcphzZEUlP81oK6WJb7kUCEh1l8wiH0teDS7acQMGnSaNX2lNjM8mgaA+J
         5RY8cOyFpbW+FeowyY1p6VkKZFFrC58iHZlD5a8ZBYOQLz4Epqe2aClD5ROWNvUB/m
         T67zGyNPcUzyluPIogDJmxdII1zbH8qJ4sykodc7KieF8QE+Lo5RSJV5+zq1sVzxcE
         X8kPBqBNVroGg==
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ae54a98a-c1e5-e7f9-4d3f-fa4a56b9a359@xs4all.nl>
Date:   Thu, 27 May 2021 09:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGHDem9dY35z8m1M5JhY6kWFDSMTHAzmmjYiAuF0OnASAgIi6P++gGlPumw5ROVrYfCnUAwuJF7D6R+zLKzsOh9hfFuXkV/Ak74RLbqHeF6pw9YJiey1
 LzHCRxRs86rHNC03JCUFH7HdFw3tr8JElJkYWMzEBBwN9HLTRjKe0/w8CbZAB9tKgrR2aBpziww6OODLmXDepW8WKoAqrpKJ50/4k75j6DTXcpgNwvEcPAEu
 64mWxN0uYGkyDURj1EqTVg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

On 29/04/2021 15:28, Stanimir Varbanov wrote:
> Hi,
> 
> HEIC (High-Efficiency Image Container) is a variant of HEIF (High
> Efficiency Image File Format) where HEVC/h265 codec is used to encode
> images.  For more info see [1].
> 
> In this RFC we propose a new compressed pixel format V4L2_PIX_FMT_HEIC.
> The name is debatable and could be changed (V4L2_PIX_FMT_HEVC_HEIF is
> also an option).
> 
> There are two encoding modes which should be selectable by clients:
>     1. Regular image encoding
>     2. Grid image encoding
> 
> 1. Regular image encoding
> 
> Propose to reuse stateful video encoder spec [2].
> 
> - queuing one OUTPUT buffer will produce one CAPTURE buffer.  The
> client could trigger Drain sequence at any point of time.
> 
> 2. Grid image encoding
> 
> Propose to reuse stateful video encoder spec [2].
> 
> - queuing one OUTPUT buffer will produce a number of grids CAPTURE
> buffers.  The client could trigger Drain sequence at any point of time.
> 
> This image encoding mode is used when the input image resolution is
> bigger then the hardware can support and/or for compatibility reasons
> (for exmaple, the HEIC decoding hardware is not capable to decode higher
> than VGA resolutions).

Is grid image encoding part of the spec for this format? Is this something
that the venus hardware needs due to image resolution limitations as
described above?

Would it be possible for the driver to handle this internally? I.e.,
if it detects that it needs to switch to grid mode, can it just encode
each grid and copy it in the capture buffer? This assumes that there is
metadata that can be used by a decoder do find and decode each grid.

> 
> In this mode the input image is divided on square blocks (we call them grids)
> and every block is encoded separately (the Venus driver presently supports 
> grid size of 512x512 but that could be changed in the future).
> 
> To set the grid size we use a new v4l2 control.

Can the driver make a choice of the grid size, and the control just
reports the grid size? I.e., does it make sense for userspace to set
this?

The wiki page [1] doesn't mention grids, so where does this come from?
Is it part of some spec? Or is it a venus-specific feature?

> 
> The side effect of this mode is that the client have to set the v4l2
> control and thus enable grid encoding before setting the formats on
> CAPTURE and OUTPUT queues, because the grid size reflects on the
> selected resolutions. Also the horizontal and vertical strides will
> also be affected because thеy have to be aligned to the grid size
> in order to satisfy DMA alignment restrictions.
> 
> Using of v4l2 control to set up Grid mode and Grid size above looks
> inpractical and somehow breaks the v4l2 and v4l2 control rules, so
> I'd give one more option. 
> 
> Encoding the Grid mode/size in the new proposed HEIC pixel format:
> 
>    V4L2_PIX_FMT_HEIC - Regular HEIC image encoding
>    V4L2_PIX_FMT_HEIC_GRID_512x512 - Grid HEIC image encoding, grid size of 512x512 
>    and so on ...
> 
> Comments and suggestions are welcome!

I notice that this RFC just talks about the encoder, does venus also
support a decoder? How would a HW decoder handle grids?

Regards,

	Hans

> 
> regards,
> Stan
> 
> [1] https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-encoder.html
> 
> 
> Stanimir Varbanov (4):
>   media: Add HEIC compressed pixel format
>   v4l2-ctrls: Add HEIC grid size control
>   venus: helpers: Add a new helper for buffer processing
>   venus: Add HEIC image encoder
> 
>  .../media/v4l/pixfmt-compressed.rst           |   12 +
>  drivers/media/platform/qcom/venus/Makefile    |    2 +
>  drivers/media/platform/qcom/venus/core.h      |   10 +
>  drivers/media/platform/qcom/venus/helpers.c   |   20 +
>  drivers/media/platform/qcom/venus/helpers.h   |    1 +
>  drivers/media/platform/qcom/venus/hfi_cmds.c  |   10 +-
>  .../media/platform/qcom/venus/hfi_helper.h    |    5 +
>  drivers/media/platform/qcom/venus/ienc.c      | 1348 +++++++++++++++++
>  drivers/media/platform/qcom/venus/ienc.h      |   14 +
>  .../media/platform/qcom/venus/ienc_ctrls.c    |   83 +
>  drivers/media/v4l2-core/v4l2-ctrls.c          |    3 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  include/uapi/linux/v4l2-controls.h            |    1 +
>  include/uapi/linux/videodev2.h                |    1 +
>  14 files changed, 1510 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/qcom/venus/ienc.c
>  create mode 100644 drivers/media/platform/qcom/venus/ienc.h
>  create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c
> 

