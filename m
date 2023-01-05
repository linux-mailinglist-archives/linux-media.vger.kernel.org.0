Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA5A65E6DB
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 09:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbjAEI3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 03:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjAEI3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 03:29:08 -0500
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BBC2020
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 00:29:05 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id ud5so88544522ejc.4
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 00:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGHlop3cCbBfoVNnfx7yeftwRQibFydm8ZewcBvk/M8=;
        b=xWaTtOHQ8L6h9pCPmi6qZT9aWiSB31Mfzwelap1+GFoD3ZtZpOt23hyOdRdWzs9dWd
         aETI4aUlazlmvtulPYf46HoF/WUJVykPjbfVmNQ7lAXbxPoNQ7fnBU1kNIPBU9ExRnVp
         TAou0dtGn9d/g2qWkdAghURHmNmRM+HWZ+YApLkuPeTWKPYJHduWI3b4Q2uPGshu8Y0B
         wG/Ghh16+yO4XPofAJNkZJ3pvuz1A4gM/CjPyqqjyGm+CCELVuzBBkG1mq78oKiwbWgO
         s5h0zaRVWKyzvRh6QHlBgCRPZy7smgEPYog1GvTZf37QM295UiDtojrmu/pyP/kzQqLK
         N9Sw==
X-Gm-Message-State: AFqh2kpYI4cjRp1/lInWuPFJkHcIh8+HXFNYg5NJR4uQKUVWhcX1pgUz
        /eXCj+Hei+NPhyTLuHygEfCciFWspavvFA==
X-Google-Smtp-Source: AMrXdXtdyYVIEW1j78tJBxMqR0264+FvKjroKe0n1IDvY1jml2EXzVDy9Jkuy0wG3gcT4NT/LMe4Ww==
X-Received: by 2002:a17:906:60cb:b0:84b:b481:6188 with SMTP id f11-20020a17090660cb00b0084bb4816188mr33845725ejk.64.1672907344510;
        Thu, 05 Jan 2023 00:29:04 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090778c400b007aee7ca1199sm16485095ejc.10.2023.01.05.00.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 00:29:03 -0800 (PST)
Message-ID: <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
Date:   Thu, 5 Jan 2023 09:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
 <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
 <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
In-Reply-To: <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05. 01. 23, 8:23, Laurent Pinchart wrote:
> On Wed, Jan 04, 2023 at 02:12:44PM +0100, Ricardo Ribalda wrote:
>> Hi Jiri
>>
>>
>>
>> I think that /dev/video3 belongs to your notebook webcam, not to the EasyCAP.
> 
> That looks correct.

Yes, you are right -- only 2 devices (4+5) are created. I don't know why 
I thought there are 3.

>> 720x480 I believe is the NTSC resolution.

Ah, that makes sense. Which leads me to: sometimes, the picture distorts 
after I start playing the video. It's skewed and halves of the picture 
switched [1]. I assume the driver expects NTSC@720x480, but the device 
sends PAL@720x576, actually. Sometimes, there are also color strips.

[1] https://hci.fi.muni.cz/~xslaby/n/skew.jpg

> Can you try starting the
>> VHS, *before* you connect the grabber to the USB? Maybe that way the
>> device realises that it should be working in PAL not in NTSC.
> 
> Good idea. The device advertises a maximum resolution of 720x480 in the
> UVC descriptors it exposes to the host, so there's nothing the driver
> can really do to obtain 720x576.

That doesn't help. Maybe it would sound foolish (I don't know the 
internals), but would it make sense to re-read UVC parameters on each 
device start in open? Only as a debug aid to see if they change.

> If plugging an active PAL source to the device before plugging it to the
> USB port doesn't help, another option for investigation is to capture
> USB traffic under Windows to check what happens there.

OK, I can try it. I have win10 virt machine set up. So that should be 
easy using usbmon. Except I don't know how to read the mon dumps. I 
should start at Documentation/usb/usbmon.rst, I believe.

thanks,
-- 
js
suse labs

