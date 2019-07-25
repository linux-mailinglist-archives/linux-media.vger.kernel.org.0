Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE39274EAD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 14:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbfGYM7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 08:59:34 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49199 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728897AbfGYM7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 08:59:34 -0400
Received: from [IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27] ([IPv6:2001:420:44c1:2579:64cb:e917:d1ce:4f27])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qdLBhEcaaLqASqdLEhTpVV; Thu, 25 Jul 2019 14:59:31 +0200
Subject: Re: [PATCH 0/7] hantro: Add RK3399 VP8 decoding support
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190724171702.9449-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b0cd9a4f-4bf9-a48c-6d7c-7147b13fa0b2@xs4all.nl>
Date:   Thu, 25 Jul 2019 14:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190724171702.9449-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH91+GSCR9/BQ6o5MVMi8O1vy+fYBT8pfW7voO0zSMsUL/0FoUIfCsRdCer6unCd3zmVDWduneqT8untxNKbfwUDD6zeR30I/mWIt+H5JH5JV6aFt3Ns
 mebj0wkIAzROiH99iss3dQxTRTr6M8q8jDR5mK5PhjPdMfgmsLT/weZJ/M64eB0YEPJozJdlg0rPFiA0UiYy0/KvPaJaTvZBnzhunjpHuCim0YhoHm7EKQWb
 4lEyOEjzOZzRC6ADMMp1ncXoQALIFxtlIOg1ueb9RjvcuFZSF9SvFxMwdjO4jiL2qP7dva5mKzRNYtq8tcuORYZ5dGcoGRDol6NRK5BYFB1hCSy0QOuZ6E/u
 et6/0+bQuPcpTZeWzvPZ63UBC8um/HLQEIIM2RxvpVFO/RqORAMUjmuVKX6VOmlV0Brb3gEQV0+tr7/5NCp149iYNlLXi0P7I5zyj4UuCMTZGx5rVpCSkD3i
 4Y/AoeWBbZ7T/5W4slLL0sLVLRxl+XfQFDNrQ3B6ay/2xODlw/+VPb6EsPPPgHz9IePfdSQyMTpsgRcvkTy0A3HiuMuvQ8o4oCPuDx+S7pk3mRRLvZmEhe16
 ZQFiIrzs2PhW5IC17EiAG1yhpLXU0eIHcg5dFhpvPSQr0aWwuUtQjj4zL7eSlXKvRmLHU7twDPiGPUQsF5l6mR3bGu2SZkR8bfsnt50RxiCCFUXwktXHvTdG
 T3IGCaNCHD0ynrqgpuETywVduNEEDsXUB4BIIb72u/zM65uPDZ3NKFzvPTcFPoRrdxsQ+Ur4gvNQY7nBRZA3cxtKKjSigmRk
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/24/19 7:16 PM, Ezequiel Garcia wrote:
> This series adds VP8 decoding support on RK3399 SoC.
> 
> I'm including a set of commits from Boris' recent H264 series [1].
> These commits add some helpers that are also useful for RK3399 VP8,
> and at the same time cleanup the driver nicely.
> 
> Finally, there's a fix by Francois Buergisser from Chromium team.
> 
> VP8 and MPEG-2 tested on RK3399 RockPi and RK3288 Rock2 boards.

I get this when compiling:

/home/hans/work/build/media-git/drivers/staging/media/hantro/hantro_g1_vp8_dec.c: In function 'hantro_g1_vp8_dec_run':
/home/hans/work/build/media-git/drivers/staging/media/hantro/hantro_g1_vp8_dec.c:435:26: warning: variable 'vb2_src' set but not used [-Wunused-but-set-variable]
  struct vb2_v4l2_buffer *vb2_src;
                          ^~~~~~~
  CC      drivers/staging/media/omap4iss/iss_csiphy.o
/home/hans/work/build/media-git/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c: In function 'rk3399_vpu_vp8_dec_run':
/home/hans/work/build/media-git/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c:515:26: warning: variable 'vb2_src' set but not used [-Wunused-but-set-variable]
  struct vb2_v4l2_buffer *vb2_src;
                          ^~~~~~~

Can you take a look?

Thanks,

	Hans

> 
> [1] https://patchwork.kernel.org/cover/11003971/
> 
> Boris Brezillon (4):
>   media: hantro: Simplify the controls creation logic
>   media: hantro: Constify the control array
>   media: hantro: Add hantro_get_{src,dst}_buf() helpers
>   media: hantro: Add helpers to prepare/finish a run
> 
> Ezequiel Garcia (1):
>   media: hantro: Move VP8 common code
> 
> Francois Buergisser (1):
>   media: hantro: Set DMA max segment size
> 
> Jeffy Chen (1):
>   media: hantro: Support RK3399 VP8 decoding
> 
>  drivers/staging/media/hantro/Makefile         |   1 +
>  drivers/staging/media/hantro/hantro.h         |  15 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  53 +-
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |  14 +-
>  .../staging/media/hantro/hantro_g1_vp8_dec.c  |  34 +-
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c |  11 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   7 +
>  drivers/staging/media/hantro/hantro_vp8.c     |  15 +
>  drivers/staging/media/hantro/rk3399_vpu_hw.c  |  22 +-
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     |  12 +-
>  .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  14 +-
>  .../media/hantro/rk3399_vpu_hw_vp8_dec.c      | 597 ++++++++++++++++++
>  12 files changed, 711 insertions(+), 84 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c
> 

