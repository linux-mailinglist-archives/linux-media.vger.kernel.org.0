Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079F1C9048
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 19:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbfJBR4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 13:56:07 -0400
Received: from jpvw.nl ([80.127.100.2]:53154 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbfJBR4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 13:56:06 -0400
X-Greylist: delayed 1981 seconds by postgrey-1.27 at vger.kernel.org; Wed, 02 Oct 2019 13:56:05 EDT
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1iFiL8-000437-RS; Wed, 02 Oct 2019 19:23:02 +0200
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     Gonsolo <gonsolo@gmail.com>, Sean Young <sean@mess.org>
Cc:     mchehab+samsung@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
References: <20191001205203.4b1a5fb6@coco.lan>
 <20191002141359.30166-1-gonsolo@gmail.com>
 <20191002141359.30166-2-gonsolo@gmail.com>
 <20191002142744.GA3475@gofer.mess.org>
 <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
 <20191002150650.GA4227@gofer.mess.org>
 <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
From:   JP <jp@jpvw.nl>
Message-ID: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
Date:   Wed, 2 Oct 2019 19:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all.

On 10/2/19 5:21 PM, Gonsolo wrote:
> Hi!
>
>> Antti has some great suggestions in that thread:
>>          https://lkml.org/lkml/2017/5/24/245
>>
>> Also note https://lkml.org/lkml/2017/5/26/357 if you have access to a
>> logic analyser.
> I read that thread. Unfortunately I'm not a hardware engineer nor do I
> have access to a logic analyser, just the device and a remote hope not
> to keep my custom 4.13 kernel forever or to have to buy a new DVB T2
> device. :(
> In the above thread it is mentioned that even the Windows driver
> receives the ffff's so maybe it is a hardware bug?
Looks like it is:
http://lkml.iu.edu/hypermail/linux/kernel/1710.3/03205.html
>
> I'd love to see this driver upstream but I have no idea how to
> proceed. Any suggestions?
>

