Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA529746FC2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjGDLWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbjGDLV7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:21:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473571710
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688469637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qjcTdXqqMGx8xrvKr2zrHmdoP8jihf1wEGtwv6LUkrk=;
        b=b+mCGQdM1IeXZ0hQUMb3KUDdFoFvKDetDGdPcxY6F1XoCIRrNkQvaJJEAPI1h9JNndPsm9
        dDjJh/aJgOI63vjLeWtKqj2uyIeL4Tar9ZxlD1BGQ1yaakepJ0Hbt4MAQ+sMy33O/iN0jP
        Ay1z26GZpbDDspQnRv7JPdYED/qcQro=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-QpKocYbMNrWlFV4UZMD0FQ-1; Tue, 04 Jul 2023 07:20:36 -0400
X-MC-Unique: QpKocYbMNrWlFV4UZMD0FQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51d91ca5635so3569695a12.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469635; x=1691061635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjcTdXqqMGx8xrvKr2zrHmdoP8jihf1wEGtwv6LUkrk=;
        b=AUFvPuAv3O6fNA4wqcKZmp9CLi/D2YrKIugdjlOU6WhwjEMsseXxZLHEXq8hm4Ozk3
         8LgO4R/gEbt5x3HuJt1Gq4Zs0vmBxjv+f3gKXHBLjSE8hELfuuwXEXCgIfXEXJ/mI07o
         vzvgWS38yOp3Znb9zIPIBvqbi0sUvJ+uWay197E9bqNnxHhNIEcZPGDhRixy9zRL0eD+
         CxAyZQHSFT1BlUJECms6TtQdj4CTI1+AyQ+Llns7l2IzmncmwB8b0Dw2XM5u7iNr/V9k
         AC7b6maQG3Nc6FmeHLIjfTzl3Bh3VT/eeGmM4SrsYeD1plCNOT+drZix4WSVcvP/Tq6R
         B8xg==
X-Gm-Message-State: ABy/qLZHybUz2S9KI2YFK2he6RpgP7SqZr1GZx21UcrWNGW1eZBv7MEZ
        ai6FvoG+N/g94jtLwq2zlnB2xgFZse8UeJThqHZ2gi1qXkHB/rstJTVQMR6XgqHugycbDAQEe38
        f7sXX09dKt/5vjWqEhGB8eYY=
X-Received: by 2002:aa7:c447:0:b0:51d:7fa6:62ca with SMTP id n7-20020aa7c447000000b0051d7fa662camr9265881edr.14.1688469635002;
        Tue, 04 Jul 2023 04:20:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHvWL+kCov/cvKQu6sGkMPQ5vHEdYoh0OlAEU8PQtRHceBAo68/poQfQJaRe1zR3Ef0DY7Y/g==
X-Received: by 2002:aa7:c447:0:b0:51d:7fa6:62ca with SMTP id n7-20020aa7c447000000b0051d7fa662camr9265865edr.14.1688469634716;
        Tue, 04 Jul 2023 04:20:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q14-20020a056402040e00b0051d890b2407sm11309150edv.81.2023.07.04.04.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:20:34 -0700 (PDT)
Message-ID: <0dc01c91-dfe0-a422-06f2-0f6ae8257a5f@redhat.com>
Date:   Tue, 4 Jul 2023 13:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 09/15] media: ipu-bridge: Drop early setting of
 sensor->adev
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-10-hdegoede@redhat.com>
 <CAHp75VfH1nE3KxOTVpJ6=7naMvU-wpjai1Gg0JPSUXkWADqRaw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfH1nE3KxOTVpJ6=7naMvU-wpjai1Gg0JPSUXkWADqRaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/30/23 16:30, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 2:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> sensor->adev is no longer dereferenced before it is permanently set by:
>>
>>         sensor->adev = acpi_dev_get(adev);
>>
>> So the early assignment with a borrowed reference can be dropped.
> 
> Ah, now I see that that change was temporary.

Ack

> Can we avoid backporting
> it please?

Patch 1/15 does fix a NULL pointer deref oops, so backporting it would
be a good thing to do IMHO.

Regards,

Hans


