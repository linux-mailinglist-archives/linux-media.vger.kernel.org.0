Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DF91E8D51
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 05:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgE3DAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 23:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3DAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 23:00:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F17C03E969;
        Fri, 29 May 2020 20:00:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n15so734786pfd.0;
        Fri, 29 May 2020 20:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YMRN0wSsDj4YeK0mPPFUdkTPLMlDL25YvZpi9MUfAXY=;
        b=PwG1wnMplph6a7K2rReSmViHb4/8f5VwWV08D3jshZYYBWN6v0jdB5yN5G0uRUmAWT
         FHrCHBCAFzCeLNedigwdrUhyL0bMCJ0dyPHNlJkmECXytoZIJiq/DHCSd14+4mtncVdU
         FDe3WhMx/vgbmWlvVF8ZWoYRYBuT4oziIqC2+y/4pNjZdiw7xVZrEQfJozuDMea/m02y
         XqwCVI+uukcTJrKm/QNkcUUlBv6PonWcYrhx8DMAxEeeaMutF6OKe2V1QBEPmfIsBygy
         GKip2PzZvBMa8U00SJPBd7o2qBRAQAZkn8kNYD1IWX4d5Ki+vFdlYdGubUCMcAU3+JaX
         23qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YMRN0wSsDj4YeK0mPPFUdkTPLMlDL25YvZpi9MUfAXY=;
        b=RVsNH+4ekP3reAKYQ/N5O7kSBs7HQ6mo7OQBa6MmLWZ6AexMbmkokTkG7zd+nU0QnX
         5Sw6xevgqwXDrn+RZkckVIgvcr/rJJlKuFdwj9URIh33rSupBSrutmu90i3WM4sI1HuM
         DfmG78Qrxfgba0rvT2Wlbedy0dponb8ghky2bRVxjrLZHqaizvThZ/xp1zNTX7BIqfdT
         ozPhPsCzetTQI0Y/a6ZFIno9WMF+tYapVltaG28piQuIIIeP0aQ09VPhP0awjdw5LVo8
         8GIFXv11ZS/VLY7DLjHL/XclM217PmoF5oJGBLnUlnQFS6q1HEVKVQnfPYFzLwPIezZP
         Bz9g==
X-Gm-Message-State: AOAM530XXSvJ+6gdcdijNYNW6T+ffggkb6S7zJtgcspIHLa80PDO+eSK
        QGeuNqSsyN4iMxCQpz79StU=
X-Google-Smtp-Source: ABdhPJw7clXcDuDY7GMB5jjhBjvxVkDCV+qtLZEpQR/N8sHEQ049wXM2f3hCnUQNnxMGCS1QjW7jFQ==
X-Received: by 2002:a63:a51b:: with SMTP id n27mr11250321pgf.40.1590807636020;
        Fri, 29 May 2020 20:00:36 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t12sm649218pjf.3.2020.05.29.20.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 20:00:35 -0700 (PDT)
Date:   Fri, 29 May 2020 20:00:33 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 7/9] staging: media: atomisp: fix enum type mixups
Message-ID: <20200530030033.GD1367069@ubuntu-s3-xlarge-x86>
References: <20200529200031.4117841-1-arnd@arndb.de>
 <20200529200031.4117841-7-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529200031.4117841-7-arnd@arndb.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 10:00:29PM +0200, Arnd Bergmann wrote:
> Some function calls pass an incorrect enum type:
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:858:16: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
>         gp_device_rst(INPUT_SYSTEM0_ID);
>         ~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:860:19: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
>         input_switch_rst(INPUT_SYSTEM0_ID);
>         ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:876:27: error: implicit conversion from enumeration type 'input_system_cfg_flag_t' to different enumeration type 'input_system_connection_t' [-Werror,-Wenum-conversion]
>                 config.multicast[i]              = INPUT_SYSTEM_CFG_FLAG_RESET;
>                                                  ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1326:32: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
>         input_selector_cfg_for_sensor(INPUT_SYSTEM0_ID);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1329:19: error: implicit conversion from enumeration type 'input_system_ID_t' to different enumeration type 'gp_device_ID_t' [-Werror,-Wenum-conversion]
>         input_switch_cfg(INPUT_SYSTEM0_ID, &config.input_switch_cfg);
>         ~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~
> 
> INPUT_SYSTEM0_ID is zero, so use the corresponding zero-value
> of the expected types instead.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Huh weird that I did not see this warning but you do randconfigs so
that's expected.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  .../pci/hive_isp_css_common/host/input_system.c        | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> index 2114cf4f3fda..aa0f0fca9346 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
> @@ -855,9 +855,9 @@ input_system_error_t input_system_configuration_reset(void)
>  
>  	input_system_network_rst(INPUT_SYSTEM0_ID);
>  
> -	gp_device_rst(INPUT_SYSTEM0_ID);
> +	gp_device_rst(GP_DEVICE0_ID);
>  
> -	input_switch_rst(INPUT_SYSTEM0_ID);
> +	input_switch_rst(GP_DEVICE0_ID);
>  
>  	//target_rst();
>  
> @@ -873,7 +873,7 @@ input_system_error_t input_system_configuration_reset(void)
>  
>  	for (i = 0; i < N_CSI_PORTS; i++) {
>  		config.csi_buffer_flags[i]	 = INPUT_SYSTEM_CFG_FLAG_RESET;
> -		config.multicast[i]		 = INPUT_SYSTEM_CFG_FLAG_RESET;
> +		config.multicast[i]		 = INPUT_SYSTEM_DISCARD_ALL;
>  	}
>  
>  	config.source_type_flags				 = INPUT_SYSTEM_CFG_FLAG_RESET;
> @@ -1323,10 +1323,10 @@ static input_system_error_t configuration_to_registers(void)
>  	} // end of switch (source_type)
>  
>  	// Set input selector.
> -	input_selector_cfg_for_sensor(INPUT_SYSTEM0_ID);
> +	input_selector_cfg_for_sensor(GP_DEVICE0_ID);
>  
>  	// Set input switch.
> -	input_switch_cfg(INPUT_SYSTEM0_ID, &config.input_switch_cfg);
> +	input_switch_cfg(GP_DEVICE0_ID, &config.input_switch_cfg);
>  
>  	// Set input formatters.
>  	// AM: IF are set dynamically.
> -- 
> 2.26.2
> 
