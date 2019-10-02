Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA77EC4A29
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 11:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfJBJBb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Oct 2019 05:01:31 -0400
Received: from www.linuxtv.org ([130.149.80.248]:36826 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbfJBJBb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 05:01:31 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFaVh-0000Na-3W; Wed, 02 Oct 2019 09:01:25 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFaW3-0003TZ-HF; Wed, 02 Oct 2019 09:01:47 +0000
Date:   Wed, 2 Oct 2019 09:01:47 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <786551029.2.1570006907525.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
References: <1586568084.1.1570004204603.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #44
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/44/display/redirect?page=changes>

Changes:

[hverkuil-cisco] cec utils: support CEC_ADAP_G_CONNECTOR_INFO


------------------------------------------
[...truncated 1.09 MB...]
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:800:16: error: ‘arg_u8’ was not declared in this scope
 #define arg_on arg_u8
                ^~~~~~
./cec-log.h:2584:12: note: in expansion of macro ‘arg_on’
   log_arg(&arg_on, "on", on);
            ^~~~~~
./cec-log.h:800:16: note: suggested alternative: ‘arg_on’
 #define arg_on arg_u8
                ^~~~~~
./cec-log.h:2584:12: note: in expansion of macro ‘arg_on’
   log_arg(&arg_on, "on", on);
            ^~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2584:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_on, "on", on);
   ^~~~~~~
./cec-log.h:2584:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_on, "on", on);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:800:16: error: ‘arg_u8’ was not declared in this scope
 #define arg_on arg_u8
                ^~~~~~
./cec-log.h:2594:12: note: in expansion of macro ‘arg_on’
   log_arg(&arg_on, "on", on);
            ^~~~~~
./cec-log.h:800:16: note: suggested alternative: ‘arg_on’
 #define arg_on arg_u8
                ^~~~~~
./cec-log.h:2594:12: note: in expansion of macro ‘arg_on’
   log_arg(&arg_on, "on", on);
            ^~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2594:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_on, "on", on);
   ^~~~~~~
./cec-log.h:2594:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_on, "on", on);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:818:21: error: ‘arg_u8’ was not declared in this scope
 #define arg_minutes arg_u8
                     ^~~~~~
./cec-log.h:2603:12: note: in expansion of macro ‘arg_minutes’
   log_arg(&arg_minutes, "minutes", minutes);
            ^~~~~~~~~~~
./cec-log.h:818:21: note: suggested alternative: ‘arg_on’
 #define arg_minutes arg_u8
                     ^~~~~~
./cec-log.h:2603:12: note: in expansion of macro ‘arg_minutes’
   log_arg(&arg_minutes, "minutes", minutes);
            ^~~~~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2603:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_minutes, "minutes", minutes);
   ^~~~~~~
./cec-log.h:2603:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_minutes, "minutes", minutes);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:811:18: error: ‘arg_string’ was not declared in this scope
 #define arg_time arg_string
                  ^~~~~~~~~~
./cec-log.h:2611:12: note: in expansion of macro ‘arg_time’
   log_arg(&arg_time, "time", time);
            ^~~~~~~~
./cec-log.h:811:18: note: suggested alternative: ‘arg_time’
 #define arg_time arg_string
                  ^~~~~~~~~~
./cec-log.h:2611:12: note: in expansion of macro ‘arg_time’
   log_arg(&arg_time, "time", time);
            ^~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2611:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_time, "time", time);
   ^~~~~~~
./cec-log.h:2611:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_time, "time", time);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:811:18: error: ‘arg_string’ was not declared in this scope
 #define arg_time arg_string
                  ^~~~~~~~~~
./cec-log.h:2619:12: note: in expansion of macro ‘arg_time’
   log_arg(&arg_time, "time", time);
            ^~~~~~~~
./cec-log.h:811:18: note: suggested alternative: ‘arg_time’
 #define arg_time arg_string
                  ^~~~~~~~~~
./cec-log.h:2619:12: note: in expansion of macro ‘arg_time’
   log_arg(&arg_time, "time", time);
            ^~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2619:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_time, "time", time);
   ^~~~~~~
./cec-log.h:2619:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_time, "time", time);
   ^~~~~~~
   log_msg
./cec-log.h:2630:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_htng_input_src, "htng-input-src", htng_input_src);
   ^~~~~~~
./cec-log.h:2630:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_htng_input_src, "htng-input-src", htng_input_src);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:579:19: error: ‘arg_u16’ was not declared in this scope
 #define arg_major arg_u16
                   ^~~~~~~
./cec-log.h:2632:12: note: in expansion of macro ‘arg_major’
   log_arg(&arg_major, "major", major);
            ^~~~~~~~~
./cec-log.h:579:19: note: suggested alternative: ‘arg_osd’
 #define arg_major arg_u16
                   ^~~~~~~
./cec-log.h:2632:12: note: in expansion of macro ‘arg_major’
   log_arg(&arg_major, "major", major);
            ^~~~~~~~~
./cec-log.h:801:17: error: ‘arg_u8’ was not declared in this scope
 #define arg_vol arg_u8
                 ^~~~~~
./cec-log.h:2642:12: note: in expansion of macro ‘arg_vol’
   log_arg(&arg_vol, "vol", vol);
            ^~~~~~~
./cec-log.h:801:17: note: suggested alternative: ‘arg_on’
 #define arg_vol arg_u8
                 ^~~~~~
./cec-log.h:2642:12: note: in expansion of macro ‘arg_vol’
   log_arg(&arg_vol, "vol", vol);
            ^~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2642:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_vol, "vol", vol);
   ^~~~~~~
./cec-log.h:2642:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_vol, "vol", vol);
   ^~~~~~~
   log_msg
./cec-log.h:2662:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
   ^~~~~~~
./cec-log.h:2662:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:831:18: error: ‘arg_u16’ was not declared in this scope
 #define arg_freq arg_u16
                  ^~~~~~~
./cec-log.h:2665:12: note: in expansion of macro ‘arg_freq’
   log_arg(&arg_freq, "freq", freq);
            ^~~~~~~~
./cec-log.h:831:18: note: suggested alternative: ‘arg_osd’
 #define arg_freq arg_u16
                  ^~~~~~~
./cec-log.h:2665:12: note: in expansion of macro ‘arg_freq’
   log_arg(&arg_freq, "freq", freq);
            ^~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2679:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
   ^~~~~~~
./cec-log.h:2679:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_htng_chan_type, "htng-chan-type", htng_chan_type);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:792:18: error: ‘arg_u16’ was not declared in this scope
 #define arg_chan arg_u16
                  ^~~~~~~
./cec-log.h:2681:12: note: in expansion of macro ‘arg_chan’
   log_arg(&arg_chan, "chan", chan);
            ^~~~~~~~
./cec-log.h:792:18: note: suggested alternative: ‘arg_osd’
 #define arg_chan arg_u16
                  ^~~~~~~
./cec-log.h:2681:12: note: in expansion of macro ‘arg_chan’
   log_arg(&arg_chan, "chan", chan);
            ^~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2702:3: error: ‘log_arg’ was not declared in this scope
   log_arg(&arg_htng_ext_chan_type, "htng-ext-chan-type", htng_ext_chan_type);
   ^~~~~~~
./cec-log.h:2702:3: note: suggested alternative: ‘log_msg’
   log_arg(&arg_htng_ext_chan_type, "htng-ext-chan-type", htng_ext_chan_type);
   ^~~~~~~
   log_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:831:18: error: ‘arg_u16’ was not declared in this scope
 #define arg_freq arg_u16
                  ^~~~~~~
./cec-log.h:2705:12: note: in expansion of macro ‘arg_freq’
   log_arg(&arg_freq, "freq", freq);
            ^~~~~~~~
./cec-log.h:831:18: note: suggested alternative: ‘arg_osd’
 #define arg_freq arg_u16
                  ^~~~~~~
./cec-log.h:2705:12: note: in expansion of macro ‘arg_freq’
   log_arg(&arg_freq, "freq", freq);
            ^~~~~~~~
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h:2719:3: error: ‘log_htng_unknown_msg’ was not declared in this scope
   log_htng_unknown_msg(msg);
   ^~~~~~~~~~~~~~~~~~~~
./cec-log.h:2719:3: note: suggested alternative: ‘log_htng_msg’
   log_htng_unknown_msg(msg);
   ^~~~~~~~~~~~~~~~~~~~
   log_htng_msg
In file included from cec-follower.h:25,
                 from cec-follower.cpp:21:
./cec-log.h: At global scope:
./cec-log.h:861:29: warning: ‘messages’ defined but not used [-Wunused-variable]
 static const struct message messages[] = {
                             ^~~~~~~~
make[3]: *** [Makefile:607: cec_follower-cec-follower.o] Error 1
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cec-follower'>
make[2]: *** [Makefile:481: all-recursive] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils'>
make[1]: *** [Makefile:590: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/'>
make: *** [Makefile:517: all] Error 2
Build step 'Execute shell' marked build as failure
