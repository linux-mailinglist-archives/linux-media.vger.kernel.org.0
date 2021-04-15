Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B44360B22
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhDON5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:57:03 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54383 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232954AbhDON5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:57:02 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X2Tzl3kBQsMyaX2U2lUORG; Thu, 15 Apr 2021 15:56:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618494998; bh=zENGeJKD7wt8oNufBS9C6pkegHFrpcYxaCUgVyvpd20=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=n9XYEAPVxtbGtM1hCpM9qoapmttOLwMVWXDoFAFrgfaio0qYRd+9SbQBM72ZIZ1WS
         yTRCItNoA5oobSMRz+fPcohpy/nvJQaRAcgfi0LKnOjRhNhG+3waolEqv6s8zcXWVV
         KCwVt6kEPd/pmYFsGXNDKUN1ukDIuylQYIesgxJcifJkv/+rkqipOHb0kmLaBI+ryx
         xy4C0pRr9v+vy+O0t7+vJa9HxSceh72pGSa/Rsf3WyObQBxyIUWKig52STRaZVnFv0
         5lw96272Dotdc7aew0RBvAHIqyQNC/yI2cNPj6pIzPD5f5JAeQvqENSil8pu0Lj4vi
         xe9iaXe0oXaSA==
Subject: Re: [PATCH] staging: media: atomisp: Use goto instead of return in
 ia_css_init()
To:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20210415005106.530914-1-vrzh@vrzh.net>
 <20210415005106.530914-8-vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7943beba-cbb5-4c85-4381-f81fb49d189f@xs4all.nl>
Date:   Thu, 15 Apr 2021 15:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415005106.530914-8-vrzh@vrzh.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPI7+owHEzu/obWgUW0ucR8RnVYKfpyU7VEyv8GHV3jinIsHQc171v2OgQa7MjPBq34T5pCPQYiPXZEVO0a5TTQx1RM3+eZGMssn9WV/QTm17kFZJNlj
 ZkBPqTtRJYlTd8HS6r0dEOnLWCE94hPfljciQ9fOoVKP9TRC/MQj9imtcJAa9fxbxghQy9gv+yX3DCXAesAYmvRk9UBh355xSeUc8YI1q2NvlA5N/YOK+hhv
 jLRHHXdYDDEXAT0vGfaLKdXkb4LLi2C8KhXqnw91S0TKIdr/wTU+nl4QpSMXuDbd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martiros,

On 15/04/2021 02:51, Martiros Shakhzadyan wrote:
> Replace multiple return statements with goto in ia_css_init(), matching
> other functions.
> 
> Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 45 +++++++++-------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index bb752d47457c..4e3ef68014ec 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -1695,10 +1695,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  	my_css.flush     = flush_func;
>  
>  	err = ia_css_rmgr_init();
> -	if (err) {
> -		IA_CSS_LEAVE_ERR(err);
> -		return err;
> -	}
> +	if (err)
> +		goto ERR;

Sorry, this doesn't work.

First a style issue: goto label are typically lowercase, not uppercase.
I do see that elsewhere in this source they use ERR as well, but that should
really all be changed to lowercase.

But more importantly, if you look up the definition of IA_CSS_LEAVE_ERR
you see:

#define IA_CSS_LEAVE_ERR(__err) \
        ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, \
                "%s() %d: leave: return_err=%d\n", __func__, __LINE__, __err)

I.e., it is used to debug the code and print where the error is returned
(__func__ and __LINE__). By moving this to the end, the __LINE__ is always
the same for all 'error' cases, thus defeating the purpose of this debug line.

So I won't take this patch.

Regards,

	Hans

>  
>  	IA_CSS_LOG("init: %d", my_css_save_initialized);
>  
> @@ -1730,27 +1728,23 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  	gpio_reg_store(GPIO0_ID, _gpio_block_reg_do_0, 0);
>  
>  	err = ia_css_refcount_init(REFCOUNT_SIZE);
> -	if (err) {
> -		IA_CSS_LEAVE_ERR(err);
> -		return err;
> -	}
> +	if (err)
> +		goto ERR;
> +
>  	err = sh_css_params_init();
> -	if (err) {
> -		IA_CSS_LEAVE_ERR(err);
> -		return err;
> -	}
> +	if (err)
> +		goto ERR;
> +
>  	if (fw) {
>  		ia_css_unload_firmware(); /* in case we already had firmware loaded */
>  		err = sh_css_load_firmware(dev, fw->data, fw->bytes);
> -		if (err) {
> -			IA_CSS_LEAVE_ERR(err);
> -			return err;
> -		}
> +		if (err)
> +			goto ERR;
> +
>  		err = ia_css_binary_init_infos();
> -		if (err) {
> -			IA_CSS_LEAVE_ERR(err);
> -			return err;
> -		}
> +		if (err)
> +			goto ERR;
> +
>  		fw_explicitly_loaded = false;
>  #ifndef ISP2401
>  		my_css_save.loaded_fw = (struct ia_css_fw *)fw;
> @@ -1760,10 +1754,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  		return -EINVAL;
>  
>  	err = ia_css_spctrl_load_fw(SP0_ID, &spctrl_cfg);
> -	if (err) {
> -		IA_CSS_LEAVE_ERR(err);
> -		return err;
> -	}
> +	if (err)
> +		goto ERR;
>  
>  #if WITH_PC_MONITORING
>  	if (!thread_alive) {
> @@ -1774,8 +1766,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  	}
>  #endif
>  	if (!sh_css_hrt_system_is_idle()) {
> -		IA_CSS_LEAVE_ERR(-EBUSY);
> -		return -EBUSY;
> +		err = -EBUSY;
> +		goto ERR;
>  	}
>  	/* can be called here, queuing works, but:
>  	   - when sp is started later, it will wipe queued items
> @@ -1801,6 +1793,7 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
>  
>  	sh_css_params_map_and_store_default_gdc_lut();
>  
> +ERR:
>  	IA_CSS_LEAVE_ERR(err);
>  	return err;
>  }
> 

