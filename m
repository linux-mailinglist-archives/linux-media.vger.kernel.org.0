Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E47AA0A4
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732826AbfIEK5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:57:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52844 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732085AbfIEK5j (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:57:39 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A216783F4C
        for <linux-media@vger.kernel.org>; Thu,  5 Sep 2019 10:57:38 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id n6so813937wrw.14
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 03:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u65TSO+Rvf1axEqmi3wSZZGF+sDF08PzfGTCX34no0w=;
        b=HSJowAq0HadZriweZNoCYvfH3poRXDJTsEBX8PENwYjZ1f8qCFjpej4PKkCLJy2tdR
         +FDbKpIZnmC1CRlPOVqlJOvyB9o02ZDKLwMQy0o1+hIGEtPtI9UvRAn6AbQqQ4xdqU8k
         YbC39IRLHMYt7br9uGqcSrnzDTd2mfmSoOGz422k0dMxK5M+biX5Ek8YunbMu0ENPXIE
         m1fhrqXZea1qiyvSU2rh/JfRbKeGCtlumvQY+GmfbJRk80wpz2F2Swf3NZgOpM01RX1W
         qtB6Cxw9G+Qyre76SBROnxBchE4e+3hzFuDI2WbXhb+iEGp74iVZHtQq3Mg1Qm7nX2DL
         rfPg==
X-Gm-Message-State: APjAAAXCudAjN5sAd7G9OFrqR8u4jbbZAETO41GUjR+OjvZw4nLJXL6H
        QKG/VnJqhYq6xA1YfXtNP7C8i67Q7u7u9JqctywiAiJkAzj+qw5yuI/86gCcPrl3xS6DU7XGc5a
        C0lwkXDrf63bmvlP7tLnhHm8=
X-Received: by 2002:a1c:ef09:: with SMTP id n9mr2295974wmh.23.1567681057404;
        Thu, 05 Sep 2019 03:57:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytSMTFwKy6lxd+Xl2q9JD1L6j9P/OzvtGIshQY0oEp+mKnHzNdpLaXEnuh8y3DBKzT/FTaXA==
X-Received: by 2002:a1c:ef09:: with SMTP id n9mr2295960wmh.23.1567681057221;
        Thu, 05 Sep 2019 03:57:37 -0700 (PDT)
Received: from [192.168.1.13] ([90.168.169.92])
        by smtp.gmail.com with ESMTPSA id p19sm1745164wmg.31.2019.09.05.03.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 03:57:36 -0700 (PDT)
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sam.hung@mediatek.com, shengnan.wang@mediatek.com
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
 <20190905082134.GY5475@paasikivi.fi.intel.com>
 <20190905101908.GB2680@smile.fi.intel.com>
 <20190905104001.GZ5475@paasikivi.fi.intel.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
Date:   Thu, 5 Sep 2019 12:57:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905104001.GZ5475@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/5/19 12:40 PM, Sakari Ailus wrote:
> On Thu, Sep 05, 2019 at 01:19:08PM +0300, Andy Shevchenko wrote:
>> On Thu, Sep 05, 2019 at 11:21:34AM +0300, Sakari Ailus wrote:
>>> On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com wrote:
>>>> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
>>
>>>> +static const struct i2c_device_id dw9768_id_table[] = {
>>>> +	{ DW9768_NAME, 0 },
>>>> +	{ },
>>>
>>> Could you drop the I²C ID table?
>>
>> But why?
>> It will allow you to instanciate the device from user space.

Yes, the I2C device table is still needed if the device can be instantiated
from user-space using the sysfs interface, or otherwise the module won't be
automatically loaded.

Kieran posted a "[PATCH RFC] modpost: Support I2C Aliases from OF tables"
patch that adds a MODULE_DEVICE_TABLE(i2c_of, ..) macro so modpost could
add legacy I2C modalias using the information in the OF device ID tables:

https://patchwork.kernel.org/patch/11038861/

If that lands, then we could get rid of the I2C device tables altogether
for non-legacy I2C drivers.

> 
> The device is supposed to be present in DT (or ACPI tables) already.
>

Agreed. Also by looking at the driver's probe function I see that the
device lookups a 'vin' and 'vdd' regulators supplies and it fails if
aren't defined, so it can't be instantiated from user-space anyways.

BTW, these two regulators supplies should be listed as 'vin-supply'
and 'vdd-supply' as required properties in the DT binding document.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
