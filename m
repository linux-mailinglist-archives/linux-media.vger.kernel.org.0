Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEC07D54E8
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 17:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjJXPLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 11:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJXPLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 11:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E15310FF
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698160262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TKUuV3D2MzzYmMyJQKVSNNUSleO8nx/GbxJ06/jy1bc=;
        b=gJBPYuiV/8Q5DX0EYuZvujpmsmaXiu/mIO6WwkkowYij6bgZkikML6TY6LK7Csn++mSzel
        C1n71AEoug15jNJfl/Zz1wejRv0ojzwsZU2EPSYlPKut2wL4/y/W9vMhiQpXFHCzaNsfD5
        wFfIkJCYmaIsaamF6PiVX5ivyA3vcdA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-bODA0nq0NY-Lw0AhDeYjZg-1; Tue, 24 Oct 2023 11:11:01 -0400
X-MC-Unique: bODA0nq0NY-Lw0AhDeYjZg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-533d8a785a5so3174478a12.3
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160260; x=1698765060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKUuV3D2MzzYmMyJQKVSNNUSleO8nx/GbxJ06/jy1bc=;
        b=SEsdc/a2g6VMDkALFdAWh6M14/BhsVEX4AFxEg5D1R8d8fCRqujE/e/wcuo05JoyaQ
         GVQYLDBo0OAXdrdKz0d0pHOR/XjJtCT3I3OE2BfQZ5hgzodOtw+3P1kYIKwKEEUUwJWG
         f8LhkIlivLJFm0DBHI6VTdLOUi734U+aAsy6Dz24WhKC64+j0SQHfUhaKQjxLJZZTExq
         p6fWCalCxECDn0xCrF5ELY8b6iUpI8p6pfD04c3ljXzhQrbiim233/7XKsycSyg1cZDF
         qK8XM+2LEuBoeH/HRoUplIhALxh/WEQox9A7CQ4dE9ts49Ave5RMUeQoxjgbHV97x4bG
         b6DA==
X-Gm-Message-State: AOJu0Yxa4e7qDyz2YSwUWxgbhZwBaEOlw5z1IjoegTmccsA1KhLfwb1T
        WqbeMv1pjoDNBlnp14Bpnyh7hder9pOoKf1CBKxzH3z8xZyBgGoWpfLS+DXGh13E8K0d5McawSH
        XDGWqSFoxB6Mn3CsSRKDT3QY=
X-Received: by 2002:a17:907:a45:b0:9b2:ccd8:2d42 with SMTP id be5-20020a1709070a4500b009b2ccd82d42mr8630151ejc.32.1698160259951;
        Tue, 24 Oct 2023 08:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN0azaOZH4gSh6rFxEA6Jy6IC6rhNntf7FeqOIS6807N5EKl2K7zLGXjUGdQcH6jFCZLfmeA==
X-Received: by 2002:a17:907:a45:b0:9b2:ccd8:2d42 with SMTP id be5-20020a1709070a4500b009b2ccd82d42mr8630136ejc.32.1698160259605;
        Tue, 24 Oct 2023 08:10:59 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.146.165])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709063b0100b0099b8234a9fesm8398663ejf.1.2023.10.24.08.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 08:10:58 -0700 (PDT)
Message-ID: <7f624c9a-d9bf-0b41-7709-99f29cf0bc54@redhat.com>
Date:   Tue, 24 Oct 2023 17:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] media: mei_csi/mei_ace: Fix driver modalias not
 matching device modalias
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231024101319.11878-1-hdegoede@redhat.com>
 <MN2PR11MB431803D884CE96CEC12CF9278DDFA@MN2PR11MB4318.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN2PR11MB431803D884CE96CEC12CF9278DDFA@MN2PR11MB4318.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/24/23 16:00, Wu, Wentong wrote:
> Hi Hans,
> 
> Thanks for your patch, but I think this has been fixed by below commit
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/media/pci/intel/ivsc/mei_csi.c?id=18e35ba0d89f89bdda8001c6b34b18f62917d10d
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/media/pci/intel/ivsc/mei_ace.c?id=6b6f41791b443e9d141ae254ec0de833841497a9

Ah right it looks like this is already fixed, so this patch
series can be dropped.

Regards,

Hans




>> From: Hans de Goede <hdegoede>
>>
>> Hi All,
>>
>> This fixes an issue with the mei device-id matching which I noticed while
>> debugging an out of tree IPU6 driver issue which a Fedora user was seeing with
>> kernels >= 6.5 on a Dell Precision 5470 which uses the VSC chip.
>>
>> Note the root cause there was a different issue and these patches have been
>> compile tested only, please test.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (2):
>>   media: mei_csi: Fix driver modalias not matching device modalias
>>   media: mei_ace: Fix driver modalias not matching device modalias
>>
>>  drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
>> drivers/media/pci/intel/ivsc/mei_csi.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> --
>> 2.41.0
> 

