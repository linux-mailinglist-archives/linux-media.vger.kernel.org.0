Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF9D4C687
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 07:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbfFTFJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 01:09:36 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46212 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfFTFJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 01:09:35 -0400
Received: by mail-ed1-f68.google.com with SMTP id d4so2649820edr.13;
        Wed, 19 Jun 2019 22:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EmCjxCDJgacK9BwIlMDVmOoF08g+LeWjNzN5O8UBWSI=;
        b=jcD+HPfN9Nd4j2oLd5GKAkcgVWvZQ5WU/MfGB8vqTjV+tTZS1fDQ+73MFbB0HYmP/G
         xLb/TZsKoR5vjHIXZis1KB/1Jo+ZKPT9IuDFnwVWCy6+BoORmfE+QvMXsjJ02u8IPoWX
         WV5MWEukPbIkY5mjt0gz8L7Kbf2zpYykQhsjX4tNSKxdaTDGt5883lJ++V854fRm16uZ
         X2ywL7/r3lkcX4qkiyDe2uAeZL00mHI5ft2Igs/Je4TYUN0cyYROi5BCNwAKKQpePBMj
         mvSNOtPpOLNWg5ME2mnhffQs6FlVQ83QQSeFb2XFgBzi31MMmbgdy13iCLxg5HuSVN/7
         Uv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EmCjxCDJgacK9BwIlMDVmOoF08g+LeWjNzN5O8UBWSI=;
        b=t6Ri4DqnitoB01Rs0LGEP8EpqehPcba/VY9AdOxyHF9p2vRvd57GgpyK9ect/K83PM
         KQMJAgcgYJujboaDoetHj1gJDN/fM6Pdp+nllFo6Hg0SuANuU9Hz2eP4t3piAx4mi9SG
         0GxYzxLHSbTj96i5VQXSDeYQ48BjlO3nNJnjJZUEQHG8XF9dAzw9NyD97mE/9bbUzkxQ
         Zu5HV9sREPeCL2MdiL++6n/RfifMios8GcAhIvcRZJSs3O6zyEtZvMbr3/wPuFFMonCb
         cFfJhnN3OhPO6njqdUm4pn9dGe71Mn7AhJUMYwV9N6V6lLBWNUo2qvz+8BxISsgCkNgk
         DV5w==
X-Gm-Message-State: APjAAAWviZvecWaS0pV0RrLgA/6qd/6R0JKIbKCAakmt7oKLBQA+THWt
        tSa69qvt/DH41fDbILTo3og=
X-Google-Smtp-Source: APXvYqzCHCOOLUu5Z9zXJJp6SnEKRgaMumbuKQKl/lZEjOigWOK659d5m8y2Y2o33P/rp5jW4iO60A==
X-Received: by 2002:a17:906:2a94:: with SMTP id l20mr24998136eje.131.1561007373738;
        Wed, 19 Jun 2019 22:09:33 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id r12sm6337899eda.39.2019.06.19.22.09.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 22:09:33 -0700 (PDT)
Date:   Wed, 19 Jun 2019 22:09:31 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] staging: media: fix style problem
Message-ID: <20190620050931.GA29061@archlinux-epyc>
References: <1561006968-29717-1-git-send-email-aliasgar.surti500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561006968-29717-1-git-send-email-aliasgar.surti500@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 10:32:48AM +0530, Aliasgar Surti wrote:
> From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> 
> checkpatch reported "WARNING: line over 80 characters".
> This patch fixes the warning for file davinci_vpfe/dm365_isif.c
> 
> Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> ---
>  drivers/staging/media/davinci_vpfe/dm365_isif.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/davinci_vpfe/dm365_isif.c b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> index 46fd818..12bdf91 100644
> --- a/drivers/staging/media/davinci_vpfe/dm365_isif.c
> +++ b/drivers/staging/media/davinci_vpfe/dm365_isif.c
> @@ -532,7 +532,8 @@ static int isif_validate_dfc_params(const struct vpfe_isif_dfc *dfc)
>  #define DM365_ISIF_MAX_CLVSV			0x1fff
>  #define DM365_ISIF_MAX_HEIGHT_BLACK_REGION	0x1fff
>  
> -static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)
> +static int isif_validate_bclamp_params(const struct vpfe_isif_black_clamp
> +				       *bclamp)

I think

static int
isif_validate_bclamp_params(const struct vpfe_isif_black_clamp *bclamp)

is a better choice for this change.

Cheers,
Nathan

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
> -- 
> 2.7.4
> 
