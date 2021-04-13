Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA2735E196
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343781AbhDMOdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:33:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51341 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241146AbhDMOdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:33:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WK5ulFW4fMxedWK5xlizVW; Tue, 13 Apr 2021 16:32:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618324370; bh=L2tfaCowAZSZheVAWPzxO/mjuZuIhVhlYjiBz7vPIWk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DRawg/urPfBhRaLnCUG/Vl0CsJF9ZNCnxGHRVoqI2QDcNa/xT0STsG88DGASQbDRS
         t0KD6b5Bv6RKJv4Ky72Ate6DZ0sRszfUV9ahYtk0zcERgSdAbvncfTWPzk9TyLOIoN
         HS87n+bd8yNSCJBuxdQ5WejcQhPlZEe3JO07Xgl+z/Xby0hyGR2x1xnHbYZlX8Bp48
         mvxlHXncG6LnWPvtVRDengZYgKPfaDWO+WsCk67OEZ80UImIBpoQykdT2naZmCBWWy
         OraokOOUmtCqCqj2xkBDE1aJEcNQmfyq2XW5oKRsYBcfzV46ZbLyepZEnS4y48lanV
         EQ9HOFyTCNz2Q==
Subject: Re: [Outreachy kernel][PATCH 1/2] staging: media: omap4iss: Align
 line break to the open parenthesis in file iss.c
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
 <aed4449f7f054eee329a808527c2a08d79076c78.1617994571.git.alinesantanacordeiro@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6823f86b-843f-1abf-e8b7-7be1044b7150@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <aed4449f7f054eee329a808527c2a08d79076c78.1617994571.git.alinesantanacordeiro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHW04A0H53qb+VDCHk3R9cvKV4akvzNem8xF7WFTsYM+qCG6LHLKUpFF6GBpfe22NqLagITMeO/x7/cAuOQKuxSA6nHD3pU6sLIz1poDfov0NIY+PBO/
 E1EI2bPsih0+PFG83QR74fh6cxUeqc8YjM0k2y+/mA+a2T5j2qHBHGA89MipI8Y8r2waQPQ37xyJhql9TE6p2yS+yLcfYWb3GEAMYytaH7TT9AXJbXzyJTJw
 J/bb39lTkZbrmseoMVL/M2HC5sdIofTdOaCxTFPnIbKW+/G51vfPOz41LGxuFuwvRlxLkENw4tXSOu88h1d+1BrnxhKcDENsjbm4sqTm1nwywYDbU11BBGZg
 dc3yC7ozs5raOna3OLPMCCSwUDzhU70x0Q+rElapJDOlwePFttKG4krLKoIS5908ScYVg6LVE4MeNcS9Cgwx02vfjleNk8SoI+XXzJQ8ZbNw34zJNVLXzyXW
 oRmYt500NzjhJVHEa9pt4iHBpd/mHcBJLlAFxw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 21:01, Aline Santana Cordeiro wrote:
> Aligns line break with the remaining function arguments
> to the open parenthesis. Issue found by checkpatch.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>

Obsolete, a similar patch from Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
has already been applied in the media subsystem tree.

Regards,

	Hans

> ---
>  drivers/staging/media/omap4iss/iss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index dae9073..c89f268a 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -960,7 +960,7 @@ iss_register_subdev_group(struct iss_device *iss,
>  		}
>  
>  		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
> -				board_info->board_info, NULL);
> +						   board_info->board_info, NULL);
>  		if (!subdev) {
>  			dev_err(iss->dev, "Unable to register subdev %s\n",
>  				board_info->board_info->type);
> 

