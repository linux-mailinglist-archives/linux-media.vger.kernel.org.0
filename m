Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC7079ADE5
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfHWLJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:09:33 -0400
Received: from ns.iliad.fr ([212.27.33.1]:49572 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbfHWLJc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:09:32 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 8FFD020600;
        Fri, 23 Aug 2019 13:09:30 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 81AF0203E6;
        Fri, 23 Aug 2019 13:09:30 +0200 (CEST)
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
 <82b06099-f652-47e9-99b9-3bd3ec197a4e@free.fr>
 <20190823072008.5ab02f4b@coco.lan>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <a72254e0-6908-d82f-3efb-3ce80a7b0c89@free.fr>
Date:   Fri, 23 Aug 2019 13:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823072008.5ab02f4b@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Aug 23 13:09:30 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Full disclosure, I enjoy playing "C standard language lawyer" in my
spare time. Feel free to ignore me if it gets boring ;-)

	https://port70.net/~nsz/c/

On 23/08/2019 12:20, Mauro Carvalho Chehab wrote:

> Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:
> 
>> On 22/08/2019 21:39, Mauro Carvalho Chehab wrote:
>>
>>> [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift  
>>
>> s/unsigned int/signed int  ?
>>
>> (See below as well.)
>>
>>> Doing something like:
>>>
>>> 	i32 foo = 1, bar;
>>>
>>> 	bar = foo << 31;  
>>
>> For my information, why did you split the expression over two lines,
>> instead of just using 1 << 31 in the example above?
>> (Most of the cases fixed involve a literal 1)
>>
>> I.e. why didn't you just say "1 << 31 has undefined behavior" ?
>>
>> Maybe patch subject can also be changed to "Don't use 1 << foo" ?
>>
>>> has an undefined behavior in C, as warned by cppcheck, as we're
>>> shifting a signed integer.  
>>
>> Not quite right. Shifting a signed integer is well-defined in some cases.
>> See paragraph 4 below. For example, 1 << 8 always resolves to 256.
> 
> I meant to say that, on a 32-bits arch, where a signed integer has
> 31 bits and we do a 31 bit shift, it will end touching the 32th bit,
> with is an undefined behavior.
> 
> I'm changing the description to:
> 
> 	media: don't do a 31 bit shift on a signed int
> 
> 	On 32-bits archs, a signed integer has 31 bits plus on extra
> 	bit for	signal.	Due to that, touching the 32th bit with something

s/on extra bit for signal/an extra sign bit

> 	like:
> 
> 	        int bar = 1 << 31;
> 
> 	has an undefined behavior in C on 32 bit architectures, as it
> 	touches	the signal bit.	This is warned by cppcheck.

s/signal/sign

> 	Instead, force the numbers to be unsigned, in order to solve this
> 	issue.
> 
> I guess this makes it clearer.
> 
> 
>>
>>     6.5.7 Bitwise shift operators
>>
>> 1   Syntax
>>              shift-expression:
>>                      additive-expression
>>                      shift-expression << additive-expression
>>                      shift-expression >> additive-expression
>>
>> 2   Constraints
>>     Each of the operands shall have integer type.
>>
>> 3   Semantics
>>     The integer promotions are performed on each of the operands. The type of the result is
>>     that of the promoted left operand. If the value of the right operand is negative or is
>>     greater than or equal to the width of the promoted left operand, the behavior is undefined.
> 
> The problem is here: "greater than or equal to the width of the promoted left operand".
> A 31 bit shift on a 31 bits value is undefined.

In the standard's terminology, "width" includes the sign bit, e.g. int32_t is 32 bits wide
(i.e. int32_t can represent 2^32 values)

Paragraph 3 forbids 1 << 32. It is paragraph 4 that forbids 1 << 31.

> In the past, we got real issues like that at the code: gcc on x86 does the shift as
> expected, so:
> 
> 	u32 a = 1 << 32;
> 
> it results in:
> 
> 	on i386:  a = 0
> 	on arm:   a = 1
> 
> I've no idea how LLVM/clang implements this.
> 
>>
>> 4   The result of E1 << E2 is E1 left-shifted E2 bit positions; vacated bits are filled with
>>     zeros. If E1 has an unsigned type, the value of the result is E1 x 2^E2 , reduced modulo
>>     one more than the maximum value representable in the result type. If E1 has a signed
>>     type and non-negative value, and E1 x 2^E2 is representable in the result type, then that is
>>     the resulting value; otherwise, the behavior is undefined.
>>
>> 5   The result of E1 >> E2 is E1 right-shifted E2 bit positions. If E1 has an unsigned type
>>     or if E1 has a signed type and a non-negative value, the value of the result is the integral
>>     part of the quotient of E1 / 2^E2 . If E1 has a signed type and a negative value, the
>>     resulting value is implementation-defined.
>>
>>
>>> Instead, force the numbers to be unsigned, in order to solve this
>>> issue.
>>>
>>> diff --git a/drivers/media/dvb-frontends/cx24123.c b/drivers/media/dvb-frontends/cx24123.c
>>> index ac519c3eff18..3d84ee17e54c 100644
>>> --- a/drivers/media/dvb-frontends/cx24123.c
>>> +++ b/drivers/media/dvb-frontends/cx24123.c
>>> @@ -431,7 +431,7 @@ static u32 cx24123_int_log2(u32 a, u32 b)
>>>  	u32 div = a / b;
>>>  	if (a % b >= b / 2)
>>>  		++div;
>>> -	if (div < (1 << 31)) {
>>> +	if (div < (1UL << 31)) {
>>>  		for (exp = 1; div > exp; nearest++)
>>>  			exp += exp;
>>>  	}  
>>
>> Did you pick unsigned long (rather than unsigned) because that's what is used
>> in the BIT macro? 
> 
> Yes.
> 
>> My concern is that UL is 64-bit wide on some platforms, and
>> when used in arithmetic expressions, compiler might generate worse code.
> 
> On Linux, long size is equal to integer size, so I don't think
> that this is actually a problem.

That's not right. On most 64-bit platforms, e.g. amd64 and arm64
sizeof(int) = 4 and sizeof(long) = 8

Regards.
