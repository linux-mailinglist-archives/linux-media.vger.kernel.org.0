Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236F814A977
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 19:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgA0SLm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 13:11:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34642 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0SLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 13:11:42 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7305129345A
Message-ID: <1d83a74c24269c7bcf6d6d8a789c88dbf7370dbb.camel@collabora.com>
Subject: Re: [PATCH 0/4] Hantro VPU JPEG encoder fixes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 Jan 2020 15:11:33 -0300
In-Reply-To: <20200127143009.15677-1-andrzej.p@collabora.com>
References: <20200127143009.15677-1-andrzej.p@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej,

Thanks a lot for the fixes!

On Mon, 2020-01-27 at 15:30 +0100, Andrzej Pietrasiewicz wrote:
> This series addresses quality issues in encoded JPEG images.
> 
> The first patch actually restores the intention of the original submission
> of this driver: due to a typo the helper variables were unused and then
> have been removed in some cleanup done by Mauro.
> 
> The second patch aligns the driver's luma quantization table with
> the one in the ITU-T.81 standard.
> 
> The third patch changes the order in which quantization tables are
> written to the resulting file and to the hardware. The file expects
> a zig-zag order, while the hardware wants some special order, neither
> linear nor zig-zag. In other words, hardware-wise it rearranges which
> parts of quantization tables go into which 4-byte registers - in a hardware
> specific order rather than linear or zig-zag. It also affects rk3288 and
> hasn't been tested with it.
> 
> The fourth patch then rearranges the sequence of register writes.
> The whole luma quantization table must be written first, and then the
> chroma quantization is written. In other words, while patch 3/4
> changes what goes into which register, this patch changes when each
> register is written to. It also affects rk3288 and hasn't been
> tested with it.
> 

I've just tested RK3288, and this series is indeed fixing
these issues. So for all patches:

Tested-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> Andrzej Pietrasiewicz (4):
>   media: hantro: Read be32 words starting at every fourth byte
>   media: hantro: Use standard luma quantization table
>   media: hantro: Write the quantization tables in proper order
>   media: hantro: Write quantization table registers in increasing
>     addresses order
> 
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c | 19 ++++-
>  drivers/staging/media/hantro/hantro_jpeg.c    | 76 ++++++++++++++-----
>  drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
>  .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     | 24 ++++--
>  4 files changed, 89 insertions(+), 32 deletions(-)
> 
> -- 
> 2.17.1
> 
> 


