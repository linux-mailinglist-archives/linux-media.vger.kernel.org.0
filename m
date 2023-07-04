Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC473746F4D
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjGDLBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGDLA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:00:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDCE10CA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688468399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZwCheff8HhJj9CeSl0R5cfApBSNFpNXFX96VYiJpqaU=;
        b=Q2MBbl1s0mfVYS97citU5OP0phhbBQYkslfBhpx/4p8mo496d1ww/+yfQUAKPp7HO67NvD
        rNo0N2/e3jFug6aK1U7mgk37wfIj2OOCXQrJjwNIbiYFeGYQEylBRaVZfmGNLNxo9TwswM
        M6rBzqRHXxzPvG10tBtWtMYCIwIr/bQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-Qe7Uf7ieP1iIPQGXAUGCDQ-1; Tue, 04 Jul 2023 06:59:56 -0400
X-MC-Unique: Qe7Uf7ieP1iIPQGXAUGCDQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2b69ab85db1so48087621fa.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 03:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688468395; x=1691060395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwCheff8HhJj9CeSl0R5cfApBSNFpNXFX96VYiJpqaU=;
        b=c7cEm20F2+/D9ctvuUW3YIijH5QoksC44IDMirSRQLNW8x/7ySKMe0IZYCF8eW1RVV
         Cuza3DwvmetjRGE1+qMxQqDkt6r3VMlAuwwlPqe0pj8bXfv0aLe7yEovFiJEqcC/h04M
         ejP5ooMNWyr8letVxxACa4CqEdZK/o4AdwXnOXE6s3RR5bHT+cCiAwB6Zk6tMW/An1Ns
         laEQ40skQGL4h8tYphHBWSuCxuv/s2T4LV+EpCfLSdIcCqpQIphTI8VWiP78+zTK3htA
         N67byYzk9oJA8Q40oK+6NB4ssQVpwAaVEm/qhz2fJOezvJ4Dk9j4zfPVxag+9yn0qYj/
         DTiQ==
X-Gm-Message-State: ABy/qLbbKjDB4M1LegKSmkxap1iXRFNI+48UMyBNt380AKNNhWihDR9d
        UYF1zzf5kHZD8gXL8ltqNf5l2DI8uMwTNbpFK0O6/4gx7zA84HoNW+T5XTWuZ6gxJiJPxgEODNP
        tYAfpa+bqfPhOSWiybVL47No=
X-Received: by 2002:a2e:b61a:0:b0:2b6:a5df:c7fb with SMTP id r26-20020a2eb61a000000b002b6a5dfc7fbmr8218005ljn.26.1688468394932;
        Tue, 04 Jul 2023 03:59:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEW91n1ys6MwdJDfom7HWewRmvF09SXjStbIJr50e0DRifK8Kja7dX6Humk5SDm7CAZbS95tA==
X-Received: by 2002:a2e:b61a:0:b0:2b6:a5df:c7fb with SMTP id r26-20020a2eb61a000000b002b6a5dfc7fbmr8217995ljn.26.1688468394626;
        Tue, 04 Jul 2023 03:59:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lc1-20020a170906f90100b00988e953a586sm13216919ejb.61.2023.07.04.03.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 03:59:54 -0700 (PDT)
Message-ID: <80024c5b-d35b-96ac-ff5b-1e013c3ef113@redhat.com>
Date:   Tue, 4 Jul 2023 12:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to
 ipu_supported_sensors[]
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-13-hdegoede@redhat.com>
 <ZKP5KIXBVaLWetVH@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKP5KIXBVaLWetVH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 7/4/23 12:49, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Jun 30, 2023 at 01:06:40PM +0200, Hans de Goede wrote:
>> The GalaxyCore GC0310 is used together with the atomisp no various
>> devices, add it to ipu_supported_sensors[].
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
>> index eb7c56e8ef9f..07a34f20af8e 100644
>> --- a/drivers/media/pci/intel/ipu-bridge.c
>> +++ b/drivers/media/pci/intel/ipu-bridge.c
>> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>>  	/* Omnivision ov13b10 */
>>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>> +	/* GalaxyCore GC0310 */
>> +	IPU_SENSOR_CONFIG("INT0310", 0),
> 
> 
> Where is this HID from? A DSDT somewhere??

This is used in many atomisp DSDTs on many atomisp devices,
see below for a quick grep to my no disk "database" of DSDTs.

This is also already used by the existing gc0310 driver for
atomisp:

https://git.linuxtv.org/media_stage.git/tree/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c

Note with the latest media_stage.git branch, which has
my "[GIT PULL] media: atomisp: Changes for 6.5-1" merged:

https://lore.kernel.org/linux-media/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com/

The gc0310 driver is now a fully standard v4l2 driver no longer using any
atomisp-isms / custom API. As such I have a patch pending to move
it to drivers/media/i2c :

https://lore.kernel.org/linux-media/20230525190100.130010-6-hdegoede@redhat.com/

that patch is waiting for you to ack (or merge) it. Note if you chose to merge this
yourself, this should be applied on top of the latest media_stage/master
not on top of 6.4-rc1 .

Regards,

Hans

p.s.

The promised list of matching DSDT-s. Note not all of these necessary actually
use the sensor (but some do) let me know if you want a DSDT of a device which
actually uses the GC0310 :

[hans@shalem ~]$ grep -l INT0310 hwinfo/*/dsdt.dsl
hwinfo/CAT-T20-tablet/dsdt.dsl
hwinfo/acer-One-S1003/dsdt.dsl
hwinfo/acer-s1003-2/dsdt.dsl
hwinfo/chuwi-hi8-Q32G22160505024/dsdt.dsl
hwinfo/chuwi-hi8/dsdt.dsl
hwinfo/chuwi-vi8-cwi501/dsdt.dsl
hwinfo/chuwi-vi8/dsdt.dsl
hwinfo/cube-iwork8-air/dsdt.dsl
hwinfo/cyberbook-t116/dsdt.dsl
hwinfo/endless-HKC/dsdt.dsl
hwinfo/estar-beauty-hd-mid7316r/dsdt.dsl
hwinfo/gp-electronics-7inch-win10/dsdt.dsl
hwinfo/hp-stream7/dsdt.dsl
hwinfo/insignia-flex8-NS-P08W7100/dsdt.dsl
hwinfo/irbis-nb41/dsdt.dsl
hwinfo/irbis-tw36/dsdt.dsl
hwinfo/irbis-tw90/dsdt.dsl
hwinfo/itworks-tw891/dsdt.dsl
hwinfo/jumper-ezbook2/dsdt.dsl
hwinfo/lamina-i8270/dsdt.dsl
hwinfo/lenovo-ideapad-miix-310/dsdt.dsl
hwinfo/lenovo-ideapad-miix-320/dsdt.dsl
hwinfo/medion-akoya-e2212t/dsdt.dsl
hwinfo/medion-e2215t/dsdt.dsl
hwinfo/medion-e2228t/dsdt.dsl
hwinfo/mele-pcg03/dsdt.dsl
hwinfo/mele-pcg09/dsdt.dsl
hwinfo/minix-neo-z83-4-xxx/dsdt.dsl
hwinfo/minix-neo-z83-4-hans-de-goede/dsdt.dsl
hwinfo/minix-neo-z83-4-unknown/dsdt.dsl
hwinfo/mpman-converter9/dsdt.dsl
hwinfo/mpman-mpwin895cl/dsdt.dsl
hwinfo/nextbook-ares-8a/dsdt.dsl
hwinfo/nuvision-TM800W560L/dsdt.dsl
hwinfo/odys-vario-pro12/dsdt.dsl
hwinfo/onda-v891w-ONDA.D890HBBNR0A/dsdt.dsl
hwinfo/onda-v891w-ONDA.W89EBBN08/dsdt.dsl
hwinfo/pipe-w2s/dsdt.dsl
hwinfo/pipe-w4/dsdt.dsl
hwinfo/ployer-momo7w/dsdt.dsl
hwinfo/pov-mobii-tab-p1005w-232/dsdt.dsl
hwinfo/pov-mobii-tab-p1006w-232-3g/dsdt.dsl
hwinfo/rca-cambio-w101-v2/dsdt.dsl
hwinfo/schneider-SCL141CTP/dsdt.dsl
hwinfo/trekstor-surftab-wintron-7.0/dsdt.dsl
hwinfo/trekstor-twin-10.1/dsdt.dsl
hwinfo/umax-visionbook-10wi/dsdt.dsl
hwinfo/yours-y8w81/dsdt.dsl
[hans@shalem ~]$ 




