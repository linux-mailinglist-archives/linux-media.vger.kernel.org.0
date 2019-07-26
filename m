Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42EF8770F6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 20:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbfGZSHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 14:07:20 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38375 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfGZSHU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 14:07:20 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4F52F8023F; Fri, 26 Jul 2019 20:07:06 +0200 (CEST)
Date:   Fri, 26 Jul 2019 20:07:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 097/158] media: coda: fix mpeg2 sequence
 number handling
Message-ID: <20190726180716.GA3909@xo-6d-61-c0.localdomain>
References: <20190715141809.8445-1-sashal@kernel.org>
 <20190715141809.8445-97-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190715141809.8445-97-sashal@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> [ Upstream commit 56d159a4ec6d8da7313aac6fcbb95d8fffe689ba ]
> 
> Sequence number handling assumed that the BIT processor frame number
> starts counting at 1, but this is not true for the MPEG-2 decoder,
> which starts at 0. Fix the sequence counter offset detection to handle
> this.

> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -1728,6 +1728,7 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
>  		v4l2_err(&dev->v4l2_dev, "CODA_COMMAND_SEQ_INIT timeout\n");
>  		return ret;
>  	}
> +	ctx->sequence_offset = ~0U;
>  	ctx->initialized = 1;
>  
>  	/* Update kfifo out pointer from coda bitstream read pointer */
> @@ -2147,7 +2148,9 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>  		v4l2_err(&dev->v4l2_dev,
>  			 "decoded frame index out of range: %d\n", decoded_idx);
>  	} else {
> -		val = coda_read(dev, CODA_RET_DEC_PIC_FRAME_NUM) - 1;
> +		val = coda_read(dev, CODA_RET_DEC_PIC_FRAME_NUM);
> +		if (ctx->sequence_offset == -1)
> +			ctx->sequence_offset = val;

For consistency, would it be better to use == ~0U here, too? Variable is unsigned...

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
