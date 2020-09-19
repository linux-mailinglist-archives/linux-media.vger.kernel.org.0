Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1AE27103D
	for <lists+linux-media@lfdr.de>; Sat, 19 Sep 2020 21:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgISTb1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 15:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 15:31:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459DBC0613CE;
        Sat, 19 Sep 2020 12:31:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y15so8717718wmi.0;
        Sat, 19 Sep 2020 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=UOl7aJgZVOco43pM0FR5gPug/eBppWzmQE1Qt2hPsAY=;
        b=SAR0t0Mj+t6LJOUepzhwcvAdBYiCPJWGjidXih0mxT/g+e3HpjDn+rHLzEtKVjbxW/
         U3eKWcHtoLlmBxL0VfxZEGGwU6kak1+ICOcHK/ET7oWeNI54c6+j2fMN2r0tkSfZFh1j
         TrwhSwDu7L7ecAblHecFDbynutj3x1Rhjh7AzcjoAFvurffDnvFqnkjDpJpWQCnozpp2
         wtJ58uf6U8uH8fyZvud81B3jgbTUU7RX/OHlDfLrxQQCcVU1dERHDuz2Y8twvucivKPL
         9sq77/VxiElGMOKb4uf5Es3JXwLn3ugDaix0Uo4H7Ry8agI+9dfLEVWnqT+28qlFjvUh
         mB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UOl7aJgZVOco43pM0FR5gPug/eBppWzmQE1Qt2hPsAY=;
        b=r5j/7goxfy7hz2P/+bbe9dXBgHOo0jXFU4KILnMXPfiGIS6mxvBc02fE0qWaXGyLkN
         8CUn1EFxYtC8LxKd2t2cc3AXkLWapopMiRev63w3ft97OkX9DpXnHyzUQiu+/P7ls+xg
         aKnip+fj3jq/wZ0/RmiaeW6ywZEFkDJ4egpVnPV6o9sS9rzS9PsWG/ALEA73WK8q8FYu
         3PHQZ4XG0DyaDb/cHjHcUxLRbugbkDH6b+BoejUPAaNNXUiBYpY93bCvvmG7mssWTQis
         rj0GmfmPfYJSM357XNWC/5t9SpXf67SD29utBSPMT/69ZZFcj0HlAqzgAtnymfTcXWfa
         IfEA==
X-Gm-Message-State: AOAM533GHC8kVC+TtuJ7dLjleqtoQdJgF1nnX93xxa7Yd6hvIkgBoxLl
        tJyTVru0bQlKsvHR7IQ904+wNsOkaTPmUw==
X-Google-Smtp-Source: ABdhPJwJ20Z3JMpNdgnVFQm9slja9W33AF/EopSX3S7Pe3V4UVomGGyQAntmfyCVsKyY+zUqaBXruA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr21360900wmy.51.1600543885768;
        Sat, 19 Sep 2020 12:31:25 -0700 (PDT)
Received: from [192.168.43.148] (92.40.169.140.threembb.co.uk. [92.40.169.140])
        by smtp.gmail.com with ESMTPSA id w14sm12516740wrk.95.2020.09.19.12.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 12:31:24 -0700 (PDT)
Subject: Re: [PATCH] staging: media: atomisp: Don't do unnecessary zeroing of
 memory
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200909204807.36501-1-alex.dewar90@gmail.com>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <6e70df97-808a-6d23-c24e-4b7c905cccda@gmail.com>
Date:   Sat, 19 Sep 2020 20:31:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909204807.36501-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-09 21:48, Alex Dewar wrote:
> In a few places in pci/sh_css_params.c, memset is used to zero memory
> immediately before it is freed. As none of these structs appear to
> contain sensitive information, just remove the calls to memset.
Friendly ping?
>
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>   drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 2c67c23b3700..24fc497bd491 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -4378,7 +4378,6 @@ ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
>   	if (me) {
>   		kvfree(me->rgby_data);
>   		kvfree(me->data);
> -		memset(me, 0, sizeof(struct ia_css_3a_statistics));
>   		kvfree(me);
>   	}
>   }
> @@ -4417,7 +4416,6 @@ ia_css_dvs_statistics_free(struct ia_css_dvs_statistics *me)
>   	if (me) {
>   		kvfree(me->hor_proj);
>   		kvfree(me->ver_proj);
> -		memset(me, 0, sizeof(struct ia_css_dvs_statistics));
>   		kvfree(me);
>   	}
>   }
> @@ -4459,7 +4457,6 @@ ia_css_dvs_coefficients_free(struct ia_css_dvs_coefficients *me)
>   	if (me) {
>   		kvfree(me->hor_coefs);
>   		kvfree(me->ver_coefs);
> -		memset(me, 0, sizeof(struct ia_css_dvs_coefficients));
>   		kvfree(me);
>   	}
>   }
> @@ -4551,7 +4548,6 @@ ia_css_dvs2_statistics_free(struct ia_css_dvs2_statistics *me)
>   		kvfree(me->ver_prod.odd_imag);
>   		kvfree(me->ver_prod.even_real);
>   		kvfree(me->ver_prod.even_imag);
> -		memset(me, 0, sizeof(struct ia_css_dvs2_statistics));
>   		kvfree(me);
>   	}
>   }
> @@ -4635,7 +4631,6 @@ ia_css_dvs2_coefficients_free(struct ia_css_dvs2_coefficients *me)
>   		kvfree(me->ver_coefs.odd_imag);
>   		kvfree(me->ver_coefs.even_real);
>   		kvfree(me->ver_coefs.even_imag);
> -		memset(me, 0, sizeof(struct ia_css_dvs2_coefficients));
>   		kvfree(me);
>   	}
>   }
> @@ -4710,7 +4705,6 @@ ia_css_dvs2_6axis_config_free(struct ia_css_dvs_6axis_config *dvs_6axis_config)
>   		kvfree(dvs_6axis_config->ycoords_y);
>   		kvfree(dvs_6axis_config->xcoords_uv);
>   		kvfree(dvs_6axis_config->ycoords_uv);
> -		memset(dvs_6axis_config, 0, sizeof(struct ia_css_dvs_6axis_config));
>   		kvfree(dvs_6axis_config);
>   	}
>   }

