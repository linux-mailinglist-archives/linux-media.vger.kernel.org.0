Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11890692FAE
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 10:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjBKJL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 04:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjBKJL1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 04:11:27 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E6C6FEB7;
        Sat, 11 Feb 2023 01:11:21 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b13so9038047ljf.8;
        Sat, 11 Feb 2023 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyJN2jBDM0ZQ9e4AvGNxG2V2mglnEJ80cu8rJwEXHYA=;
        b=LPUo/RnI68TUc4H/+2vxdGf1usrKLVjkGCbX2FzNvCx9IMbfxTb6sdAlmr9t4JPWNf
         uEIapbF2H7+IiRh7uXiranYqs+mqQe8IcXude768YRMxQlzSBUApDxN9i9PKjiF2wSKb
         readvC5EYyubZ+z+bYRsU3AJOXBPETFE+6LtltkJqWMSTmHSHKkGr1ke7Np1+oN+V9t3
         riE/6yDyvbboa0+fQD+7r5zrK5SntFx+LeuMLMUyitHzYwnwR1ynwwvvloOMW3F43Mro
         9pM5n6cvzHexk3JMYFO+HVRerwWTo/n/QHGPeILdFr136XaeWJ4FyaU0XcDVjNbECuiF
         Iviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyJN2jBDM0ZQ9e4AvGNxG2V2mglnEJ80cu8rJwEXHYA=;
        b=IvyvRodI1SNHR7QGybGhC6dqfcvmUwwv7ZTp+S/cLr3Aq+3+A7BdS2BEUWBn0tFvK0
         Fbj4IA2Wxhw24t3+3ibzY/38zVKOWxCmuS4FHuyIxelB4R6WDZ1iN7Gn0AGeGkG6v97m
         H9QL94XHEBKfdVSCdNdQrQIhJpKGI0V0iL+21y+zkU8qM8OZfVNxdcwdrgy6OliTK9bJ
         Rx9DWuADybg+5w+kp/bykU3iTbuT1wn+jq+HFt67jxPUcrkYGTFMfXamx6VXlYVIiwk7
         qd7RP+30EO300JjyN0YFLQEWzUUHmiWymHLAhaXMW3F3WGWrpCVeLijpqLhsjZUajJbT
         A6XQ==
X-Gm-Message-State: AO0yUKWqNNzMLgHWqCULK8GSDCL++T0jNwv5bhcVM2W7kd6capDlU8ND
        WBwyhYfWtC/Q70lLapYlv5OnoSUwGig=
X-Google-Smtp-Source: AK7set80SoVou0TAiVnDQJmizMnt+SgefTjT/MF106Yswsdo/3D8u4waLuu067yBBYITz8Wdul4BDA==
X-Received: by 2002:a2e:8805:0:b0:293:2b97:c983 with SMTP id x5-20020a2e8805000000b002932b97c983mr4418505ljh.38.1676106679788;
        Sat, 11 Feb 2023 01:11:19 -0800 (PST)
Received: from [192.168.1.103] ([178.176.78.148])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e9d5a000000b0029335c12997sm641060ljj.58.2023.02.11.01.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 01:11:19 -0800 (PST)
Subject: Re: [PATCH 2/2] media: i2c: adv7604: Fix range of hue control
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230210225622.24411-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e2f92695-c681-616d-a565-89d348f00a3b@gmail.com>
Date:   Sat, 11 Feb 2023 12:11:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230210225622.24411-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 2/11/23 1:56 AM, Laurent Pinchart wrote:

> The ADV7604, ADV7611 and ADV7612 software manuals different the CP_HUE

   s/different/document/?

> value differently:
> 
> - For ADV7604 and ADV7611, the hue is specified as an unsigned 8-bit
>   value, and calculated as
> 
>   (CP_HUE[7:0] * 180) / 256 - 90
> 
>   with the range set to [-90°, 90°]. Additionally, the values 0x00, 0x0f
>   and 0xff are documented as corresponding to -90°, 0° and 90°
>   respectively.
> 
> - For ADV7612, the hue is specified as a signed 8-bit value in the range
>   [0°, 360°[ without any formula. Additionally, the value 0x00 is
>   documented as corresponding to 0°.
> 
> The ADV7604 and ADV7611 documentation is clearly wrong as the example
> values don't correspond to the formula. Furthermore, the [-90°, 90°]
> range seems incorrect as it would cover only half of the hue space.
> 
> The ADV7612 documentation is better, although the range should likely be
> [-180°, 180°[ if the value is signed. Given that the values wrap around,
> this makes no difference in practice.
> 
> The hue values have been verified on ADV7612 to follow the
> documentation. There is a high chance they do as well on ADV7604 and
> ADV7611.
> 
> In any case, all software manuals document the register as 8-bit, so the
> current range of the V4L2 hue control [0, 128] is not correct. Expand it
> to cover the full 8-bit space, using unsigned values to avoid breaking
> any application that may rely on 128 being a valid value.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[...]

MBR, Sergey
