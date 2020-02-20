Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 470F6165988
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 09:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgBTIpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 03:45:43 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55843 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726799AbgBTIpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 03:45:43 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4hSkj9f9DyIme4hSnjicPj; Thu, 20 Feb 2020 09:45:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582188341; bh=n1KovKvq/q7CIfGUBL0d+FJ4p0KVxipSS2I4qj0qbjY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jeXfjP86TikbtpD3J5VM+gOlslNigQ3trmHXSBe5ZjocZN9D33MAOue90O/UO7ahl
         QToWoYt+tLkBWWswLNeClIk9egzyswdF+oy5dwSejQSY0BcUpxs/IAoJAyIhFS2iS+
         PKc3xqtMswCYD3RytkalsISdAJFmcCZkn1V/guato+ZS6D1GiQdxtPqaG+t7KH8e0Y
         i1MIalfnweVfP2rkNTy1sXrq33fq188GTrjmMjy0rtgKuUwQipNchR1zxnWC6A38TT
         VPOkjOHL6qN9/w82j0cWR83XvGidJ+yMKLROgJpKeGkf1YMOQYMQCJ01O7t/u8bYBt
         rb04LfTm6G9ZA==
Subject: Re: [PATCH v5 0/6] media: rockchip: Add the rkvdec driver
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20200219173750.26453-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <933b8189-5541-a7ff-e1dc-05ca3b2d65d5@xs4all.nl>
Date:   Thu, 20 Feb 2020 09:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219173750.26453-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCIE1D8IrPKqAzrx2WDTcm5C6VJb1hktJWZM2wFnyVwAi4U00BlQBVxdgIrnegfo5ze+3BZKzUXGO8cxlQPs5vQti08iUW+80WqJLRhT7RuAtfoIcdBb
 ZUnK6dj/BIP++yf1V8jAqwrbUNUW9rpw23QgJrzuDbPeyb0ps1YcvTiN/ZTeK89vspQ5tttTtSjovKQWR9lHx39MEFbFie9iFjuuMLr4dU2rwgbuvquEnzEP
 HglOUv8e44p712AelnuV0P2kvDnUyqSXo40pTKjhCJcQYjSMeG9LRzohRMDpggUH9l5I71WrLaFl3pZ8s/2VgIAt0RD+HBQaXAZtrMu9rR80TNjGD88Rr4io
 sxDhTfuqN/1Izqg4ExpWJxktDZnwijHzyYTf+EjUN3R8BjLYZhYOdTb2YHHi5sTbOiefVXME4ajMs2SQ//FdTruIrJCXnbaVJK5u3OtO+Al0ortWFWGu2IU3
 RACIZovXQUNdrkfZUeUOCuL+MB7BjBpv/2Oan0zw1An3ln0f6Et+gDESrxg4XHXv7xGwwO0k8fAOxtL/IedjKvKT4ei5kLADE1Ob2RwhaEE+ilGzBHq6uyGO
 y+QclkE4lAHfE2YQkJFkDz1CQiqYFVX9sugqg/6C1+MrKgusnLo70Stp5xFXpQiGPWP1u16KgdhwLk6y2NqfjQPNX1ffJIvi+z6reco8M0Q8/g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/19/20 6:37 PM, Ezequiel Garcia wrote:
> Hello,
> 
> This is v5 of Boris' rkvdec driver.
> 
> This version corrects wrong copyright notices and then adds
> a TODO file for the staging driver. The only reason to keep the
> driver in staging are the staging uAPI controls.

I got some sparse warnings for this series, should be trivial to fix:

sparse: WARNINGS
drivers/media/v4l2-core/v4l2-h264.c:214: warning: Function parameter or member 'reflist' not described in 'v4l2_h264_build_p_ref_list'
drivers/media/v4l2-core/v4l2-h264.c:214: warning: Excess function parameter 'p_reflist' description in 'v4l2_h264_build_p_ref_list'
SPARSE:drivers/staging/media/rkvdec/rkvdec.c drivers/staging/media/rkvdec/rkvdec.c:561:22:  warning: symbol 'rkvdec_queue_ops' was not
declared. Should it be static?

Also, checkpatch.pl --strict complains about empty trailing lines in two
files.

Together with the missing MAINTAINERS it is probably best if you post
a v6.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 
> Boris Brezillon (5):
>   media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
>   media: hantro: h264: Use the generic H264 reflist builder
>   media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
>   media: rkvdec: Add the rkvdec driver
>   arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
> 
> Jonas Karlman (1):
>   media: uapi: h264: Add DPB entry field reference flags
> 
>  .../bindings/media/rockchip,vdec.yaml         |   71 +
>  .../media/uapi/v4l/ext-ctrls-codec.rst        |   16 +
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
>  drivers/media/v4l2-core/Kconfig               |    4 +
>  drivers/media/v4l2-core/Makefile              |    1 +
>  drivers/media/v4l2-core/v4l2-h264.c           |  258 ++++
>  drivers/staging/media/Kconfig                 |    2 +
>  drivers/staging/media/Makefile                |    1 +
>  drivers/staging/media/hantro/Kconfig          |    1 +
>  drivers/staging/media/hantro/hantro_h264.c    |  237 +---
>  drivers/staging/media/rkvdec/Kconfig          |   15 +
>  drivers/staging/media/rkvdec/Makefile         |    3 +
>  drivers/staging/media/rkvdec/TODO             |   11 +
>  drivers/staging/media/rkvdec/rkvdec-h264.c    | 1154 +++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec-regs.h    |  223 ++++
>  drivers/staging/media/rkvdec/rkvdec.c         | 1134 ++++++++++++++++
>  drivers/staging/media/rkvdec/rkvdec.h         |  123 ++
>  include/media/h264-ctrls.h                    |    2 +
>  include/media/v4l2-h264.h                     |   86 ++
>  19 files changed, 3126 insertions(+), 230 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
>  create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
>  create mode 100644 drivers/staging/media/rkvdec/Kconfig
>  create mode 100644 drivers/staging/media/rkvdec/Makefile
>  create mode 100644 drivers/staging/media/rkvdec/TODO
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
>  create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
>  create mode 100644 include/media/v4l2-h264.h
> 

