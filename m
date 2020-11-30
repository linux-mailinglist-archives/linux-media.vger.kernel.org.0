Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D492C8224
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgK3K2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbgK3K2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:28:10 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4A3C0613D2
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:27:30 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id x16so13602229ejj.7
        for <linux-media@vger.kernel.org>; Mon, 30 Nov 2020 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mojUcFaFWrmPvm6PQa/ffpB+mQE3ctox4g4XwFjgJQU=;
        b=Vi5Gi2uW0ePyQwuhHVG6mPQ9oE3+Ttcbi2FUtWJjB9M4bdg9zYGKEMsGe+CbOplB3p
         579/JECS5wOn/2XBn3w0JEw44fhdy7mAO+LHDTfyiycQ2M/nu1j1ux7vE7XwYY5fPu9L
         XwC3UF17fL0W0riQ8V5PBff4aW/rtjKgixQmCtQDwbuFk6+0tdiAh3z1ucLFsw++QTOn
         ZSkkZfhTYsHBt3a6QdRzEgBmOhHDZfSnrvUgu+tLGd4DP+Z5pQq2RYg9manUDscxNgrt
         BMUn/a9UEB62o4gr+qdZzuTV5WVtbyYmD+Kh1vYtTuytVH60WM3GsxpsGilzEV3kr/D3
         gNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mojUcFaFWrmPvm6PQa/ffpB+mQE3ctox4g4XwFjgJQU=;
        b=Lmc7dEkLZnj9Z68kle236WIOQ/SF8VTxw8C2K29IX+/fcmLemM4bCjW/L6i7+SgowM
         m2l6sU0O/MVrkEH5mF+KXEOxxWT/OJaG1k/LsM6AZWsSwMPnkRoRwaxJttLeLd87Lagq
         sHPDzb3vfrz7wZcqOqSkscKPKCIsVwtJiPUiSerz+70ZWaJPsZ+TI9vnzeFITpzEyRrZ
         x1n6GkeK373Feu0NJxBRbfA6OlhW/jlfOQMstAHtR87w2vSIciEDW3RbVnRtdYw+mdR3
         Nx1gRG42Ms8FhphfDzmgYX2pmJqSGS7dcEhpZ/kAFk0bSFwCaoPZj0tojLJqFlVmQJDt
         yM+Q==
X-Gm-Message-State: AOAM530cWsxwS/4A4QcsnKfyFECPcXZuO7+I5EzPE/WuGM9x1Kf263nA
        DlB6S08FZZR7yWzTOk4WOJTT/A==
X-Google-Smtp-Source: ABdhPJzAIzL2sKXKKrMMVllrcQybVgI3uV4V/IXtJPiFulg+z0WjnIFVw1DwvfJoNGFqWfYIozE+ug==
X-Received: by 2002:a17:906:6d52:: with SMTP id a18mr20155432ejt.224.1606732048726;
        Mon, 30 Nov 2020 02:27:28 -0800 (PST)
Received: from [192.168.0.3] (hst-221-94.medicom.bg. [84.238.221.94])
        by smtp.googlemail.com with ESMTPSA id v16sm2476312eds.64.2020.11.30.02.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 02:27:28 -0800 (PST)
Subject: Re: [PATCH] venus: core: add support to dump FW region
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1606714572-1113-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b1c32c35-91fb-9ddf-2a1e-9e88b7cba991@linaro.org>
Date:   Mon, 30 Nov 2020 12:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606714572-1113-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/30/20 7:36 AM, Dikshita Agarwal wrote:
> Add support to dump video FW region during FW crash
> using devcoredump helpers.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 47 ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 6103aaf..01a0cfe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -7,8 +7,10 @@
>  #include <linux/interconnect.h>
>  #include <linux/ioctl.h>
>  #include <linux/delay.h>
> +#include <linux/devcoredump.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/of_address.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -22,6 +24,48 @@
>  #include "firmware.h"
>  #include "pm_helpers.h"
>  
> +static int subsystem_dump(struct venus_core *core)

this function could return void because we don't handle the error in
venus_sys_error_handler().

> +{
> +	struct device_node *node;
> +	struct device *dev;
> +	struct resource r;
> +	void *mem_va;
> +	size_t mem_size;
> +	void *data;
> +	int ret;
> +
> +	dev = core->dev;
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node)
> +		return -EINVAL;
> +
> +	ret = of_address_to_resource(node, 0, &r);
> +	if (ret)
> +		goto err_put_node;
> +
> +	mem_size = resource_size(&r);

could you reuse the resource from venus_load_fw by adding r.sart and
resource size in venus_core->fw{} structure.

> +
> +	mem_va = memremap(r.start, mem_size, MEMREMAP_WC);
> +	if (!mem_va) {
> +		ret = -ENOMEM;
> +		goto err_put_node;
> +	}
> +
> +	data = vmalloc(mem_size);
> +	if (!data) {
> +		ret = -EINVAL;
> +		goto err_unmap;
> +	}
> +
> +	memcpy(data, mem_va, mem_size);
> +
> +	dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
> +err_unmap:
> +	memunmap(mem_va);
> +err_put_node:
> +	of_node_put(node);
> +	return ret;
> +}
>  static void venus_event_notify(struct venus_core *core, u32 event)
>  {
>  	struct venus_inst *inst;
> @@ -67,6 +111,9 @@ static void venus_sys_error_handler(struct work_struct *work)
>  
>  	venus_shutdown(core);
>  
> +	dev_warn(core->dev, "dumping FW region!\n");

this warn is not needed, please drop it.

> +	subsystem_dump(core);

Are we sure that the dump is always required?

> +
>  	pm_runtime_put_sync(core->dev);
>  
>  	while (core->pmdomains[0] && pm_runtime_active(core->pmdomains[0]))
> 

-- 
regards,
Stan
