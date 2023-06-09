Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40726729CE1
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241132AbjFIO3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240307AbjFIO3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB8A3590
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686320896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r0fW7HRI6r5ku1SJy3t8UWhy3FwKuC8nkGvN3ZLWkP0=;
        b=httOj7NQUzNBuytyw/hDT3DpnPiqeCt6BBMKinqWVj2lPJSm+uZkf0I8qyTJmSQzrC8X2K
        q6nGq8+AmhQuaOY8tXi5j9+q7HQpqP/kxv1wyEZUwKIIZhTiacjRIM3ZyKyX4ULz51mCoT
        r0zTNeWFFMNE1qNcGnCKiZlamBSKiqg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-36-vD6oLMAutfzPwLaj4LA-1; Fri, 09 Jun 2023 10:28:14 -0400
X-MC-Unique: 36-vD6oLMAutfzPwLaj4LA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9745c72d99cso225788266b.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jun 2023 07:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686320893; x=1688912893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0fW7HRI6r5ku1SJy3t8UWhy3FwKuC8nkGvN3ZLWkP0=;
        b=I36TchrOrqnvEbbbZA1D1QECpvQ67S0WYSvB9vbG0TLagnIYybzHjoVWJwy1/H6dmu
         oaq1p7zG8jP/7RbS4ULTeJI0St2WxIuW1RqJ/pKRAE0TCH7nvVErrc5e5bVW5Ccgk/FS
         OCVLNDXvmx3jAKQh84WPupYVsjnGHMOFRwLTQxnni0q+MILvdZM1X0Ym8oHiFmvqQ5MW
         YZrDh3GeNg/a96QEN02cO0/HLFbImlWInhU6OyomBxFNMJg7hoQ3xInXVzQg6mZoXIvl
         lVpWCt9u6msPobIOO/Upvh+zIZb5Wac8Qw+CjN63/JrbYe5L/rY90LOXYlz/R5v0NPzJ
         4JTQ==
X-Gm-Message-State: AC+VfDy/PUT0xTS51G2l3jWhHV0kn2hcfbrkftZiHxRL8zRAeR++DiDN
        NWdJ1Hwr1dB8TicnqReb3cCEFqNWAbTrWJLJtHljOpz2WThvZQhVBLSjdn6Ainkll5rrlQ+xnGY
        l1Owc84fufJwq1+Sy/DkN0DY=
X-Received: by 2002:a17:907:9412:b0:978:6e73:e833 with SMTP id dk18-20020a170907941200b009786e73e833mr2194896ejc.45.1686320893536;
        Fri, 09 Jun 2023 07:28:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79XpgDseMC9d1XxgmqiMpNv90VLWgZDIQUvpUPgXAmIZTbRLwpx/DiIhjjkub56e+ALCAwPw==
X-Received: by 2002:a17:907:9412:b0:978:6e73:e833 with SMTP id dk18-20020a170907941200b009786e73e833mr2194884ejc.45.1686320893271;
        Fri, 09 Jun 2023 07:28:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lo11-20020a170906fa0b00b009784915c660sm1367427ejb.136.2023.06.09.07.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 07:28:12 -0700 (PDT)
Message-ID: <9195b0bd-5375-9df1-793d-1ccdc715833e@redhat.com>
Date:   Fri, 9 Jun 2023 16:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/28] media: ov2680: Bugfixes + ACPI +
 selection(crop-tgt) API support
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <ZILyvPcLNwBscZdk@kekkonen.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZILyvPcLNwBscZdk@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 6/9/23 11:37, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Jun 07, 2023 at 06:46:44PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> During all the work done on the atomisp driver I have mostly been testing
>> on devices with an ov2680 sensor. As such I have also done a lot of work
>> on the atomisp-ov2680.c atomisp specific sensor driver.
> 
> Could you wrap the lines at or before 80 characters, unless there are
> reason (generally other coding style rules) to keep them longer?

I can certainly do that. But the kernel has stopped requiring this now
and I often find that sticking within the new official limit of
100 chars leads to IMHO better readable code the needlessly breaking
the lines in 2.

Are there any specific reasons why you want to keep enforcing
the old and obsolete 80 chars limit ?

I must say that inconsistent enforcing of a 80 vs 100 chars limit
across the kernel is quite confusing for contributors.

E.g. I'm pretty sure that if I had stuck to 80 chars with this
patch-set from the start that Andy would then have pointed out
several places where I had needlessly broken a lone in 2.

So having 2 different limits leads to reviewers contradicting
each other which is really not helpful.

SO IMHO if drivers/media is going to keep enforcing a 80 chars
limit then this needs to be clearly documented (with rationale)
somewhere. Or did I miss this already being documented somewhere ?

Regards,

Hans




