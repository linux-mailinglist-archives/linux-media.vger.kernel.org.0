Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA60632210
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 13:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbiKUMa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 07:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiKUMad (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 07:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDCABCA5
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669033776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/hWYzdY8pp69gJAN6Ao8jjyimu9MRzFcxQpQWDRT5hk=;
        b=AP0W9YTu+OhAu3/rPKzIVy5a0adxs/0wah0np/gQhqOMlQ1AKk7r3pG2ja7XCHK85nHm/d
        o9q+TkdBpIWFO4vE8nB7U8j4p+ya6qzmHflwhxqLQmKBJYJz25tkpWI+qROLaXxtm53zRJ
        nbsESuz0WJcvwxRtzHgHgqe7qnDvcic=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-Z_z-ckCAPXuwkIX4vjAmUA-1; Mon, 21 Nov 2022 07:29:34 -0500
X-MC-Unique: Z_z-ckCAPXuwkIX4vjAmUA-1
Received: by mail-ej1-f72.google.com with SMTP id sb4-20020a1709076d8400b007ae596eac08so6651037ejc.22
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hWYzdY8pp69gJAN6Ao8jjyimu9MRzFcxQpQWDRT5hk=;
        b=6cJ+8MccN8SI8yhcc2B9PZMDoJpdQGGjQu5uvskxS3EHlOUJ9/vLkqxc3khMsN+wDB
         bBhKMVJlT12qaJdRm0z7NBLwNkcW7gPQivH/Sd5qoPsNZqXixObtO00D4hzef295EZkk
         WAWJuIaydhv0K+13ZkLHw25a3IkCRoAq9xb0/YG2dSJ0ASDGccUse0Gomgzd+fj7Q8xc
         xY3NqBCxT7MBISQCmdMGE2SvvU3A+x3BneFZhLRS1x2dgbHyH5BWNmH7e7w0ijcYQk4h
         Fa9vCpvnXWT47ZGKXdQN83T4Wp5DSK0Mc4uQPfXtdmrsXISnd2F7G1nXtXlRcjYU9pvm
         xIrA==
X-Gm-Message-State: ANoB5pk4ERqCWOMXZRJr2Nk7dXN46F0HLGLKPbcF5fQUFi8wQUc4zi1W
        ZWwmPupIWCYi8zvBm6lVtWV6wCK2McOKWIzsKIrL/FrQh3wkilc4rm28oY+HrS0mD6IFIQ8gISA
        5Im7fDuEPoWb7aTydShhyDaM=
X-Received: by 2002:a17:906:81cc:b0:7ae:4373:c8aa with SMTP id e12-20020a17090681cc00b007ae4373c8aamr15574115ejx.466.1669033773643;
        Mon, 21 Nov 2022 04:29:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5iTHPCffdDV1lG7rCc7HhYezcsaBiBmHzgqsviLz35yyEF+pLC+yeuGaXVTX9aqaw5T0xzzQ==
X-Received: by 2002:a17:906:81cc:b0:7ae:4373:c8aa with SMTP id e12-20020a17090681cc00b007ae4373c8aamr15574096ejx.466.1669033773463;
        Mon, 21 Nov 2022 04:29:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a170906805400b007919ba4295esm4978724ejw.216.2022.11.21.04.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:29:32 -0800 (PST)
Message-ID: <96be9818-4c97-b9fc-a694-7a46e4b8f108@redhat.com>
Date:   Mon, 21 Nov 2022 13:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/20] media: atomisp: Log an error on failing to alloc
 private-mem
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-6-hdegoede@redhat.com>
 <Y3s9wLqlHojRq8jS@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s9wLqlHojRq8jS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/21/22 09:58, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:46PM +0100, Hans de Goede wrote:
>> I managed to trigger an atomisp_css_start() error by pushing my test
>> system towards an OOM situation, this resulted in the following errors:
>>
>> atomisp-isp2 0000:00:03.0: alloc pages err...
>> atomisp-isp2 0000:00:03.0: hmm_bo_alloc_pages failed.
>> atomisp-isp2 0000:00:03.0: stream[0] start error.
>>
>> But it is not entirely clear what the root cause of
>> the "alloc pages err..." error is. I suspect the root cause is
>> alloc_pages_bulk_array() failing. Add a log message to make
>> the root cause more clear if this is hit again.
> 
> ...
> 
>> +		dev_err(atomisp_dev, "alloc_pages_bulk_array() failed\n");
> 
> I would put it after calling the below function, but I'm not sure about side
> effects (if the below can hang or something else).
> 
>>  		free_pages_bulk_array(ret, bo->pages);
>>  		return -ENOMEM;
> 

Fixed in my media-atomisp branch.

Regards,

Hans


