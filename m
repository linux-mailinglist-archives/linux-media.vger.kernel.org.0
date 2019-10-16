Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE37D90AC
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392943AbfJPMVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:21:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42377 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387581AbfJPMVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:21:33 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KiIuiHSeVPduvKiIxiquC1; Wed, 16 Oct 2019 14:21:31 +0200
Subject: Re: [PATCH] staging: meson: add space to fix check warning
To:     Jules Irenge <jbi.octave@gmail.com>,
        outreachy-kernel@googlegroups.com
Cc:     mjourdan@baylibre.com, gregkh@linuxfoundation.org,
        mchehab@kernel.org, khilman@baylibre.com,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org
References: <20191015223433.18784-1-jbi.octave@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f855f544-e546-eb3d-6346-242eb3435e35@xs4all.nl>
Date:   Wed, 16 Oct 2019 14:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015223433.18784-1-jbi.octave@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHsIZxW8/J7+DHm0y77EjQKA9TDKkipmz/iz2ou5vQkcABiVz0wD2N9hiUJUO5Qx9SjJqf18AoTsRI0bf0iJGgCmY6wDtzHNVBgUWcNqB6OL1/cbZbOP
 DcGNv3faNnW4Gs0IsWlHmeVwyzNThU2fpY4N6Tno5jU8R7clio/iJfTcV7LTojz1sYlUCTtj2MquZ805HHw5+UV2xeistkVER1JR/xWjYQi+KmQ6Xr7vElI5
 7xtYGyBG0DrC9jb4mcLXDjHZ24GlAZXssVO7m+nBFiWzh/9AGGUvgGV/Gs4htWUjbaYqXUXzN+Sz7R8jUywUtD/wBgQjptycUy0ZxzK/7dwbBLFTbsIenyvq
 7f+S9k/uBvl/Znh9Cy9icsI1A/bjqgDGdL4gN3xRlbcv1RKWDTFLxPbd+11BFJ8ddLjjz0T5JQM0rdUmirDgeXTyfunyBwIuze2Cf4VgMom1O4YGu8iW14uu
 ftTg44AK0vfCQvdp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/16/19 12:34 AM, Jules Irenge wrote:
> Fix "alignment should mactch open parenthesis" check.
> Issue detected by checkpatch tool
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> index 48869cc3d973..21e93a13356c 100644
> --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> @@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
>  	}
>  
>  	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> -					(u32[]){ 8, 0 });

This is clearly intended to be aligned with the (u32[]) prefix for readability.

So this is one checkpatch issue where I prefer to keep the original.

Regards,

	Hans

> +				  (u32[]){ 8, 0 });
>  	if (ret)
>  		goto free_workspace;
>  
> 

