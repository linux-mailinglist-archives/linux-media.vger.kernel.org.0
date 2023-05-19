Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A9370981D
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 15:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbjESNUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 09:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjESNUx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 09:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BD11B4
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684502402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zSSykxU8qNPTT0DvW/IVIYDeZCbmXVxYSFgPp4geLgs=;
        b=G4eMf4nbsLc1QsOS2d4Mu/W13viSmhyaeIY5CwYS6beMIW8Xrswi5Tk1hGgh3/yH3suFeF
        Ub0SlexbgfRDe9n7TTT3B3Mi6xlfEXpMeeg0bJj3Y8Tuj1x/baq6U+Pf65WmWnuVPW29T4
        46bioMPqjaLb52WqCNcLDnkXI37jrE8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-SiFv0YGeMZ-OMuJpkAJSKQ-1; Fri, 19 May 2023 09:19:51 -0400
X-MC-Unique: SiFv0YGeMZ-OMuJpkAJSKQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94a34e35f57so355533166b.3
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 06:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502390; x=1687094390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSSykxU8qNPTT0DvW/IVIYDeZCbmXVxYSFgPp4geLgs=;
        b=iwuvX1dwGVJZ0M4jwHAUv8+5COPut9qSBclJFTmh+lJjAnSdKmr2JECO86ea+P+qN8
         hnWCmkT6eibJKJewA0Mp8YUKvhlLzW0iSUjTQuIcskSZUQZocue+ffH4uSo3rFSJFWpR
         wuWQVC3OzFchOolihOhpBOakXY0Uro1anOOsD45QHnOUWo0qm55T0HFYH4crcrXYqAXS
         Wt/hugVKSEo6UZCWHUqDSu1xaUvPI+PioDbHjqL7TIGHVTG5nPIJwySaOgg8DlYXYgfH
         A1rh78PkTOFx3VJRxayV4aMLaNNsxISOy3wswXa5hTVU3zr0sliAMSgW/gFDjmpnCWi9
         vsXQ==
X-Gm-Message-State: AC+VfDyqPVo+UYoamKZKiKV2AiScjcr/VcOuS3dnmnprfdONzzYHBmBM
        BXrpWWsrbgUVOEpU90DPt4lZDU89dU8c8RFyPw8RYHwXtGXneNW9I+XybwEEaSqiMQT45knd41L
        3Sz5CNTVdVfSfDf9qNvVxKpE=
X-Received: by 2002:a17:907:9443:b0:96a:e7cc:b8b1 with SMTP id dl3-20020a170907944300b0096ae7ccb8b1mr1674601ejc.56.1684502390355;
        Fri, 19 May 2023 06:19:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62v2aoLN+QzWXHnBj2QkAUBMwygdNpEGbnEfBLI8e4Z8i443l9g5odvPHgNNOxLSVL/ujGQg==
X-Received: by 2002:a17:907:9443:b0:96a:e7cc:b8b1 with SMTP id dl3-20020a170907944300b0096ae7ccb8b1mr1674568ejc.56.1684502390024;
        Fri, 19 May 2023 06:19:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv24-20020a1709072bd800b00965a4350411sm2276030ejc.9.2023.05.19.06.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:19:49 -0700 (PDT)
Message-ID: <ece718a3-4d8c-17c7-ded0-0096c2f0fdc7@redhat.com>
Date:   Fri, 19 May 2023 15:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 9/9] media: atomisp: Add support for v4l2-async sensor
 registration
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
References: <20230518153733.195306-1-hdegoede@redhat.com>
 <20230518153733.195306-10-hdegoede@redhat.com>
 <CAHp75Vf2CjdtchvOAYFpCdsqDxMy8d2CB5O6ApeqJsx98+gyXQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf2CjdtchvOAYFpCdsqDxMy8d2CB5O6ApeqJsx98+gyXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

As always thank you for the review. I know you spend a lot of time
on reviews and it is much appreciated!

I agree with all your comments and I'll address them as suggested
for the next version.

Regards,

Hans




On 5/19/23 14:45, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>> +static const guid_t atomisp_dsm_guid = GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
>> +                                                0x97, 0xb9, 0x88, 0x2a,
>> +                                                0x68, 0x60, 0xa4, 0xbe);
> 
> Can we use the de facto pattern for this kind of assignments?
> 
> ... guid_t foo =
>  <TAB>GUID_INIT(...first 3 parameters...
> <TAB><TAB>[spaces if needed)...last 8 parameters...);
> ?
> 
> Also would be nice to have a comment where the GUID is represented in
> text format so it can be easily googled/searched for in
> internet/documentation.
> 
> ...
> 
>> +       for (i = 0; i < obj->package.count - 1; i += 2) {
>> +               /* The package should only contain strings */
> 
>> +               if (obj->package.elements[i].type != ACPI_TYPE_STRING ||
> 
> i + 0 ?
> 
>> +                   obj->package.elements[i + 1].type != ACPI_TYPE_STRING)
>> +                       break;
>> +
>> +               if (!strcmp(obj->package.elements[i].string.pointer, key)) {
> 
> Ditto?
> 
>> +                       val = kstrdup(obj->package.elements[i + 1].string.pointer, GFP_KERNEL);
>> +                       dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
>> +                       break;
>> +               }
> 
> I would even go for temporary for element pointer
> 
> ... *elem0 = &[i + 0];
> ... *elem1 = &[i + 1];
> 
>> +       }
> 
> ...
> 
>> +use_default:
> 
> out_use_default:
> 
> ...
> 
>> +       status = acpi_evaluate_object(adev->handle, "_PR0", NULL, &buffer);
> 
> acpi_evaluate_object_typed()
> 
>> +       if (!ACPI_SUCCESS(status))
>> +               return -ENOENT;
> 
> ...
> 
>> +       if (!buffer.length || !package || package->type != ACPI_TYPE_PACKAGE)
> 
> See above.
> 
>> +               goto fail;
> 
> ...
> 
>> +               if (strlen(name) == 4 && !strncmp(name, "CLK", 3) &&
> 
> strlen() assumes that name is NUL-terminated, hence it can be simply
> replaced with name[5] == '\0' check which can go at the end of
> conditional, so that it's also implied in strncmp() for the start of
> the string, but why not using str_has_prefix()?
> 
>> +                   name[3] >= '0' && name[3] <= '4') {
> 
> It's also possible to have it done via kstrtou8() that does almost all
> checks along with conversion. You will only need to check for > 4.
> 
>> +                       clock_num = name[3] - '0';
>> +                       break;
>> +               }
>> +       }
> 
> Altogether
> 
>  if (str_has_prefix()) {
>    ret = kstrto...(&clock_num);
>    if (ret)
>      ...
>    check for clock_num range if needed.
>  }
> 
> Yes it's longer in code.
> 
> ...
> 
>> +fail:
> 
> err_free_pointer:
> (It will be also in align with the rest of the code AFAICS)
> 
>> +       ACPI_FREE(buffer.pointer);
>> +
>> +       return clock_num;
> 
> ...
> 
>> +       /* Intel DSM or DMI quirk overrides PR0 derived default */
>> +       port = gmin_cfg_get_int(adev, "CsiPort", port);
>> +
>> +       return port;
> 
> return gmin_...;
> 
> ...
> 
>> +       if (dev->fwnode && dev->fwnode->secondary)
> 
> Please, use dev_fwnode() instead of direct access to the fwnode in
> struct device.
> 
>> +               return 0;
> 
> ...
> 
>> +               struct v4l2_fwnode_endpoint vep = {
>> +                       .bus_type = V4L2_MBUS_CSI2_DPHY
> 
> I would add a trailing comma here.
> 
>> +               };
> 

