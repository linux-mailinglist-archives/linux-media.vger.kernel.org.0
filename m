Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD0E2C63A7
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 12:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbgK0LOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 06:14:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:53532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725616AbgK0LOS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 06:14:18 -0500
Received: from coco.lan (ip5f5ad5a6.dynamic.kabel-deutschland.de [95.90.213.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA54721527;
        Fri, 27 Nov 2020 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606475657;
        bh=UUHBLygREjHYXn3z1M033GRc6uSd/b7ObYwCOHWwod8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R5uRv8ImrJl1TIvMjjrXi8QUS5/ZkIsqaHATSP0jbwCGdIG8Q8vxZSarNQXImurFe
         JWekhIK4QpTFZolQrm1dzdBZ81/7MoQ/YtIDH33G8DZ3DCOPztbu/7/zld5/UtxzIx
         NXvscXKSJB6dHftOxfMyRxN4Z0vcc+7UBlacXV84=
Date:   Fri, 27 Nov 2020 12:14:12 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: fix possible buffer overlow casued bad
 DMA value in venus_sfr_print()
Message-ID: <20201127121412.2c982188@coco.lan>
In-Reply-To: <20200530024117.24613-1-baijiaju1990@gmail.com>
References: <20200530024117.24613-1-baijiaju1990@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 30 May 2020 10:41:17 +0800
Jia-Ju Bai <baijiaju1990@gmail.com> escreveu:

> The value hdev->sfr.kva is stored in DMA memory, and it is assigned to
> sfr, so sfr->buf_size can be modified at anytime by malicious hardware. 
> In this case, a buffer overflow may happen when the code 
> "sfr->data[sfr->buf_size - 1]" is executed.
> 
> To fix this possible bug, sfr->buf_size is assigned to a local variable,
> and then this variable is checked before being used.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 0d8855014ab3..4251a9e47a1b 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -960,18 +960,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>  {
>  	struct device *dev = hdev->core->dev;
>  	struct hfi_sfr *sfr = hdev->sfr.kva;
> +	u32 buf_size;
>  	void *p;
>  
>  	if (!sfr)
>  		return;
>  
> -	p = memchr(sfr->data, '\0', sfr->buf_size);
> +	buf_size = sfr->buf_size;
> +	if (buf_size > 1)

That seems plain wrong to me... I suspect you wanted to do,
instead:

	if (buf_size < 1)

or even:
	if (buf_size < 1 || buf_size >= maximum_size_of_data)


> +		return;
> +
> +	p = memchr(sfr->data, '\0', buf_size);
>  	/*
>  	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>  	 * that Venus is in the process of crashing.
>  	 */
>  	if (!p)
> -		sfr->data[sfr->buf_size - 1] = '\0';
> +		sfr->data[buf_size - 1] = '\0';

Well, a malicious hardware with DMA access could simply write 0 to
some random address, without needing to rely on the value
of sfr->buf_size. I can't see how a change like that would prevent
that.

A check like that only makes sense if the driver can ever
call this function with an invalid value for sfr->buf_size.


>  
>  	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>  }



Thanks,
Mauro
