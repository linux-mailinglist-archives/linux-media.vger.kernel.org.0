Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB3767671
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 00:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfGLWLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 18:11:31 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:8534 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727362AbfGLWLb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 18:11:31 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 542C419F574;
        Sat, 13 Jul 2019 00:11:12 +0200 (CEST)
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Brad Love <brad@nextdimension.cc>
Cc:     Antti Palosaari <crope@iki.fi>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
 <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
 <20190712144537.2bad2482@coco.lan>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <10f064c5-1634-c9f9-fcc9-6ab51b7f8f0b@free.fr>
Date:   Sat, 13 Jul 2019 00:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712144537.2bad2482@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/07/2019 19:45, Mauro Carvalho Chehab wrote:

> Brad Love <brad@nextdimension.cc> escreveu:
> 
>> On 04/07/2019 05.33, Marc Gonzalez wrote:
>>
>>> +#define CMD_SETUP(cmd, args, rlen) \
>>> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
>>> +  
>>
>> This is only a valid helper if args is a null terminated string. It just
>> so happens that every instance in this driver is, but that could be a
>> silent pitfall if someone used a u8 array with this macro.
> 
> Actually, it is uglier than that. If one writes something like:
> 
> 	char buf[20];
> 
> 	buf[0] = 0x20;
> 	buf[1] = 0x03;
> 
> 	CMD_SETUP(cmd, buf, 0);
> 
> 	// some other init, up to 5 values, then another CMD_SETUP()

I'm not sure what you mean in the // comment.
What kind of init? Why up to 5 values? Why another CMD_SETUP?

> sizeof() will evaluate to 20, and not to 2, with would be the
> expected buffer size, and it will pass 18 random values.
> 
> IMHO, using sizeof() here is a very bad idea.

You may have a point...
(Though I'm not proposing a kernel API function, merely code
refactoring for a single file that's unlikely to change going
forward.)

It's also bad form to repeat the cmd size (twice) when the compiler
can figure it out automatically for string literals (which is 95%
of the use-cases).

I can drop the macro, and just use the helper...

Or maybe there's a GCC extension to test that an argument is a
string literal...

Regards.
