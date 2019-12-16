Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FCF12068B
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 14:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbfLPNBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 08:01:36 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49268 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727553AbfLPNBg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 08:01:36 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGD1GEB035729;
        Mon, 16 Dec 2019 07:01:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576501276;
        bh=qu4CX1xmsIJKNsiSCd4Q7cKnvTPwSjXkFWKSo8iJ+4U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IUjovb1voNOw0bGSYt1NM92Pnj8HaGhWHOB/Uf6pgKUahW5o8SeeoMDpJIK5mvJW5
         SAFt0dkaf5/hQWLjucnoz03cLLQqhlFXLcYDtaJR7Tc8c/NLZNmX8D5s0jHg2AmD/U
         zLgnkN/DPxAibbOMwYSdxreD4egLXB9aJgPSWWCM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGD1Gsn098541
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 07:01:16 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 07:01:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 07:01:16 -0600
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGD1EGl118008;
        Mon, 16 Dec 2019 07:01:14 -0600
Subject: Re: [PATCH] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
To:     zhong jiang <zhongjiang@huawei.com>, <sumit.semwal@linaro.org>,
        <benjamin.gaignard@linaro.org>
CC:     <lmark@codeaurora.org>, <labbott@redhat.com>,
        <Brian.Starkey@arm.com>, <john.stultz@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1576490904-18069-1-git-send-email-zhongjiang@huawei.com>
From:   "Andrew F. Davis" <afd@ti.com>
Message-ID: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com>
Date:   Mon, 16 Dec 2019 08:01:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1576490904-18069-1-git-send-email-zhongjiang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/16/19 5:08 AM, zhong jiang wrote:
> Fix the following sparse warning.
> 
> drivers/gpu/drm/ast/ast_main.c:391:22: warning: symbol 'ast_mode_config_mode_valid' was not declared. Should it be static?
> 


The patch looks valid, but this commit message does not seem to match..

Andrew


> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 4f04d10..da2090e 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>  	return 0;
>  }
>  
> -unsigned int dma_heap_ioctl_cmds[] = {
> +static unsigned int dma_heap_ioctl_cmds[] = {
>  	DMA_HEAP_IOC_ALLOC,
>  };
>  
> 
