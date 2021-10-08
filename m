Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E516426D2B
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 17:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbhJHPDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 11:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237929AbhJHPDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 11:03:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C89C061570;
        Fri,  8 Oct 2021 08:01:41 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id A4F701F45ABA
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and
 Cedrus
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211008100423.739462-1-wenst@chromium.org>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <c5393cf3-e2d1-4000-3bd1-00a09bb0ee8f@collabora.com>
Date:   Fri, 8 Oct 2021 17:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chen-Yu Tsai,

W dniu 08.10.2021 o 12:04, Chen-Yu Tsai pisze:
> Hi everyone,
> 
> While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
> behavioral differences compared to Hantro and Cedrus:
> 
> 1. The driver always overrides the sizeimage setting given by userspace
>     for the output format. This results in insufficient buffer space when
>     running the ChromeOS video_decode_accelerator_tests test program,
>     likely due to a small initial resolution followed by dynamic
>     resolution change.
> 
> 2. Doesn't support dynamic resolution change.
> 
> This small series fixes both and aligns the behavior with the other two
> stateless decoder drivers. This was tested on the downstream ChromeOS
> 5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
> have any other RK3399 devices set up to test video stuff, so testing
> would be very much appreciated.
> 
> Also, I'm not sure if user applications are required to check the value
> of sizeimage upon S_FMT return. If the value is different or too small,
> what can the application do besides fail? AFAICT it can't split the
> data of one frame (or slice) between different buffers.
> 
> Andrzej, I believe the second patch would conflict with your VP9 series.
> 

The conflict is rather trivial to solve. Adopting your version does not
change in any way (neither for better nor for worse) the fluster score
I get for vp9 with rkvdec on a rockpi4 using my vp9 series.

Regards,

Andrzej

> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (2):
>    media: rkvdec: Do not override sizeimage for output format
>    media: rkvdec: Support dynamic resolution changes
> 
>   drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
>   drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
>   2 files changed, 23 insertions(+), 22 deletions(-)
> 

