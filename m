Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BAF7DE3BD
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 16:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233914AbjKAP1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 11:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjKAP07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 11:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E56C111
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698852372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a7Z3G6teEmjhgj5RdnWcMA2SralsvmdKFj0iPCQCdOw=;
        b=QdxjGW0g27cXV+AB9OQHkoy1Z2vLfY+0YatdUPBt93tzBXdDI0BSn1+HuigcQAajUhaHu3
        jLp9m9A/7ESFwpjIiL3uhlId5CGuTEoiCPN27hF/k587bMWGxU2OGCM+6N+tKZZZ2XTLj7
        g0QYwfT5RtPPahrZffgoGoWR2s+ReyU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-l_6sgNtCOVmgqcpLgvLyCw-1; Wed, 01 Nov 2023 11:26:10 -0400
X-MC-Unique: l_6sgNtCOVmgqcpLgvLyCw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-53df95eaebfso5182379a12.2
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 08:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698852369; x=1699457169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7Z3G6teEmjhgj5RdnWcMA2SralsvmdKFj0iPCQCdOw=;
        b=iSB/Ej4Jz9VEg6twZnj5sCkaIxK0m9Ncq7/ZKp0/WAEELst5PmTX4b0g7/KLhjgKhI
         sCm2yYQvaCgA7xmnxrHHA1ZzfOdbpgS2Tow2F80T6fDuzNQXRAMBvTejIWOGae+Be6Q0
         h5Gb2YoA+HoWkzz1/coMqYDHPvqcsk4FEOpAYVW3DkwPcv0KMh56bMf0jNk6dOocmHSb
         mNAPLawyeITmOM10UUXEsUDTY0Vy0OqwjkPF/uksDM9lZx/VGVv8LXFabzKeZieEwJ03
         cs8YOV8k0dSOss25Fted3QkLFi6kUs6E0RzzBokuPQzrSsTy36IlAsGUlkEbCYYYQcsf
         bYiQ==
X-Gm-Message-State: AOJu0YzYZCeH37N6JV0LHpmEz27GOFP8GDrvUhwZUzDe1tFAqZsWet3u
        dzsLkknRNnIB53Te9SEcLg2ox2zVyT1ywwiaZjpYvVfEHeqLMEB+kUEXeCONCDdxaFj3SJzVZ1S
        oMwqJNPwTG4v/DoCVbc1oong=
X-Received: by 2002:a50:9b55:0:b0:543:533a:7d34 with SMTP id a21-20020a509b55000000b00543533a7d34mr5520663edj.22.1698852369123;
        Wed, 01 Nov 2023 08:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiR3CS+nOQPmH2aipcxCDFlshlPnzTpTY4E+UW0A13DfKn36OSPA5r5Hrz4Te00d0RxcC8UQ==
X-Received: by 2002:a50:9b55:0:b0:543:533a:7d34 with SMTP id a21-20020a509b55000000b00543533a7d34mr5520648edj.22.1698852368840;
        Wed, 01 Nov 2023 08:26:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g27-20020a056402321b00b005434095b179sm1168808eda.92.2023.11.01.08.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 08:26:07 -0700 (PDT)
Message-ID: <509740bc-258c-e673-bfa0-e2e24bb09053@redhat.com>
Date:   Wed, 1 Nov 2023 16:26:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] v4l2-cci: little-endian registers
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
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

Hoi,

On 11/1/23 13:23, Alexander Stein wrote:
> Hi,
> 
> after the discussions at [1] and [2], this series adds proper support for
> little-endian encoded registers.
> Patch 1 adds the infrastructure and patch 2 fixes imx290 driver.
> As v6.6 was released with imx290 broken, both should be added to stable.
> 
> Changes in v2:
> * Add proper Fixes/CC tags to both patches
> * Add little-endian support for cci_read()

Thanks, this version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans





