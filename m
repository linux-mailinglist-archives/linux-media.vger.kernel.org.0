Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F186626D325
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 07:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIQFbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 01:31:21 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:35159 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726106AbgIQFbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 01:31:19 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0U9BclBt_1600320673;
Received: from B-455UMD6M-2027.local(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U9BclBt_1600320673)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 17 Sep 2020 13:31:14 +0800
Subject: Re: [PATCH v1] atomisp:pci/runtime/queue: modify the return error
 value
To:     Xiaoliang Pang <dawning.pang@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     alexander.deucher@amd.com, evan.quan@amd.com,
        christian.koenig@amd.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200917034451.20897-1-dawning.pang@gmail.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <75262d3f-eeb6-5531-a93d-85376236774a@linux.alibaba.com>
Date:   Thu, 17 Sep 2020 13:31:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200917034451.20897-1-dawning.pang@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LGTM.

Reviewed-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

On 9/17/20 11:44 AM, Xiaoliang Pang wrote:
> modify the return error value is -EDOM
> 
> Fixes: 2cac05dee6e30("drm/amd/powerplay: add the hw manager for vega12 (v4)")
> Cc: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
> ---
>   .../staging/media/atomisp/pci/runtime/queue/src/queue_access.c  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
> index fdca743c4ab7..424e7a15a389 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
> @@ -44,7 +44,7 @@ int ia_css_queue_load(
>   				   the value as zero. This causes division by 0
>   				   exception as the size is used in a modular
>   				   division operation. */
> -				return EDOM;
> +				return -EDOM;
>   			}
>   		}
>   
> 
