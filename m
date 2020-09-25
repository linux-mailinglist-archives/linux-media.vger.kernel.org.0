Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55E7278C08
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 17:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgIYPGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 11:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728843AbgIYPGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 11:06:09 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CEBC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 08:06:09 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id r10so823671oor.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 08:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x1sbmZ75NGM7AD1AjHWbiOyh9jrSaY5rZ5i9u5wAYJo=;
        b=pyo7C3HqTnTZw96JOVwCGuKcQv8AZnFVKCuVi44ecNIPXuVs/QKnG7KkR8HaWa8mi8
         +4RXIpIV7yC+DMPFGmlC1znrpeyirczZoRhDcniz3Sq21NbUfdnNa2cgexCi5Rsyfy22
         64UKby7l0HD3iX3+UfPshE3Fq7vMhS4XjNz8Grg1ahfGucyEqlR5pLmq+CMjqsO1HT+e
         Q43UiaWwI7PqTbxfbK8JebEj+r57ydaCbgZE18CNMMl3VrIG8L3eK9SbbzHS3Ck+LTK0
         P5Gz6Z4O+64+SiMK6/iHKJLP4cA1/FMChf/Q4HGshS3UHT51NbTNuQ081yIpXRIMaKco
         o/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x1sbmZ75NGM7AD1AjHWbiOyh9jrSaY5rZ5i9u5wAYJo=;
        b=unpoDHRVZjpUBUgEB/4LkejPm6oMGyUqwLPgIeDFdX6CxrPx7RMMmGzjoTGw16k/ei
         mdA9idjoTIIB8w25t8YKzNIvFtrsG6qb4mdSRi26rS2pBCC8yRAPs/LF9BcESL3Gf3oM
         thO2hu9P3iVexQ/tDvSUMJdNvFq8t0zA+HChtJ8LnIWXkBvChLOrrIs/NvRN/6Yz558K
         +QDJkR5Bu7NW9HWK9iovBdjqzj/Bwq+SoNVvnDiuCb2hlAWfDJzHQ0y9bCCo8DuUdAUv
         0gYIFf2WCgQc+AIFj8K3aO94CLolpg2Aqfr/9HiGOZxFDScNEsdHBoTYsjAA25ZArvQY
         V4Wg==
X-Gm-Message-State: AOAM531+8ELzsQKJzHdO/FZq+Vco4O48GR5nxW29UrkuAAylLZikIhEQ
        iFxtFSGZX0iwDl1u6S2f0qxKsw==
X-Google-Smtp-Source: ABdhPJwO5i3qUyONWfxsNjNMkNMtnzblXibTHdyFvR4gbIBLQgbaIluxyBgJ3QAx9INXjcoMnLER5Q==
X-Received: by 2002:a4a:5896:: with SMTP id f144mr1136706oob.49.1601046369049;
        Fri, 25 Sep 2020 08:06:09 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id o13sm698493otj.2.2020.09.25.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 08:06:08 -0700 (PDT)
Date:   Fri, 25 Sep 2020 10:06:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: venus: simplify the return expression of
 venus_sys_set_* function
Message-ID: <20200925150605.GA2510@yoga>
References: <20200921082440.2591617-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921082440.2591617-1-liushixin2@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 21 Sep 03:24 CDT 2020, Liu Shixin wrote:

> Simplify the return expression.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 28 +++----------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 4be4a75ddcb6..05ddb68023b8 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -772,34 +772,24 @@ static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
>  {
>  	struct hfi_sys_set_property_pkt *pkt;
>  	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
> -	int ret;
>  
>  	pkt = (struct hfi_sys_set_property_pkt *)packet;
>  
>  	pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
>  
> -	ret = venus_iface_cmdq_write(hdev, pkt);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return venus_iface_cmdq_write(hdev, pkt);
>  }
>  
>  static int venus_sys_set_coverage(struct venus_hfi_device *hdev, u32 mode)
>  {
>  	struct hfi_sys_set_property_pkt *pkt;
>  	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
> -	int ret;
>  
>  	pkt = (struct hfi_sys_set_property_pkt *)packet;
>  
>  	pkt_sys_coverage_config(pkt, mode);
>  
> -	ret = venus_iface_cmdq_write(hdev, pkt);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return venus_iface_cmdq_write(hdev, pkt);
>  }
>  
>  static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
> @@ -807,7 +797,6 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
>  {
>  	struct hfi_sys_set_property_pkt *pkt;
>  	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
> -	int ret;
>  
>  	if (!enable)
>  		return 0;
> @@ -816,11 +805,7 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
>  
>  	pkt_sys_idle_indicator(pkt, enable);
>  
> -	ret = venus_iface_cmdq_write(hdev, pkt);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return venus_iface_cmdq_write(hdev, pkt);
>  }
>  
>  static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
> @@ -828,17 +813,12 @@ static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
>  {
>  	struct hfi_sys_set_property_pkt *pkt;
>  	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
> -	int ret;
>  
>  	pkt = (struct hfi_sys_set_property_pkt *)packet;
>  
>  	pkt_sys_power_control(pkt, enable);
>  
> -	ret = venus_iface_cmdq_write(hdev, pkt);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return venus_iface_cmdq_write(hdev, pkt);
>  }
>  
>  static int venus_get_queue_size(struct venus_hfi_device *hdev,
> -- 
> 2.25.1
> 
