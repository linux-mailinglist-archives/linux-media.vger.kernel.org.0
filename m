Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A508567B4A
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 18:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbfGMQne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 12:43:34 -0400
Received: from mout.gmx.net ([212.227.15.19]:38105 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727656AbfGMQne (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 12:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563036189;
        bh=UwOTxlpedAtIJteQ+EbYcD45ermXVB3b8k/rX3ec3R0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=LlCGds8tLFHkxQY4A8DYQ+UAbiJQU028pr6FQHzOsrURWh+QiN2Vv/OZvVfaqCol9
         1VHWdYfibOHTQNvIEiNHVopZJLq4qxGM4dCAiDDsxdT21Nfpkxmmm93UsEFtrbH/qC
         x6CfyMVaac32WKrRbDUyOB/9d8sbNsvqo4rDdK4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.43.148] ([188.29.165.74]) by mail.gmx.com (mrgmx003
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0LwIuc-1iXL3y2psk-0185OJ; Sat, 13
 Jul 2019 18:43:08 +0200
Subject: Re: [REGRESSION] Xorg segfaults on Asus Chromebook CP101 with Linux
 v5.2 (was Asus C101P Chromeboot fails to boot with Linux 5.2)
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
References: <59042b09-7651-be1d-347f-0dc4aa02a91b@gmx.co.uk>
 <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk>
 <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk> <2648434.ut0pN6mfR1@phil>
From:   Alex Dewar <alex.dewar@gmx.co.uk>
Message-ID: <2d52b787-187c-5638-660c-33d51a07770c@gmx.co.uk>
Date:   Sat, 13 Jul 2019 17:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2648434.ut0pN6mfR1@phil>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JRa8kHbPxKGkpPygG10tX/aBQSMIisJJ9fXnJjgZuyZ1W7GC+Mp
 UWk2xOEa+tqjn8j3Fydrl7wjTyNAo4dzQaHGBneHQwzWL8L0x29CRmeKCq0qpkFe7sy3UMj
 VIrUk1ExlWOkyAkJxv3p7SybwDr98MbR7e2wtwG3O0iRaUKx9NI2fHU70L04yvE8Q9q3XyJ
 sFEmN+nz9ndgdoGzIU24A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w4DUqOcE0LY=:WP0Ayt3RvUP59J/j6MUqTK
 7pAH60CiZthm4S9UOwZO7na+vFNfY80H0SkBkOq/XAmsJawrqisvGG7o2u/laPEZyNQ80UQka
 FU3JXw3Pkf+V+TVlOCTs+YK1jUMOG9O4gHwtTKMSChU/XDyWxje2DI597MkODMeojaWY3OF4S
 vXLGo0JOViaf7RK3V13r7x11ac71ZRZDF7eEQknTQnG/rCkDki/Og/69f4T6RzDWbRJLf0B3V
 B29gfO1H2T5z5e6iB+E2MZgEEAZXoWyUU1uzCqOCnK3dgCxUX77eV01dF55AJz2czL575PDLr
 hOxNDEh9OLi7tctbmo7mF2AWX+oRWFcVlomcAlDnNFp7i+Sa6CUmREEOfodipidbiE3GCbZB2
 hVw2Tx3scBApcn283GxyMBJvnzc3HfeAfl2sepC5w4lfXbS0nsdNtZgemPzFGiNlPLMtFuYUN
 n/nJqiiD4DDfnpGKkpu1sTFcTIJDnTd0/XqE2zBoUsn0yMZlYz5ZUgJ48kKBEqULZGsVy1Izh
 rDMCp74boOgMAAbl31ujlH9m55IR1DLbnQi9r/BRu1a/F/5BZhDvI49EpGKWlQIVtykpBAczX
 Q8oBrsBIBR/0y13IVHu/LyI7OjtgivJSrgbv5rlyTUOgbVPJcuHgDETQ2kEyW3ncvhQw/UatF
 BeH50lKO8E5CqNAjvv5v4P7o6hk1YElaDCM+/sS7vhIivxr5KCe8i0sAEHm9GQYQx9XBvplMW
 qll72M8rekGmMla2b3pPnpDjlx4pEQ8KvONfjx7l9lnIFI8CRR6413j7CPpvDzQY+LrSBke1y
 aqVySXnaQkgGzKsF1qgRyF8q71GsYroJe393asclnNW3IS5AuPLeGX5qxnfudHak+1Yevhwhs
 1QfqvCVUWh7ko6kW3RUGiGTpVCO+6k/n7nN6xeXcDSGfEu4KHE99UMMZ/+mnGFn1bnxViPU/F
 1OlK1xeq4RKkRby0B4Efnxwo1owMXBfmqVaBfBGwE+ZXpimyeqUcqDJ3QpzU0V/BWDWgQCgIs
 3GuD0tGmVpb9WwQxOkdh97NEenhL1ydmNVrLIg4JYKmurB2rXgT7KWj6tPwb+hCjy5gfYS5qd
 JzejdaCIP1RedpkyvkYYSOiXsfBBom7EYgO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/07/2019 16:17, Heiko Stuebner wrote:
> Hi,
>
> Am Samstag, 13. Juli 2019, 13:38:45 CEST schrieb Alex Dewar:
>> I initially thought my machine was failing to boot entirely, but it
>> turns out it was just failing to start the display manager. I managed t=
o
>> escape to a tty by hammering the keyboard a bit.
>>
>> I suspect the culprit is the rockchip_vpu driver (in staging/media),
>> which has been renamed to hantro in this merge window. When I run start=
x
>> from a terminal, X fails to start and Xorg segfaults (log here:
>> http://users.sussex.ac.uk/~ad374/xorg.log). X seems to work without any
>> issues in v5.1.
>
> 5.2 also has support for Panfrost (Mali-Midgard GPUs) but I'm not
> sure if it already can support X11 yet and your X11 log mentions
> libglamoregl in the segfault stack trace.
>
> Apart from it bisect that Greg suggested you could also just try
> blacklisting either panfrost or vpu kernel modules
> /etc/udev/somewhere . This would prevent them from loading
>
> Hope that helps
> Heiko
>
>

Hi Heiko,

Thanks for this. I blacklisted the panfrost driver and X magically
started working again.

I'll try to do a bisect later to find the offending commit though.

In related news, it also seems that the sound and wifi drivers aren't
working either in 5.2 (although I need to do a bit more testing to
confirm the latter).

Best,
Alex
