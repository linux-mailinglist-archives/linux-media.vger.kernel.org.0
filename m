Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2611163796F
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 13:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiKXM4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 07:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiKXMzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 07:55:48 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F346B78180
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 04:55:42 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id bj12so3916328ejb.13
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 04:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wATdhX93jIu9ywzFV+Yks3t6B626MQgeteSPPBs2SLg=;
        b=l+Onk33+eMYCvI+eRk6qxicDMLLN/jvxH1IywBV+hgzxm/qjYx6peCXwy+fkISI4k/
         owfcLIerspmOEUFQSuG9au2LCzEdPzRAu7FDQTtSMZNfNMtIeuHIAfyB0UGFAFfjujAe
         d7qS/ar2fbAEXVWk1Wd0yRVjoRWdT8QUKwh19reXW8O4umTZF5MgDpq8yecQpqLOQRl+
         UcC32bvlZX7cQAi33ZBwUWt8DugWfKh5OWTR97vuCg5S6r8fqulRw+DjkYzAKvB1QSjb
         NemLSGRA2Qm4TDLIrqPMoWisTA1oqsfAwlHYnadvq9bGUR47LiqqQJvu6tLYzHzm5JIS
         hrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wATdhX93jIu9ywzFV+Yks3t6B626MQgeteSPPBs2SLg=;
        b=gy8PAmfIxZvTJmCdFFgEQF/7Lw533apncCRGYwRZPUNtwjkUTCnSkTTD3nre7w8Hl5
         CXpnF5WUApotjGA3MElSJZXoKsynbpV+/n9pcWlrCa6Dh/1inYA1jfWAe3oTuUcLmj9t
         peWYeNvISnT02YxhqkHK8jpzoXWn7zKxqn62w2ySQZ5kCIdpe0fv8UkhaN8DgW/V6LGl
         m7YV9UBMi71/dyINlLQe+oVPm8IOOvO9vJ+ZSh9tvYd5TIpJM1ed82SUZAP1Ahyy+gra
         xRtMpVdjhc3L+qvLNF7gdSagJhH+eC7VUuaPNQxj2E7yHqhwRYK/oRmyyxs9oijxN5q9
         WW8Q==
X-Gm-Message-State: ANoB5pkBKPvPPFBjT232Ph4EMreeViYbNaNTHtPGRghnZB0QlEyf6ksh
        AxhlUqY6UbIQTg2dSTGFCK1lGA02MyY=
X-Google-Smtp-Source: AA0mqf54IOmFzyUXuox7V30QjXf5oT+qrkDHc1avzN/Mm5ucWXJnsZb3izh6EcEiQIjfZrV3ZElJxQ==
X-Received: by 2002:a17:906:814f:b0:7b2:86d6:292d with SMTP id z15-20020a170906814f00b007b286d6292dmr14194598ejw.714.1669294541433;
        Thu, 24 Nov 2022 04:55:41 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
        by smtp.gmail.com with ESMTPSA id ay10-20020a056402202a00b00461cdda400esm499262edb.4.2022.11.24.04.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 04:55:40 -0800 (PST)
Message-ID: <3de513b2-8ec3-2ff4-136d-0f56ac07c0ff@gmail.com>
Date:   Thu, 24 Nov 2022 13:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Fix possible UAF in
 dma_buf_export
Content-Language: en-US
To:     cuigaosheng <cuigaosheng1@huawei.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Charan Teja Kalla <quic_charante@quicinc.com>,
        "T.J. Mercier" <tjmercier@google.com>
Cc:     sumit.semwal@linaro.org, Dan Carpenter <dan.carpenter@oracle.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
 <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
 <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
 <2c9fa595-e788-5474-4f2b-ffbd08a70d13@amd.com>
 <CABdmKX0KJJV0iQwy0aUNXcLc1DGyLjmh6_Y53asHEoh-uyHzAA@mail.gmail.com>
 <83944425-c177-7918-bcde-9cf7296a613f@amd.com>
 <e12784da-b3e3-ddec-0e84-f968d60097c4@quicinc.com>
 <b2d5d904-99f2-7974-a22d-63a6cf864973@huawei.com>
 <689ad89b-0e34-3743-24c9-3f92856720f8@amd.com>
 <a87e407c-f858-28f1-c5ea-ca69b39db53a@huawei.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <a87e407c-f858-28f1-c5ea-ca69b39db53a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Am 24.11.22 um 13:49 schrieb cuigaosheng:
>> I was already wondering why the order is this way.
>>
>> Why is dma_buf_stats_setup() needing the file in the first place? 
>
> dmabuf->file will be used in dma_buf_stats_setup(), the 
> dma_buf_stats_setup() as follows:
>
>> 171 int dma_buf_stats_setup(struct dma_buf *dmabuf)
>> 172 {
>> 173         struct dma_buf_sysfs_entry *sysfs_entry;
>> 174         int ret;
>> 175
>> 176         if (!dmabuf || !dmabuf->file)
>> 177                 return -EINVAL;
>> 178
>> 179         if (!dmabuf->exp_name) {
>> 180                 pr_err("exporter name must not be empty if stats 
>> needed\n");
>> 181                 return -EINVAL;
>> 182         }
>> 183
>> 184         sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), 
>> GFP_KERNEL);
>> 185         if (!sysfs_entry)
>> 186                 return -ENOMEM;
>> 187
>> 188         sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>> 189         sysfs_entry->dmabuf = dmabuf;
>> 190
>> 191         dmabuf->sysfs_entry = sysfs_entry;
>> 192
>> 193         /* create the directory for buffer stats */
>> 194         ret = kobject_init_and_add(&sysfs_entry->kobj, 
>> &dma_buf_ktype, NULL,
>> 195                                    "%lu", 
>> file_inode(dmabuf->file)->i_ino);

Ah, so it uses the i_ino of the file for the sysfs unique name.

I'm going to take another look how to properly clean this up.

Thanks for pointing this out,
Christian.

>> 196         if (ret)
>> 197                 goto err_sysfs_dmabuf;
>> 198
>> 199         return 0;
>> 200
>> 201 err_sysfs_dmabuf:
>> 202         kobject_put(&sysfs_entry->kobj);
>> 203         dmabuf->sysfs_entry = NULL;
>> 204         return ret;
>> 205 }
> Did I miss something?
>
> Thanks.
>
> On 2022/11/24 20:37, Christian König wrote:
>>
>>
>> Am 24.11.22 um 13:05 schrieb cuigaosheng:
>>> Some tips:
>>>     Before we call the dma_buf_stats_setup(), we have to finish 
>>> creating the file,
>>> otherwise dma_buf_stats_setup() will return -EINVAL, maybe we need 
>>> to think about
>>> this when making a new patch.
>>
>> I was already wondering why the order is this way.
>>
>> Why is dma_buf_stats_setup() needing the file in the first place?
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Hope these tips are useful, thanks!
>>>
>>> On 2022/11/24 13:56, Charan Teja Kalla wrote:
>>>> Thanks T.J and Christian for the inputs.
>>>>
>>>> On 11/19/2022 7:00 PM, Christian König wrote:
>>>>>>      Yes, exactly that's the idea.
>>>>>>
>>>>>>      The only alternatives I can see would be to either move 
>>>>>> allocating
>>>>>>      the
>>>>>>      file and so completing the dma_buf initialization last again 
>>>>>> or just
>>>>>>      ignore errors from sysfs.
>>>>>>
>>>>>>      > If we still want to avoid calling 
>>>>>> dmabuf->ops->release(dmabuf) in
>>>>>>      > dma_buf_release like the comment says I guess we could use
>>>>>>      sysfs_entry
>>>>>>      > and ERR_PTR to flag that, otherwise it looks like we'd 
>>>>>> need a bit
>>>>>>      > somewhere.
>>>>>>
>>>>>>      No, this should be dropped as far as I can see. The sysfs 
>>>>>> cleanup
>>>>>>      code
>>>>>>      looks like it can handle not initialized kobj pointers.
>>>>>>
>>>>>>
>>>>>> Yeah there is also the null check in dma_buf_stats_teardown() that
>>>>>> would prevent it from running, but I understood the comment to be
>>>>>> referring to the release() dma_buf_ops call into the exporter which
>>>>>> comes right after the teardown call. That looks like it's preventing
>>>>>> the fput task work calling back into the exporter after the exporter
>>>>>> already got an error from dma_buf_export(). Otherwise the exporter
>>>>>> sees a release() for a buffer that it doesn't know about / thinks
>>>>>> shouldn't exist. So I could imagine an exporter trying to double 
>>>>>> free:
>>>>>> once for the failed dma_buf_export() call, and again when the
>>>>>> release() op is called later.
>>>>>
>>>>> Oh, very good point as well. Yeah, then creating the file should
>>>>> probably come last.
>>>>>
>>>> @Gaosheng: Could you please make these changes or you let me to do?
>>>>
>>>>> Regards,
>>>>> Christian.
>>>> .
>>
>> .
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

