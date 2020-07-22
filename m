Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763D622905A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 08:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgGVGJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 02:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVGJx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 02:09:53 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AE7C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 23:09:52 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d4so639835pgk.4
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 23:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RhXegAW3T4i328rum+So8pAJ7KI23JDDS/7S/jTO9RQ=;
        b=ezdkKVNUlBfGpGWVP/Rp0p4P+ckcybTK80r9+/y5WkrvArlDcz6GkMmR0rvitjOadZ
         J7kkdHvZ2ysm4epFUMN/87tO1yCa+DKIoOlmRtm96laLbm4dESjUm6M2YUswTNr5UhLB
         Meq5c7P8mYI2lMCUvqPEyFbgNUYvz5v2GB0NbakO7SDpJ3Fi1RQFpFu1AtquTruSDwiX
         xYgjoY77sqjpSsLOXsifRENYt/hdOgSF7i9kW2Mc5KHhdS4vcPzjMURsbK29XjciogAy
         Soy313DrIWWorjd06x8LLm2m71iolBA4RhWBYhj3GzlpR+Uu8jvEBOvDwP4g+3gJXF/m
         gZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RhXegAW3T4i328rum+So8pAJ7KI23JDDS/7S/jTO9RQ=;
        b=LlYvuDSUKoMV5psTd38hSZoKlXKY6nBoSqAvgjjWynsKZpK9xYdwNn8SpsmnR6qQoC
         HjWzfAY6Dlk/Vtfi52WV83kTjx5CgVfFCzem6arBs40BvuKPhsFfyvDpRDenFwBJYW2e
         kKBli4FAwozMWVZK1dQJ6jugmemp8sIh2FWgzDCJ2sAo7YNv+pvokvsLQhseW7GI9OMz
         hYLfdtLUjuy/klMLo9gIIfb+5a6Jvuu4IxIkq8f38EG49lXbKtQDjQFMvaWNORE+YpaB
         0xXQMdpnHzlnA3wZhVKxepWaVDphbqDAvMgLY6z6+zEVL1B1k525NGr7GxDn4oBWaJIp
         TSqQ==
X-Gm-Message-State: AOAM533dyyYhXjjueueDfeZ8rCw0bd8IqzRVnag+PXVrzxQo/nrZzB07
        K+771huhD9N3sa7ez/P9ZE0=
X-Google-Smtp-Source: ABdhPJyl1gJqXsbXyyJsZUcoVpuD3crqnUe3sHWH6Gendi8sklMsuDkl9kJwQorLa3jAy1/oTnyxHg==
X-Received: by 2002:a62:18cd:: with SMTP id 196mr28001763pfy.253.1595398192397;
        Tue, 21 Jul 2020 23:09:52 -0700 (PDT)
Received: from gmail.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id a30sm22963241pfr.87.2020.07.21.23.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 23:09:51 -0700 (PDT)
Date:   Wed, 22 Jul 2020 11:38:33 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] meye: fix missing pm_mchip_mode field
Message-ID: <20200722060833.GA1365@gmail.com>
References: <6c163ae3-5aff-e44c-95b5-4eedc73ccc93@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c163ae3-5aff-e44c-95b5-4eedc73ccc93@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 21, 2020 at 11:32:29PM +0200, Hans Verkuil wrote:
> After patch 9c4a8489ab7c ("media: meye: use generic power management")
> the pm_mchip_mode field should now always be present, even if CONFIG_PM
> is not set.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9c4a8489ab7c ("media: meye: use generic power management")
> ---
> diff --git a/drivers/media/pci/meye/meye.h b/drivers/media/pci/meye/meye.h
> index c957d9b55f89..5fa6552cf93d 100644
> --- a/drivers/media/pci/meye/meye.h
> +++ b/drivers/media/pci/meye/meye.h
> @@ -305,9 +305,7 @@ struct meye {
>  	u16 colour;
>  	struct meye_params params;	/* additional parameters */
>  	unsigned long in_use;		/* set to 1 if the device is in use */
> -#ifdef CONFIG_PM
>  	u8 pm_mchip_mode;		/* old mchip mode */
> -#endif
>  };
> 
>  #endif
Thank you so much for the fix.

--Vaibhav Gupta
