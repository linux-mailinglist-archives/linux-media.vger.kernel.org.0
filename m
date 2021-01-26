Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E333E303FD4
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 15:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392685AbhAZOJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 09:09:50 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:34853 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404788AbhAZOIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 09:08:14 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7A49C3E7D4;
        Tue, 26 Jan 2021 15:07:19 +0100 (CET)
Subject: Re: [PATCH] venus: core: Parse firmware-name DT property
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b2afcf41-5135-1ac0-c603-6394bb0ab492@somainline.org>
Date:   Tue, 26 Jan 2021 15:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 26/01/21 09:42, Stanimir Varbanov ha scritto:
> On production devices the firmware could be located on different
> places, this path could be provided by special firmware-name DT
> property.
> 
> Here we check for existence of such DT property and if it exist
> take the firmware path from there. Otherwise, if the property
> is missing we fallback to the predefined path from driver resource
> structure.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>   drivers/media/platform/qcom/venus/firmware.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index d03e2dd5808c..56c8fb5a019b 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -187,6 +187,7 @@ int venus_boot(struct venus_core *core)
>   {
>   	struct device *dev = core->dev;
>   	const struct venus_resources *res = core->res;
> +	const char *fwpath = NULL;
>   	phys_addr_t mem_phys;
>   	size_t mem_size;
>   	int ret;
> @@ -195,7 +196,12 @@ int venus_boot(struct venus_core *core)
>   	    (core->use_tz && !qcom_scm_is_available()))
>   		return -EPROBE_DEFER;
>   
> -	ret = venus_load_fw(core, core->res->fwname, &mem_phys, &mem_size);
> +	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
> +					    &fwpath);
> +	if (ret)
> +		fwpath = core->res->fwname;
> +
> +	ret = venus_load_fw(core, fwpath, &mem_phys, &mem_size);
>   	if (ret) {
>   		dev_err(dev, "fail to load video firmware\n");
>   		return -EINVAL;
> 

Super! As you surely know, I totally agree.

It may not have huge value, but:
Reviewed-By: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>
