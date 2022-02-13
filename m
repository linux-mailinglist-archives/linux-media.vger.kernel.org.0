Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74804B3C76
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 18:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiBMRSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 12:18:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiBMRSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 12:18:03 -0500
X-Greylist: delayed 305 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 09:17:57 PST
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993A659395
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:17:57 -0800 (PST)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id D75EA2006F;
        Sun, 13 Feb 2022 19:12:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1644772366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0MkPUAWHNRmoLqvYGVE00XeVmjwl/0mvVNFS5rdAEyU=;
        b=KNOlhQ+8BEtJidJUy43X79rV4sVoYGetEDYWiqnfF9C2Lh9bTfkZhXZ5KJO+llHbVGZ0OD
        5Yc3Y6+MVVdgEYb/2Bb8PpgZbqPsOhmlZ/OlHEAZXwG+qPwED6d8E0wZB20d1Ys/3vcGQg
        WpnjRXB+PjO5QB+9adtnrSXHv01MK8g=
Date:   Sun, 13 Feb 2022 19:12:44 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <Ygk8DM3tstwi/m9g@jyty>
References: <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
 <YgKeZ+vAynWvvijz@gofer.mess.org>
 <YgN3cq+utQAFFnEW@jyty>
 <YgeXBRR8YUH8H61t@gofer.mess.org>
 <Ygfhl+dZUfHNJXkU@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Ygfhl+dZUfHNJXkU@gofer.mess.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1644772366; a=rsa-sha256; cv=none;
        b=rota/t4abNOW3CIPHohb6X/Ga7YcA9N9MPRcPbr1TUyyDeEVWiWbTPKs7bwUpr8Nc/RkQx
        PTYatTNbnibC/KmHLcpGfkfl0ql1HFNu5XhY74OoOkrbbwHREvgKQzpmMYgX4lvLs9tXhM
        4HthKY1m2WKiZDmISeqHSCPHR3e2FqU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1644772366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0MkPUAWHNRmoLqvYGVE00XeVmjwl/0mvVNFS5rdAEyU=;
        b=smebu4JFIaD7+EpPZYRspVZSEHlxqNZKZko9AoHQTMvC/+bgA6R0fzCiersmJrkpK5XPTu
        CPkz64wV/WPuUtKfCQ9ebXyMZi54Os4FhKo0M4vQ0hYRtaUxgh0y5sHUsIVnvsPQUaZDvb
        TR5ndgrdF75xa2WMYd12DUS5oYqaT6k=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

>>I've spent some more time debugging this. The problem is that we need 
>>to increase the timeout to prevent key up events from arriving to 
>>early, but the same timeout is used for the raw IR timeout.
>
>So I've sent two patches (you're on the cc) which should fix the issue.  
>Please can you test if this solves the issue?

It is a significant improvement. Alas, I was able to repeat a glitch 
with both the RC5 and NEC protocols. I was testing the key-repeat events 
for the volume control. For both remotes, a sequence was lost every now 
and then. Here is the output of "sudo ir-keytable -t" for both. I used 
the default repeat period of 125ms, but I also repeated it with 100ms.

First, the RC5 remote:

135.157621: lirc protocol(rc5): scancode = 0x1e10 toggle=1
135.115390: event type EV_MSC(0x04): scancode = 0x1e10
135.115390: event type EV_SYN(0x00).
135.247388: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
135.247388: event type EV_SYN(0x00).
135.379387: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
135.379387: event type EV_SYN(0x00).
135.379387: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
135.379387: event type EV_SYN(0x00).
135.477638: lirc protocol(rc5): scancode = 0x1e11
135.477656: event type EV_MSC(0x04): scancode = 0x1e11
135.477656: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
135.477656: event type EV_SYN(0x00).
135.707404: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
135.707404: event type EV_SYN(0x00).
136.261605: lirc protocol(rc5): scancode = 0x1e11
136.261623: event type EV_MSC(0x04): scancode = 0x1e11
136.261623: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
136.261623: event type EV_SYN(0x00).
136.491396: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
136.491396: event type EV_SYN(0x00).
137.621640: lirc protocol(rc5): scancode = 0x1e11 toggle=1
137.621659: event type EV_MSC(0x04): scancode = 0x1e11
137.621659: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
137.621659: event type EV_SYN(0x00).
137.851403: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
137.851403: event type EV_SYN(0x00).
138.853651: lirc protocol(rc5): scancode = 0x1e11 toggle=1
138.853670: event type EV_MSC(0x04): scancode = 0x1e11
138.853670: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
138.853670: event type EV_SYN(0x00).
138.965618: lirc protocol(rc5): scancode = 0x1e11 toggle=1
138.965635: event type EV_MSC(0x04): scancode = 0x1e11
138.965635: event type EV_SYN(0x00).
139.077652: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.077670: event type EV_MSC(0x04): scancode = 0x1e11
139.077670: event type EV_SYN(0x00).
139.189646: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.189664: event type EV_MSC(0x04): scancode = 0x1e11
139.189664: event type EV_SYN(0x00).
139.301668: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.301684: event type EV_MSC(0x04): scancode = 0x1e11
139.301684: event type EV_SYN(0x00).
139.383390: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
139.383390: event type EV_SYN(0x00).
139.413590: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.383390: event type EV_MSC(0x04): scancode = 0x1e11
139.383390: event type EV_SYN(0x00).
139.515385: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
139.515385: event type EV_SYN(0x00).
139.525651: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.515385: event type EV_MSC(0x04): scancode = 0x1e11
139.515385: event type EV_SYN(0x00).
139.637630: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.637646: event type EV_MSC(0x04): scancode = 0x1e11
139.637646: event type EV_SYN(0x00).
139.647387: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
139.647387: event type EV_SYN(0x00).
139.749562: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.647387: event type EV_MSC(0x04): scancode = 0x1e11
139.647387: event type EV_SYN(0x00).
139.779387: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
139.779387: event type EV_SYN(0x00).
139.861680: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.779387: event type EV_MSC(0x04): scancode = 0x1e11
139.779387: event type EV_SYN(0x00).
139.911392: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
139.911392: event type EV_SYN(0x00).
139.973654: lirc protocol(rc5): scancode = 0x1e11 toggle=1
139.911392: event type EV_MSC(0x04): scancode = 0x1e11
139.911392: event type EV_SYN(0x00).
140.043399: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
140.043399: event type EV_SYN(0x00).
140.175392: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
140.175392: event type EV_SYN(0x00).
140.175392: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
140.175392: event type EV_SYN(0x00).

Then, the NEC remote:

Testing events. Please, press CTRL-C to abort.
312.477881: lirc protocol(nec): scancode = 0x1e
312.477894: event type EV_MSC(0x04): scancode = 0x1e
312.477894: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
312.477894: event type EV_SYN(0x00).
312.703402: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
312.703402: event type EV_SYN(0x00).
313.033303: lirc protocol(nec): scancode = 0x1e repeat
313.033312: event type EV_MSC(0x04): scancode = 0x1e
313.033312: event type EV_SYN(0x00).
314.497859: lirc protocol(nec): scancode = 0xa
314.497872: event type EV_MSC(0x04): scancode = 0x0a
314.497872: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
314.497872: event type EV_SYN(0x00).
314.609316: lirc protocol(nec): scancode = 0xa repeat
314.609325: event type EV_MSC(0x04): scancode = 0x0a
314.609325: event type EV_SYN(0x00).
314.721305: lirc protocol(nec): scancode = 0xa repeat
314.721313: event type EV_MSC(0x04): scancode = 0x0a
314.721313: event type EV_SYN(0x00).
314.833272: lirc protocol(nec): scancode = 0xa repeat
314.833280: event type EV_MSC(0x04): scancode = 0x0a
314.833280: event type EV_SYN(0x00).
314.945342: lirc protocol(nec): scancode = 0xa repeat
314.945350: event type EV_MSC(0x04): scancode = 0x0a
314.945350: event type EV_SYN(0x00).
314.999394: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
314.999394: event type EV_SYN(0x00).
315.131392: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
315.131392: event type EV_SYN(0x00).
315.131392: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
315.131392: event type EV_SYN(0x00).
315.277279: lirc protocol(nec): scancode = 0xa repeat
315.277289: event type EV_MSC(0x04): scancode = 0x0a
315.277289: event type EV_SYN(0x00).
315.497281: lirc protocol(nec): scancode = 0xa repeat
315.497290: event type EV_MSC(0x04): scancode = 0x0a
315.497290: event type EV_SYN(0x00).
315.717281: lirc protocol(nec): scancode = 0xa repeat
315.717290: event type EV_MSC(0x04): scancode = 0x0a
315.717290: event type EV_SYN(0x00).
315.829305: lirc protocol(nec): scancode = 0xa repeat
315.829314: event type EV_MSC(0x04): scancode = 0x0a
315.829314: event type EV_SYN(0x00).
315.941310: lirc protocol(nec): scancode = 0xa repeat
315.941319: event type EV_MSC(0x04): scancode = 0x0a
315.941319: event type EV_SYN(0x00).
316.053285: lirc protocol(nec): scancode = 0xa repeat
316.053294: event type EV_MSC(0x04): scancode = 0x0a
316.053294: event type EV_SYN(0x00).
316.165247: lirc protocol(nec): scancode = 0xa repeat
316.165256: event type EV_MSC(0x04): scancode = 0x0a
316.165256: event type EV_SYN(0x00).
316.277254: lirc protocol(nec): scancode = 0xa repeat
316.277263: event type EV_MSC(0x04): scancode = 0x0a
316.277263: event type EV_SYN(0x00).
316.389266: lirc protocol(nec): scancode = 0xa repeat
316.389274: event type EV_MSC(0x04): scancode = 0x0a
316.389274: event type EV_SYN(0x00).
316.501288: lirc protocol(nec): scancode = 0xa repeat
316.501296: event type EV_MSC(0x04): scancode = 0x0a
316.501296: event type EV_SYN(0x00).
316.613317: lirc protocol(nec): scancode = 0xa repeat
316.613326: event type EV_MSC(0x04): scancode = 0x0a
316.613326: event type EV_SYN(0x00).
316.725342: lirc protocol(nec): scancode = 0xa repeat
316.725350: event type EV_MSC(0x04): scancode = 0x0a
316.725350: event type EV_SYN(0x00).
316.837272: lirc protocol(nec): scancode = 0xa repeat
316.837281: event type EV_MSC(0x04): scancode = 0x0a
316.837281: event type EV_SYN(0x00).
316.949298: lirc protocol(nec): scancode = 0xa repeat
316.949307: event type EV_MSC(0x04): scancode = 0x0a
316.949307: event type EV_SYN(0x00).
317.061320: lirc protocol(nec): scancode = 0xa repeat
317.061328: event type EV_MSC(0x04): scancode = 0x0a
317.061328: event type EV_SYN(0x00).
317.173318: lirc protocol(nec): scancode = 0xa repeat
317.173327: event type EV_MSC(0x04): scancode = 0x0a
317.173327: event type EV_SYN(0x00).
317.285274: lirc protocol(nec): scancode = 0xa repeat
317.285283: event type EV_MSC(0x04): scancode = 0x0a
317.285283: event type EV_SYN(0x00).
317.397277: lirc protocol(nec): scancode = 0xa repeat
317.397285: event type EV_MSC(0x04): scancode = 0x0a
317.397285: event type EV_SYN(0x00).
317.509317: lirc protocol(nec): scancode = 0xa repeat
317.509325: event type EV_MSC(0x04): scancode = 0x0a
317.509325: event type EV_SYN(0x00).
317.621282: lirc protocol(nec): scancode = 0xa repeat
317.621291: event type EV_MSC(0x04): scancode = 0x0a
317.621291: event type EV_SYN(0x00).
317.733293: lirc protocol(nec): scancode = 0xa repeat
317.733302: event type EV_MSC(0x04): scancode = 0x0a
317.733302: event type EV_SYN(0x00).
317.845315: lirc protocol(nec): scancode = 0xa repeat
317.845324: event type EV_MSC(0x04): scancode = 0x0a
317.845324: event type EV_SYN(0x00).

Possibly related to this: A long time ago when I was involved with 
formal methods in theoretical computer science, timers or timeouts would 
make me nervous due to the inherent state space explosion. In model 
checking, a timed event can be modeled with nondeterminism: in every 
state where the event is enabled, it may or may not be executed. So, in 
theory, timers or timeouts could open more room for race conditions or 
starvation. In practice, if multiple timers are driven from the same 
clock source, it should not be that bad.

>These patches touch nearly every rc-core driver so they will need a 
>good testing.

Should this allow the key repeat period to be set to exactly match the 
IR message rate, to get a consistent response rate? Or is there a small 
probability that a key-down or key-up event will be delayed by exactly 
one RC5 time slot?

	Marko
