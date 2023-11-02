Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2687DF460
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 14:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbjKBNzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 09:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235129AbjKBNzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 09:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375B083
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 06:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698933298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+z6C1FW6gq5BbqpkNht0itNC7pImcA5/jUZv9Ss3E8Y=;
        b=gCcL+yHhKIn70w1U10jG3j+0YhpqaLbZnf0EtAA5TnLs2sdzMUoLh8NxoJhC2OkmiC5Xuf
        AX3W6a+U5nE1+6BX4IkUQT5zvXsFGfykcv8Xt3xh65dVsn6gNzEhN8f7HuccJ3jx+ApdLa
        ojAx34u3OM+jAEaR5CK+4pjpNgWZNCM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-hsTof_9QNJKVYo8lhfitSg-1; Thu, 02 Nov 2023 09:54:57 -0400
X-MC-Unique: hsTof_9QNJKVYo8lhfitSg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-778b3526240so102000185a.1
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 06:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933295; x=1699538095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+z6C1FW6gq5BbqpkNht0itNC7pImcA5/jUZv9Ss3E8Y=;
        b=BS7Ip5HhXfKJhjxmzQoAV9XT1pJxImmna/oI7YKgHoQMOHUbp2jwBWliLgVoBLZfFK
         o3dzgliz4cDMOU3mmNkt0S45jGIWkqv4EEQOBx4W4DUhNSdkWgbCbaz24KlRQ83MO08B
         On+q5EOU/xl1WEn8K0qpMadzEgYu5NqISL1OyMnW4q/5h1xt62MqhYpacNzfnvLpLZa9
         n4kJ1zzHcfnTHp9lVehEViiJpTK6Cr7JfVHDXPLJEb6FJsc6aQnnWwC6WeN9WI+/Fxrg
         alMwZ4i41enADrtisWH2RDzLj+VifCg55tX6hXbQsg4RTn9L9zHUONjrt+yrkcJ8pRCz
         7q+A==
X-Gm-Message-State: AOJu0YympdV4i1RBmSGBXBF2n2CpxpQZp0/116tuvQAVyjifRO+WCo0e
        tzdhnJc8UbmdWwI12n7V+aYYNHL7QXkDZhVkvUAGJrD8DWGX9Q0Ahmve2fhgyndNUE8VmecIZDJ
        Prjo9OgTfjcB3n0Qz1z5ZHng=
X-Received: by 2002:a37:c247:0:b0:774:15ad:f34c with SMTP id j7-20020a37c247000000b0077415adf34cmr18693063qkm.70.1698933295657;
        Thu, 02 Nov 2023 06:54:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESxR/9k4uzKkbF3gxkwpKgyMV9nnhLEuDz+Yg8psv0teJxq6Bh5KlPfT1VXnFWXJ8I/5BVvQ==
X-Received: by 2002:a37:c247:0:b0:774:15ad:f34c with SMTP id j7-20020a37c247000000b0077415adf34cmr18693047qkm.70.1698933295387;
        Thu, 02 Nov 2023 06:54:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x16-20020ae9e910000000b00770f3e5618esm2351408qkf.101.2023.11.02.06.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 06:54:54 -0700 (PDT)
Message-ID: <e4da877a-e499-6ddc-c0cb-cffdf41e2a1b@redhat.com>
Date:   Thu, 2 Nov 2023 14:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>,
        "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
 <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUH6RYayRSb-hykQ@kekkonen.localdomain>
 <DM8PR11MB56533C342B834265A3F64D1499A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <ZUOluxSV0eqZi9v9@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZUOluxSV0eqZi9v9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 11/2/23 14:35, Andy Shevchenko wrote:
> On Wed, Nov 01, 2023 at 07:38:24AM +0000, Cao, Bingbu wrote:
> 
> Side note: Can you please Cc me in your v2, I believe I have some comments,
> but let's see a new version for them?

I'm a bit confused, this is a series written by me not Bingbu
and this series has been merged for a while now...

Regards,

Hans




