Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95D12A799C
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgKEIsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgKEIsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 03:48:36 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5E1C0613CF
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 00:48:34 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id v5so735326wmh.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 00:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O5ctiIecOJMj5eydurD3p6Qv3uyEbdZ4aY7Y/2rpsMY=;
        b=WT0FzCo+BNbA8JWMIpfGgfK7dbc5XyCEqEUvaTcZAjw8FC+egAZ1eLbD7z7HaVbEz4
         SO+/Ms0CqzUYHKEZ+WZUCVU7NADftXs1PzSoR9n4DfjJDhcYWtRQ5bFe3kgQ3xO/+JDl
         3f4JJOC2eWXem7N3muXa5F+9nMo+QXTxYHsFnl3b3Xhb74I76Y2OZvZdhO2IoG9dyf9d
         6N47yxIXeEFJwLOXcLFhCto5GAKej4836DePpJ0KhFIdx0rnoKJsr7X2pzKCpteJv+L2
         O1xZH/P0O1KVEacLcO1DiyMcMKBPjHhXzkUQIdminTPPXMfto+/NgnNIQelHpwn0VdJi
         dAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=O5ctiIecOJMj5eydurD3p6Qv3uyEbdZ4aY7Y/2rpsMY=;
        b=cqj4jpf/iqFp8kXvdS3PK+nRqPNOpNiaJns0SWhwROFXUlC5K/Oa/ABoZzAY77/6i1
         +2x1+F3SMGUfSIB8YyDBZGuWKIqImGqoUl5YzHmHuWCikgfzw+0xZR74BJwF69byqXDC
         W4R6nxLq8eN4aetYrCtXVpjjyjAPH5/Gvh3tZ5kfB/l54vVRn4Mmf5Yj+Ia1XJk2Bd8x
         kK9y/AmRdLfaOZLoCl+i0tShPSKgqkJ5Hj3BIb9Bt/ewQbtPZkugvtRnDrwuT4cQOFim
         j/V+ocPo469KbGjul1aDiUwLywxHyu5MCHUynY6itPT2Yo/UxBYlH9Dw+ABqYkDQcE9P
         do7Q==
X-Gm-Message-State: AOAM531Q2ZQpGAkdQnU4uDjfzIL9QOKn4hKk2jdozfRA1fnn+KzYAQ+x
        e3PX8j1Wwv/+EAPpk0QPwI9dStPjD9tthclp
X-Google-Smtp-Source: ABdhPJxR2MQzc0ZU6rTFw6KfIuUQz6VyBpLGVhqsuUKIQyoeReigUQZtyw2H7rWk9P1FJua3X/S1VQ==
X-Received: by 2002:a1c:3846:: with SMTP id f67mr1513384wma.33.1604566112817;
        Thu, 05 Nov 2020 00:48:32 -0800 (PST)
Received: from [192.168.1.47] (home.beaume.starnux.net. [82.236.8.43])
        by smtp.gmail.com with ESMTPSA id m14sm1466053wro.43.2020.11.05.00.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 00:48:32 -0800 (PST)
Subject: Re: [PATCH v2 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
To:     Linus Walleij <linus.walleij@linaro.org>,
        Todd Kjos <tkjos@google.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Roman Stratiienko <r.stratiienko@gmail.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
 <CACRpkdZnpjas-WYuXhJ_mwCTqTP5DpWHcnNmGpdCQjrr3xGnYg@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e265e64b-d1b0-ed31-e82c-c339dd2bffe6@baylibre.com>
Date:   Thu, 5 Nov 2020 09:46:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZnpjas-WYuXhJ_mwCTqTP5DpWHcnNmGpdCQjrr3xGnYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

On 05/11/2020 08:53, Linus Walleij wrote:
> Hi Neil,
> 
> this is just a drive-by question and I'm looping in Todd in the hopes for
> a discussion or clarification.
> 
> On Fri, Oct 30, 2020 at 3:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
>> The GE2D is a 2D accelerator with various features like configurable blitter
>> with alpha blending, frame rotation, scaling, format conversion and colorspace
>> conversion.
>>
>> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
>> - 0, 90, 180, 270deg rotation
>> - horizontal/vertical flipping
>> - source cropping
>> - destination compositing
>> - 32bit/24bit/16bit format conversion
>>
>> This adds the support for the GE2D version found in the AXG SoCs Family.
> 
> We are starting to see a bunch of these really nicely abstracted blitters
> and other 2D-accelerators now.

The actual blitting functionality is limited to non-alpha blitting since
no standard CID are available for this, but we could totally try to find
common CIDs to describe the possible Alpha Blending properties for these
2D accelerators.

> 
> Is stuff like Android going to pick up and use this to blit and blend
> generic buffers?

I'm not sure this is Google's plan right now, but maybe it should be doable.

> 
> Or is this in essence a camera and/or video out accelerator thing?

No it's really a blitter & scaler, rotate & format converter, like
the samsung and rockhip drivers, and somehow the allwinner rotate driver.
Amlogic mainly uses it to copy frames beeing displayed for encoding,
or to convert frames from the HDMI RX on their TV SoCs.

> 
> The placement of this driver in drivers/media makes me think that
> it is for cameras or video output, but the functionality is actually
> quite generic.

It's really a memory-2-memory driver, like the video codecs, it's a separate
class than the camera & video output drivers.

> 
> I've been half-guessing that userspace like Android actually mostly
> use GPUs to composit their graphics, but IIUC this can sometimes be
> used for 2D compositing, and when used will often be quicker and/or
> more energy efficient than using a GPU for the same task.

Well drm-hwcomposer can already use the DRM universal planes and the virtual
writeback connector when available for compositing.
But this kind of driver can be really useful for display rotation for example
when the DRM driver doesn't support it.

Honestly I don't understand the Android graphics stack enough to formally answer
this question, but if it can be used, this kind of driver is much faster and much
simpler than a GPU for simple blitting and rotation.
And since they support DMA-BUF, they can totally be used in a modern graphics pipeline.

Maybe someone could answer ? Maybe drm-hwcomposer could be extended for that ?

I know there is an issue opened in GloDroid for that:
https://github.com/GloDroid/glodroid_manifest/issues/66

For the record, I use this driver to accelerate the LVGL flush to display on the
AXG SoCs lacking a GPU, this by using DMA-BUF and DRM atomic modesetting with the DRM
LVGL display driver I submitted (and tweaked for V4L2 M2M):
https://github.com/lvgl/lv_drivers/blob/master/display/drm.c

Neil

> 
> Yours,
> Linus Walleij
> 

