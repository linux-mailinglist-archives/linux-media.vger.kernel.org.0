Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A1446D013
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 10:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhLHJbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 04:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhLHJbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 04:31:32 -0500
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895FDC061746
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 01:28:00 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id utExmfMqmgFRtutF0mL1wt; Wed, 08 Dec 2021 10:27:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638955679; bh=e1Ahxpf21OtARi7R0FZtxGAi7oWn5OaJOh/8h0Z9c6s=;
        h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From:
         Subject;
        b=OZtQ794rQF8dxSuOTelg4Y9H16zph+3Nk7GZ/65KqJTzuZE8VEpiXzlZMtzxCgOya
         obJ4GEEC1cgdr4ook4gCX4eBaEn47xOmTeOU78STIEa5dn75qcVf+w0u8w5Mgs10cs
         h6WjUe0XZweG7xioe8tyGkz4HPev5qtVKZggDX02Q28uX7P9o036Dcy5G7J58xfDgh
         FYblvX5HyrlWtVolcz0A+xP9OX0Z6PSdCEvXUTVtfdeXnd293V78e1ElAJOHwL3Q0s
         qvEID84AntF/FGt6X/UDuVvPkCF28HcIIIvyAKXBsq0xiTWv7KfFo9esc7SQ4mbsBh
         D4WCHp5L2biGA==
Message-ID: <fe41d021-09cb-63ad-9e0e-d1457ce0aa49@xs4all.nl>
Date:   Wed, 8 Dec 2021 10:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: Kernel oops bisected to media: videobuf2: move cache_hints
 handling to allocators
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>
Cc:     mchehab+huawei@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
 <YZhq0o7p0dVWeueC@google.com>
 <d4be3ea9-5d41-0a19-c03c-4037d01d1b6a@xs4all.nl>
 <17f34600-2717-d125-62ba-fd933b3b59f1@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <17f34600-2717-d125-62ba-fd933b3b59f1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDejKI1ZYwa+69Ok33aAOFIkB8TW2D6i8qdISNh6fQgxhrOfLqVM2AluyI9tbVt+iN5ruICX78csgpEHu7SbUL+YywluqVk2/RKnP7Qndr/v13UpPgti
 pWMlxHlG8bgyC7LRT5FgKy/2HF8+IjC6YFL6fVkBZKkdvjQCCUPx0Mzhm/XNEGazA9aE5vBz3oXxIMkazlLqm+OOxFIld/Wm33gAq0byZUJwEj79guCRn+ym
 +ayZ90WlN8OO6xh/ZF0+2ZGDif7PdLPxAGr7si+GUTEfMIcWyeqoFtPKB14JNsgN7ql4fVaFKxfER2kahgNlLQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/12/2021 22:41, Daniel Scally wrote:
> Hi Hans
> 
> On 02/12/2021 11:15, Hans Verkuil wrote:
>> Daniel: ping!
>>
>> On 20/11/2021 04:26, Sergey Senozhatsky wrote:
>>> Hello,
>>>
>>> On (21/11/19 22:41), Daniel Scally wrote:
>>>> Hi all
>>>>
>>>> I've been experiencing an oops trying to run libcamera's qcam util
>>>> (which starts streaming on a camera sensor - the ov8865), which I
>>>> bisected down to the patch cde513fd9b35: "media: videobuf2: move
>>>> cache_hints handling to allocators"
>>> Can you please check if you have these two patches in your tree:
>>>
>>> https://lore.kernel.org/lkml/20210928034634.333785-1-senozhatsky@chromium.org/raw
>>> https://lore.kernel.org/all/20211101145355.533704-1-hdegoede@redhat.com/raw
>>>
>>> If not then please apply, this should fix the problems you're seeing.
>>>
>> I really like to know if the cause is indeed that you are missing two patches.
> 
> 
> Apologies for the delayed response - I was indeed missing those patches
> and, having added them, everything's working fine.

Great! Thank you for taking the time to confirm this.

Regards,

	Hans
