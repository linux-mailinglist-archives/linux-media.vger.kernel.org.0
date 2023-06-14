Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F453730487
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 18:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjFNQFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 12:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjFNQFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 12:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B632E1FC8
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686758660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ddv6X7+TLTsTPQNkVoVc0YE5flEdJCFn8m2NzGNUqvk=;
        b=Sa8p1Dijf5RMXoUYJQCCdPkHwnwzKqasxTLTCFmqWsvtTr3oFtlo5HPA9dVsmpLmGRdfEi
        ChVsB6FULXhZVhwv6lHykct+dROpKXxXuPw/D9kWTNwpQTmMqIRi5E6iAoFIDC0cENTxwR
        l++Alnxp1KxRFqClPhyLIC5jPrwNEK0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-zHUPQIAXOt6Kt7eupD9DDg-1; Wed, 14 Jun 2023 12:04:19 -0400
X-MC-Unique: zHUPQIAXOt6Kt7eupD9DDg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9750bb0695dso110748466b.0
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686758658; x=1689350658;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddv6X7+TLTsTPQNkVoVc0YE5flEdJCFn8m2NzGNUqvk=;
        b=E5bYDFImJwJEMeoUtG2rzq3loce6Otgybcqa/QFLzDhESxjQskcHTBGYXcvcGGbsS3
         DU1UMkXefpmaaqUywGHmrSZfGucaex0sceC3ogCOauFYAn9A2zSAnVO7CG9COp9vh4oO
         nQLCul5aC24PcTztFhMeDZ3S2/NophLLHuKcClcZ3fYsRHPffVQjI/x1QaJBgHyvHAN7
         V1sQxXKkghkCjRg2NtPQ16gpgKMQXcF62wWNGyjwxHX+ZCDiNtt+jMkVIMpPaZCdENA3
         pIzik2aQQaKbGVEZUr7mM407Z2AJ9rETFYhywJK8wuOP59b6lRxWj+bfMJN04a1aSaqT
         Ai5g==
X-Gm-Message-State: AC+VfDyO5U6q83JMHjEII7rQqPgJyzvInZubR1TwjlWmt7JM/A2urkwi
        MRqFW+ddwhpOjiN4qPVvX25uaPmenh+MEd3BOxgm4gt6ViK2C/Nqgf3L8tKGoyLcIOoD5I/A/5m
        9ssVCKcjf9WGYv0MZLUoKPmU=
X-Received: by 2002:a17:907:ea9:b0:974:5a12:546 with SMTP id ho41-20020a1709070ea900b009745a120546mr2054104ejc.23.1686758658098;
        Wed, 14 Jun 2023 09:04:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QpwXesrMQut58i/BZcxGoMQLGc7hItUBd+kziUNp7H2gEvYDg1LObJHPbXSZd2ivJnYI+6A==
X-Received: by 2002:a17:907:ea9:b0:974:5a12:546 with SMTP id ho41-20020a1709070ea900b009745a120546mr2054087ejc.23.1686758657821;
        Wed, 14 Jun 2023 09:04:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906491000b0095342bfb701sm8388810ejq.16.2023.06.14.09.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:04:16 -0700 (PDT)
Message-ID: <e909f648-1c03-9ffc-b500-fe2c0177cc74@redhat.com>
Date:   Wed, 14 Jun 2023 18:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/14/23 17:47, Hans de Goede wrote:
> Hi All,
> 
> The ov5693 driver uses v4l2_subdev_get_try_crop() /
> v4l2_subdev_get_try_format() both of which are
> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
> 
> Yet it does not do select VIDEO_V4L2_SUBDEV_API
> in its Kconfig bits ?
> 
> Note I've not seen any build errors because of this,
> I guess we somehow end up getting away with this...
> 
> But still I think the select should be added ?

Hmm, so while looking at the VIDEO_IMX290 entry
in drivers/media/i2c/Kconfig I notice that
the VIDEO_IMX274 entry directly above it seems
to be missing "select V4L2_FWNODE".

I am starting to think that we need a
V4L2_SENSOR_DRIVER_DEPS which can be selected
which then in turn selects all the bits modern
sensor drivers need ?

Regards,

Hans


