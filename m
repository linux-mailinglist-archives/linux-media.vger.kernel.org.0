Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C8276ED5A
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 16:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236211AbjHCO6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 10:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbjHCO6L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 10:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D32173F
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691074649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fuyjb1Cccus6UotRAr0UxgPDDuaangXpnKlnjeG6whc=;
        b=A9JE0uNTa3Ep2U3Q0kjGMR1M/jeCx1kb1LIe+iiyHOPmRBXXy8eqaGwLlZ/ZY1/6RpWQsI
        lz4NHtjfwt1Af1PSn1+0XtrHrP7usyEiZ8L2UqwuG2MKMf6Ov1vqYTepk7XUUSQFdzxNMb
        LaYlEqkSOhTO3XmacgtoAqZlAi5bl9Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-I3CfTTIDNN683s-YjcwJ3g-1; Thu, 03 Aug 2023 10:57:28 -0400
X-MC-Unique: I3CfTTIDNN683s-YjcwJ3g-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993d5006993so74947966b.3
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 07:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691074646; x=1691679446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuyjb1Cccus6UotRAr0UxgPDDuaangXpnKlnjeG6whc=;
        b=NVjD8KzAbwocB/QYa9zXV7Zti6f5IwW8rIIx86bIvFfrduRoUOmAPKXUZhtZGM/iIt
         bmol/KZzPyzwve4cSfoENph8OETnQrPVMBfpfPc11rvWFGgHshvj/KBAlCWNsTuEi+tc
         E+4lBHcUZUVp600Eyiq7qLcSay4yUbA66uIzaM6U9g5wpjOPk/QuCxwxTD4nfW28zsXJ
         N8mRfRzPoyZEmqr04qMHmVs1hoG0vHSENVaj++xiEnZqFgnz1XMZc7tb/h6QFyd+ZjnL
         MU8Nxhi2JfopnYGcAynG/A7pbt5/qXQaCmPK3Ih2eVgC7Ti4TpG7JMzEcN6IzjT2XROE
         DykQ==
X-Gm-Message-State: ABy/qLavq22HpXXn5m+VeIDKX42XuCKEaLDj6EFtF1pMqJzuvkc+9F4r
        1UljKaNGguaSFEcDDaBDxmxq7TdLdnN4iS1L6LTWSXweR8Cyp5lB2hLirzoUjbmiT1zP/0Ydbmh
        LHJNpLapHmWIFaxr1/MUPtz4=
X-Received: by 2002:a17:907:b0b:b0:98d:fc51:b3dd with SMTP id h11-20020a1709070b0b00b0098dfc51b3ddmr6938488ejl.41.1691074645853;
        Thu, 03 Aug 2023 07:57:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWqwZvhEBZ2qhK3XO0raGpINZqVB3uCNVO4Uu8FSScgqBS0h15EEpE8q2CcgERg/EPXV4TCg==
X-Received: by 2002:a17:907:b0b:b0:98d:fc51:b3dd with SMTP id h11-20020a1709070b0b00b0098dfc51b3ddmr6938478ejl.41.1691074645620;
        Thu, 03 Aug 2023 07:57:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id br7-20020a170906d14700b0098ce63e36e9sm10748833ejb.16.2023.08.03.07.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 07:57:25 -0700 (PDT)
Message-ID: <28263f7c-ae07-3d17-4c45-92af29c3144a@redhat.com>
Date:   Thu, 3 Aug 2023 16:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 17/32] media: ov2680: Add support for ACPI enumeration
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-18-hdegoede@redhat.com>
 <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi andy,

On 8/3/23 15:15, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:33:32AM +0200, Hans de Goede wrote:
>> Add an acpi_match_table now that all the other bits necessary for
>> ACPI support are in place.
> 
>> The OVTI prefix used for the ACPI-HID is used for various OmniVision
>> sensors on many generations x86 tablets and laptops.
> 
> "OVTI is the official ACPI vendor ID for OmniVision Technologies, Inc."

Is it though? Is there a list of official ACPI vendor IDs
published somewhere were we can check this ?

I think the Intel MIPI camera driver team may have come up with
the OVTI prefix independently ?

Just because it is used quite a lot does not mean that it is
official ...

Regards,

Hans


