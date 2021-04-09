Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80826359CDC
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhDILOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:14:52 -0400
Received: from ns.mm-sol.com ([37.157.136.199]:50394 "EHLO extserv.mm-sol.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233940AbhDILOv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 07:14:51 -0400
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Apr 2021 07:14:48 EDT
Received: from [192.168.1.124] (hst-221-7.medicom.bg [84.238.221.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: svarbanov@mm-sol.com)
        by extserv.mm-sol.com (Postfix) with ESMTPSA id EB5A5D150;
        Fri,  9 Apr 2021 14:08:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mm-sol.com; s=201706;
        t=1617966517; bh=k6WYER5qAUxrnq97OeTOyOEqgbO9uezWvqO3n++Khy8=;
        h=Subject:To:Cc:From:Date:From;
        b=TdaSCt5pvGBTHcwOKMZScrbFhYeiLzQOP4SK3le4gvdAdrdQ3tA0OWBCqO+gyN/m+
         5PyajX5L+JZvlBVP+g2TBD5t/Z95wySXWogAHbCAhfCmNmbe4cjCubr3ryyA+B0xu/
         /Rk8yJqdF1+lUru5AWrUTFLLY4eFrVJT9BeWOIRZw4UHur1ELtWA8HW1bXmw2iSUmR
         QaVKbg3Mq1i+btyLMNJTw25KibZLg53GW813TDROLpFML3JmuZC1kke011X4V64ZMJ
         a9S6AJKTNKsMvy39p2p/GJjt3mh002/wmLP2Lw43LQ1Yw5FCyXLB6c9eEIBjr3BXM7
         PG5DwvC82kAnQ==
Subject: Re: [PATCH 1/3] media: venus: use NULL instead of zero for pointers
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <svarbanov@mm-sol.com>
Message-ID: <8719c5f3-1c28-c099-6137-8bfff51106e9@mm-sol.com>
Date:   Fri, 9 Apr 2021 14:08:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 4/8/21 10:40 AM, Mauro Carvalho Chehab wrote:
> As reported by sparse:
> 
> 	drivers/media/platform/qcom/venus/core.c:227:41: warning: Using plain integer as NULL pointer
> 	drivers/media/platform/qcom/venus/core.c:228:34: warning: Using plain integer as NULL pointer
> 
> Two vars are using zero instead of NULL for pointers. Not really
> an issue, but using NULL makes it clearer that the init data is
> expecting a pointer.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index f5b88b96f5f7..4451e3c11bc0 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -224,8 +224,8 @@ static void venus_assign_register_offsets(struct venus_core *core)
>  		core->cpu_cs_base = core->base + CPU_CS_BASE;
>  		core->cpu_ic_base = core->base + CPU_IC_BASE;
>  		core->wrapper_base = core->base + WRAPPER_BASE;
> -		core->wrapper_tz_base = 0;
> -		core->aon_base = 0;
> +		core->wrapper_tz_base = NULL;
> +		core->aon_base = NULL;
>  	}
>  }
>  
> 

-- 
regards,
Stan
