Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C5536572B
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 13:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhDTLJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 07:09:30 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:35547 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231415AbhDTLJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 07:09:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YoFQlXI0l8K3KYoFUlzJfz; Tue, 20 Apr 2021 13:08:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618916937; bh=CeUDTKC6/4x+SawU5mgBsQLgrLEY0E60ReLGH33UB+A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=plG+mQP0CfXo2HsyY6JVE6sYFFTEDjkq66ceT3kGwjQXAycAP3USg+LCmdHghciPv
         tm+m55jNtYyijZwWoTy4uREA/GWeS2wgvJCXBTAwm+p5bH6f32VwY1Ml7tOFHMeITD
         5MRB76f2LrI3Bn1jyslRrjBQMiHzXvHqiXIu2b1By1x8B4w/zC5DeCdSBYZOPApBee
         UhoXGXKhh8Z3ObyC1LMg8MwK8UeydnCKsS7BSEYTcjbXgLfkYvJ05iHWIHg+jED8Ae
         z0nF4GqTTQB0aKVoQAHRL8H+jIWb15zO9dl8bdnUV6X3Gs3po1xPbnJp4Ri12B/95u
         dBS4thtlgpIDg==
Subject: Re: [PATCH] v4l-utils: switch remote_subtest arrays to vector
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20210420042714.3720981-1-rosenp@gmail.com>
 <c206618a-01f4-0cf4-7cdf-4f08a75c1559@xs4all.nl>
 <7A4EAA2C-9A31-4A3F-8ABA-8FE4F9D38980@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <79e73829-332f-7e04-e419-3bb92f178d60@xs4all.nl>
Date:   Tue, 20 Apr 2021 13:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7A4EAA2C-9A31-4A3F-8ABA-8FE4F9D38980@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCcmrp+qFHnJNNq1gHBQ+MS7ayduLFRRsDowMBdAT+nm/QzIZziWH5nmpB3eOjJAYqe2SRN2oEht/4YGVusIW2UI7bC6zkVzSvoo96tYUZGN8BP4Fk/r
 bopx4ZPpkwE19P1idalZHJZM9+sOL36SVH7xlOXkmkHd8I6b66znNchtkUmUMLCjCcp+Zu953DSEbTM/pOhrxMc7dq3+ION8oU4GOMpdiGgU8r3JjrSzV9de
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 12:13, Rosen Penev wrote:
> 
>> On Apr 20, 2021, at 02:54, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Rosen,
>>
>>> On 20/04/2021 06:27, Rosen Penev wrote:
>>> Easier to read and allows removing some boilerplate code. Only a
>>> moderate size increase.
>>>
>>> Ran through git clang-format
>>
>> Just to clarify: this is a clean up patch, right? There are no clang fixes
>> here as in your past patches.
> Not directly no. I initially wanted to use std::array and constexpr but could not because of the size parameter. vector is good enough I think.
>>
>>>

<snip>

>>> @@ -1553,32 +1486,31 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
>>>
>>>   int ret = 0;
>>>
>>> -    for (const auto &test : tests) {
>>> +    for (auto &&test : tests) {
>>
>> Why use 'auto &&test' instead of 'const auto &test'? Is there a good reason
>> for that? The original is much more readable and from what I understand just
>> as efficient (not that efficiency is an issue here).
>>
>> The same for other occurences of this idiom.
> In a different project, I replaced all range loops to use auto&& and got a size decrease. I don’t have a good explanation for it. Maybe it helps with copy elision which const can sometimes prevent. Not sure.
> 
> My understanding of auto&& is that it evaluates to const ref, then ref, then value in that order.

Please keep the original. It is easier to understand, and that is more important
than saving a few bytes.

I read elsewhere after googling this construct that it is not recommended, unless
there is a really good reason for it.

Regards,

	Hans
