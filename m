Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6379C496B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 10:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfJBIZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 04:25:12 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:55911 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725843AbfJBIZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 04:25:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id FZwUiv1Vzop0AFZwYi3ZeN; Wed, 02 Oct 2019 10:25:09 +0200
Subject: Re: Build failed in Jenkins: v4l-utils #43
To:     Jenkins Builder Robot <jenkins@linuxtv.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6a1df171-bd07-5eef-1917-4171fb3bc359@xs4all.nl>
Date:   Wed, 2 Oct 2019 10:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJuFiXB76Z5ryT8AUgqEGAJOMxDpN74nwD6VzAFQsrmWh60oXZrlFu46SNJnplJaR1QLosiXRpPPPn/Z+dd8ceAxyAXoNWrtOc+FTK92l6NrGxSxbyxW
 gg3ptrhQYU6p4Tj4kFrvKroVSeOcl2j8iphSQ76V0tKdSmPNPp6fVHqz6f5mLZfVdOtakJ79+uuXCK0F4wb36gkQ85OnXTG9TQ+ie1dt5/zxpgd1IGh6ZtWY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 10/2/19 10:16 AM, Jenkins Builder Robot wrote:
> See <https://builder.linuxtv.org/job/v4l-utils/43/display/redirect?page=changes>
> 
> Changes:
> 
> [hverkuil-cisco] keytable: add new generated keymaps
> 
> [hverkuil-cisco] msg2ctl.pl: add newline after log_msg
> 
> [hverkuil-cisco] cec-follower: drop the hardcoded UI commands list
> 
> [hverkuil-cisco] cec-ctl/cec-log: use new CEC_OP_UI_CMD defines

You need to remove utils/cec-follower/cec-log.h.

This file was generated but the generated file is now called cec-log-gen.h.
A new cec-log.h was also added to utils/common as a companion to cec-log.cpp.

Unfortunately, the old cec-log.h clashes with the new cec-log.h. And since
the old cec-log.h was generated and so is not part of the git repo it is
not removed as part of a 'git pull'.

Anyway, just remove utils/cec-follower/cec-log.h and it compiles again.

Regards,

	Hans

> 
> 
> ------------------------------------------
> [...truncated 1.10 MB...]
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:800:16: error: ‘arg_u8’ was not declared in this scope
>  #define arg_on arg_u8
>                 ^~~~~~
> ./cec-log.h:2584:12: note: in expansion of macro ‘arg_on’
>    log_arg(&arg_on, "on", on);
>             ^~~~~~
> ./cec-log.h:800:16: note: suggested alternative: ‘arg_on’
>  #define arg_on arg_u8
>                 ^~~~~~
> ./cec-log.h:2584:12: note: in expansion of macro ‘arg_on’
>    log_arg(&arg_on, "on", on);
>             ^~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2584:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_on, "on", on);
>    ^~~~~~~
> ./cec-log.h:2584:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_on, "on", on);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:800:16: error: ‘arg_u8’ was not declared in this scope
>  #define arg_on arg_u8
>                 ^~~~~~
> ./cec-log.h:2594:12: note: in expansion of macro ‘arg_on’
>    log_arg(&arg_on, "on", on);
>             ^~~~~~
> ./cec-log.h:800:16: note: suggested alternative: ‘arg_on’
>  #define arg_on arg_u8
>                 ^~~~~~
> ./cec-log.h:2594:12: note: in expansion of macro ‘arg_on’
>    log_arg(&arg_on, "on", on);
>             ^~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2594:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_on, "on", on);
>    ^~~~~~~
> ./cec-log.h:2594:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_on, "on", on);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:818:21: error: ‘arg_u8’ was not declared in this scope
>  #define arg_minutes arg_u8
>                      ^~~~~~
> ./cec-log.h:2603:12: note: in expansion of macro ‘arg_minutes’
>    log_arg(&arg_minutes, "minutes", minutes);
>             ^~~~~~~~~~~
> ./cec-log.h:818:21: note: suggested alternative: ‘arg_on’
>  #define arg_minutes arg_u8
>                      ^~~~~~
> ./cec-log.h:2603:12: note: in expansion of macro ‘arg_minutes’
>    log_arg(&arg_minutes, "minutes", minutes);
>             ^~~~~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2603:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_minutes, "minutes", minutes);
>    ^~~~~~~
> ./cec-log.h:2603:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_minutes, "minutes", minutes);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:811:18: error: ‘arg_string’ was not declared in this scope
>  #define arg_time arg_string
>                   ^~~~~~~~~~
> ./cec-log.h:2611:12: note: in expansion of macro ‘arg_time’
>    log_arg(&arg_time, "time", time);
>             ^~~~~~~~
> ./cec-log.h:811:18: note: suggested alternative: ‘arg_time’
>  #define arg_time arg_string
>                   ^~~~~~~~~~
> ./cec-log.h:2611:12: note: in expansion of macro ‘arg_time’
>    log_arg(&arg_time, "time", time);
>             ^~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2611:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_time, "time", time);
>    ^~~~~~~
> ./cec-log.h:2611:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_time, "time", time);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:811:18: error: ‘arg_string’ was not declared in this scope
>  #define arg_time arg_string
>                   ^~~~~~~~~~
> ./cec-log.h:2619:12: note: in expansion of macro ‘arg_time’
>    log_arg(&arg_time, "time", time);
>             ^~~~~~~~
> ./cec-log.h:811:18: note: suggested alternative: ‘arg_time’
>  #define arg_time arg_string
>                   ^~~~~~~~~~
> ./cec-log.h:2619:12: note: in expansion of macro ‘arg_time’
>    log_arg(&arg_time, "time", time);
>             ^~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2619:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_time, "time", time);
>    ^~~~~~~
> ./cec-log.h:2619:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_time, "time", time);
>    ^~~~~~~
>    log_msg
> ./cec-log.h:2630:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_htng_input_src, "htng-input-src", htng_input_src);
>    ^~~~~~~
> ./cec-log.h:2630:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_htng_input_src, "htng-input-src", htng_input_src);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:579:19: error: ‘arg_u16’ was not declared in this scope
>  #define arg_major arg_u16
>                    ^~~~~~~
> ./cec-log.h:2632:12: note: in expansion of macro ‘arg_major’
>    log_arg(&arg_major, "major", major);
>             ^~~~~~~~~
> ./cec-log.h:579:19: note: suggested alternative: ‘arg_osd’
>  #define arg_major arg_u16
>                    ^~~~~~~
> ./cec-log.h:2632:12: note: in expansion of macro ‘arg_major’
>    log_arg(&arg_major, "major", major);
>             ^~~~~~~~~
> ./cec-log.h:801:17: error: ‘arg_u8’ was not declared in this scope
>  #define arg_vol arg_u8
>                  ^~~~~~
> ./cec-log.h:2642:12: note: in expansion of macro ‘arg_vol’
>    log_arg(&arg_vol, "vol", vol);
>             ^~~~~~~
> ./cec-log.h:801:17: note: suggested alternative: ‘arg_on’
>  #define arg_vol arg_u8
>                  ^~~~~~
> ./cec-log.h:2642:12: note: in expansion of macro ‘arg_vol’
>    log_arg(&arg_vol, "vol", vol);
>             ^~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2642:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_vol, "vol", vol);
>    ^~~~~~~
> ./cec-log.h:2642:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_vol, "vol", vol);
>    ^~~~~~~
>    log_msg
> ./cec-log.h:2662:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
>    ^~~~~~~
> ./cec-log.h:2662:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:831:18: error: ‘arg_u16’ was not declared in this scope
>  #define arg_freq arg_u16
>                   ^~~~~~~
> ./cec-log.h:2665:12: note: in expansion of macro ‘arg_freq’
>    log_arg(&arg_freq, "freq", freq);
>             ^~~~~~~~
> ./cec-log.h:831:18: note: suggested alternative: ‘arg_osd’
>  #define arg_freq arg_u16
>                   ^~~~~~~
> ./cec-log.h:2665:12: note: in expansion of macro ‘arg_freq’
>    log_arg(&arg_freq, "freq", freq);
>             ^~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2679:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
>    ^~~~~~~
> ./cec-log.h:2679:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:792:18: error: ‘arg_u16’ was not declared in this scope
>  #define arg_chan arg_u16
>                   ^~~~~~~
> ./cec-log.h:2681:12: note: in expansion of macro ‘arg_chan’
>    log_arg(&arg_chan, "chan", chan);
>             ^~~~~~~~
> ./cec-log.h:792:18: note: suggested alternative: ‘arg_osd’
>  #define arg_chan arg_u16
>                   ^~~~~~~
> ./cec-log.h:2681:12: note: in expansion of macro ‘arg_chan’
>    log_arg(&arg_chan, "chan", chan);
>             ^~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2702:3: error: ‘log_arg’ was not declared in this scope
>    log_arg(&arg_htng_ext_chan_type, "htng-ext-chan-type", htng_ext_chan_type);
>    ^~~~~~~
> ./cec-log.h:2702:3: note: suggested alternative: ‘log_msg’
>    log_arg(&arg_htng_ext_chan_type, "htng-ext-chan-type", htng_ext_chan_type);
>    ^~~~~~~
>    log_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:831:18: error: ‘arg_u16’ was not declared in this scope
>  #define arg_freq arg_u16
>                   ^~~~~~~
> ./cec-log.h:2705:12: note: in expansion of macro ‘arg_freq’
>    log_arg(&arg_freq, "freq", freq);
>             ^~~~~~~~
> ./cec-log.h:831:18: note: suggested alternative: ‘arg_osd’
>  #define arg_freq arg_u16
>                   ^~~~~~~
> ./cec-log.h:2705:12: note: in expansion of macro ‘arg_freq’
>    log_arg(&arg_freq, "freq", freq);
>             ^~~~~~~~
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h:2719:3: error: ‘log_htng_unknown_msg’ was not declared in this scope
>    log_htng_unknown_msg(msg);
>    ^~~~~~~~~~~~~~~~~~~~
> ./cec-log.h:2719:3: note: suggested alternative: ‘log_htng_msg’
>    log_htng_unknown_msg(msg);
>    ^~~~~~~~~~~~~~~~~~~~
>    log_htng_msg
> In file included from cec-follower.h:25,
>                  from cec-follower.cpp:21:
> ./cec-log.h: At global scope:
> ./cec-log.h:861:29: warning: ‘messages’ defined but not used [-Wunused-variable]
>  static const struct message messages[] = {
>                              ^~~~~~~~
> make[3]: *** [Makefile:607: cec_follower-cec-follower.o] Error 1
> make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cec-follower'>
> make[2]: *** [Makefile:481: all-recursive] Error 1
> make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils'>
> make[1]: *** [Makefile:590: all-recursive] Error 1
> make[1]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/'>
> make: *** [Makefile:517: all] Error 2
> Build step 'Execute shell' marked build as failure
> 

