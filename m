Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C35A6796AD
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbjAXLcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjAXLcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C077DB74D
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vGVsObfOI177yum6BCbDOyJ7nngV9aW6rIVh+p+1Pvo=;
        b=itG4nxiaQkke3v94YGqzZ3SjwVJYyyG9lwG3boGxfW0tQJ6Ucagsa7CkGuiiExBPLVTT/P
        DbpAO8Py2XujfyqAjiqakqfCxwokOcck50KVl0+5RgRryFirXTM4u+3xvXWXQ781PCSOSo
        w7/RsOGqiwR05/YsEBzKmeFShaRyC4A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-gV5lGe8MN8avqtSRC7H9qg-1; Tue, 24 Jan 2023 06:31:16 -0500
X-MC-Unique: gV5lGe8MN8avqtSRC7H9qg-1
Received: by mail-ej1-f69.google.com with SMTP id du14-20020a17090772ce00b0087108bbcfa6so9597091ejc.7
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGVsObfOI177yum6BCbDOyJ7nngV9aW6rIVh+p+1Pvo=;
        b=rjriUA73HlnouasPDPAD54+uPLL93zXCk7ufd9cA8R4ngivzGqm3328JoJesGQyxw2
         tDDVtx1LcW4jhZKis/Bcv8ik4FDDzQGZDxlAzP0CGju53v6AY/mIJbvn/H8HUm1UpsYB
         hs+7mdIYzdaO02a2ic8mP3c6rot4L003WP2afJBblQs7HQAEFYxVjfMdbaom/yvRDAVY
         FfawpLvEU0A/RgkK0/jl4OU19ahr5cMkITwqwkKluGiIz7u5kf7LAwoR8OP7lCv9po0m
         vxPeSPBZnHKzkqQIKfgSWXwTGXUo4Ebv2sX4E9raVmbRBV3ZJUPVSxUEsnHYgDPuU3zv
         gSxg==
X-Gm-Message-State: AFqh2kp2z9kSsUuEumraKNg1QZMri4Xk5EgZmUTe4vT8wAOXEbw5IJ2q
        GBsGax1I6NtsgrQ8GGhaM3ZCqldVyZt6ep5y0fPBUmplIwiEvdWurT+sFjm0Ua66qIc8ocSJlFq
        Rfvj5WdIHhfj0RklH0Sz6M+o=
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id gx22-20020a170906f1d600b0086e789680d4mr28365515ejb.49.1674559875609;
        Tue, 24 Jan 2023 03:31:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDy52T5RX3cDKXyxpbVqtTbcuvG6OT5P/eIC2McW6lb9od5F52pT8maLr1v48f1YLYRa2fcg==
X-Received: by 2002:a17:906:f1d6:b0:86e:7896:80d4 with SMTP id gx22-20020a170906f1d600b0086e789680d4mr28365500ejb.49.1674559875447;
        Tue, 24 Jan 2023 03:31:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id et16-20020a170907295000b0085e05b4f815sm783557ejc.95.2023.01.24.03.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:31:14 -0800 (PST)
Message-ID: <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
Date:   Tue, 24 Jan 2023 12:31:14 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
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

On 1/24/23 11:51, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:
>> Move the setting of the mode to stream on, this also allows
>> delaying power-on till streaming is started.
>>
>> And drop the deprecated s_power callback since this now no long
>> is necessary.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> See below.
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-ov2680.c        | 101 +++++++-----------
>>  1 file changed, 41 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> index 1dc821ca4e68..2a8c4508cc66 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c

<snip>

>> +	if (sensor->is_streaming == enable) {
>> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
> 
> stopP ?!

Yes the format string is "%sed" so "stopp" gives us "stopped".

Regards,

Hans

