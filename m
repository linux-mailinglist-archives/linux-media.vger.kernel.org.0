Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA489713587
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 17:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjE0PzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 11:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbjE0PzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 11:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FC7A2
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 08:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685202862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fWXtfOd6tHgSzxnVv5n9Y7UKxxqVFWTdpkSovEPASQM=;
        b=PtyFH8MHxqQzsjhw7zW+XBdbJs3D4Dr8azB8mmiqoRBu8/mCoWIzMu9+8+qtuqe+iPjKbH
        6oLvbp26BlFkbcqV9ePlsTihwDVdqOVr+k3UcMBI+TcOJUysFjkBu5TV61Be8bJS95xaBk
        p/uyj1GIC7wsdhr8WBLPYtM/I6OBmms=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-mMUZZWIsOdu8AmakbK-H4A-1; Sat, 27 May 2023 11:54:21 -0400
X-MC-Unique: mMUZZWIsOdu8AmakbK-H4A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96fb396ee3dso160224266b.1
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685202860; x=1687794860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWXtfOd6tHgSzxnVv5n9Y7UKxxqVFWTdpkSovEPASQM=;
        b=lqhRd9JS6GcTfo1t6cYvUXlkwVSs1LSIiRFwSlgp68fD9hySbFuuXdffUJ1Jkx0GrW
         QRpzVu4Ak0D7cW7EhSCCspEn313uF3aXUzmVKaHkYv11W34I7oZ2/t34lTGUhXqubbwh
         6t2wF1zIMLnSYYUJ7PLQdhk7zlf6U9QcQxp82cZFIdRbep0yT4mBNLlLKvm5EZHZHgyE
         5oreBOzstfRhLSfTLiSNDjBv9am+lkyJhYXbAQD0rUKV3A9E1e96z6ao74Q9QzAtA2Dm
         jVZp+Bc7WgbwO2PtjNu4j9689nZt2nGX5vOCvok/bZxHQOukbvjq7djYfJ5E02B01Pcc
         E9Gg==
X-Gm-Message-State: AC+VfDw9gL/RbyFqHeTPfseGZZhufQ2QKoINpeDZs9JiLaZl4jIcgNyb
        a74GpxCx1nsYSC1LCgrDhb/0wLo7TlwNzJSCXdIUC9pDdUtkGm+RPM5Wq6L57miB5i/PVO0t2Um
        BP7PZ8oV5cogdi3jhZcADSrY=
X-Received: by 2002:a17:907:2d13:b0:973:ea41:3ef8 with SMTP id gs19-20020a1709072d1300b00973ea413ef8mr933670ejc.35.1685202859972;
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7eH60rbebjGc335e2DNtNerJIO7a+02d1+rpBt5qPcbPCJMB3TqCXK2upgb/UGhhxvbcZb/Q==
X-Received: by 2002:a17:907:2d13:b0:973:ea41:3ef8 with SMTP id gs19-20020a1709072d1300b00973ea413ef8mr933659ejc.35.1685202859656;
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906074200b0096f4c9ce526sm3577411ejb.225.2023.05.27.08.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
Message-ID: <5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
Date:   Sat, 27 May 2023 17:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor
 registration
Content-Language: en-US, nl
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
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

Hi All,

On 5/25/23 21:00, Hans de Goede wrote:
> Hi All,
> 
> Here is a new version of my v4l2-async sensor registration support
> for atomisp. I have merged all the prep / cleanup patches which Andy
> already gave his Reviewed-by for in my media-atomisp branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> This v2 series applies on top of that branch!
> 
> This v2 series is the remainder (and core part) of
> my previous 2 related patch-series:
> 
> https://lore.kernel.org/linux-media/20230518153733.195306-1-hdegoede@redhat.com/
> https://lore.kernel.org/linux-media/20230518153214.194976-1-hdegoede@redhat.com/
> 
> The big change in this v2 is making atomisp_csi2_bridge_init() also
> add the ACPI GPIO mappings to the sensors it finds / it is adding
> fwnode graph endpoints for. Combined with making sensor drivers
> check there is a fwnode graph endpoint (and return -EPROBE_DEFER if not)
> before trying to get GPIOs so that the mappings are in place before
> getting the GPIOs.
> 
> Thank you Sakari for suggesting this nice solution.
> 
> Patch 1    Adds the v4l2-async sensor registration support
> Patch 2-3  Convert the ov2680 and gc0310 drivers to this
> Patch 4    Removes some now dead code
> Patch 5    Moves the now fully standard / no custom atomisp API
>            gc0310 sensor driver to drivers/media/i2c
> 
> Patches 1-4 only touch atomisp code and build on top of previous
> work so I plan to merge these through my media-atomisp branch.

I have pushed patches 1-4 to my media-atomisp branch now with
Andy's Reviewed-by added (and with Andy's review remarks addressed).

> Patch 5 also depends on all the others, so it should also
> get merged through my media-atomisp branch. Sakari may I have
> your Ack for this ?  Alternatively we could delay the move to
> the next kernel cycle and then it could be merged directly
> into some other linux-media branch. Either way works for me.

How to merge patch 5/5 moving the gc0310 driver from staging
to drivers/media/i2c is still something which needs to be
decided...

Regards,

Hans


