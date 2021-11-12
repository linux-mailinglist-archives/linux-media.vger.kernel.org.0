Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF7B44E357
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 09:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbhKLIjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 03:39:42 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54628 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234610AbhKLIjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 03:39:42 -0500
Received: from [IPv6:2a01:e0a:120:3210:ce3c:556c:48c3:a452] (unknown [IPv6:2a01:e0a:120:3210:ce3c:556c:48c3:a452])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 997ED1F4628E;
        Fri, 12 Nov 2021 08:36:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636706210; bh=pTLy68AKu+/FRxEuTnbsRd73ctNabYrP8oSVqbG1njw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Dbu3BI5W5ZtXYUtgvV/K/ioCz7CKRYCjTEjry4Wy+Z9bNoM114j7DDR1OJ/AMzhzs
         CFy070Q53lX4MRpjs/THX6iAqWs+w625mPF3EWb2Zy8rcs0oK6LIoTWdEs9NZelaVg
         sb8sM8szHTbDFFRUQW4IVkPYi7t8rgZV7ytbFHAJjVCanOFrPV+ljfssz7WEleTgyH
         lZsQlp9A4SugxdPPhUvfau6ZY3z96smVlNfhji/atUUIeIpaIc5P8Pwg5brihS1Pci
         hpa6LZwndi7X9xSfTop1Y4kwiXZKr/oTMVGRVT9hIv4SzvsfUkgJSyn0Xru+4J2BFk
         hR2s/PiO4bqSA==
Subject: Re: [PATCH] media: coda: Keep metas sync with hardware fifo
To:     Philipp Zabel <p.zabel@pengutronix.de>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20211108142404.598968-1-benjamin.gaignard@collabora.com>
 <bf7129460b4fb0c9daa92cfc628248ee92399074.camel@pengutronix.de>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <4247f8c1-496b-4026-a328-284a495b88f3@collabora.com>
Date:   Fri, 12 Nov 2021 09:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bf7129460b4fb0c9daa92cfc628248ee92399074.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 11/11/2021 à 18:03, Philipp Zabel a écrit :
> Hi Benjamin,
>
> On Mon, 2021-11-08 at 15:24 +0100, Benjamin Gaignard wrote:
>> After updating the output fifo position be sure that metas are also
>> synchronised with this position.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   drivers/media/platform/coda/coda-bit.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
>> index c484c008ab02..28c56286b0de 100644
>> --- a/drivers/media/platform/coda/coda-bit.c
>> +++ b/drivers/media/platform/coda/coda-bit.c
>> @@ -2315,6 +2315,12 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>>   	/* Update kfifo out pointer from coda bitstream read pointer */
>>   	coda_kfifo_sync_from_device(ctx);
>>
>> +	/*
>> +	 * After updating the read pointer, we need to check if
>> +	 * any metas are consumed and should be released.
>> +	 */
>> +	coda_decoder_drop_used_metas(ctx);
>> +
> This doesn't look right. If you drop all metas seen by the decoder right
> away, they can't be copied into the decoded picture's meta slot later in
> this function. I'd expect you run into the "empty timestamp list!"
> errors if you do this.

Hi Philipp,

I don't run into the "empty timestamp list!" errors.
The only case I have seen metas been dropped here it is when
an invalid/incomplete frame has been send into the decoder.
When that happens I don't see any interrupt or error message but
the erroneous frame stay in the list.
If that occur 4 times (I'm using CODA 960) then the decoder hang.
Dropping the metas at this moment solve this problem.

Maybe you can guide me to a better solution ?

Regards,
Benjamin

>
> regards
> Philipp
