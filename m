Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF7074FB6
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 15:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389726AbfGYNjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 09:39:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44170 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387959AbfGYNjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 09:39:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F10C728B644
Message-ID: <4f0d0390057195da326354da2343c98c93d86669.camel@collabora.com>
Subject: Re: [PATCH 0/7] hantro: Add RK3399 VP8 decoding support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Hans Verkuil <hans.verkuil@cisco.com>
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
Date:   Thu, 25 Jul 2019 10:38:47 -0300
In-Reply-To: <b0cd9a4f-4bf9-a48c-6d7c-7147b13fa0b2@xs4all.nl>
References: <20190724171702.9449-1-ezequiel@collabora.com>
         <b0cd9a4f-4bf9-a48c-6d7c-7147b13fa0b2@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-07-25 at 14:59 +0200, Hans Verkuil wrote:
> On 7/24/19 7:16 PM, Ezequiel Garcia wrote:
> > This series adds VP8 decoding support on RK3399 SoC.
> > 
> > I'm including a set of commits from Boris' recent H264 series [1].
> > These commits add some helpers that are also useful for RK3399 VP8,
> > and at the same time cleanup the driver nicely.
> > 
> > Finally, there's a fix by Francois Buergisser from Chromium team.
> > 
> > VP8 and MPEG-2 tested on RK3399 RockPi and RK3288 Rock2 boards.
> 
> I get this when compiling:
> 
> /home/hans/work/build/media-git/drivers/staging/media/hantro/hantro_g1_vp8_dec.c: In function 'hantro_g1_vp8_dec_run':
> /home/hans/work/build/media-git/drivers/staging/media/hantro/hantro_g1_vp8_dec.c:435:26: warning: variable 'vb2_src' set but not used [-Wunused-but-
> set-variable]
>   struct vb2_v4l2_buffer *vb2_src;
>                           ^~~~~~~
>   CC      drivers/staging/media/omap4iss/iss_csiphy.o
> /home/hans/work/build/media-git/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c: In function 'rk3399_vpu_vp8_dec_run':
> /home/hans/work/build/media-git/drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c:515:26: warning: variable 'vb2_src' set but not used [-Wunused-
> but-set-variable]
>   struct vb2_v4l2_buffer *vb2_src;
>                           ^~~~~~~
> 
> Can you take a look?
> 

Oops, I missed these warnings. I'll fix them and post a new version.

Thanks,
Eze

