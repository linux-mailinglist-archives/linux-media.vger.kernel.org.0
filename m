Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C15424BEFF
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 15:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgHTNi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 09:38:56 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53651 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726723AbgHTJ16 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 05:27:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 8grPkFbsBywL58grRkZ8bJ; Thu, 20 Aug 2020 11:27:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597915675; bh=cNLUtp3j+bxZUs5oMm61luJ8XShEeI/t0jPuqCJFGx8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Oy74UdDgA4wbHGzZmQVtRP4mSlN2EhMn97pEipm7FeIIO2NTZPowsnhBah4se6SgV
         WdglVV2S62zFk0+5GPKcDA5uPfmNAAnEFoqzoa3X6Xj5aY3tzSF9HwD6ovyMjvK8YE
         fgxjzIWM3mbZ3P8xrx0vuRm6kt2hPEoouirH3i+RHRwFRvofIGgHQpIE1HNq5cnKZ9
         Zn8UNb2SDm2KSaFrSDOtYV24Pjlk6QNAGMK0bRrPrvum8oKK4bf/XU/Drh4tzUlPRM
         rA1UAKgXGfCOsO2VWS1WKtMl1E6ht9RYpq6gr+V+0Wm72I/jD4vZsAlVRUzSvru6fJ
         1p5lAq2EcygEw==
Subject: Re: [PATCH v2 05/14] media: staging: rkisp1: params: upon stream
 stop, iterate a local list to return the buffers
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-6-dafna.hirschfeld@collabora.com>
 <695451da-c7af-a12c-f308-c45675b8f3aa@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <33ed026c-f014-0fff-2f19-afc1548e80f2@xs4all.nl>
Date:   Thu, 20 Aug 2020 11:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <695451da-c7af-a12c-f308-c45675b8f3aa@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFRKzvCCkyJS9Q5rdxze4gulqoKt38zEPt9G9XCo9uvSvJmQH6GZa9qlg4aSjmCj5cGVZVd7L6SKZU94SNwCZOegkbnPo+NvvWFXnm4eT9u9L0EkAJx8
 /VIWg5YbHC2p1pTSUX8P0vtvVD5M+nj8ayALIq8Xa4w80T0xEKSNJm+RkOG+HyeRBvp9zmjq+ZKPm0ZX9eM1vUS703EordaXp7j29IaE75o/SBUzwBGnKkE3
 9sBCm+UfmVY+ItN6MiUsrkzWFKDqPulfmOfDG8El8EvhxJPPCD90PZ+zU02++C8FWUkQIG+mYm3X4VIjkFZLvTW1TaKNl93fBQLy+VlK0v4sAjUrH/rU7xAc
 Z4165x6fUSdaJm8YaiFIV3wLKMjWhdsJ+UQjTW9858V/ZGkfrD5P1ENKxORG/1yThkOf6cpBLRmrV1LyCpdwZJjUvoJHGDX+bZQdGFNrn4lFiTVa5Slf0moL
 CKp/UD79D67ZGEvhRa5AwyD01AZsYGPZFKRlN2+zJihIv9rNBdwDS53V7Q/1I4IV4nBRm8UND6VcxbuwEZqanJntLFdvLfFGzeSoZ4ZzIrAMvEst2L76f4tX
 tekMnfyWaiQse8XbiMuf1fBFUkSS13GiIU4NnSosYTRW3bbGScPqvpsXEPwCTgtfqU8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/08/2020 23:47, Helen Koike wrote:
> Hi Dafna,
> 
> On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
>> The code in '.stop_streaming' callback releases and acquire the lock
>> at each iteration when returning the buffers.
>> Holding the lock disables interrupts so it should be minimized.
>> To make the code cleaner and still minimize holding the lock,
>> the buffer list is first moved to a local list and
>> then can be iterated without the lock.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> 
> lgtm
> 
> Helen Koike <helen.koike@collabora.com>

Missing 'Acked-by:' tag?

Hans

> 
> Thanks
> Helen
> 
>> ---
>>  drivers/staging/media/rkisp1/rkisp1-params.c | 31 +++++++-------------
>>  1 file changed, 11 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
>> index 0c2bb2eefb22..6a76c586e916 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
>> @@ -1477,32 +1477,23 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>>  {
>>  	struct rkisp1_params *params = vq->drv_priv;
>>  	struct rkisp1_buffer *buf;
>> +	struct list_head tmp_list;
>>  	unsigned long flags;
>> -	unsigned int i;
>>  
>> -	/* stop params input firstly */
>> +	INIT_LIST_HEAD(&tmp_list);
>> +
>> +	/*
>> +	 * we first move the buffers into a local list 'tmp_list'
>> +	 * and then we can iterate it and call vb2_buffer_done
>> +	 * without holding the lock
>> +	 */
>>  	spin_lock_irqsave(&params->config_lock, flags);
>>  	params->is_streaming = false;
>> +	list_cut_position(&tmp_list, &params->params, params->params.prev);
>>  	spin_unlock_irqrestore(&params->config_lock, flags);
>>  
>> -	for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
>> -		spin_lock_irqsave(&params->config_lock, flags);
>> -		if (!list_empty(&params->params)) {
>> -			buf = list_first_entry(&params->params,
>> -					       struct rkisp1_buffer, queue);
>> -			list_del(&buf->queue);
>> -			spin_unlock_irqrestore(&params->config_lock,
>> -					       flags);
>> -		} else {
>> -			spin_unlock_irqrestore(&params->config_lock,
>> -					       flags);
>> -			break;
>> -		}
>> -
>> -		if (buf)
>> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> -		buf = NULL;
>> -	}
>> +	list_for_each_entry(buf, &tmp_list, queue)
>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>  }
>>  
>>  static int
>>

