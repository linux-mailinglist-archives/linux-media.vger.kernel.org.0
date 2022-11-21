Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217B0632238
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 13:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbiKUMem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 07:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiKUMeS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 07:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BB2B7E2
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669033922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oKpZnG0rPqEKAL5LH5lU2H5pnJQYE0Ll66mz17vxttU=;
        b=aQZZjmwZJxbRrLON3FFwhADpjmdzTQTQ7u5KdcQTmwwea7dpgxPdivEXpYFNSro3B0wNQZ
        UlpZXJ5Qxw62NYvhgsSnUfb+WDQ5r6GhX7BZjOCzR0BAeKGTKhQl3M7i7laBQZ0/HBfaiJ
        4kroQjPqz0h1s9PsJgJkxvbwlBL29Uc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-EtCvAWVWPX-6p0vDnzD77g-1; Mon, 21 Nov 2022 07:31:59 -0500
X-MC-Unique: EtCvAWVWPX-6p0vDnzD77g-1
Received: by mail-ed1-f71.google.com with SMTP id t4-20020a056402524400b004620845ba7bso6703417edd.4
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 04:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKpZnG0rPqEKAL5LH5lU2H5pnJQYE0Ll66mz17vxttU=;
        b=NKOV1Q65L1z+6DQN56zAgc6ZPbdXD2ZjmSXm27Ef5XeUO3GDscVIxZiBhUE8b32F0w
         HEoFAeVu5PYT3xeLc9T67tk9lhGyaI96X5sRSABY+qIRqyzh4LZZZIRMl/8RGSb38w6Q
         YD3EjyO1E+lppVJ7MIr/B65ZTVOz8tIIKu+NRV81560yyEpVGCHBfmiz0HUgUyaRB9mT
         A/FkZ5Ninu9NCtT4DZ4PFArWEW7o5O/tScBntxsbkQ/KjBWdUfzrA44juAKrMgGUGX0e
         y8UPQpaizhmLlFtKelS74nAqPm7uVdath/iC6jJmYTVrOw11/tvlTHFphMXt0Ocg2K8R
         qBZg==
X-Gm-Message-State: ANoB5pkeKXIjgnzmimfWgC7U5Klt5mEb42wE8x4RS+K22KHDcMGAzh9I
        bi34KVGJ8wiMADEe7vdUCLzbzEZS1F3DiAOJpQLbfWznkIyYzvj+XfomCyWvtTDIwuL8RzERM9k
        hqpvKjbI/z0firXrBTs+5IYg=
X-Received: by 2002:a17:907:900a:b0:7ae:f6e8:2502 with SMTP id ay10-20020a170907900a00b007aef6e82502mr15403869ejc.157.1669033917961;
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf640EdQG3DAJkEsZwbS/HagKIL/ehxH8OD0wvYhdnpJ42Koh7AN/IIMshwJnE29O/POqPlNsg==
X-Received: by 2002:a17:907:900a:b0:7ae:f6e8:2502 with SMTP id ay10-20020a170907900a00b007aef6e82502mr15403858ejc.157.1669033917818;
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f16-20020a17090631d000b0073d81b0882asm4915823ejf.7.2022.11.21.04.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
Message-ID: <a9862f25-3762-dbb1-3091-162dc3e6bebc@redhat.com>
Date:   Mon, 21 Nov 2022 13:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 10/20] media: atomisp: Drop userptr support from hmm
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
 <20221120224101.746199-11-hdegoede@redhat.com>
 <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
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

On 11/21/22 10:01, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:51PM +0100, Hans de Goede wrote:
>> After the conversion to videobuf2 userptr support is no longer needed,
>> drop it.
> 
> ...
> 
>>  	dev_dbg(atomisp_dev,
>> -		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
>> -		__func__, bo->start, bytes, type, userptr);
>> +		"%s: pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
>> +		__func__, bo->start, bytes, type, vmalloc);
> 
> I believe we may drop __func__ here as well.

Fixed in my media-atomisp branch.

Regards,

Hans

