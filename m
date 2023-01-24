Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D7679683
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbjAXLXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbjAXLXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1993113D7
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559347;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SQb1UOEiZ4MRlQ72YjMoJvN8ZRmgMFziRKH1pMkYfkY=;
        b=c0e5EONANnNNmfnSHqBHU01DCdggP/6qHnpPBH9TuMXT9JBBF2pPs0NTbARgCssTkLCRAm
        OJ7Goh4ECTsRFunQkkSQbMF9x2tNATrEpw71eCnnXLbmXtq6D6lkbppAsU4kXhTB8nDcJj
        9iqbyEaS1eIqGXQSOEonRwZiR+US/uU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-BUBFzYp8MEafUI_lOkB24g-1; Tue, 24 Jan 2023 06:22:25 -0500
X-MC-Unique: BUBFzYp8MEafUI_lOkB24g-1
Received: by mail-ed1-f70.google.com with SMTP id b15-20020a056402350f00b0049e42713e2bso10395662edd.0
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQb1UOEiZ4MRlQ72YjMoJvN8ZRmgMFziRKH1pMkYfkY=;
        b=Jm5lIsGEpn4B6TYiZvrOr/BPCB0yx7Bfwb1SvPSjny1NC0iCy8DtsPwX4ysd3FjS8U
         5tRNpvWdiSsToKsTYYtCmgcGmMyfNua77N3k2RpOgczxnjT28NUcrvv78IP3ClhRlB6M
         EJNMO0+3HOpZbXLb/bSY468tVhchdx0Cf9+1n50Bm154GMVnRxMcQfKn4Xc+dS3YKiZ6
         Ce8fCJmCQAKmJF8pVFi4ym3UjudWj1dyv8LUMdrYv8ERjiHVHX6thdnDSB7NNO0QtS7Y
         Ly/QxIoA8n3XXHkeVesGyTdxLVupiC4AIOZwUop2CcWfx+8mb6Rj3NzNXHaw58C46oyj
         2JKg==
X-Gm-Message-State: AFqh2krNUF2nVYzXEFZGPPe0gB8S6S+8/sX5s6BwPIsp3wFaQcKQTYAC
        ViFnb7/i8+a4P1wkyQ4ZtVeZSEvV8JnrKIyKS8n5BP3cs2yQx99rMysiInjlevdRYcDLKRvJyLM
        aHrkJU1NOBtF8E9JywUx/KEM=
X-Received: by 2002:a17:906:244b:b0:7be:fb2c:c112 with SMTP id a11-20020a170906244b00b007befb2cc112mr27094991ejb.66.1674559344614;
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsoUVw/w39DIAN1tWEZm9oHb8DFKE8Z1im+02H0I5RZnyKt8uFEviRmBh1SCDT+yJEem0pPUw==
X-Received: by 2002:a17:906:244b:b0:7be:fb2c:c112 with SMTP id a11-20020a170906244b00b007befb2cc112mr27094982ejb.66.1674559344469;
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709062dcb00b007c14ae38a80sm747524eji.122.2023.01.24.03.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:22:24 -0800 (PST)
Message-ID: <93f3a065-44e5-4d8f-d55a-699dc8a3c0bd@redhat.com>
Date:   Tue, 24 Jan 2023 12:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 29/57] media: atomisp: ov2680: Use the new
 ovxxxx_16bit_addr_reg_helpers.h
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
 <20230123125205.622152-30-hdegoede@redhat.com>
 <Y87ORy9ELdZSiMRf@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87ORy9ELdZSiMRf@smile.fi.intel.com>
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

On 1/23/23 19:13, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:37PM +0100, Hans de Goede wrote:
>> Use the new ovxxxx_16bit_addr_reg_helpers.h instead of duplicating
>> the ovxxxx sensor I2C register access helpers found in many different
>> sensor drivers.
> 
> ...
> 
>> -	ret = ov2680_write_reg(client, 1,
>> -			       OV2680_GROUP_ACCESS, 0x00);
>> +	ret = ovxxxx_write_reg8(client, OV2680_GROUP_ACCESS, 0x00);
>>  	if (ret) {
>>  		dev_err(&client->dev, "%s: write 0x%02x: error, aborted\n",
>>  			__func__, OV2680_GROUP_ACCESS);
> 
> Wouldn't this be a dup message without any additional value?
> 
> Same to many other places.

Ack, these errors are all removed in further refactoring.

Regards,

Hans


