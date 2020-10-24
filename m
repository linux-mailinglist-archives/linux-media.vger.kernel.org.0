Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC814297F7B
	for <lists+linux-media@lfdr.de>; Sun, 25 Oct 2020 00:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762816AbgJXWut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 18:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731326AbgJXWut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 18:50:49 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BF9C0613CE;
        Sat, 24 Oct 2020 15:50:48 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e17so7442635wru.12;
        Sat, 24 Oct 2020 15:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M8jqheH0/7JwJ1NlxK492HqYeUVeasNd8aMJ44uTSps=;
        b=NV6UgykferZl71u2XGSi5zDpEHJyrGD6JEl+G2uD4qqfToLV6EiSF4V5baYqVNoP0E
         w6K72S7C2z09av5dFEzwsaLeUHqfu0FEcG0CtolPIcF+5fz0TOhleMGHgFB8UL2vdHQn
         kgrbSYBcnaniGdSpxQg9omo2M15GxDAuvCqsjivudqoLORGEq15B3WeG5YfKhE1B2hEQ
         c3FKKyuilrkuuY1EjM5TbhN6/EEd1hpsqrQqpY6MvlBBIX3SPWoBCyVSZWT1LJuGJe/M
         C/FIHLwLemqnrpQKj83XCYsM2TODbizYCGEm9gTUxdPLmCemTbE3EacqrAnkTgu0mZOG
         zCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M8jqheH0/7JwJ1NlxK492HqYeUVeasNd8aMJ44uTSps=;
        b=HZm+i4bISvPP2MKxuXqEMGEARRoy2TmrZKa88oj68qHZopVzSdkb75bKftq4zSlS5b
         lgOGX14D/Ojek7SfWZAC8cEyHlKpVdctYYYVGTSI4Avmt1M0JsUL65YtO5OMUo6cvYoO
         H9zFDFj/T6gZyGdG+RveuTOdHxpwAxHkpLAodHJ44cavnb1uYO9VTDGrvbS/iXEtiGR1
         MdyNjF7aCXYJkX0RmiIWEYjhdr+VeumkkyJWhTKXGTAptveSYhu2dS2kd+JxSURhmkhc
         1KwUL7R+CfjGgg2DeLDNC1O21RuF/fOctvbGiw1soXILakBy42gbVGFrn4OqNvcJPfvh
         lqbA==
X-Gm-Message-State: AOAM532m8VciwaR6iZr9m2NfTaxuXLNF8Y+bczT+LWN/fG7hwOA7rHDH
        IGtuWCYwYDE0GCYFYBkX0HM=
X-Google-Smtp-Source: ABdhPJwSlsOwuSjhJa0gSmSuzS4CrNhPCvyyNUyovP/WJQcOZ/zV+vDBOg0pNYBg6lxjdGnIGJK86g==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr9432818wrt.137.1603579847340;
        Sat, 24 Oct 2020 15:50:47 -0700 (PDT)
Received: from [192.168.1.158] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id x15sm15518310wrr.36.2020.10.24.15.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2020 15:50:46 -0700 (PDT)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <98d1f782-9749-1de7-02d5-da51b57ffaef@gmail.com>
Date:   Sat, 24 Oct 2020 23:50:45 +0100
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

Hi Laurent

On 24/10/2020 23:36, Laurent Pinchart wrote:
> Hi Dan,
>
> On Sat, Oct 24, 2020 at 11:28:06PM +0100, Daniel Scally wrote:
>> On 24/10/2020 10:37, Laurent Pinchart wrote:
>>
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

I'd have to look into how the ACPI/I2C core does it to be confident, but
I think it would be ok. Doesn't look to me like the bus number is
involved; my sensor's device names come through as "i2c-OVTI2680:00";
that's just a prefix tacked on to dev_name(adev->dev). I'm sure there's
something that will stop it being quite so easy, but hopefully not
insurmountable.

> Maybe this calls for extending the gpiod lookup API, but that would then
> likely be something we would build on top. I'm thinking about a way to
> specify the GPIO mapping in the software node, and retrieving it from
> there, the same way this is done for GPIOs in OF-based systems.
Yeah that's an option too; I had had the same thought actually. Probably
an extensive piece of work in its own right though
