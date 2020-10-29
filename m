Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A527C29F871
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 23:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJ2Wgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 18:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ2Wgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 18:36:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13787C0613CF;
        Thu, 29 Oct 2020 15:36:47 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id h22so1309407wmb.0;
        Thu, 29 Oct 2020 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oG1cfKestOZxKNIqNZ2SCpWsI5ep5X6hHqD8Gth13jc=;
        b=u91qw3/H0n2KkVRNCw7b94Dx+RbTfoLfXhkaI29lg2ez9EFoiEeeGjW9fdx2bvn1WC
         SFu/OoNjplccRUfPXpzoINf1Sm50cYBUkQ8buOlEv2RusUdkn1puFNY4alaZFkzPq4qV
         Bq9KASkNXQ2gfMvNvTk5kWZ6wQFue5pjAxYkjdV/FvwqB+rQuLa+Yr4gxtuPKSw+aCOY
         haBb/PFDdsL7OOKiSal0no7aVkkVAUFQkVjY4/+62LvZyPa+/tCRQ9tRKqm+KpUwRaNP
         u1LCJhLf+YIoxHBQ9p/Uq7v2jPPEpTXQCtnUsiF3eD5VEzmX5H6rfjkrh5Ge4nGdKawD
         mFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oG1cfKestOZxKNIqNZ2SCpWsI5ep5X6hHqD8Gth13jc=;
        b=fTkm57pvOVHi4yiEWAmnLbQ83IMWg5S1B9yttGiWg22ojBbRdxleh6HW1B6DlrikeP
         Bo4Pa1x4MOW+nGDIDjnrXBbmP/FqIV+nVkQ47Ta5OZJhWnfEz6OO5qUmbrdJAdafL2FJ
         3rBdoKL9dP8I4etRzKJhc+S50lWzh0qFFGsh/2mfEOuF/FrJi4nSa8cVhvgJonrPy116
         sYJfYqUM29TAto+nd7n1X4DqzdppbkhTu163yA1rbAUC7hhrmHCTrbPcnnoBInjTLx63
         oXUA7Ny5VYFkJGEeKtulw8lBc7n/WHxflWimGJxFg9O9RsKQuRty4IlIWpi1TsKHXUEN
         MbIA==
X-Gm-Message-State: AOAM533LWaXxosTcPVMmSv52cAg+zXtdRPK3ju5VupW9MuDXtR2F6PEG
        PlClboAsM8mOvbKaC/d2ZII=
X-Google-Smtp-Source: ABdhPJzu5RlBXo5XRbxc76r+XFHoj7bOEsEAPBKjGJeWzSOntEwbEiOJYsMzBNTYaAhIbHskSNsL/A==
X-Received: by 2002:a1c:7d49:: with SMTP id y70mr1163234wmc.103.1604011005634;
        Thu, 29 Oct 2020 15:36:45 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id l16sm7578299wrx.5.2020.10.29.15.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 15:36:44 -0700 (PDT)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <748d34c3-a146-12fe-22c0-8dfef9006ea0@gmail.com>
 <20201024223628.GG3943@pendragon.ideasonboard.com>
 <703d5108-5b10-802d-2bac-c719150430af@gmail.com>
 <20201026160549.GO4077@smile.fi.intel.com>
 <20201029201742.GC15024@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <91258d01-7226-880f-1388-02b43a71e0e3@gmail.com>
Date:   Thu, 29 Oct 2020 22:36:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029201742.GC15024@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi both

On 29/10/2020 20:17, Laurent Pinchart wrote:
> Hi Andy,
>
> On Mon, Oct 26, 2020 at 06:05:49PM +0200, Andy Shevchenko wrote:
>> On Mon, Oct 26, 2020 at 08:20:14AM +0000, Dan Scally wrote:
>>> On 24/10/2020 23:36, Laurent Pinchart wrote:
>>>> On Sat, Oct 24, 2020 at 11:28:06PM +0100, Daniel Scally wrote:
>>>>> On 24/10/2020 10:37, Laurent Pinchart wrote:
>>>>>>>> I wonder if we could avoid depending on the I2C device being created by
>>>>>>>> getting the fwnode from adev, and setting ->secondary manually. adev
>>>>>>>> would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.
>>>>>>> Let me try that; I initially wanted to do
>>>>>>> set_secondary_fwnode(&adev->dev, fwnode) to avoid depending on the I2C
>>>>>>> dev being created but it turns out &adev->dev isn't the same pointer. I
>>>>>>> shall try it and see.
>>>>> Actually, thinking on this further I think maybe we can't avoid that -
>>>>> it's not actually in this patch series but during assigning GPIO
>>>>> resources parsed from PMIC's ACPI node to the sensor, I'm using
>>>>> dev_name() on the i2c dev to pass to .dev_id member of gpiod_lookup_table
>>>> Any chance we can construct the I2C device name from the ACPI device,
>>>> the same way that the ACPI/I2C core does ? It may be a dead end, but if
>>>> we could avoid depending on the I2C device, I think it will make
>>>> initialization easier. I have a feeling that will be difficult though,
>>>> as we'll need the I2C bus number, which won't be readily available.
>>> OK yeah; the i2c core does indeed just prefix "i2c-" onto the acpi
>>> device name, so I will make this change too.
>> This is part of the I²C core and if you go this way, do not home grow the
>> functionality that doesn't belong here.
>>
>> Instead, export a helper function that will do it for you and for I²C core with
>> explanation why it's needed.
> Agreed, I was actually considering suggesting that. Hardcoding the same
> naming scheme in two places is asking for trouble, especially if we
> don't let the I2C maintainers know. It should be easy to do, not
> necessarily the highest priority task, but something that should be
> handled to get this merged.
Understood - I'll have a look at the best way to do this once I'm
through the current to do list
