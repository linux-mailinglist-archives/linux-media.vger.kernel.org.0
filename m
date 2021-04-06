Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CC5354E28
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 09:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235572AbhDFHxs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Apr 2021 03:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhDFHxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 03:53:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BA4C06174A
        for <linux-media@vger.kernel.org>; Tue,  6 Apr 2021 00:53:39 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <u.oelmann@pengutronix.de>)
        id 1lTgWn-0001Pn-Lm; Tue, 06 Apr 2021 09:53:37 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <u.oelmann@pengutronix.de>)
        id 1lTgWm-0004Gf-R1; Tue, 06 Apr 2021 09:53:36 +0200
References: <20210304132340.17069-1-u.oelmann@pengutronix.de>
 <6rblb62uu2.fsf@pengutronix.de>
User-agent: mu4e 1.4.13; emacs 28.0.50
From:   Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: Re: [PATCH v4l-utils v2 1/2] configure.ac: autodetect availability
 of systemd
In-reply-to: <6rblb62uu2.fsf@pengutronix.de>
Date:   Tue, 06 Apr 2021 09:53:36 +0200
Message-ID: <6rsg43u9vj.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

another gentle ping for my small series. I am addressing you directly
this time as you are recorded as delegate in [1].

Best regards
Ulrich


[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=4756

On Fri, Mar 26 2021 at 09:16 +0100, Ulrich Ölmann <u.oelmann@pengutronix.de> wrote:
> Gentle ping!
>
> There is series [1] ("Add support for meson building") which is
> currently discussed. If you want me to take that into account and extend
> my patches to meson, as well, I could readily do that in a v3.
>
> Best regards
> Ulrich
>
>
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=4887
>
> On Thu, Mar 04 2021 at 14:23 +0100, Ulrich Ölmann <u.oelmann@pengutronix.de> wrote:
>> Import systemd's official suggestion [1] how this should be handled in packages
>> using autoconf. A side effect of this is the removal of the hardcoded fallback
>> path "/lib/systemd/system" which leaks build host information when cross
>> compiling v4l-utils and therefore defeats reproducible builds.
>>
>> [1] https://www.freedesktop.org/software/systemd/man/daemon.html#Installing%20systemd%20Service%20Files
>>
>> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
>> ---
>> v1 --> v2:
>>   - fixed autodetection
>>   - extended commit message
>>
>>  configure.ac | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index 727730c5ccf4..8470116df4b1 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -388,7 +388,15 @@ AC_ARG_WITH(udevdir,
>>  AC_ARG_WITH(systemdsystemunitdir,
>>  	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
>>  	[],
>> -	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
>> +	[with_systemdsystemunitdir=auto])
>> +AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
>> +      [def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
>> +       AS_IF([test "x$def_systemdsystemunitdir" = "x"],
>> +             [AS_IF([test "x$with_systemdsystemunitdir" = "xyes"],
>> +                    [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
>> +              with_systemdsystemunitdir=no],
>> +             [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
>> +AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])
>>  
>>  # Generic check: works with most distributions
>>  def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
-- 
Pengutronix e.K.                           | Ulrich Ölmann               |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
