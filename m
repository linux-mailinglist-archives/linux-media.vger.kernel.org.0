Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F3F7096DD
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 13:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjESLzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 07:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjESLzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 07:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFD118C
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684497309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QwI6Nj2vCLKRD8HgvMtblEY+8esIKsJ802LV5+/Lo5U=;
        b=IOUT6QMOeGkXJ/gmIGG7GWHRVV/GwmBC7WhA36uSdthvr2B0ZDIncdmnzKXlNXPQzHjB49
        GgtOJbQIp04yjHhz80kDkqCIUj7Ev/0Pp2K/oC2rhwdm45ZlD720UKf3uk+wsLYjBN974/
        +mtROESX8mOUGwyvP/dXgnxm29k/yC0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-3iG2G3qmN_uE0vjUKo4PDg-1; Fri, 19 May 2023 07:55:07 -0400
X-MC-Unique: 3iG2G3qmN_uE0vjUKo4PDg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-969c378d138so347862166b.1
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 04:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684497306; x=1687089306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwI6Nj2vCLKRD8HgvMtblEY+8esIKsJ802LV5+/Lo5U=;
        b=MuVWFMfHhWFUTho+HbbATuANLIc46cD4qGjKyINKmY/QMS4pwM/1/0pH5wgCCDPUKO
         ge50R0ai4WGZByh/Wf+xgz8meezMdtLW26IiXzFBGua7R7+nFYWmbUb5lo/W91DCESOt
         lLaD4TfQHxH81Pfir9J29/zqyszUFwpIMLDi+wk2+0nlkZbs8Z/3t2oJO5f2YTbZJuQl
         57dkVumcs0nPjFkTukgflcavzgCKADJ+uwXGdarHjBMKaXR57sAyUAzif5S3ydFsjzNd
         FQSkjGygEEB5RfYzeOO8T2IQlDwRj8T3w11LzyV1mNiTmXwrsTpnqM8TWclz23Pki9hk
         mvsA==
X-Gm-Message-State: AC+VfDxfoVzC59gtoSL1z/YcoZEbjjDEE7SBMdOUXmdEncx5LuLRUp2R
        kSLOIcEfSPsSJZBxGr5qVrapwfE0/j/VwTOcQbRjqYLH+TkcF/RAIPm7Mqk/V3nejSMIm7tFtsW
        P0pSWJCHdIBNdslj3N3zXXpQ=
X-Received: by 2002:a17:907:94ca:b0:94a:44ef:853d with SMTP id dn10-20020a17090794ca00b0094a44ef853dmr1377107ejc.68.1684497306567;
        Fri, 19 May 2023 04:55:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7g+PPDb+Fu98wn9GnBymtZBPS5yJKApkKfFISBfnM7mx/2AVNbs7ga5pi7p7KN75qLGyiA3g==
X-Received: by 2002:a17:907:94ca:b0:94a:44ef:853d with SMTP id dn10-20020a17090794ca00b0094a44ef853dmr1377084ejc.68.1684497306241;
        Fri, 19 May 2023 04:55:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id br21-20020a170906d15500b009662b4230cesm2226163ejb.148.2023.05.19.04.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 04:55:05 -0700 (PDT)
Message-ID: <d230dd21-9c2b-2dc4-0325-6ceb502c3ba0@redhat.com>
Date:   Fri, 19 May 2023 13:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 function
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
 <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
 <ZGdWVATARAQlaEjC@kekkonen.localdomain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZGdWVATARAQlaEjC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 5/19/23 12:58, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:

<snip>

>>> Although if the number of those drivers would be small, this could be just
>>> undesirable but still somehow acceptable. And I wouldn't expect new sensors
>>> to be paired with the IPU2 anymore. How many drivers there would be
>>> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
>>
>> About ten-ish drivers sounds right.
>>
>>> Isn't it possible to create a device for this purpose and use software
>>> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
>>> have to initialise this via other route than driver probe.
>>
>> This creates unsolvable probe-ordering problems. At a minimum we would
>> need some check inside sensor drivers for them to return -EPROBE_DEFER
>> until the GPIO mappings are added through some other means. Note that
>> without the mappings gpiod_get will return -ENOENT, so we cannot just
>> use its return value.
> 
> They probably will already need this in order to make sure the atomisp
> bridge has been initialized.

The instantiation of the sensor i2c_clients and of the atomisp PCI device
is independent of each other. In my other patch series I'm moving sensor
registration for atomisp over to the v4l2-async framework like all other
bridge/ISP drivers use so that atomisp no longer needs special sensor
drivers.

And AFAIK one of the reasons for having the v4l2-async framework is
to avoid needing to have a specific probe order between bridge vs
sensor drivers.

> Could this code live in the atomisp bridge instead?

That does not solve the probe ordering problem the sensor drivers
need the GPIOs to enable the sensor and they all enable the sensor
in their probe() to check the hw-id. The sensor's probe() function
runs without any ordering guarantees vs the ISP/brige's probe()
function. This is not an issue because at least during probe()
the sensor drivers don't have any interactions with the bridge
and any further access to the sensor-drivers is delayed until
the v4l2-async notifier completion callback has run.

The only way to work around the probe-ordering problem would
be to delay checking the hw-id until the sensor gets linked
to the bridge. Which would mean registering an async notifier
from the sensors to catch binding from the sensor drivers
and allowing the binding to fail.

Delaying the hw-id check like this would be much more involved
then the currently proposed solution and will likely cause
other issues like the wrong driver binding when hw-vendors
get the ACPI hw-id wrong (this is a known issue with audio-codecs,
so chances are we will see this with sensors too).

>> And if we need some changes anyways just adding the single line call
>> to the new helper seems both the least invasive and the easiest.
> 
> Simplest given the current patches, surely. But nothing to do with the
> sensor drivers. I'd at least like to see relatively trivial ways to avoid
> this researched first.

There are no trivial ways to avoid this. Period, full stop. I have
been looking into this for quite some time now and this really is
the easiest solution.

I cannot help but feel that you are blocking progress here purely
because you have a very dt centric view. I've done my best to make
the changes as non-invasive as possible and I must say I'm quite
unhappy about the in my eyes unnecessary and unproductive push back
here. I say unproductive because you have not offered any workable
alternatives yet.

Please keep in mind that the atomisp work I do is a volunteer /
side project, so as such I have limited time to invest in this and
I must say that your in my eyes unproductive unnecessary push back
is not helping with my motivation for this.

Also I'm basically fixing a mess here which Intel has left behind by
never properly doing hw-enablement for this...

Regards,

Hans



