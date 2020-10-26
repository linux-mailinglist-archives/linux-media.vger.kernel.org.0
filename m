Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63742298833
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 09:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1771541AbgJZIUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 04:20:20 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50402 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1768911AbgJZIUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 04:20:20 -0400
Received: by mail-wm1-f65.google.com with SMTP id 13so10681328wmf.0;
        Mon, 26 Oct 2020 01:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QV58dqmkH1DfYF96dLxD/X4lVkmb76mPN7rMpGdDayE=;
        b=tb5rjma5QkiAgPeIFRCui6TlZZOGsVsGEbVrKMp9O7+35xZ6YQP2K3MtjqGPfI11t2
         VxF/VugXSwM5ERng/7D3m6bSHyvaI44l4k7fkJT/nnQVCvqusGNlHF9BTwYJUYcYm7AH
         19v0538aW4ng+DfhfXea1pRRxegusVX2/3mwCeNGrQ4Irjnjbd7ZTTWfA/ZPHKAtoiLR
         JUlCuTG+B/MV5Vz5mgeIr4iPsmipZCbCP1anNDHtlQmRLTQmzZ5RolcHSQuMnzystw+y
         lvU8xO766pInwVD0c+H5ztOWaoTvtOj7hGxX3jDX2CfKmEz25RB5rSTY/GlTAIU/4yEy
         gUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QV58dqmkH1DfYF96dLxD/X4lVkmb76mPN7rMpGdDayE=;
        b=iCaJo/64l0uhf7A7Xu1dba6MZhkjhc4zvJD3HwvCM7KmsUuLdqmTp4/oeXFnzFhmdK
         FEHpWtw9XXtmcqvyE0v1LGRyiSwnKC2MzlCHy3b6Cvuaug2JsKZcscvgO9MzeUFxZbDi
         40B3+6rj74TUM/OJeFS/SwT83OGQOhHQpPC2VEuQLKu59c1MCIfxhkQjBNytYJCwd2MU
         gXJYg5p0nDezLakhZgnFQ9Ry5o7P302PIZHd4d3X/Mc7vKRoWnD3B7HSB2qz3SuKi7rx
         PN5DbZ25d7vDXN683LTbqebeBshZY80+HtiaY6Eb7X+b2S73fBQHj1/4DEQMZ34XIVII
         EFmw==
X-Gm-Message-State: AOAM531ueyQ8dpkotczDQgSGIKyoljTb/X7C1piF6cURSvuUUZ624+Hp
        eEm/MmsJVymsZaKMuvDy88M=
X-Google-Smtp-Source: ABdhPJy8OdrKvvz1ExXqrJ8YxhXVk7TipRS5MumO7ODp+rA03nVeHU5FgbF4mj+thXY5spTk04M+PQ==
X-Received: by 2002:a1c:2901:: with SMTP id p1mr15217931wmp.170.1603700417672;
        Mon, 26 Oct 2020 01:20:17 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id f8sm21102594wrw.85.2020.10.26.01.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 01:20:16 -0700 (PDT)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <748d34c3-a146-12fe-22c0-8dfef9006ea0@gmail.com>
 <20201024223628.GG3943@pendragon.ideasonboard.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <703d5108-5b10-802d-2bac-c719150430af@gmail.com>
Date:   Mon, 26 Oct 2020 08:20:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201024223628.GG3943@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/10/2020 23:36, Laurent Pinchart wrote:
> Hi Dan,
>
> On Sat, Oct 24, 2020 at 11:28:06PM +0100, Daniel Scally wrote:
>> On 24/10/2020 10:37, Laurent Pinchart wrote:
>>>>> I wonder if we could avoid depending on the I2C device being created by
>>>>> getting the fwnode from adev, and setting ->secondary manually. adev
>>>>> would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.
>>>> Let me try that; I initially wanted to do
>>>> set_secondary_fwnode(&adev->dev, fwnode) to avoid depending on the I2C
>>>> dev being created but it turns out &adev->dev isn't the same pointer. I
>>>> shall try it and see.
>> Actually, thinking on this further I think maybe we can't avoid that -
>> it's not actually in this patch series but during assigning GPIO
>> resources parsed from PMIC's ACPI node to the sensor, I'm using
>> dev_name() on the i2c dev to pass to .dev_id member of gpiod_lookup_table
> Any chance we can construct the I2C device name from the ACPI device,
> the same way that the ACPI/I2C core does ? It may be a dead end, but if
> we could avoid depending on the I2C device, I think it will make
> initialization easier. I have a feeling that will be difficult though,
> as we'll need the I2C bus number, which won't be readily available.
OK yeah; the i2c core does indeed just prefix "i2c-" onto the acpi
device name, so I will make this change too.
