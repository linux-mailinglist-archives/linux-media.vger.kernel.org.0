Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FB21F17DC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 13:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgFHLbw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 07:31:52 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45725 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729310AbgFHLbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 07:31:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iG0HjQdY4CKzeiG0Kjlusf; Mon, 08 Jun 2020 13:31:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591615909; bh=Anz/P42LyFrZUpWS2NR5kigUEkgwjzKuHAFeL8LWRr0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SWhCfLDbzJ3YUsvxR7HG4IdRwUOE0jA8c/qlSmg4V6m4QNyPsjiyfiP4ldFOHpKK3
         I7T0pROhvZ54cTYa3kwfpQIuZSam170Kz8VN3yJeC5nX0cYcoXTtGo95HYxLFgDKvY
         KlFNEq44OJCmyARpHki7XPeej9zm3kT39WfPgobUpUK3/Q5HIDppfyCDQ1QACWZb/a
         VB9juB4YNqcPiWEKYuy7P7Bvgs+BnjxP/KBJLSzW2olp3Ga2kCfAWEzx9q759N+6UF
         rjASMJfP2UoFmZR5iCLPfSz1+xU7pYVLRCYfJrktm+uF7DMQQu0gMNcoeyTApu3tFa
         /1fD7z/HowMvg==
Subject: Re: [RFC v4 2/8] media: staging: rkisp1: rsz: set default format if
 the given format is not RKISP1_DIR_SRC
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-3-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ae1d2389-a054-a6ae-e4b6-a447bb64c071@xs4all.nl>
Date:   Mon, 8 Jun 2020 13:31:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605172625.19777-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHyBh+BQb4GKKQgR/jqOp83cWQgqcGQD5PeziMeomxJ2HIohRdAlHosoDX41LmgHncJHzdwgRJ6Sx+1c5TipTzg2sS0xNCRxyOasYd47qrBhbQrg+3VJ
 0gCYq3EcxPJXnFWvdGLJhwG/Vp4Dvj0dNhPe2l5Z1mrTyprA4IR7rbtnJtiQ99u+Trx3afvCUjL75anPCpYRmmt0QKPgUut663NFNc8DjzdH2NLX0hzaGFSX
 LhsAheR48Qkw9eZuYfNiRd6TEVJhBcEigw6pf0T4rVJgEkO3Z/oZMOj7KGprOhgiKVE2jDcgvKQp8nguJv9CZxIy116zfR+uf3AAKbLA15BKshjLWw/hrki7
 em1l17g4L9LgCl2lifVMjksrI1IJes4nAdHzm3ziho+0qfM+EpoSnGX9ki3xzhdSKKRU95zo6GFxDYYV4gVkSkbelBe5vZ7vFqhvIhNOFISgBH/eTFAOqIX4
 9uZefcmkCHk/vtqnsadHiQbd/m74YD7ont5DdKvmquyHFBuMg5jzeMNCT2wBWFft06pyNyUKEQp8crAUxQdopEXH+IQJNVnc2mPlvZdF6FhVlQBIj/NwsdZC
 N3hJzQYOVsQqlKArue6i5xqHi2kW8xXTQyup8x7BtLI9yA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/06/2020 19:26, Dafna Hirschfeld wrote:
> When setting the sink format of the 'rkisp1_resizer'
> the format should be supported by 'rkisp1_isp' on
> the video source pad. This patch checks this condition
> and set the format to default if the condition is false.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  | 4 ++++
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 4 ----
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 0c4fe503adc9..39d8e46d8d8a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -22,6 +22,10 @@
>  #include "rkisp1-regs.h"
>  #include "uapi/rkisp1-config.h"
>  
> +#define RKISP1_DIR_SRC BIT(0)
> +#define RKISP1_DIR_SINK BIT(1)
> +#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
> +
>  #define RKISP1_ISP_MAX_WIDTH		4032
>  #define RKISP1_ISP_MAX_HEIGHT		3024
>  #define RKISP1_ISP_MIN_WIDTH		32
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index dc2b59a0160a..e66e87d6ea8b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -23,10 +23,6 @@
>  
>  #define RKISP1_ISP_DEV_NAME	RKISP1_DRIVER_NAME "_isp"
>  
> -#define RKISP1_DIR_SRC BIT(0)
> -#define RKISP1_DIR_SINK BIT(1)
> -#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)

Helen had a comment about this in the original patch (https://patchwork.linuxtv.org/patch/64292/).

Can you process that comment for the v5 of this series?

Regards,

	Hans

> -
>  /*
>   * NOTE: MIPI controller and input MUX are also configured in this file.
>   * This is because ISP Subdev describes not only ISP submodule (input size,
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d64c064bdb1d..fa28f4bd65c0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  					    which);
>  	sink_fmt->code = format->code;
>  	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
> -	if (!mbus_info) {
> +	if (!mbus_info || !(mbus_info->direction & RKISP1_DIR_SRC)) {
>  		sink_fmt->code = RKISP1_DEF_FMT;
>  		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>  	}
> 

