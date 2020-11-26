Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839872C5E1C
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 00:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391908AbgKZXVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 18:21:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46784 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388513AbgKZXVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 18:21:23 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A2EB61F46084
Message-ID: <1496f292eadc62a3ab585a89cf9b997ce4a1d799.camel@collabora.com>
Subject: Re: [PATCH v3] media: cedrus: Add support for VP8 decoding
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, wens@csie.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com,
        Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Date:   Thu, 26 Nov 2020 20:21:11 -0300
In-Reply-To: <20201110223540.4105284-1-jernej.skrabec@siol.net>
References: <20201110223540.4105284-1-jernej.skrabec@siol.net>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej, Emmanuel,

Thanks for the patch.

On Tue, 2020-11-10 at 23:35 +0100, Jernej Skrabec wrote:
> VP8 in Cedrus shares same engine as H264.
> 
> Note that it seems necessary to call bitstream parsing functions,
> to parse frame header, otherwise decoded image is garbage. This is
> contrary to what is driver supposed to do. However, values are not
> really used, so this might be acceptable. It's possible that bitstream
> parsing functions set some internal VPU state, which is later necessary
> for proper decoding. Biggest suspect is "VP8 probs update" trigger.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> [addressed issues from reviewer]
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> ---
> Changes in v3:
> - addressed comments from Ezequiel Garcia - new comments,
>   using new macros from VP8 UAPI, new function for waiting
>   on bit to be set
> Changes in v2:
> - rebased on top of current linux-media master branch
> 
> NOTE: This now depends on following patch:
> https://patchwork.linuxtv.org/project/linux-media/patch/20201108202021.4187-1-linkmauve@linkmauve.fr/
> 

The patch looks fairly good, so let's wait and see
what Hans, Paul and Maxime think about it.

FWIW, my humble Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

It would be good to make sure this doesn't regress
v4l2-compliance, or cause some regression in decoding.

Not really a blocker to merge this, but I'm thinking
that now that we have Fluster for conformance testing,
we could add the VP8 vectors and use them against
Cedrus and Hantro:

https://chromium.googlesource.com/webm/vp8-test-vectors/+/refs/heads/master

Thanks,
Ezequiel

>  drivers/staging/media/sunxi/cedrus/Makefile   |   3 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   8 +
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  24 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   5 +
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   2 +
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  80 ++
>  .../staging/media/sunxi/cedrus/cedrus_video.c |   9 +
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 907 ++++++++++++++++++
>  8 files changed, 1037 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> 

