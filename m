Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B35476E413
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjHCJPw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjHCJPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BA9DA
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691054103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qenpH05CMTFMah/ZsfQQOjptnPSTkcxy9wGpGUuSsNs=;
        b=BUV6xv4fJlW+mZoKC3h3oMjBDTygZQ0cFs3IzPDQx31gA4H+8ZJCJMwHhUPpx/CoUU9HUg
        vJcJb5ljlqSSHZ3LFYjTB3FS0mLSrla0YyCdBMzKB5XN7hvobvUOvQTZbmlhy0vU4Z65r/
        Ff0M1pbxaFPsMg4m/zVFXUaW1zY/D9A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-evLf8ATrNsOOTzDabfunBQ-1; Thu, 03 Aug 2023 05:15:02 -0400
X-MC-Unique: evLf8ATrNsOOTzDabfunBQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-522c1b1e7bbso498117a12.1
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 02:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691054101; x=1691658901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qenpH05CMTFMah/ZsfQQOjptnPSTkcxy9wGpGUuSsNs=;
        b=hVatUGuK58OSvfQaUF/DosZduX7IEpHCIWaNeDjsqQ+0OsPz8NxP0BgwoC8UQRRlgj
         ZLAXvy5pI7bUTuGXqsji4B9sUyiYvXWlCkDyUIpZoW1RE3ntyNt87eFhiCVkk+eMqdQ8
         W76bOFKfj98tb/THAG8sBKtuhUdEQPcgBoHCM9vrG2gLhUlusLfcNPoyDj3RaaDOuDVl
         /pxx58KtDszSk3WvdCMPahqyi63vZWPhcKV7C3uOB9ay8LfmeXZn8K1JFh/ehVJBqNzz
         mGU1kAV62f32Zy7FJU0VE9NtjM1ixmxJM4JdXIvv/g3eX9fE0Eu/1WUhAuH85y5KIFF0
         lMzQ==
X-Gm-Message-State: ABy/qLbKtPbH/aGsrVx0zUdrDIf/EfVy2Nrxil3dv4uCQyJc02GbexYC
        WF7E0SbmG2euGeI6QQcf4exQLDy4zu2OFxExkoEF52VljwK2WA99DQp8v+ECXH5/A2pNjaykM1V
        ZKzzmh2R6gv4PjoguNkmv9fKC5iJK+aE=
X-Received: by 2002:aa7:c919:0:b0:522:b1a6:4aa8 with SMTP id b25-20020aa7c919000000b00522b1a64aa8mr7134880edt.41.1691054101132;
        Thu, 03 Aug 2023 02:15:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEqDdTyk2QVSOT2Ft5HdFufGIaaHqXKih+Y8B0WZoqSFtWl3BWa83V1KAOHRdi617w5I2tgHQ==
X-Received: by 2002:aa7:c919:0:b0:522:b1a6:4aa8 with SMTP id b25-20020aa7c919000000b00522b1a64aa8mr7134867edt.41.1691054100784;
        Thu, 03 Aug 2023 02:15:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o12-20020aa7d3cc000000b00522d88e8c55sm4451121edr.91.2023.08.03.02.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 02:14:59 -0700 (PDT)
Message-ID: <dec04f64-b89a-c639-21d5-4583c5414e6c@redhat.com>
Date:   Thu, 3 Aug 2023 11:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 17/32] media: ov2680: Add support for ACPI enumeration
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230802173046.368434-1-hdegoede@redhat.com>
 <20230802173046.368434-18-hdegoede@redhat.com>
 <CAHp75Vfyx89HsN_U=TjOGSrGXa8BgDNnZZhxyBCwUmNvYcss1w@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vfyx89HsN_U=TjOGSrGXa8BgDNnZZhxyBCwUmNvYcss1w@mail.gmail.com>
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

On 8/2/23 21:31, Andy Shevchenko wrote:
> On Wed, Aug 2, 2023 at 8:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add an acpi_match_table now that all the other bits necessary for
>> ACPI support are in place.
> 
> Would be good to add a couple of words about ID itself:
> - is it the correct ACPI ID or not (confirmation from OmniVision, if any)?
> - is there a product with that ID in the wild (mention, if any)?

Ok, I'll add some text about this to the commit msg for v5.

Regards,

Hans

