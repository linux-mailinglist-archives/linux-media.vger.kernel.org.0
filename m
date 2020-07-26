Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003C822DD63
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 10:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbgGZI6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 04:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZI6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 04:58:14 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0344C0619D2;
        Sun, 26 Jul 2020 01:58:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m22so7726450pgv.9;
        Sun, 26 Jul 2020 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eKHZfUdWwVlQQlyAJPYR0dRFAIn0IvrChWeOS54Hjw8=;
        b=SAdQOW0fI8g1P+YzT9518H+diSMFVQ99WAv18bOGv+9eGpuqUFK9WpwxhV/TCmlGMU
         zjRSBvsP0iwFPKZVOOAOX7Nb36YvOplvZ3YG3LZPQ2c2U/kVjH+O0oUEBH6gaCn4S590
         gdaDdNus0yOHZ79yQrJJ5MsNvlaT5xyGOsW8MovwiaNcgB81yX9CC22ri7tLQrHH8AQX
         rQA1XzI47mP34DG18lMjsTTN0+rBU31ECQo9LstPKDyL8HLa/oO9VSt/pEVIxpq2x7/F
         lv+ax2HapGThCAcAoT4HLL9TEFnX5CxxhjAdOrcr96aRz6CV8wS5hpPL4ddUtaRn8DVV
         rUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eKHZfUdWwVlQQlyAJPYR0dRFAIn0IvrChWeOS54Hjw8=;
        b=DYxeGcgiQuprgJ9jEpBDj/c4or/URMirWS6LRjzPpPsyP+XEiiysAVp5ZH0ln6HvJh
         nVum2fxGfXfW3bcKwvg9TkVEL3IjbQ8yW7xGrk8IJZrnLcz17AcEDfr82lzBu4eHPXhT
         9//S+GwY4SsCbZ+2PnTUIUr4f3zL/LaSVT4wuYbTvbPSAIASnWb6LgYfibYaNmDwT0Ub
         IO1Ux1ypdZp68epavIG0e5hz+LRPswSigv99x3b/+8+KeVP0H+xl5uJHHvsgg/Yfi8FZ
         NfEekKSW9WbPBu0JTtVBriROXT+4ICHECi7YNDVJcRg7jIRRfZnGdNMLT7hT71fDxhRb
         QmDg==
X-Gm-Message-State: AOAM532s56wUFZxwuSYWJxxOFZeP/p2hoqXtEhpL2DbG13TpNQ3irizQ
        JAh5Lq8Hz28icTgBius3G0vzKwTtpek=
X-Google-Smtp-Source: ABdhPJxR1ssefATZ2ss4fjbe1RFJ43C4cGCkQ6Jp477YREPPPvJSj1/lKcLKbnddi+XWTryFxF8TzA==
X-Received: by 2002:a62:18cd:: with SMTP id 196mr16073837pfy.253.1595753893075;
        Sun, 26 Jul 2020 01:58:13 -0700 (PDT)
Received: from [192.168.0.109] ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id 17sm11572910pfv.16.2020.07.26.01.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 01:58:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] fix style of block comments
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200726084900.19246-1-bharadwaj.rohit8@gmail.com>
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Message-ID: <6e0d8e34-4440-7c40-04cc-a7bed99e6e68@gmail.com>
Date:   Sun, 26 Jul 2020 14:28:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726084900.19246-1-bharadwaj.rohit8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/20 2:18 pm, Rohit K Bharadwaj wrote:
> this patch fixes the coding style of block comments.
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> ---
> v2: split patch into sequence of patches 
> v1: fix all coding style issues in single patch
> 
>  .../media/atomisp/pci/sh_css_firmware.c       | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index d4ab15b6d1ac..2907aead98b7 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -51,9 +51,12 @@ struct fw_param {
>  
>  static struct firmware_header *firmware_header;
>  
> -/* The string STR is a place holder
> +/*
> + * The string STR is a place holder
>   * which will be replaced with the actual RELEASE_VERSION
> - * during package generation. Please do not modify  */
> + * during package generation. Please do not modify
> + */
> +
>  static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
>  static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);
>  
> @@ -276,10 +279,11 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  	for (i = 0; i < sh_css_num_binaries; i++)
>  	{
>  		struct ia_css_fw_info *bi = &binaries[i];
> -		/* note: the var below is made static as it is quite large;
> -		   if it is not static it ends up on the stack which could
> -		   cause issues for drivers
> -		*/
> +		/*
> +		 * note: the var below is made static as it is quite large;
> +		 * if it is not static it ends up on the stack which could
> +		 * cause issues for drivers
> +		 */
>  		static struct ia_css_blob_descr bd;
>  		int err;
>  
> @@ -333,7 +337,11 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  				return err;
>  
>  		} else {
> -			/* All subsequent binaries (including bootloaders) (i>NUM_OF_SPS) are ISP firmware */
> +			/*
> +			 * All subsequent binaries
> +			 * (including bootloaders) (i>NUM_OF_SPS)
> +			 * are ISP firmware
> +			 */
>  			if (i < NUM_OF_SPS)
>  				return -EINVAL;
>  
> @@ -374,8 +382,10 @@ ia_css_ptr
>  sh_css_load_blob(const unsigned char *blob, unsigned int size)
>  {
>  	ia_css_ptr target_addr = hmm_alloc(size, HMM_BO_PRIVATE, 0, NULL, 0);
> -	/* this will allocate memory aligned to a DDR word boundary which
> -	   is required for the CSS DMA to read the instructions. */
> +	/*
> +	 * this will allocate memory aligned to a DDR word boundary which
> +	 * is required for the CSS DMA to read the instructions.
> +	 */
>  
>  	assert(blob);
>  	if (target_addr)
> 
I'm really sorry for the spam, please excuse me, I realized that I didn't change the subject prefix so will send another version, apologies for any inconvenience caused.
