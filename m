Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A07664013
	for <lists+linux-media@lfdr.de>; Tue, 10 Jan 2023 13:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjAJMPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Jan 2023 07:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238371AbjAJMP1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Jan 2023 07:15:27 -0500
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6942DE4
        for <linux-media@vger.kernel.org>; Tue, 10 Jan 2023 04:14:10 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4NrqVN1CwBz9sm0;
        Tue, 10 Jan 2023 13:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flowerpot.me;
        s=MBO0001; t=1673352844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gY8VdTrqiCm0nV/GdFR2kjViWRwiqpU4o1LfEzdYFA4=;
        b=X1GfXH4VoKRkT2WTE5MZMujOk1NNPfWXed12H2mt1dpDeXpX4Qde0wcqrK+v1F50fJVDuL
        0vHS4wtuxEClTlnVratHltl44iLOokbTzI9HB0FkCa/OoGHGGllOoRSS8rhfEGl+8Pn00v
        5k8w2QSDTcwGk3xqoIxz1UXw/+QovP90EYkVF1Z0ca3AkwuJaaM3Q3uu8vE3NbEtee9Yve
        kioijYenba3QUl7XP8Be13kXjGleGlGt1KcxmCeut6dEKQ+Qg6CUDG14pJ6s/9EVbIHTnD
        /ksW818GTdMaP2ogfaGHKW4hz38h5Ts7ltVMfafYkSyvGVU1MiPxnkEHoHbN0g==
Message-ID: <0472f1b7-ed0f-63a5-918d-98cabb4ba4ba@flowerpot.me>
Date:   Tue, 10 Jan 2023 13:14:02 +0100
MIME-Version: 1.0
Subject: Re: Potential integration of thermal cameras into v4l
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Sophie Friedrich <lkml@flowerpot.me>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
References: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
 <20230110104626.23f476df@ferris.localdomain>
 <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
From:   Sophie Tyalie <lilly@flowerpot.me>
In-Reply-To: <20230110114518.cp3bitj4hketc2ix@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4NrqVN1CwBz9sm0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pekka and Jacopo,

I'll not quote the whole exchange now, please tell me if this is an
anti-pattern.

On 10/01/2023 12:45, Jacopo Mondi wrote:
> On Tue, Jan 10, 2023 at 10:46:26AM +0200, Pekka Paalanen wrote:
>> Hi,
>>
>> since no-one else replied to you yet, I thought to mention my 2c
>> (I don't really do camera stuff myself so far):
>>
>> Perhaps the best place is to reach out to the libcamera community:
>> https://libcamera.org/
>>
>
> cc-ed the libcamera list

Thank you. Maybe libcamera is the better place to work on this.

> I agree it would be interesting to better understand what you mean by
> driver here.
>
> The camera seems to be a UVC camera, does it deliver frames with the
> current UVC driver or do you need kernel patches to support it ?

I'm not fully familiar with the UVC driver, but I very much doubt that
the camera speaks anything resembling the UVC protocol.

Guide build an RPC interface over USB, which they use to probe the
camera and retrieve data that is needed later on (manufacturing
calibration files, temperature curves, available modis, …).
Afterwards they tell the camera to send the raw frames on the
same channel (by sending `StartX=1`).

> I would also be interested why it needs to go through v4l2loopback..

I've currently used v4l2loopback in order to get the processed frames
from Python into the v4l2 system, so that I can access it further on.
There are probably better solutions, but it was one that I know and is
easy to work with.

An actual driver developed for v4l2 or libcamera would make use of the
standard ways of course.


>> It sounds to me like you want to do some hardware-specific
>> processing in userspace, and it might not be great to try to come
>> up with a generic thermal camera API at the kernel UAPI level.
>> That's where libcamera fits in.

This is probably true. I'm not sure if a generic thermal camera API is
even feasible, as every manufacturer does their own thing fully outside
of standards.

Together with the Guide MobIR Air, we could also implement the Flir ONE
USB camera which also already has an user space driver¹. But these two
cameras work completely differently in many regards (even conversion of
raw to thermal values).


>> As for the pixel type, maybe use a floating-point type to avoid
>> range/precision problems? E.g. DRM_FORMAT_R32F for application
>> facing API. That format does not seem to exist yet, but it's
>> trivial to add into kernel's drm_fourcc.h and should be well
>> accepted IMO.
>>
>> Thanks,
>> pq

Yeah, I would have preferred a floating point type too, but
v4l2loopback doesn't support one (yet).


>>> [1]:
>>> https://www.guideir.com/products/mobileaccessories/mobirair/data_300.html
>>> [2]: https://github.com/tyalie/pyMobirAir-v4l2/
>
> This link is broken :)

Yeah sorry. I forgot to set the Github repo to public. It should be
fixed now.

Thank you all,
- Sophie

[1]: https://github.com/fnoop/flirone-v4l2

