Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D614E72B390
	for <lists+linux-media@lfdr.de>; Sun, 11 Jun 2023 21:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjFKTRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jun 2023 15:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjFKTRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jun 2023 15:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80096E42
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686511006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BO76KSoZdyA68Oh2Q2Smu04r7xPvaYnzigaEgXeWJLA=;
        b=MxMthnwOmowYiyWS2P8UmiVPbjdbFtKM5J+zQ9uvF2FyOmgjqAYYmhXZBBdbzUk/s99XHE
        wloe36+kVCbplhViVJtdoRFHaEdYL/34AeJdEorOouNkkBfchWVtGysRg3U6GLcFu1blz2
        Ge45qfcTwi0V35K4pNCIQTiBGCZ9AZI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Ndkn931oPkG5DVi0kgE6lg-1; Sun, 11 Jun 2023 15:16:44 -0400
X-MC-Unique: Ndkn931oPkG5DVi0kgE6lg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso428297666b.2
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 12:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686511004; x=1689103004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BO76KSoZdyA68Oh2Q2Smu04r7xPvaYnzigaEgXeWJLA=;
        b=NrwgPY42vqL2s7DjELhSluhLF8H0psyfAxecDFk5Vehe/vsl9KV3mV5Bp7u3rOj5df
         KE0S3cEFXQsa9hl+My/4t4oicJ6f1Q2UOBk5rAKhHW+UqiK1V31P31laT+ACOA4VdDZN
         EDmVJc1aFLawd2CGZ+wsE7fxho3uLKBHMAQ7xU5rxjbQ8qMWXPrqRqxXvz8TnM5ilQnc
         dzfYQ94l+7zoKj7JBDURt5I6gCRplbvhL9Zic23hVGEC9+RQ1w1pCC01a/nHSMRLywf3
         gw4dZa6/R5h1PblmK26F43H30aD0BQRl+XZYWA5raOEmXVbIgVPDZf9PuiEsRUR9gFSH
         vGHQ==
X-Gm-Message-State: AC+VfDxYAxxoQQ8IIeX0t7AHg7jlEASNBtlVip0u/TVd8O+wKOG/Qia8
        6gmoLjzzdWgTA652sqs7NTzPBIkfKLqaEDxQ48pQ39Zys/kPOzK4Z6N6ztm1zPk0JB/sS5q43br
        wvRPMi895f06pd/1LsyQBN30=
X-Received: by 2002:a17:907:62a0:b0:978:afbc:676e with SMTP id nd32-20020a17090762a000b00978afbc676emr9060905ejc.6.1686511003883;
        Sun, 11 Jun 2023 12:16:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RZuyCAhzQt1oVmLBGJz+xWwXWd0/2Mqtk7/rOOo6PSZg2etX3RdQXTQkM9x8Hk7/CE9JNZw==
X-Received: by 2002:a17:907:62a0:b0:978:afbc:676e with SMTP id nd32-20020a17090762a000b00978afbc676emr9060888ejc.6.1686511003617;
        Sun, 11 Jun 2023 12:16:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a19-20020a17090682d300b009775eb0343bsm4168979ejy.79.2023.06.11.12.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 12:16:42 -0700 (PDT)
Message-ID: <d2d2bc9b-9d75-d96b-d6fe-8a4bfa532a27@redhat.com>
Date:   Sun, 11 Jun 2023 21:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use
 .probe()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Corey Minyard <cminyard@mvista.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Haowen Bai <baihaowen@meizu.com>, linux-media@vger.kernel.org,
        Tom Rix <trix@redhat.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-staging@lists.linux.dev,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        kernel@pengutronix.de, Jean Delvare <jdelvare@suse.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
 <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
 <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

On 6/11/23 13:07, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, May 24, 2023 at 05:16:43PM +0200, Uwe Kleine-König wrote:
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
>> back to (the new) .probe() to be able to eventually drop .probe_new() from
>> struct i2c_driver.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> the four other patches from this series are already in next, this one
> wasn't picked up yet though. There is another change for staging: media:
> atomisp in next via Mauro's media-next (branch: fixes).
> 
> Who wants/should pick up this change?

This patch is already in media-staging:

https://git.linuxtv.org/media_stage.git/log/?ofs=50
https://git.linuxtv.org/media_stage.git/commit/?id=625ac9af384481e8644e0653a4aa472aa95f0395

So this is on its way to -next already.

Regards,

Hans


