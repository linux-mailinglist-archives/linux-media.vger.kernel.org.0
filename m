Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3E652429
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 09:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfFYHQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 03:16:02 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47693 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbfFYHQB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 03:16:01 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ffgKhOAc3F85OffgNhckI0; Tue, 25 Jun 2019 09:16:00 +0200
Subject: Re: [PATCH v2 1/1] staging: media: fix style problem
To:     Aliasgar Surti <aliasgar.surti500@gmail.com>,
        linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <1561091693-18427-1-git-send-email-aliasgar.surti500@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6da132f6-9dca-d340-b237-3aed580a8d3a@xs4all.nl>
Date:   Tue, 25 Jun 2019 09:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561091693-18427-1-git-send-email-aliasgar.surti500@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBUVUrEucL4EH4258ivfjz5MGaJRgSBJZU9KXqoSotm9E/VjPeHVYQmf/5jZKHlZinHEtFrVCcZQzB+ogetz5EYgOp9636TAGfHk6gaRN9KigrZ8pEjF
 sSBletQ44ikkegUqX0FcUY00B8Yr0Ozmlg92mRHZMclkHDFrmOtzNN/46ox+bU+R8jDA2beW1gsT8Uq33fXsEOM6rlyvwQgG1bc2rINGvu3BeU6ArURaN68v
 OLFbTa3/q+0bHbbrlJRgJClBmycW6jKJqSSPTDgmavIPCAXGrr8Yj0KEn+Yo9X/Y
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aliasgar,

Please state the driver in question in the Subject. So:

[PATCHv2] staging/media/davinci_vpfe: fix style problems

That way it is clear to reviewers which driver is modified.

Also there is no need for '1/1' if there is only one patch.

Regards,

	Hans

On 6/21/19 6:34 AM, Aliasgar Surti wrote:
> From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> 
> checkpatch reported "WARNING: line over 80 characters".
> This patch fixes the warning for file davinci_vpfe/dm365_isif.c
> 
> Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> ---
> Changes in v2:
> 	- Fixed styling as per suggestion in comments
>  
>  drivers/staging/media/davinci_vpfe/dm365_isif.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> index 46fd818..e9c8de1 100644
> --- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
> +++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> @@ -532,7 +532,8 @@ static int isif_validate_dfc_params(const struct vpfe_isif_dfc *dfc)
>  #define DM365_ISIF_MAX_CLVSV			0x1fff
>  #define DM365_ISIF_MAX_HEIGHT_BLACK_REGION	0x1fff
>  
> -static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
> +static int
> +isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
>  {
>  	int err = -EINVAL;
>  
> @@ -593,7 +594,8 @@ isif_validate_raw_params(const struct vpfe_isif_raw_config *params)
>  	return isif_validate_bclamp_params(&params->bclamp);
>  }
>  
> -static int isif_set_params(struct v4l2_subdev *sd, const struct vpfe_isif_raw_config *params)
> +static int isif_set_params(struct v4l2_subdev *sd,
> +			   const struct vpfe_isif_raw_config *params)
>  {
>  	struct vpfe_isif_device *isif = v4l2_get_subdevdata(sd);
>  	int ret = -EINVAL;
> 

