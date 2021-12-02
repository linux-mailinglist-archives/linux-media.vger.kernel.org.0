Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0253D466226
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 12:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357234AbhLBLSf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 06:18:35 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:44158 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234740AbhLBLSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 06:18:34 -0500
X-KPN-MessageId: 0ee039e6-5361-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 0ee039e6-5361-11ec-8862-005056aba152;
        Thu, 02 Dec 2021 12:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:date:message-id:from:to:subject;
        bh=AmU1zRuPtNlNWEYuHpEHjuzyuc6FeMRAnaW6CRkXaWE=;
        b=hcdlrCIHK9TttRjJt718B1zr/74/UdK2JiIsqmd2GNv1cSRRFdsTgjX/4Sc4Vsk3kEzUbhEFP/yT5
         dALIV8+KRbfkxGXtufuvnISr2o+GmJh/2TTI+t5WmGU9VwvhQ4BWoVoaOH9jHia5UB3dLdX3ljv35N
         RYP3oKGjgTINl42ofzMYm3rSDrhDMfRLI2A69Kdy3PHV5N47mc9Jjhqnwr1RkAYE08b8NvmGhzTh8u
         F1LqwLto3hORovbvkDtlh2DWLx8YT2mE1PKSZmIw1rp+HZK7OxhyDGe3DKJtoWN8I8IQjEahXOTDBS
         FATdYvnamKXVw1C/OlMX5Mh0QUsz8Bg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|qs1BxD9lh9RsZGtc/4mYw2NBFRVpoz1d4srVeMiucXp27l60U5Y+yfgKXprcxXC
 GTTy3nbe6c+ie7LQJ/8XPjA==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 1d1baed2-5361-11ec-94d2-005056abf0db;
        Thu, 02 Dec 2021 12:15:11 +0100 (CET)
Subject: Re: Kernel oops bisected to media: videobuf2: move cache_hints
 handling to allocators
To:     Daniel Scally <djrscally@gmail.com>
Cc:     mchehab+huawei@kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <d0dcd227-0753-5e9d-f757-4819cc271d4f@gmail.com>
 <YZhq0o7p0dVWeueC@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d4be3ea9-5d41-0a19-c03c-4037d01d1b6a@xs4all.nl>
Date:   Thu, 2 Dec 2021 12:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZhq0o7p0dVWeueC@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Daniel: ping!

On 20/11/2021 04:26, Sergey Senozhatsky wrote:
> Hello,
> 
> On (21/11/19 22:41), Daniel Scally wrote:
>> Hi all
>>
>> I've been experiencing an oops trying to run libcamera's qcam util
>> (which starts streaming on a camera sensor - the ov8865), which I
>> bisected down to the patch cde513fd9b35: "media: videobuf2: move
>> cache_hints handling to allocators"
> 
> Can you please check if you have these two patches in your tree:
> 
> https://lore.kernel.org/lkml/20210928034634.333785-1-senozhatsky@chromium.org/raw
> https://lore.kernel.org/all/20211101145355.533704-1-hdegoede@redhat.com/raw
> 
> If not then please apply, this should fix the problems you're seeing.
> 

I really like to know if the cause is indeed that you are missing two patches.

Regards,

	Hans
