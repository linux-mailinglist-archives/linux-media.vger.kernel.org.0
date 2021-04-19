Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA75364D17
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 23:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhDSVbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 17:31:22 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59941 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229714AbhDSVbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 17:31:21 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id YbTilTU9lo2ggYbTllhXrO; Mon, 19 Apr 2021 23:30:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618867850; bh=jzmVey1/GYFVWwA4aaoOqJANRtDEyIenQEqrUsB8Z+I=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=L1YxT1jeEHJW9gAyrVpxj0M5DPGfuQs1DbE361SlJ7gxL7wza8t/0lv1Yb/agOxsv
         vKahbQ4rmx3r9eC7KlUgx4VEk79M8rXLCXXVkyj/1ObHXww++wlKgy320HG4k2afdr
         0X5RUzY8+mlxoVVrzIyOfqIPZm86JAdCO55oA+4zHtev+jWEGnH2AokSUVFvmVoUZc
         ntcWCOFrVbUhw48Ke+BT82ei3M30ERRF07tEibTNkIYPP/dHb27BrMZUul6N4pz4eG
         ylfFLqsqxzFlyuiYFL2p0TowCk7JWkNvC4Q4OJIy8gMSBFV0eWqR8WtlvAnw//rQ3G
         64zk846tCtz1A==
Subject: Re: [PATCH] configure.ac: Resolve GIT_SHA even if repository is a
 submodule
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org
References: <20210419182832.577010-1-niklas.soderlund@ragnatech.se>
 <dd9a9dde-2c39-1472-a71b-f6039993fce2@xs4all.nl>
 <YH30jV7Tyfe/89xA@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <581b3539-65e6-f1d5-9206-e9e9917c16b4@xs4all.nl>
Date:   Mon, 19 Apr 2021 23:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YH30jV7Tyfe/89xA@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfH+a+d0vwhKoAyOcFKxuV1A0DC7o9ZDC5rOPsz+uKeaxtb7ak2LWBWKZ/Dk/xTiqMIQSBcF4DP5wry996Ij0+F75Qkx5IsU4MRg4Mc1BKuutSIVTcloD
 ZXnkeNrCvsEXwoYrst9sUbdC0RQzzMJSxItaTJ348lNmHJe+dL5pg2+KJ/Mnpy1CIiDEqtmgfobluZ0FKTHFxhkgZafOBfiDhtqXkG8PCo5hYWq5aBKMC46R
 SZGHGqfare13xOV/WruAVQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/04/2021 23:22, Niklas Söderlund wrote:
> Hi Hans,
> 
> On 2021-04-19 23:10:37 +0200, Hans Verkuil wrote:
>> On 19/04/2021 20:28, Niklas Söderlund wrote:
>>> If the v4l-utils repository is a git submodule the $(top_srcdir)/.git is
>>> a file and not a directory. Update the shell check to allow the test to
>>> pass in both cases.
>>>
>>> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>> ---
>>>  configure.ac | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/configure.ac b/configure.ac
>>> index f144a50d034fbda0..4ac4195cd6e4747e 100644
>>> --- a/configure.ac
>>> +++ b/configure.ac
>>> @@ -588,7 +588,7 @@ fi
>>>  CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
>>>  
>>>  # Obtain git SHA of HEAD
>>> -AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -d \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
>>> +AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
>>>  
>>>  # Obtain git commit count of HEAD
>>>  AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
>>
>> Isn't the same change needed here and in GIT_COMMIT_DATE as well?
> 
> Wops, you are correct. I noticed the problem in an older branch where 
> version.h was generated in different utilities and this is a bad 
> conflict fix of that.
> 
> Do you want me to resend?

Yes please!

Thanks,

	Hans
