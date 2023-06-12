Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D672C9F4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbjFLP0P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbjFLP0J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD5710F6
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686583521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i65rFJvHOOM8EKdbnoEWD9HJVU1NrRZ1Rpd5+Qn8ETo=;
        b=eRxXr6UFcwPWwmZXUSQQdS1oXHN4CP+TqRpaOOcaYdx0ZElgLHXDwUpPEFEMMNnJruap9R
        B0y1pX+B3LLv01F+VYd6ibP5jdCE3vZ1FRtMC39hsZkVU17kQA1UtFggz4QgQJ5gx6gnXT
        Ef+v/7kC/ki9+4qwtPTbEEX1niDZW4s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-PDH8UUuTP9GC8Z0yriCFZw-1; Mon, 12 Jun 2023 11:25:19 -0400
X-MC-Unique: PDH8UUuTP9GC8Z0yriCFZw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so413695166b.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686583519; x=1689175519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i65rFJvHOOM8EKdbnoEWD9HJVU1NrRZ1Rpd5+Qn8ETo=;
        b=iZID1QRuLAvSYhkjXIgIat5FNJ6SzREcQx6wLarn9h0KuGzT+ghDEK4nwTz9WjphuK
         SQ30x8sofFWQUb6Buql4PUVgUf7W3BuH1DZgKlyKpE7ZVE0G0oYgsHFTy+Bje3A76qlz
         era88GnmHKEdVF7qkWKbSvI48+a88pKlmogcTtLa7z/gYMP1tHXrCSzbwpsAKsqRZk0x
         /AvsJ8qaqir+Ck84D4CyPqoqwgDJ7RqLykD9vZs1h//rfqh8So0EdvWMLPZT2hhy1tfP
         PCXKCSRitpzt4g0jFF44ZU/NZDPo9ce1jHK62zer+iicHDjHe9x3VjIAYZnlYJSuRrgW
         dY7Q==
X-Gm-Message-State: AC+VfDw1LdxemPi6n4RW2CJtPhht0hp7eZK9ulEBnfvEi7gSwXUDdi9g
        wIW0gHbQYIhwvSE+Aq4aVj5aILZ4rDKsWGInRdH941fjcE2Uv1PTeSZWKYDoELMz7/n5KHTrT1U
        k2JNHSoBOvxp8mfUfSFoOm+U=
X-Received: by 2002:a17:907:9414:b0:979:65f0:cd07 with SMTP id dk20-20020a170907941400b0097965f0cd07mr8858676ejc.38.1686583518885;
        Mon, 12 Jun 2023 08:25:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Nc4IMoSj2ZsgsuRG+IJw0zAFVwvw9Uq2Ko1tpq5HVYaOQjhA9iU+dEIl9SarUmIgtYKzavQ==
X-Received: by 2002:a17:907:9414:b0:979:65f0:cd07 with SMTP id dk20-20020a170907941400b0097965f0cd07mr8858656ejc.38.1686583518494;
        Mon, 12 Jun 2023 08:25:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gj15-20020a170906e10f00b0096f4c9ce526sm5369256ejb.225.2023.06.12.08.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:25:17 -0700 (PDT)
Message-ID: <86828409-d95f-43a6-215b-b0bfbaf9f69e@redhat.com>
Date:   Mon, 12 Jun 2023 17:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] platform/x86: int3472: discrete: Fix getting
 active_value
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <CAHp75Ve3+XvsyrPauSzto0jU8Q1czM4Bj-qMquAc_WYK+ZHhxg@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve3+XvsyrPauSzto0jU8Q1czM4Bj-qMquAc_WYK+ZHhxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/12/23 16:18, Andy Shevchenko wrote:
> On Mon, Jun 12, 2023 at 5:16 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> acpi_object.integer.value is 64 bit, so to get bits 31-24
>> the value not only needs to be shifted but also masked.
> 
> Why? The type of active_value is u8. How does this make any difference?

Ah right I forgot about that, I'll drop this patch and drop the & 0xff for the second patch.

Regards,

Hans

