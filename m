Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E037B26D93D
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgIQKjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:39:42 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40509 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726285AbgIQKjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:39:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IrK7kLrEDPTBMIrK9klcOJ; Thu, 17 Sep 2020 12:39:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600339173; bh=ovPmCy2WU4DV9C/CbTpmAM6WjhC6BguH4dx89notBIg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Qml+oBHA7thqryEPovgtmdqNEaiX+u5+Gpi/kTvOYl5xSe7wD3AWwFJXuH235XZ47
         EIxHoanS6a4FazdiTBmOK+K/KC81qxNjYvCe4TApm9dy3DnaizX35KzKeNU3l9WNiu
         b3im30uwET2yRhzZupRD+MlkJV4s90133RcXPyIaq9FocftfGyZZMo96d+BfPoH3RM
         IHmXogGGXIZJHhuS0d77VC7l7MdYI7b6XmZl3fKx5UGXQSDLsZCoHG3lwQIPS7p4uN
         bkg6WBwq3KHCydqH3RXPrnqEOSo3FS1DXY2DYRK9bAiFyK/P/ppUw6RG3HT+G1rL76
         LCnEwUPyy9iaA==
Subject: Re: [PATCH] media: cedrus: Propagate OUTPUT resolution to CAPTURE
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     kernel@collabora.com, Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200514153903.341287-1-nicolas.dufresne@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b868e559-25e0-7381-67f4-d3a6f7c0e2ed@xs4all.nl>
Date:   Thu, 17 Sep 2020 12:39:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200514153903.341287-1-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNdzMGLz+xOc27mAcRC5nGCJ0Z1gcbHjBQcsVrd+8VTj6OMxdfftRLAFEtE5SuJ3kpxtqG1IPfG0ykbqZcktO14SOE8/cpJJla2CU5gqAjSx8PqeR5Gt
 a2lKzoCMroWlIpvyIQHolKjF7pvwFvYURo3oByAgspezKpO/6DcTdaRNRy1IPOaJVgJWdaX20c/Ofq8NcEWF3zkJ1fuvR/WzIvh8YzvjhkrwcF7UjeBNYMfF
 6chbFl7Q/iYU4JgtV0q6flUpJY3aDRNfZ6mbryJkOg8fvi6LosdpXFylZ1lyjhbKDl5xU6OlyHdFNUGcMrH7Pka0pURwHjxA2fAvSNlNvvnWeSP59R4SuQ44
 S3CanQUNAPgUB1Wb589JLwfLCOkG2xg3TadC4yJdCnIfwipQ9j+0kkwFV/XixT/7v/938i97HKY0tWCbWA+QviU0dkisUljlErZjk5YxZkd90SD1+geNi7PZ
 eKLnLaveAX8VCROayJb5FiG/lj4/ngAKQNMR2nWTc6yu0dZCJGSw/tn7J8c6y4uNoKYNvfwbCGDluWxf2GCJjuWgHXcLpnZRMUGITdRbrmAcvJmLw42J0aU7
 o52rCsBFsNgXLY7F2yfW04DYTIUGhk8FLS89yjDWcwGi/VlU7/xvRjzNCzdPG3leOL4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/05/2020 17:39, Nicolas Dufresne wrote:
> As per spec, the CAPTURE resolution should be automatically set based on
> the OTUPUT resolution. This patch properly propagate width/height to the
> capture when the OUTPUT format is set and override the user provided
> width/height with configured OUTPUT resolution when the CAPTURE fmt is
> updated.
> 
> This also prevents userspace from selecting a CAPTURE resolution that is
> too small, avoiding unwanted page faults.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 16d82309e7b6..a6d6b15adc2e 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -247,6 +247,8 @@ static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
>  		return -EINVAL;
>  
>  	pix_fmt->pixelformat = fmt->pixelformat;
> +	pix_fmt->width = ctx->src_fmt.width;
> +	pix_fmt->height = ctx->src_fmt.height;
>  	cedrus_prepare_format(pix_fmt);
>  
>  	return 0;
> @@ -319,11 +321,14 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
>  		break;
>  	}
>  
> -	/* Propagate colorspace information to capture. */
> +	/* Propagate format information to capture. */
>  	ctx->dst_fmt.colorspace = f->fmt.pix.colorspace;
>  	ctx->dst_fmt.xfer_func = f->fmt.pix.xfer_func;
>  	ctx->dst_fmt.ycbcr_enc = f->fmt.pix.ycbcr_enc;
>  	ctx->dst_fmt.quantization = f->fmt.pix.quantization;
> +	ctx->dst_fmt.width = ctx->src_fmt.width;
> +	ctx->dst_fmt.height = ctx->src_fmt.height;

You can only do this if the capture queue isn't busy.

See also hantro_reset_raw_fmt() where it does that check.

So this needs a v2.

Regards,

	Hans

> +	cedrus_prepare_format(&ctx->dst_fmt);
>  
>  	return 0;
>  }
> 

