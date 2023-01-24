Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BFF679957
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 14:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbjAXNgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 08:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjAXNgT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 08:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFD621A04
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674567332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ja1Boq6JcSFXCMZhXgFdCI/xjNx9lt77gCIPTTWiLqY=;
        b=CXxx2EiQzEvakN3BjzgtP5j3op9MHOUfyrC0B9SNzS0fibjGSMOTtGutT9mSpjF6jYffXh
        AA09UvgiqgDshWPybzM6voebe3QBfrywrvd2XBzy22/IoamFCOKT/OdPlJ7PfLkxvF+bfb
        1myOQpTV3iHghtCSLCxO7TpuFev7Nzs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-QY_q8aJgNGqamAQwGJc5Mg-1; Tue, 24 Jan 2023 08:35:30 -0500
X-MC-Unique: QY_q8aJgNGqamAQwGJc5Mg-1
Received: by mail-ej1-f69.google.com with SMTP id sc9-20020a1709078a0900b0086910fdf624so9931355ejc.13
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 05:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ja1Boq6JcSFXCMZhXgFdCI/xjNx9lt77gCIPTTWiLqY=;
        b=oNzn/zB1jUpdMjUR3iJeKb0KCkRtNmhmBMdJOY7lvKiLM2Qu1F9nyfZ6pBxS13bHeG
         2NuHI0tr8z+5OKzCzJU9vPajJ0fxaRAN2WCdMv/nHRfIVJuPM44G5imdGRwUXWuw8WGX
         2WeKoKjTgAZOy+aJ7r8O5mDyCN3BzkvPK1S5c/5necnbNRFFceMHd11LHPiEa+QLAT60
         sKa9FpvxD2qVr7yYB2/lFeaxlNqueYiSQ0BnSOTfbyYGmCwd+BmFIlnujo5MS5tHo0v6
         WHOkdKfxIwE+lbRp2HFt0NS/5IeIlDH4eltWZYYTXeNsTtyG9I1tEZDCmIXfvVL1VV2l
         BbbA==
X-Gm-Message-State: AFqh2kpMStw5tlCfTVEMzNNZ72vvZMBOZgECKlOFcRRz4H6Sbw6y8S+K
        B11r9tyhVRUKRNQNXzdJKTe6q/V9zYQkVoiQ4iqZjMK4hjcexlUYeHGPGfdcaSF+8vFN2Tz4VdL
        9d1LQ81I6c50FNl5V+bbybYA=
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr41535513ejc.3.1674567329582;
        Tue, 24 Jan 2023 05:35:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt//+kuObY87nZxu3COedx8quy/73VjZYsYfGZKXBUbXcz+uJPJh4p54v4VFtWUDLdyM+d6xg==
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr41535502ejc.3.1674567329376;
        Tue, 24 Jan 2023 05:35:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rn3-20020a170906d92300b00877a9d2e5e1sm915695ejb.79.2023.01.24.05.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 05:35:28 -0800 (PST)
Message-ID: <af5eed6c-7913-cd52-4d87-ce3029137f07@redhat.com>
Date:   Tue, 24 Jan 2023 14:35:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till
 streaming is started
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-47-hdegoede@redhat.com>
 <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
 <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
 <Y8/UeKTin7fyUrLl@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8/UeKTin7fyUrLl@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/24/23 13:52, Andy Shevchenko wrote:
> On Tue, Jan 24, 2023 at 12:31:14PM +0100, Hans de Goede wrote:
>> On 1/24/23 11:51, Andy Shevchenko wrote:
>>> On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>> +	if (sensor->is_streaming == enable) {
>>>> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
>>>
>>> stopP ?!
>>
>> Yes the format string is "%sed" so "stopp" gives us "stopped".
> 
> Can we, please, use full words, so it will be easier to find a candidate for
> including into string_choices.h or so?

Sure I'll update this before adding it to the PR.

Regards,

Hans

