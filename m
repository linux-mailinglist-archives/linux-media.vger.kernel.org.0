Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4091442EEAA
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 12:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237976AbhJOKSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 06:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbhJOKSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 06:18:48 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E572FC061760;
        Fri, 15 Oct 2021 03:16:40 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id r7so25643975wrc.10;
        Fri, 15 Oct 2021 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ojnbZ/aq4HNFkRouovnAwZY+4UzTj+fN1eFBpXz6H30=;
        b=PWBZSDPkbGdWXkDwzoipcoJTpMpbKgDaKVpmtT5vqeiWoJJpVcDorsr16yQjy42MvQ
         TgQ15xobEeO6hnRCeQ+6NZJJyQGTaLaOTkPyL3kDXL//tldOWQoypocTevhqmUjqZGKr
         UcA7D6AR2oNTHWEVSkXycGrp6nJ1FMN+HmYKruCK/5Vcf8Bz1LSv4KwLW4yD73HdTM9Q
         v4leT79gmLqO98yF/W0d7Z/OPvpyLVVKgb7ulatzeyACkePG2Vqf8ZfX6Zp+9gMee0aQ
         jp2rYEEnc34xqOur6EBFDwjDZIqaF47xBVlvk7g2ZW3wdy7Coig7+hIpGJeYhF/0W9Z+
         3jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ojnbZ/aq4HNFkRouovnAwZY+4UzTj+fN1eFBpXz6H30=;
        b=zYeAZwdgy9n57gx7neAgjA8AuFPJBcF1cGJNJ4aM0nXL9PLeKjsSx62w8BJIOIADA+
         Ncutz9/g3eNePKrZK2Xw2Wf4WUa1HavrL7FpaZVRoypvXiC3VutNNpPrQ8vZIkFSfD0j
         dXjbMQxEMDmjpgBrZTaaIjH2TbfqWbm/wbMxrUg9byPTbOZNEF5gR/SL5gqaYxG4imXK
         UjmxGd4mlzaQcRkIKbo/JcYuwAahdREOgOZgvwtqdxtxz7bMpkp7Q+mJvehT/7SQo42q
         r2TEJVedGucDKjX6KKMCAYJrm92hlkzkq4aG7DQC1BNIc0Gyf1chWjX44jLVs4ebsm//
         c5ug==
X-Gm-Message-State: AOAM532n96rrezls20QC2nagX75egX/t5k9y3CQCkYtjREw9St3CMgJG
        RQqO87Pj5jh0+n1KozQNc2L0P5si7wM=
X-Google-Smtp-Source: ABdhPJzqF9iysPUUbrMgSJlnpSwO/trvp0WUKT6EcrODKHIG7K1mJHEsVmk+M4Udm6E2kgmNr6tTOA==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr12883872wri.161.1634292999567;
        Fri, 15 Oct 2021 03:16:39 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l6sm4507523wmg.10.2021.10.15.03.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 03:16:39 -0700 (PDT)
Subject: Re: [PATCH] media: ipu3-cio2: Fix missing error code in
 cio2_bridge_connect_sensor()
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, yong.zhi@intel.com
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1634292555-66006-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <2507e669-37c6-383b-4a80-9070ae198e4f@gmail.com>
Date:   Fri, 15 Oct 2021 11:16:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634292555-66006-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiapeng - thanks for the patch

On 15/10/2021 11:09, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'ret'.
>
> Eliminate the follow smatch warning:
>
> drivers/media/pci/intel/ipu3/cio2-bridge.c:242 cio2_bridge_connect_sensor()
> warn: missing error code 'ret'
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index 67c467d3..9e364ba 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -238,8 +238,10 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  			goto err_put_adev;
>  
>  		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
> -		if (ACPI_FAILURE(status))
> +		if (ACPI_FAILURE(status)) {
> +			ret = -EINVAL;
>  			goto err_put_adev;
> +		}
>  
>  		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
>  			dev_err(&adev->dev,


This was actually just patched already:
https://lore.kernel.org/linux-media/163421191963.3878617.4945041938867839263@Monstersaurus/T/#m3dfd290de36ae21e6de90d4c297ba27bb0647611

