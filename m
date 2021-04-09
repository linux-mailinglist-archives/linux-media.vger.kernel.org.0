Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF15359CE2
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhDILOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:14:54 -0400
Received: from ns.mm-sol.com ([37.157.136.199]:50393 "EHLO extserv.mm-sol.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233939AbhDILOw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 07:14:52 -0400
Received: from [192.168.1.124] (hst-221-7.medicom.bg [84.238.221.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: svarbanov@mm-sol.com)
        by extserv.mm-sol.com (Postfix) with ESMTPSA id D3B4ED14D;
        Fri,  9 Apr 2021 14:08:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mm-sol.com; s=201706;
        t=1617966516; bh=+4p1odBCiDXO+nqU80eVL0ylXtK4qmPWsCufUxMum30=;
        h=Subject:To:Cc:From:Date:From;
        b=gVpp9fyuSprSUbFJU7xK0atYRq6OLhO6S+HKMw1im3lJkm+M0e6Ga33nPL2mKqbFO
         apFLfZaK7Mb1I1ApW1W8zX1STBtl3Lyan4SiBhFXoHD1iw73ljxIrHV9cbNsxemyg+
         SmDPsgrOcEtj6IOmsOVbX5M1HCccEAWduv9P7Pt0MGhByW04b9ybrB298lzoEF8R0b
         5KXJke2CNt//tLYnrUmnCtOz7Q+OUbdEn0gEQHb3qjaOZvBbdj3KLL3TCNzgu/IU7w
         Takxd82UFDy1rKsuIevALtp2qhQGcagzbNN1U+LtYxXfq9/Jz1NORlftsimSc/55uR
         RcM/Tbnj/kqeQ==
Subject: Re: [PATCH 3/3] media: venus: don't de-reference NULL pointers at IRQ
 time
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
 <73570a5dfe7b3411d256367d4a2a02169aa9b900.1617867599.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <svarbanov@mm-sol.com>
Message-ID: <4cfa9841-43cd-f3f8-8adb-a5868051b586@mm-sol.com>
Date:   Fri, 9 Apr 2021 14:08:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <73570a5dfe7b3411d256367d4a2a02169aa9b900.1617867599.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 4/8/21 10:40 AM, Mauro Carvalho Chehab wrote:
> Smatch is warning that:
> 	drivers/media/platform/qcom/venus/hfi_venus.c:1100 venus_isr() warn: variable dereferenced before check 'hdev' (see line 1097)
> 
> The logic basically does:
> 	hdev = to_hfi_priv(core);
> 
> with is translated to:
> 	hdev = core->priv;
> 
> If the IRQ code can receive a NULL pointer for hdev, there's
> a bug there, as it will first try to de-reference the pointer,
> and then check if it is null.
> 
> After looking at the code, it seems that this indeed can happen:
> Basically, the venus IRQ thread is started with:
> 	devm_request_threaded_irq()
> So, it will only be freed after the driver unbinds.
> 
> In order to prevent the IRQ code to work with freed data,
> the logic at venus_hfi_destroy() sets core->priv to NULL,
> which would make the IRQ code to ignore any pending IRQs.
> 
> There is, however a race condition, as core->priv is set
> to NULL only after being freed. So, we need also to move the
> core->priv = NULL to happen earlier.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index cebb20cf371f..ce98c523b3c6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1094,12 +1094,15 @@ static irqreturn_t venus_isr(struct venus_core *core)
>  {
>  	struct venus_hfi_device *hdev = to_hfi_priv(core);
>  	u32 status;
> -	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> -	void __iomem *wrapper_base = hdev->core->wrapper_base;
> +	void __iomem *cpu_cs_base;
> +	void __iomem *wrapper_base;
>  
>  	if (!hdev)
>  		return IRQ_NONE;
>  
> +	cpu_cs_base = hdev->core->cpu_cs_base;
> +	wrapper_base = hdev->core->wrapper_base;
> +
>  	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
>  	if (IS_V6(core)) {
>  		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> @@ -1650,10 +1653,10 @@ void venus_hfi_destroy(struct venus_core *core)
>  {
>  	struct venus_hfi_device *hdev = to_hfi_priv(core);
>  
> +	core->priv = NULL;
>  	venus_interface_queues_release(hdev);
>  	mutex_destroy(&hdev->lock);
>  	kfree(hdev);
> -	core->priv = NULL;
>  	core->ops = NULL;
>  }
>  
> 

-- 
regards,
Stan
