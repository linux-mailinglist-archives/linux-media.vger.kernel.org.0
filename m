Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C186566565
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 10:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiGEIs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 04:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiGEIs4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 04:48:56 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F60DEA
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 01:48:55 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 6CF0720191;
        Tue,  5 Jul 2022 11:48:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657010931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/CdP2P1akG4CGeESnZEzHNCeSNYIa1vWZVlmccgUctA=;
        b=Y9QPuxoLe5OAIQ/s+gNtsosZvERHCB22CneOshrjJSPppiJHx9NeoOMZr2R6TC7GnS+oHk
        n6+tYRC5QwmfoEGA9YSkVWBFHr2WkDhAJRQK8HYWzSZ1gTo3xWigNcrF0g85XtXgJGYdo7
        E3jwlqTp2+SARmBcHD+Ev/hzguLBtpA=
Date:   Tue, 5 Jul 2022 11:48:50 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Message-ID: <YsP68l7IuktIiMLD@jyty>
References: <YrhSK5l0uQZT76Fi@jyty>
 <YrmMQNPHkDGZ843v@gofer.mess.org>
 <YrqfTnY4Azqt44e4@jyty>
 <Yr/+g/j20kb5kzki@gofer.mess.org>
 <YsHLlg9CccrEzOjL@jyty>
 <YsKVA4bKNuRUOZpf@gofer.mess.org>
 <YsKwwVaFYrOxMhZw@jyty>
 <YsK6Rlk/ODYUE2/F@gofer.mess.org>
 <YsM5xhEXb6rzl1X9@jyty>
 <YsPnfBYnW2GJk4Hn@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsPnfBYnW2GJk4Hn@gofer.mess.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657010931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/CdP2P1akG4CGeESnZEzHNCeSNYIa1vWZVlmccgUctA=;
        b=ID5Gco/Y+Q+6H3u4hFYgfVDNO7A3qAWEO3a96nR/s6Viv9JSolSGo0LH2PCOb8Bcc5j70r
        ciLkRYpmNspl5MgWdTbLk15D7Dn91DFiOAsGhk2TgvmSr2ruNaMOJ1+/8LzH/djlPN6Fuk
        kTIM3w9PiBkDjhD7VMJZ0KMDJTRnVDE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657010931; a=rsa-sha256; cv=none;
        b=H/lpypdVN2mOgdfIe3VRwkXz4W8NToFBbb+1G00mA5A6dGdPwYfLeMAcPiNDHvBOwhifgU
        ZGASJ9XRBHCHt/ZhPm3dgmqY1eOQeEyec9tNzx1Tb3Ywz2wJxAl7csbPvaAho1XJkYOU1C
        du+InCagx5LxyFOoASchd60iL2npaac=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Tue, Jul 05, 2022 at 08:25:48AM +0100, Sean Young wrote:
>On Mon, Jul 04, 2022 at 10:04:38PM +0300, Marko Mäkelä wrote:
>> Mon, Jul 04, 2022 at 11:00:38AM +0100, Sean Young wrote:
>> > On Mon, Jul 04, 2022 at 12:20:01PM +0300, Marko Mäkelä wrote:
>> > > Mon, Jul 04, 2022 at 08:21:39AM +0100, Sean Young wrote:
>> > > > On Sun, Jul 03, 2022 at 08:02:14PM +0300, Marko Mäkelä wrote:
>> > > I tested the attached patch (which was created on 5.19-rc5, which
>> > > failed to boot on my system for unrelated reasons) on Linux 5.17, on
>> > > top of your fixes to rtl28xxu and rc-core.
>> >
>> > You'll need to fix this.
>>
>> The 5.19-rc5 boot failure could have been related to LUKS setup on that
>> machine, because a kernel panic message was displayed before I was being
>> prompted for an encryption key. The modules would not have been loaded at
>> that point, so I do not think that it is related to my modifications.
>>
>> When compiled for the v5.17 kernel release tag on another computer, the
>> patch that implements rc_keydown_or_repeat() worked for me.
>>
>> It does not look like there are many changes in drivers/media/rc between
>> 5.17 and 5.19.
>
>Your patch needs a `Signed-off-by` and it should not be attached, it should
>be inline in your email.

Thank you for your patience. I hope that I got it right. It would be my 
very first patch submission to the Linux kernel. I did not see it appear 
on this list archive yet. You are Cc'd.

>> > See https://github.com/seanyoung/cir/
>>
>> This could open up many possibilities. Would the decoded events also be
>> available via some low-level interface to user-space programs, in addition
>> to the input event driver?
>
>The plan was for it to run once, generate an eBPF program, attach that an
>exit. The eBPF program sends the decoded stuff to the lirc chardev in
>this struct:
>
>https://www.kernel.org/doc/html/latest/userspace-api/media/rc/lirc-dev-intro.html#data-types-used-by-lirc-mode-scancode
>
>This is the struct you're amending with LIRC_SCANCODE_FLAG_REPEAT.
>
>Will that be sufficient for your needs?

I think that it should cover the most common types of remote control 
units.

I can name an example of a complex IR remote control, which I think 
would be challenging to repurpose for controlling anything else than the 
original type of device. But, I would think that something Bluetooth or 
WLAN based on a touchscreen device will replace IR in such applications.  
The remote control of my air conditioner presents all settings on a 
local LCD. On every change, maybe after a short timeout of inactivity, 
it will send a long IR message with all the settings. The 32 bits of 
keycode or 64 bits of scancode would not be sufficient for that.

	Marko
