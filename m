Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0811715BC9
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjE3Kae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbjE3KaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:30:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73907170F
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685442507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2b1AE976whQJl3Q7EHB138HWP9PHu2abmZeSJSchDMM=;
        b=XMaX1p6XxtaKkPq0XozK0n+g+/3EemFqLUXF/gPGzEkUBR8qHH24UFxr91/ViDbSwJSJpW
        8jCbZRNmU0WNHlxNYPSeb1FVb1zNMN8zp7iM9FqIq1jFHP+thwlvtJdM9UOlc/ijGL6vG2
        WoePePJ7ixenzVZtVR4Bk1GyWeol60Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-BAZyTwnjNPKbRU8hpmX3YA-1; Tue, 30 May 2023 06:28:26 -0400
X-MC-Unique: BAZyTwnjNPKbRU8hpmX3YA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5128dcbdfc1so3425156a12.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442505; x=1688034505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2b1AE976whQJl3Q7EHB138HWP9PHu2abmZeSJSchDMM=;
        b=NaXdlT0npsN6NuRUMSzTmSAgbGclB9w6wdlq7r2z17aeCvnatVLPhXI8eoilyZhzPl
         D3+W+T/Xphi3/s8X/G8GkwwY5qeNqVHYi0qzHwz/1jh9wdjmeNq2IyBqonMTiNasmAeo
         I13j0EzU/5p1xnG0w/aXBB/8vuG3G7qS2l3ZExTaqWvaAzD8cIbekFFk+3P2j6K353O5
         gD1ctbC74Uc5Kj9dE6+6q5zZwFaH9hQcVgR1aL4oeTiw12PgDfgui9Di0JAry540izgX
         WLw/cJXLN0Sger1xJ22z1EoRYp5ZGFgqeoK20tK5n4Hdxq1RP6GZGGDp46r39kBS5y3a
         LsfA==
X-Gm-Message-State: AC+VfDyh4Tpj3BpafG7JWQARgn2ADRdHouLfPdGfjxSwv8+pyVl9ASG5
        oWM/EP3LJNWVdLljcgxX/BK307tCedVDY3+gIiblfGYbgMGcSEsT5u6ND+KIC1aU3GJ6mLT7x8v
        Dfw/LmjHEKUjuNmjjoAMm+P8=
X-Received: by 2002:aa7:d815:0:b0:514:964c:4c42 with SMTP id v21-20020aa7d815000000b00514964c4c42mr1441249edq.8.1685442505173;
        Tue, 30 May 2023 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qUT7YhhUSNEEOWXHKh1/GHGLG6omqx6SInmX+q9c0x1JLfzHSB+xftFhIHjWmzYOvQyKDIA==
X-Received: by 2002:aa7:d815:0:b0:514:964c:4c42 with SMTP id v21-20020aa7d815000000b00514964c4c42mr1441235edq.8.1685442504893;
        Tue, 30 May 2023 03:28:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p3-20020aa7cc83000000b0050bc7c882bfsm4218865edt.65.2023.05.30.03.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:28:24 -0700 (PDT)
Message-ID: <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
Date:   Tue, 30 May 2023 12:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-22-hdegoede@redhat.com>
 <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/29/23 23:48, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The ACPI code takes care of enabling/disabling the PMC clk(s) for
>> the sensors as necessary based on the runtime-pm state of the sensor.
>>
>> But the GMIN code this replaces also set the clk-rate of the PMC clk
>> to 19.2 MHz. At least on BYT devices the PMC clks may come up running
>> at 25 MHz instead of the expected 19.2 MHz.
>>
>> Ensure the sensor clk also runs at the expected 19.2 MHz for sensors
>> using v4l2-async probing by explicitly setting it to 19.2 MHz when
>> enumerating sensors in atomisp_csi2_bridge.c.
> 
> ...
> 
>> +       ret = clk_prepare_enable(clk);
>> +       if (!ret)
>> +               clk_disable_unprepare(clk);
> 
> I'm wondering if _enable / _disable required.


As the comment says the BIOS may have the clock enabled
at boot, the hw won't allow changing the rate while
the clk is enabled and the clk-framework won't
allow calling clk_disable_unprepare(clk) without
first calling clk_prepare_enable().

All the sound/soc/intel/boards/*.c files which are
used on BYT / CHT do the same thing before setting
the codec clk speed.

Regards,

Hans



