Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29DD42FC7F
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242828AbhJOTus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 15:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20033 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242824AbhJOTug (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 15:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634327309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=BhVWlqIJXYy/XX4lYp3F2SGsqwK6JLd7cVF7o3roGTNwblSkctLEDFA0zG7kYKmVI9hSLP
        ODQvWDMVjcah/UvzKWPrlJGovFkM21v5ofzM+R4RTUidtZdElB3BdCqIU9kblC2qNeorsH
        XXS1ElWh6ww+jGeLHpOV7Aiu9Q25B4k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-In60MiTpMriOGKMb6cVGdA-1; Fri, 15 Oct 2021 15:48:27 -0400
X-MC-Unique: In60MiTpMriOGKMb6cVGdA-1
Received: by mail-ed1-f71.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso9233291edv.9
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 12:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1hH4W57qRLgsm0O9+HdRUSpD7zjpM0ZP5d2Uict6qKQ=;
        b=MdnFuuN4Sy+urcLlCGVz9980D5Qdhr9GJejUuoGW8XL7CjTN0EwfY0xpVRH0UU93im
         OaJSu9RwOGFQqMwj/NMs+gyNaZzBjN1/b0UW2F9kqh4eyJ+bOxvJaiijOynLswirJ3lX
         ZFUl81VNXRm8NdzQHC+b36p0yD1BNA/wF2jyGP1hznGOlqV4E8l5jh9ViBbKna10oYA2
         LqRrYdeD9XtnbQv/L1xsYdvztg8WV+ic081L42EOsTy/ws9D7TZ/Xcqggn6YIeO/iJQd
         3sKtlCpsvRFN9abFSE9JPVV0H+J8E1fnhYy9iOIpvPE+p1R51qcj6LuzGs+4pchk7hyD
         Ly+Q==
X-Gm-Message-State: AOAM531ro3Bqnr7xc2jQZfyGhFHGEXpTIFVAjXHvhvtJp8e6hJcQ5krB
        vBGR5Tc2SBKX9+fYdtAW7eqxOWpT4ZQAR+c/Mx/KnUSFq0DQd00q8snUDgsjSh8+EOlgNhBJ3p1
        MmnO6ufKyX45O85iPj6LVqLo=
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595778edk.165.1634327306299;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBOCFkCR2vdRzxrwAi1cJBTtzNkY4QmZY6+q1a1h0qqrN3XXenbeNF2Zkd++CQueWa9xXBvQ==
X-Received: by 2002:a50:9d48:: with SMTP id j8mr20595754edk.165.1634327306125;
        Fri, 15 Oct 2021 12:48:26 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id v13sm6036701edl.69.2021.10.15.12.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 12:48:25 -0700 (PDT)
Subject: Re: [PATCH 05/12] regulator: Introduce tps68470-regulator driver
To:     Mark Brown <broonie@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-6-hdegoede@redhat.com> <YWQU/SYTT5Vk24XH@sirena.org.uk>
 <f6f2d7e8-fdb8-ed64-0cdd-65aded9fc42c@redhat.com>
 <YWmwZJvDYjPWJdb4@sirena.org.uk>
 <d0d1dc05-4cc6-2f47-88a9-700cfc356d86@redhat.com>
 <YWnPaI/ZECdfYre9@sirena.org.uk>
 <843f939a-7e43-bc12-e9fc-582e01129b63@redhat.com>
 <YWnZIZTPiuAIazV+@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c595b143-d7ed-e76b-7734-e03d14e0f76e@redhat.com>
Date:   Fri, 15 Oct 2021 21:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWnZIZTPiuAIazV+@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/15/21 9:40 PM, Mark Brown wrote:
> On Fri, Oct 15, 2021 at 09:27:50PM +0200, Hans de Goede wrote:
>> On 10/15/21 8:58 PM, Mark Brown wrote:
> 
>>> I am very confused about why it's in the driver without a DMI quirk
>>> and/or clear comments about why and saying that this is a terrible
>>> example to copy.
> 
>> The DMI quirks live in the ACPI glue code under drivers/platform/x86,
>> that code instantiates the MFD cell and sets the platform-data
>> as part of the cell.
> 
> I can't see how the quirking gets propagated through into the driver and
> I'd really expect that in a situation like this the platform data would
> be passed through as platform data from the code doing the quirks,

That is exactly what is happening here. The platform_data in this
case is just an array of regulator_init_data pointers (one per
regulator in the PMIC):

struct tps68470_regulator_platform_data {
        const struct regulator_init_data *reg_init_data[TPS68470_NUM_REGULATORS];
};

This struct gets filled by platform specific code under drivers/platform/x86
(in later patches in the series).

And the regulator code in this patch consumes this like this:

                if (pdata && pdata->reg_init_data[i])
                        config.init_data = pdata->reg_init_data[i];
                else
                        config.init_data = &tps68470_init[i];

                rdev = devm_regulator_register(&pdev->dev, &regulators[i], &config);

So we have the code doing the quirks determining the regulator_init_data
and passing this through platform_data, which AFAICT is exactly what
you want?

Regards,

Hans

