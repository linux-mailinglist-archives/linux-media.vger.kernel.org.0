Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46816447C9C
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 10:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhKHJTP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 04:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhKHJTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 04:19:15 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00F7C061570;
        Mon,  8 Nov 2021 01:16:30 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id k0lNmeg9KFZvck0lQmuMHy; Mon, 08 Nov 2021 10:16:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636362989; bh=kUolfHZmV7/0vz8TfY+i/uV1QQ2ndW6GKWY0t/hohRo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UXwI/U7Ys6CRnLSvPTzSjnFVBavHK1F/kBB3ScYI/uUK0BQhbd/Y5AJjZ4+tlD9kc
         HKMTO6SF9CJRrer5CPu7+kmz0OFkHCy0vsVsMG13du4Qj3/9O0HhOcjJ0LNM4D5PRC
         wvPu+q/fkW2zYxauyYkpkohAPZubfNEjHfs6QXrl/NIw5/zvQ5eUjWPzly4cQIcbks
         FMDBvxC5eygI39i4VtKsRamyp2ZG1PLvj8pL2W+69lpXZOBmGQe266I15C7ogqIS/y
         FeQtPhHqsbLlA13quHZKVvbUA9jfcRjuQgmEW/Yqm/6Mj2v6G6Mfo54E4C6XMZTigy
         3Y23bK6NWRy2w==
Subject: Re: [PATCH] media: use swap() to make code cleaner
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        davidcomponentone@gmail.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Yang Guang <yang.guang5@zte.com.cn>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211103083337.387083-1-yang.guang5@zte.com.cn>
 <CAHp75VdZLdJS2SLijO+Ff-8OM+fBvS-R1er5ByYuw38qrRXRwA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1fb9ff6d-e129-5109-7431-c9da67d04d1f@xs4all.nl>
Date:   Mon, 8 Nov 2021 10:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdZLdJS2SLijO+Ff-8OM+fBvS-R1er5ByYuw38qrRXRwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLYF73KZX0vKTAc2gzI1+XCo3tLuD0TctFHFjeeSdrQP3lo5M3rhX0rCQw29ldbQ0046dB9gHo68714rXRpMtpTsdxqRFtouWWNCxwMHjEG2m8oU/f4k
 QUnDsSY1/Wg0wBdQORXDHv5FW7lyBEamTGv5bXdODDhDuLIB+TwwP1LzKmHNxssZgDdGI2+N8zn03wO1lkuTUVuVLizgGLkHDdEeKVvdiLUEnuRLCrvwTNhw
 L6BB1/kS6iMH383cYoybxSXOSt5M1htUJLYk97L4/0pd4adTWtKV/PYK+zb/X+SSzvjGPRKZtW6Na7z0Koe4lCOsfIUXkVKySPORcMKOSDM1ZrhGCZg2+L20
 /54izvY529epH+1GGfW4jvAwC6ympmLFAtziBY2UOjfB+r6W5gAHJR3NdLBsGWjtbM5Z9IJkXheq0cu4NlHM1DtXGhYa5c1Bj4whYW4bGNM7doXnTUyleGlU
 mGlOBzvZVRZDa5n0SwiFD0KALdPiE8UunLY7vA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/11/2021 11:43, Andy Shevchenko wrote:
> On Wed, Nov 3, 2021 at 10:34 AM <davidcomponentone@gmail.com> wrote:
>> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
>> opencoding it.
> 
> Same comments as per all your valuable contributions: just think more
> about the code that you are dealing with!
> 
>>                 if (dev->fmt->uvswap) {
>> -                       tmp = base2;
>> -                       base2 = base3;
>> -                       base3 = tmp;
>> +                       swap(base2, base3);
>>                 }
> 
> Have you run checkpatch? What did it say?
> 

checkpatch says all is fine :-)

But yes, the {} can now be dropped. If I apply the patch, then run checkpatch,
it will indeed complain about the {}.

Regards,

	Hans
