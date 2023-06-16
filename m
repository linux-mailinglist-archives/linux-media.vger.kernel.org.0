Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C588173376F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbjFPRbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjFPRbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35E41FD7
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IkK/INZNXHmaSjJW+2RHeMEQ2PwAA62AoGL5RLC1Kl4=;
        b=jO/XQa9dxAhPyXVFQdLFmwPB/R91FlIGluUZfakcXCgOGwXkC5ArPIw0+5u3sq2M8wLNSO
        OxZP9QurgdU07q4wirpysDp0tZ9mC6j6Dc3mwFPcW+30zOEkFO0FPGo2PJUzq+1sdPibCA
        LOrQ2PyQBkW1v/x7TWP1Fz8D9bgh6lU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-M_gChQv0PqiCsHNWiGOhqw-1; Fri, 16 Jun 2023 13:30:25 -0400
X-MC-Unique: M_gChQv0PqiCsHNWiGOhqw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-982ab5d1151so84548966b.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686936624; x=1689528624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkK/INZNXHmaSjJW+2RHeMEQ2PwAA62AoGL5RLC1Kl4=;
        b=EZyBgtFkgFfYFGui8Aj8bnxKAvozlXKsTZ45O9TXGj1DW7galVBIarQhsH+jHnDgud
         HO0EADVXXj9RSibKEArpvh/zyjaZs+ixYyYS1TRXRnedzRpiPDNKsIEj5c3PP9mv7hSg
         Oc+7j14Q41cUy4Lm0YzthXzmFfrD7sOD/yc9ndlx3kHB5vngV26dPiXxisI4ExpHdXQf
         sOLF64fKw2zdO05V/kWUKB0pJDTCTqGuCa+9b18eo22bLEJlKxFXH+Y5T/Yf8HTeRbOP
         yCYLa/rU/pe+VWyCKQ0+VXbOUDyO8fMDjxUXtAV4OSXAMJeE4TRlDeJu6xzpM8FYerBA
         vIbg==
X-Gm-Message-State: AC+VfDzcFJVnfuVd7qK4BgtLg+Hwy2scveNsnugRSLKXWP/Deb0a+Gvn
        0E15DER7cfir9KX/upAH8H4f7qZPnjbHOTBoQuzoNSoqQKc+5izkkp6yidCXoe6cl5vSpvfjMfJ
        WarURQu/a6puQBvxi/ponhCU=
X-Received: by 2002:a17:907:a409:b0:973:ad8f:ef9b with SMTP id sg9-20020a170907a40900b00973ad8fef9bmr2537150ejc.5.1686936624496;
        Fri, 16 Jun 2023 10:30:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Mj050l/LnDF3Ra0QBfGVYed1hevj1mJIGUlGI1sORxRZZkFcZNl5yioqUZjY/+HOljBNCjA==
X-Received: by 2002:a17:907:a409:b0:973:ad8f:ef9b with SMTP id sg9-20020a170907a40900b00973ad8fef9bmr2537143ejc.5.1686936624258;
        Fri, 16 Jun 2023 10:30:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qc11-20020a170906d8ab00b00977d7ccd9fdsm11239203ejb.95.2023.06.16.10.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 10:30:22 -0700 (PDT)
Message-ID: <b79f8519-ace2-7899-188f-426dbf054e80@redhat.com>
Date:   Fri, 16 Jun 2023 19:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 27/28] media: ov2680: Read and log sensor revision
 during probe
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <20230615141349.172363-28-hdegoede@redhat.com>
 <ZIsjn8AqpDNWeIpA@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIsjn8AqpDNWeIpA@smile.fi.intel.com>
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

Hi,

On 6/15/23 16:43, Andy Shevchenko wrote:
> On Thu, Jun 15, 2023 at 04:13:48PM +0200, Hans de Goede wrote:
>> Read and log sensor revision during probe.
>>
>> Since this means that the driver will now already log a message on
>> successful probe drop the "ov2680 init correctly" log message.
> 
> ...
> 
>> -	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
>> +	cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, &ret);
>> +	cci_read(sensor->regmap, OV2680_REG_SC_CMMN_SUB_ID, &rev, &ret);
>>  	if (ret < 0) {
>>  		dev_err(sensor->dev, "failed to read chip id\n");
>>  		return -ENODEV;
> 
> Even in the original code I don't see justification why the error code should
> be shadowed.


Ack, I've squashed a fix for this into this patch (since it is already
making significant changes to ov2680_check_id() anways),

Regards,

Hans

