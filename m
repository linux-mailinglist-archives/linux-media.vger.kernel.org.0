Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE37A297F6E
	for <lists+linux-media@lfdr.de>; Sun, 25 Oct 2020 00:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762538AbgJXW2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Oct 2020 18:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762500AbgJXW2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Oct 2020 18:28:10 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6066C0613CE;
        Sat, 24 Oct 2020 15:28:09 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y12so7366322wrp.6;
        Sat, 24 Oct 2020 15:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DLMvmiGErsLTvHJlAUfm5XCoZVDF9c6VQwTXEbmBAMM=;
        b=bd++ygZpbXy8AU457/vEPIxmaxI41RoSc7HV9NEpYgjV94zX40vQnhaI/0AaGiMjZQ
         4+jZ3jVjSOljKUV5OlU3napeL52DOdD4nV1Squ6cqsU0uKSNDZKPYAujgkYfJk5fJusz
         0+RXWAZqd7R2R+pk7PEju/O+41yVvP+h72Hn2J+dVg4ggFqM8mrnG2KLdFk02dM6eTPb
         PV+uCFdSEXKMjXlojQKDrUApuz7QRtw1VCi9i1i2X1J5pUdssgZX8c7RCrDWgpoLblWW
         JeGDGxvYiJrzX8MkBkH7ThyL3JoOXd6ixmKBzogEv+CNMV8v3VF+l6EqgLrzU52B9+N2
         shsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DLMvmiGErsLTvHJlAUfm5XCoZVDF9c6VQwTXEbmBAMM=;
        b=fVu8HMxJx3aGFjsXNs4kkNoanw8X0N9seRaNvzh1H367QyA5AWeNe7qURaj2tC1twD
         ZCFoqX/cIyYfhRlFIjc6uDTSq6PNLO5r5WtIUeBA9fCfgrTxsGO260+Vw5QgJ6uzrhU3
         X+rXFp49W9wteWGfNiwaks5dSmwy1dNG6DjQ7jhIez3ISSZO86envMZ5uEUWeX2XklAc
         yhgDwREBclJHu40oOQH/dsB1/ba6FK7aYF57EmMs6zI027FojIDo90WePAxYU+hU89SH
         R1GlX57EoGjjTG46bVnoYCW0Bzu+aZEH/Cz0x3unryhMA37HEMnBY42V8gh0Ss1tKMNV
         6FDg==
X-Gm-Message-State: AOAM530jdqrwIViGjjxCtPiz3tE0/6ASN8oxdxVcfht8YnYO3/XrbNY8
        /5/rPO/U8rJBsItEOBYyKSE=
X-Google-Smtp-Source: ABdhPJw5+gEdxMkXXcTkmCAdjGA4pdY/G217J8ItT72HsCxIQ8xPYpNbF7yN+tJpWCTlhyOTkv3XcA==
X-Received: by 2002:adf:d849:: with SMTP id k9mr9317520wrl.332.1603578488363;
        Sat, 24 Oct 2020 15:28:08 -0700 (PDT)
Received: from [192.168.1.158] ([2.29.20.56])
        by smtp.gmail.com with ESMTPSA id 4sm14205299wrn.48.2020.10.24.15.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2020 15:28:07 -0700 (PDT)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <748d34c3-a146-12fe-22c0-8dfef9006ea0@gmail.com>
Date:   Sat, 24 Oct 2020 23:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201024093702.GA3939@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 24/10/2020 10:37, Laurent Pinchart wrote:
>
>>> I wonder if we could avoid depending on the I2C device being created by
>>> getting the fwnode from adev, and setting ->secondary manually. adev
>>> would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.
>> Let me try that; I initially wanted to do
>> set_secondary_fwnode(&adev->dev, fwnode) to avoid depending on the I2C
>> dev being created but it turns out &adev->dev isn't the same pointer. I
>> shall try it and see.


Actually, thinking on this further I think maybe we can't avoid that -
it's not actually in this patch series but during assigning GPIO
resources parsed from PMIC's ACPI node to the sensor, I'm using
dev_name() on the i2c dev to pass to .dev_id member of gpiod_lookup_table

