Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8048A6688D5
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 02:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjAMBDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 20:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240644AbjAMBDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 20:03:37 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078081A81F
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 17:03:35 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A9359829F5;
        Fri, 13 Jan 2023 02:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673571814;
        bh=1XFaZHmkb8YSF/bHCD7z/Pbj4IYhEiDhEY/GMEGJtt4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kq5Mw+P+4v8sozCRBQwgkyP35yjICkqfMrn8V1U+fkx+X75tMM11bZyjgQhnIIuaO
         0r7LggMDucHe0Ce8dG+n5CQPLfXVaP3QXOz3//JssgUPEPWLcr7C6fTVhWrHnUkwIQ
         OrrPxLBukZQmNS5wogi+Bge4osi7BuZELzjTBj3b1mniY8Is80LFi3i+D/Y2WsyESL
         qA2nGsLaXTq671Gb28cGC66XRLqke5NfNdZ4SfiuwbFOfkNSnPlRdn9jRkTw+LrfC2
         VS5YYx0ILTCjPf3bB1td6kd/r0aToDekijBX+Aq4WvFCSne87cx/6uhxNbGlSPokPA
         ByQHrsSqKC4ww==
Message-ID: <3dcf0665-a3ba-1279-2bc8-0e5d6f9319bc@denx.de>
Date:   Fri, 13 Jan 2023 02:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        William Manley <will@williammanley.net>
References: <20230110195331.175103-1-marex@denx.de>
 <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Y8CUo17laYyY9/c2@pendragon.ideasonboard.com>
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

On 1/13/23 00:15, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Tue, Jan 10, 2023 at 08:53:31PM +0100, Marek Vasut wrote:
>> The Cypress EZUSB FX3 UVC example can be configured to report pixel
>> format "e436eb7e-524f-11ce-9f53-0020af0ba770". This is its GUID for
>> BGRA/X 8:8:8:8.
>>
>> The UVC 1.5 spec [1] only defines GUIDs for YUY2, NV12, M420 and I420.
>> This seems to be an extension documented in the Microsoft Windows Media
>> Format SDK[2]. This Media Format SDK defines this GUID as corresponding
>> to `MEDIASUBTYPE_RGB32`.
>>
>> Note that in my case, the FX3 UVC can output either channel order,
>> BGR or RGB or any other mix for that matter. Since Linux commit
>> 1b8dc32286a1a ("[media] uvcvideo: Add GUID for BGR 8:8:8")
>> defined a GUID for `MEDIASUBTYPE_RGB24` channel order as BGR, keep
>> this change consistent and define `MEDIASUBTYPE_RGB32` as BGR as well.
> 
> I'd like to see documentation of the MEDIASUBTYPE_RGB32 format that
> indicates the components order precisely. While there's a high chance it
> maps to a BGR (in the V4L2 nomenclature) format, there would still be
> two different options for the A or X component.

Maybe this ?

https://github.com/MicrosoftDocs/win32/blob/docs/desktop-src/DirectShow/uncompressed-rgb-video-subtypes.md

"
Remarks
...
For RGB 32, every pixel is an RGBQUAD. Each color is one byte, with a 
value from 0 to 255, inclusive. The memory layout is:
Byte    0       1       2       3
Value   Blue    Green   Red     Alpha or Don't Care
"

Maps to

drivers/media/v4l2-core/v4l2-ioctl.c:   case V4L2_PIX_FMT_BGR32: 
descr = "32-bit BGRA/X 8-8-8-8"; break;

