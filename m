Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CC9680B7
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2019 20:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfGNSbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jul 2019 14:31:18 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:48000 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728218AbfGNSbS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jul 2019 14:31:18 -0400
Received: from [IPv6:2001:a62:1aa0:1f01:8bef:1c55:1564:aa8] (unknown [IPv6:2001:a62:1aa0:1f01:8bef:1c55:1564:aa8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zzam)
        by smtp.gentoo.org (Postfix) with ESMTPSA id DEB7A347B24;
        Sun, 14 Jul 2019 18:31:15 +0000 (UTC)
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Brad Love <brad@nextdimension.cc>, Antti Palosaari <crope@iki.fi>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
 <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
 <20190712144537.2bad2482@coco.lan>
 <10f064c5-1634-c9f9-fcc9-6ab51b7f8f0b@free.fr>
 <20190713070256.3495de51@coco.lan>
From:   Matthias Schwarzott <zzam@gentoo.org>
Message-ID: <13f74614-69b8-00e1-2072-ba390d5aa2cb@gentoo.org>
Date:   Sun, 14 Jul 2019 20:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190713070256.3495de51@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 13.07.19 um 12:02 schrieb Mauro Carvalho Chehab:
> Em Sat, 13 Jul 2019 00:11:12 +0200
> Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:
> 
>> On 12/07/2019 19:45, Mauro Carvalho Chehab wrote:
>>
>>> Brad Love <brad@nextdimension.cc> escreveu:
>>>   
>>> IMHO, using sizeof() here is a very bad idea.  
>>
>> You may have a point...
>> (Though I'm not proposing a kernel API function, merely code
>> refactoring for a single file that's unlikely to change going
>> forward.)
> 
> Yes, I know, but we had already some bugs due to the usage of
> sizeof() on similar macros at drivers in the past.
> 
>> It's also bad form to repeat the cmd size (twice) when the compiler
>> can figure it out automatically for string literals (which is 95%
>> of the use-cases).
>>
>> I can drop the macro, and just use the helper...
> 
> The helper function sounds fine.
> 
>>
>> Or maybe there's a GCC extension to test that an argument is a
>> string literal...
> 
> If this could be evaluated by some advanced macro logic that
> would work not only with gcc but also with clang, then a
> macro that does what you proposed could be useful.
> 
> There are some ways to check the type of a macro argument, but I'm
> not sure if are there any way for it to distinguish between a
> string constant from a char * array.
> 
Maybe something like this will prevent compilation if the argument is no
string literal:

#define CMD_SETUP(cmd, args, rlen) \
	cmd_setup(cmd, args "", sizeof(args) - 1, rlen)

Another idea is a check like:

#define CMD_SETUP(cmd, args, rlen) \
	do { \
		BUILD_BUG_ON(#args[0] != "\""); \
		cmd_setup(cmd, args "", sizeof(args) - 1, rlen) \
	} while(0)

Regards
Matthias
