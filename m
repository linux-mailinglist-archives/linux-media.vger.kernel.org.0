Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F824E8374
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 19:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiCZSqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Mar 2022 14:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiCZSqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Mar 2022 14:46:01 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0F01877D0
        for <linux-media@vger.kernel.org>; Sat, 26 Mar 2022 11:44:21 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 7D7201B000F7;
        Sat, 26 Mar 2022 20:44:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1648320259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5TxyizJVqeyd5TTQpPP43Akf4ag9xwFYJDmjaBjoBto=;
        b=Wk8oneuQpQZ3MIroZtNSXpNqUkT1PjVIYi0GrWtlHVJS770dQVkw/vwUD93scbG2PaEKDY
        rwJtdG0bFU6u+9mX9YYznVY3fq+5hGJ6HXycVgxdP4SVlDLGFOKZBWlOEGxje5cALWdcu1
        fS82v/oIyegkvzgZlkI9SNnlJ4ATllyID6Xsad2NL6wFN09H1YDOVv9bihRnfDdW69AUI3
        KcliRyQe/MnbGqmW6hBUxUN0oYfqVvFCSmTjYVzPxRF7xaMjUNySxRefTM1jd5svTglR6z
        1ErR0hLod0brPOdDmriDU+vBw4fG0bjJvP2iv1xs7xejZVBC85IAMgHYlYsa6Q==
Date:   Sat, 26 Mar 2022 20:44:18 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <Yj9fArSg/fFU2MB7@jyty>
References: <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
 <YgKeZ+vAynWvvijz@gofer.mess.org>
 <YgN3cq+utQAFFnEW@jyty>
 <YgeXBRR8YUH8H61t@gofer.mess.org>
 <Ygfhl+dZUfHNJXkU@gofer.mess.org>
 <Ygk8DM3tstwi/m9g@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ygk8DM3tstwi/m9g@jyty>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1648320259; a=rsa-sha256;
        cv=none;
        b=HOuW/+4qj2XZx9LFqwSehFkK1jbbzBhTgRSXSfIRvaP3y+netd4c9O5obmmqlMbImlq/zr
        YZvt3ui47H5al9u8DRyzeKS6e+MrXhlgTc/9en8vLROq5k2XWXSvbIviWQQHxhlHL4cuEi
        +cceluZwSERdA8vqwgHahMtdMsfLz5BPKFQ2Zh0x6z/ZvdPd4j+VLXkOpcj3vaS7drbvVI
        KI4Fqy3dn412oqxlq+jlEi+1lLqVx5g+Dyqjsyjop7KTwSqAw5dz+h3cCgqqJZ4jHPKyds
        tAak4PK3webE5odjM3JWA8Yjfm40HgEjEY5Hn3xJpsMlZxCxiBhvLVa4uqfUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1648320259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5TxyizJVqeyd5TTQpPP43Akf4ag9xwFYJDmjaBjoBto=;
        b=uGTRNVl3kSWiyqE2jSqa+iPPznFDgq4bvERZeiSWItRligtqKioDml1oP/E2DlfAD7j1Ck
        cWIGJigMWDlDOvwW5nVYy4KR/ZyZWJfYzvrraugEw0Qa6IG6LIV5ROCAqnouTNIk65eQCp
        Zs98UzniATOLALd44iJZKDnQaDbX9ojkw5UcEZufBU25LAFqTQ6vVD3Ia2Js9xA3BCH0tk
        ku+Wnl2F8sdPb9NFNa8iaJNNUx1nO9pNa5ltiR753ztLhfLV1Q0llEuZ7hSJapZPlwncka
        2DFWrs4u5nl/o5WrhLX1kn8PCaXY9KUXuG0brnmnsxP3jCBQtlqxzs7uxqbOLw==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Sun, Feb 13, 2022 at 07:12:46PM +0200, Marko Mäkelä wrote:
>Hi Sean,
>
>>>I've spent some more time debugging this. The problem is that we 
>>>need to increase the timeout to prevent key up events from 
>>>arriving to early, but the same timeout is used for the raw IR 
>>>timeout.
>>
>>So I've sent two patches (you're on the cc) which should fix the 
>>issue.  Please can you test if this solves the issue?
>
>It is a significant improvement. Alas, I was able to repeat a glitch 
>with both the RC5 and NEC protocols. I was testing the key-repeat 
>events for the volume control. For both remotes, a sequence was lost 
>every now and then. Here is the output of "sudo ir-keytable -t" for 
>both. I used the default repeat period of 125ms, but I also repeated 
>it with 100ms.

I tested this once more, applying your 2 commits to the 5.17.0 kernel, 
and I still observe the error that even though I hold a button 
depressed, a key_up event will be delivered. The LIRC protocol events 
appear to be generated fine.

Here is some "ir-keytable -t" output for the bundled remote control that 
uses the NEC protocol.

2977.094816: lirc protocol(nec): scancode = 0x9
2977.094825: event type EV_MSC(0x04): scancode = 0x09
2977.094825: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2977.094825: event type EV_SYN(0x00).
2977.206201: lirc protocol(nec): scancode = 0x9 repeat
2977.206214: event type EV_MSC(0x04): scancode = 0x09
2977.206214: event type EV_SYN(0x00).
2977.318205: lirc protocol(nec): scancode = 0x9 repeat
2977.318217: event type EV_MSC(0x04): scancode = 0x09
2977.318217: event type EV_SYN(0x00).
2977.430187: lirc protocol(nec): scancode = 0x9 repeat
2977.430199: event type EV_MSC(0x04): scancode = 0x09
2977.430199: event type EV_SYN(0x00).
2977.542185: lirc protocol(nec): scancode = 0x9 repeat
2977.542197: event type EV_MSC(0x04): scancode = 0x09
2977.542197: event type EV_SYN(0x00).
2977.596054: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2977.596054: event type EV_SYN(0x00).
2977.654185: lirc protocol(nec): scancode = 0x9 repeat
2977.596054: event type EV_MSC(0x04): scancode = 0x09
2977.596054: event type EV_SYN(0x00).
2977.728050: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2977.728050: event type EV_SYN(0x00).
2977.766185: lirc protocol(nec): scancode = 0x9 repeat
2977.728050: event type EV_MSC(0x04): scancode = 0x09
2977.728050: event type EV_SYN(0x00).
2977.860047: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2977.860047: event type EV_SYN(0x00).
2977.878185: lirc protocol(nec): scancode = 0x9 repeat
2977.860047: event type EV_MSC(0x04): scancode = 0x09
2977.860047: event type EV_SYN(0x00).
2977.990153: lirc protocol(nec): scancode = 0x9 repeat
2977.990164: event type EV_MSC(0x04): scancode = 0x09
2977.990164: event type EV_SYN(0x00).
2977.992053: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2977.992053: event type EV_SYN(0x00).
2978.102203: lirc protocol(nec): scancode = 0x9 repeat
2977.992053: event type EV_MSC(0x04): scancode = 0x09
2977.992053: event type EV_SYN(0x00).
2978.124054: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.124054: event type EV_SYN(0x00).
2978.214192: lirc protocol(nec): scancode = 0x9 repeat
2978.124054: event type EV_MSC(0x04): scancode = 0x09
2978.124054: event type EV_SYN(0x00).
2978.260047: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.260047: event type EV_SYN(0x00).
2978.326193: lirc protocol(nec): scancode = 0x9 repeat
2978.260047: event type EV_MSC(0x04): scancode = 0x09
2978.260047: event type EV_SYN(0x00).
2978.396006: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.396006: event type EV_SYN(0x00).
2978.440131: lirc protocol(nec): scancode = 0x9 repeat
2978.396006: event type EV_MSC(0x04): scancode = 0x09
2978.396006: event type EV_SYN(0x00).
2978.528049: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.528049: event type EV_SYN(0x00).
2978.554229: lirc protocol(nec): scancode = 0x9 repeat
2978.528049: event type EV_MSC(0x04): scancode = 0x09
2978.528049: event type EV_SYN(0x00).
2978.660049: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.660049: event type EV_SYN(0x00).
2978.666239: lirc protocol(nec): scancode = 0x9 repeat
2978.660049: event type EV_MSC(0x04): scancode = 0x09
2978.660049: event type EV_SYN(0x00).
2978.778158: lirc protocol(nec): scancode = 0x9 repeat
2978.778169: event type EV_MSC(0x04): scancode = 0x09
2978.778169: event type EV_SYN(0x00).
2978.796049: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.796049: event type EV_SYN(0x00).
2978.928053: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.928053: event type EV_SYN(0x00).
2978.928053: event type EV_KEY(0x01) key_up: KEY_NUMERIC_1(0x0201)
2978.928053: event type EV_SYN(0x00).
2979.334204: lirc protocol(nec): scancode = 0x9 repeat
2979.334218: event type EV_MSC(0x04): scancode = 0x09
2979.334218: event type EV_SYN(0x00).
2979.554215: lirc protocol(nec): scancode = 0x9 repeat
2979.554229: event type EV_MSC(0x04): scancode = 0x09
2979.554229: event type EV_SYN(0x00).
2979.666173: lirc protocol(nec): scancode = 0x9 repeat
2979.666185: event type EV_MSC(0x04): scancode = 0x09
2979.666185: event type EV_SYN(0x00).
2979.778232: lirc protocol(nec): scancode = 0x9 repeat
2979.778243: event type EV_MSC(0x04): scancode = 0x09
2979.778243: event type EV_SYN(0x00).
2979.890230: lirc protocol(nec): scancode = 0x9 repeat
2979.890241: event type EV_MSC(0x04): scancode = 0x09
2979.890241: event type EV_SYN(0x00).
2980.002258: lirc protocol(nec): scancode = 0x9 repeat
2980.002269: event type EV_MSC(0x04): scancode = 0x09
2980.002269: event type EV_SYN(0x00).
2980.114226: lirc protocol(nec): scancode = 0x9 repeat
2980.114237: event type EV_MSC(0x04): scancode = 0x09
2980.114237: event type EV_SYN(0x00).
2980.226200: lirc protocol(nec): scancode = 0x9 repeat
2980.226212: event type EV_MSC(0x04): scancode = 0x09
2980.226212: event type EV_SYN(0x00).
2980.338197: lirc protocol(nec): scancode = 0x9 repeat
2980.338210: event type EV_MSC(0x04): scancode = 0x09
2980.338210: event type EV_SYN(0x00).
2980.450191: lirc protocol(nec): scancode = 0x9 repeat
2980.450203: event type EV_MSC(0x04): scancode = 0x09
2980.450203: event type EV_SYN(0x00).
2980.562195: lirc protocol(nec): scancode = 0x9 repeat
2980.562206: event type EV_MSC(0x04): scancode = 0x09
2980.562206: event type EV_SYN(0x00).

As you can see, LIRC events will be produced, but there were only 
intermittent key_down events, and a premature key_up event while I was 
holding the key down.

Above, I would like to emphasize the following glitch. Not only we got a 
premature key_up while I held the button depressed, but that event was 
generated at the very same timestamp with a key_down.

2978.778158: lirc protocol(nec): scancode = 0x9 repeat
2978.778169: event type EV_MSC(0x04): scancode = 0x09
2978.778169: event type EV_SYN(0x00).
2978.796049: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.796049: event type EV_SYN(0x00).
2978.928053: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
2978.928053: event type EV_SYN(0x00).
2978.928053: event type EV_KEY(0x01) key_up: KEY_NUMERIC_1(0x0201)
2978.928053: event type EV_SYN(0x00).
2979.334204: lirc protocol(nec): scancode = 0x9 repeat
2979.334218: event type EV_MSC(0x04): scancode = 0x09
2979.334218: event type EV_SYN(0x00).

This time, I also did
echo 'file rtl28xxu.c +p' > /sys/kernel/debug/dynamic_debug/control
dmesg

and here is some output corresponding to the above:

[ 2978.632071] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff 89 2c 8d 7f 40
[ 2978.633720] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 2978.635377] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 2978.637031] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 2978.740612] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2978.742301] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 05
[ 2978.744024] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 05 00 <<< b0 2c 8d 7f 40
[ 2978.744037] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=b0 2c 8d 7f 40
[ 2978.745690] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 2978.747350] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 2978.749009] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 2978.852621] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2978.854306] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 03
[ 2978.856004] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 03 00 <<< 8d 7f 40
[ 2978.856018] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=8d 7f 40
[ 2978.857669] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 2978.859320] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 2978.860976] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 2978.964619] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2978.966304] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 04
[ 2978.968003] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 04 00 <<< ff b5 2b 8d
[ 2978.968016] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff b5 2b 8d
[ 2978.968021] dvb_usb_rtl28xxu 2-9.1:1.0: ignoring idle=2b
[ 2979.072616] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2979.074308] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 06
[ 2979.076026] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 06 00 <<< ff b5 2b 8d 7f 40
[ 2979.076040] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff b5 2b 8d 7f 40
[ 2979.077691] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 2979.079350] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 2979.081008] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 2979.184612] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2979.186294] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 04
[ 2979.187986] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 04 00 <<< ff b5 2c 8d
[ 2979.187997] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff b5 2c 8d
[ 2979.188001] dvb_usb_rtl28xxu 2-9.1:1.0: ignoring idle=2c
[ 2979.292615] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2979.294304] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 06
[ 2979.296024] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 06 00 <<< ff b5 2c 8d 7f 40
[ 2979.296037] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff b5 2c 8d 7f 40
[ 2979.297696] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 2979.299352] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 2979.301013] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 2979.404611] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 2979.406292] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 06
[ 2979.408005] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 06 00 <<< ff b5 2c 8c 7f 40
[ 2979.408018] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=ff b5 2c 8c 7f 40

Here, the problem could be correlated with the "ignoring idle" messages. 
The previous such message was at 2976.728254, which correlated with the 
start of me pressing the button. I had released the previous button 
about 40 seconds earlier.

With the RC5 remote control (using hauppauge.toml) it is similar, but 
the key_down events never disappeared indefinitely. If I kept the button 
depressed, eventually the bogus key_up would be followed by key_down.

Testing events. Please, press CTRL-C to abort.
4462.130185: lirc protocol(rc5): scancode = 0x1e01
4462.130197: event type EV_MSC(0x04): scancode = 0x1e01
4462.130197: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4462.130197: event type EV_SYN(0x00).
4462.242167: lirc protocol(rc5): scancode = 0x1e01
4462.242176: event type EV_MSC(0x04): scancode = 0x1e01
4462.242176: event type EV_SYN(0x00).
4462.354172: lirc protocol(rc5): scancode = 0x1e01
4462.354181: event type EV_MSC(0x04): scancode = 0x1e01
4462.354181: event type EV_SYN(0x00).
4462.466172: lirc protocol(rc5): scancode = 0x1e01
4462.466182: event type EV_MSC(0x04): scancode = 0x1e01
4462.466182: event type EV_SYN(0x00).
4462.578198: lirc protocol(rc5): scancode = 0x1e01
4462.578208: event type EV_MSC(0x04): scancode = 0x1e01
4462.578208: event type EV_SYN(0x00).
4462.652054: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4462.652054: event type EV_SYN(0x00).
4462.690173: lirc protocol(rc5): scancode = 0x1e01
4462.652054: event type EV_MSC(0x04): scancode = 0x1e01
4462.652054: event type EV_SYN(0x00).
4462.784052: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4462.784052: event type EV_SYN(0x00).
4462.802199: lirc protocol(rc5): scancode = 0x1e01
4462.784052: event type EV_MSC(0x04): scancode = 0x1e01
4462.784052: event type EV_SYN(0x00).
4462.914215: lirc protocol(rc5): scancode = 0x1e01
4462.914224: event type EV_MSC(0x04): scancode = 0x1e01
4462.914224: event type EV_SYN(0x00).
4462.916050: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4462.916050: event type EV_SYN(0x00).
4463.048051: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4463.048051: event type EV_SYN(0x00).
4463.130202: lirc protocol(rc5): scancode = 0x1e01
4463.048051: event type EV_MSC(0x04): scancode = 0x1e01
4463.048051: event type EV_SYN(0x00).
4463.180051: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4463.180051: event type EV_SYN(0x00).
4463.312052: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4463.312052: event type EV_SYN(0x00).
4463.346181: lirc protocol(rc5): scancode = 0x1e01
4463.312052: event type EV_MSC(0x04): scancode = 0x1e01
4463.312052: event type EV_SYN(0x00).
4463.444050: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4463.444050: event type EV_SYN(0x00).
4463.576056: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4463.576056: event type EV_SYN(0x00).
4463.576056: event type EV_KEY(0x01) key_up: KEY_NUMERIC_1(0x0201)
4463.576056: event type EV_SYN(0x00).
4464.466165: lirc protocol(rc5): scancode = 0x1e01
4464.466177: event type EV_MSC(0x04): scancode = 0x1e01
4464.466177: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4464.466177: event type EV_SYN(0x00).
4464.578177: lirc protocol(rc5): scancode = 0x1e01
4464.578187: event type EV_MSC(0x04): scancode = 0x1e01
4464.578187: event type EV_SYN(0x00).
4464.690210: lirc protocol(rc5): scancode = 0x1e01
4464.690219: event type EV_MSC(0x04): scancode = 0x1e01
4464.690219: event type EV_SYN(0x00).
4464.802158: lirc protocol(rc5): scancode = 0x1e01
4464.802167: event type EV_MSC(0x04): scancode = 0x1e01
4464.802167: event type EV_SYN(0x00).
4464.914163: lirc protocol(rc5): scancode = 0x1e01
4464.914172: event type EV_MSC(0x04): scancode = 0x1e01
4464.914172: event type EV_SYN(0x00).
4464.988053: event type EV_KEY(0x01) key_down: KEY_NUMERIC_1(0x0201)
4464.988053: event type EV_SYN(0x00).

Again, at 4463.576056 we get both key_down and key_up with the same 
timestamp. Between the two first key_down there is a delay of about 
500ms, and the repeat rate looks roughly correct too. So, the only 
problem is the premature key_up event, and the 890ms delay until a 
key_down was delivered again. The last key_down in the above snippet was 
delivered in about 500ms from that. That is correct, as the driver 
"thinks" that the key had been released in between.

Here is the dmesg output for that time frame:

[ 4463.405960] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=89 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.407580] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.409206] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.410830] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4463.514533] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4463.516188] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 0f
[ 4463.517940] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 0f 00 <<< 8e 11 92 12 92 11 92 12 92 11 92 24 91 7f 40
[ 4463.517953] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=8e 11 92 12 92 11 92 12 92 11 92 24 91 7f 40
[ 4463.519572] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.521199] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.522825] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4463.626542] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4463.628196] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 0f
[ 4463.629947] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 0f 00 <<< a6 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.629959] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=a6 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.631574] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.633201] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.634824] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4463.738496] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4463.740169] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 13
[ 4463.741961] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 13 00 <<< 88 11 92 11 a4 11 93 11 92 11 93 11 92 12 92 23 92 7f 40
[ 4463.741974] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=88 11 92 11 a4 11 93 11 92 11 93 11 92 12 92 23 92 7f 40
[ 4463.743596] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.745219] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.746848] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4463.850469] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4463.852113] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 15
[ 4463.853936] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 15 00 <<< 8d 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.853951] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=8d 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.855570] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.857194] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.858821] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4463.962543] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4463.964199] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 15
[ 4463.966010] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 15 00 <<< 94 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.966022] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=94 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4463.967636] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4463.969256] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4463.970880] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.074517] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.076193] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 17
[ 4464.078006] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 17 00 <<< a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.078019] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.079639] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4464.081256] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4464.082879] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.186516] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.188168] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 19
[ 4464.190002] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 19 00 <<< 93 11 a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.190015] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=93 11 a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.191638] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4464.193257] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4464.194879] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.298515] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.300186] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 19
[ 4464.302020] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 19 00 <<< 92 11 a4 23 92 12 92 11 92 12 a3 12 92 12 91 12 92 12 91 12 92 23 92 7f 40
[ 4464.302034] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=92 11 a4 23 92 12 92 11 92 12 a3 12 92 12 91 12 92 12 91 12 92 23 92 7f 40
[ 4464.303652] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4464.305276] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4464.306898] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.410538] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.412209] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 19
[ 4464.414043] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 19 00 <<< 93 11 a4 23 92 11 93 11 92 12 a3 12 92 11 92 12 92 11 92 12 92 23 92 7f 40
[ 4464.414055] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=93 11 a4 23 92 11 93 11 92 12 a3 12 92 11 92 12 92 11 92 12 92 23 92 7f 40
[ 4464.415676] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4464.417303] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4464.418928] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.522518] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.524176] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 19
[ 4464.526010] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 19 00 <<< 93 11 a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.526025] dvb_usb_rtl28xxu 2-9.1:1.0: IR_RX_BUF=93 11 a4 23 92 11 93 11 92 11 a4 11 93 11 92 11 93 11 92 11 93 23 92 7f 40
[ 4464.527642] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 01 fd 11 02 01 00 >>> 03
[ 4464.529259] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 09 fd 11 02 01 00 >>> 80
[ 4464.530881] usb 2-9.1: rtl28xxu_ctrl_msg: 40 00 02 fd 11 02 01 00 >>> 80
[ 4464.634523] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 01 fd 01 02 01 00 <<< 83
[ 4464.636176] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 0b fd 01 02 01 00 <<< 19
[ 4464.638011] usb 2-9.1: rtl28xxu_ctrl_msg: c0 00 00 fc 01 02 19 00 <<< 93 11 a4 23 92 11 93 11 92 11 a4 12 92 11 92 12 92 11 92 12 92 23 92 7f 40

For the RC5 protocol, there are no "ignoring idle" messages. I could 
offer another potential explanation for the premature key_up events.  
You described the intended change earlier as follows:

>>I think rc-core needs a little refactoring to split out the timeout 
>>into keyup_timeout and rawir_timeout. For this driver, the 
>>rawir_timeout needs to be set to 0xbf * 51us, and the keyup_timeout to 
>>the query interval (which 200ms).

In my previous message, I replied to that:

>Possibly related to this: A long time ago when I was involved with 
>formal methods in theoretical computer science, timers or timeouts 
>would make me nervous due to the inherent state space explosion. In 
>model checking, a timed event can be modeled with nondeterminism: in 
>every state where the event is enabled, it may or may not be executed.  
>So, in theory, timers or timeouts could open more room for race 
>conditions or starvation. In practice, if multiple timers are driven 
>from the same clock source, it should not be that bad.

Maybe an easier-to-understand analogy would be the physics concept of 
interference, nicely visualized by Moiré patterns.

I did not study the code, so I am merely thinking aloud here: If both 
keyup_timeout and rawir_timeout occur at the same time, an incorrect 
key_up event could be delivered every now and then. I guess that this 
would require two independent threads being triggered by the timeouts, 
and some race condition between them.

I am happy to test a revised patch.

Best regards,

	Marko
