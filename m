Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B5B66B4D1
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 00:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjAOXpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 18:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjAOXpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 18:45:38 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3395113537
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 15:45:37 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 870DE85258;
        Mon, 16 Jan 2023 00:45:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673826335;
        bh=W+XMQB6+qD6def5W7Q0EXnQMXiW2/ldThjmVsVy0qMY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SHmRDB3Qk2ebmbbu+fjTGbSwEMNiQmmT6X+r1ZVOMUYYqY/1zur5PQH6bkNKGI93y
         EOtkaivZdQDx2ud/bnb5ZfE2e4Nnk0mt+06FfvCSx5zuK/FidFD46xAzgI8xc5ZKwB
         v+luOk3Mz23AbEe521DlqBJA/Rkkp1FW+E8/qjzm8S+j3MrFO69YEmg7pqCzPYV5rZ
         jFWE7jlRoXdOeQMal5b34eak5IZFyu4JCwTAqB/bzwG0XTGiLdhtw99uX2MfUnGw5m
         Rnpklol37fzuY5lIlSWxeobwTpG2RoAFTOq1500yARletSidJo6b5023D2XqDY7ycf
         HSv5sPWFniKhg==
Message-ID: <02b50474-8ce0-31e8-92f5-653774d24d4e@denx.de>
Date:   Mon, 16 Jan 2023 00:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
References: <20230110195331.175103-1-marex@denx.de>
 <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
 <3dcf0665-a3ba-1279-2bc8-0e5d6f9319bc@denx.de>
 <Y8Rw0Ok9JpoflkEt@pendragon.ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y8Rw0Ok9JpoflkEt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/15/23 22:32, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Fri, Jan 13, 2023 at 02:03:33AM +0100, Marek Vasut wrote:
>> On 1/13/23 00:15, Laurent Pinchart wrote:
>>> On Tue, Jan 10, 2023 at 08:53:31PM +0100, Marek Vasut wrote:
>>>> The Cypress EZUSB FX3 UVC example can be configured to report pixel
>>>> format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
>>>> BGRA/X 8:8:8:8.
>>>>
>>>> The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
>>>> This seems to be an extension documented in the Microsoft Windows Media
>>>> Format SDK[2]. This Media Format SDK defines this GUID as corresponding
>>>> to `MEDIASUBTYPE_RGB32`.
>>>>
>>>> Note that in my case, the FX3 UVC can output either channel order,
>>>> BGR or RGB or any other mix for that matter. Since Linux commit
>>>> 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
>>>> defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
>>>> this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
>>>
>>> I'd like to see documentation of the MEDIASUBTYPE_RGB32 format that
>>> indicates the components order precisely. While there's a high chance it
>>> maps to a BGR (in the V4L2 nomenclature) format, there would still be
>>> two different options for the A or X component.
>>
>> Maybe this ?
>>
>> https://github.com/MicrosoftDocs/win32/blob/docs/desktop-src/DirectShow/uncompressed-rgb-video-subtypes.md
>>
>> "
>> Remarks
>> ...
>> For RGB 32, every pixel is an RGBQUAD. Each color is one byte, with a
>> value from 0 to 255, inclusive. The memory layout is:
>> Byte    0       1       2       3
>> Value   Blue    Green   Red     Alpha or Don't Care
>> "
>>
>> Maps to
>>
>> drivers/media/v4l2-core/v4l2-ioctl.c:   case V4L2_PIX_FMT_BGR32:
>> descr = "32-bit BGRA/X 8-8-8-8"; break;
> 
> Thank you for digging it up. Looks good to me, except that
> V4L2_PIX_FMT_BGR32 is deprecated (see
> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/pixfmt-rgb.html#deprecated-rgb-formats).
> You should use V4L2_PIX_FMT_BGRA32 or V4L2_PIX_FMT_BGRX32 instead.

V4L2_PIX_FMT_XBGR32 , right ?
