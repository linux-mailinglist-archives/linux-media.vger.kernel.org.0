Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F31F2DE0BA
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 11:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733049AbgLRKHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 05:07:53 -0500
Received: from gofer.mess.org ([88.97.38.141]:44745 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732951AbgLRKHw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 05:07:52 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 45E57C6357; Fri, 18 Dec 2020 10:07:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1608286031; bh=BDB7u85wJSmxQ2Rt441L7gp9iO3f0gLog3mQPW0S3e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W3qaNq17kyWd1EUb9CO4/5aRbNmQ1IMVY1za+M9Nu0PFaJU4ALuGa6E05hga5SN6e
         YpAOf3mr7S7WKhOhkyOCppeH+5xGMs5hYJSApOoTDL5tZYI53bl7WvMwazB7crphIN
         U6Cg/qwvoKyiJfv77xicPPA0kgztepsMJwAMw2FG+Qr9qYssvu0Mt4KsG0nbKSAIWD
         abzUTA4++OI3TTpkwbrhdfEiGnmhFF0hCLW0KIxxUtYkFLrAO8NYu8coZTasKvFwF7
         jZpUpjWvjwt42eNfXs8ERmggvD/ZSh13iR8OZnOhEhYM4TW4L6H6vxs7F/iJiRyekE
         /d5uTanqvmoIw==
Date:   Fri, 18 Dec 2020 10:07:11 +0000
From:   Sean Young <sean@mess.org>
To:     Jesus <observer1@hotmail.es>
Cc:     linux-media@vger.kernel.org
Subject: Re: Help with harmony remote
Message-ID: <20201218100710.GA29317@gofer.mess.org>
References: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Dec 18, 2020 at 05:21:36AM +0000, Jesus wrote:
> Hi
> I have an ir harmony remote which I have configured to use as a mouse with a Intel nuc D54250WYK, I have tested un Windows 10 and it works as expected but in linux the mouse buttons don't work.
> I'm using the keymap /lib/udev/rc_keymaps/mce_keyboard.toml, this happens when I press the left button:

The mce_keyboard is for a very specific keyboard:

https://www.trustedreviews.com/reviews/microsoft-media-center-2005-keyboard

I suspect this is not the right IR decoder. What model is this exactly
and what buttons does it have, etc. What buttons do already work?

Some recording of the ir using "ir-ctl -r" would be useful too.

> 688888.335099: lirc protocol(mcir2-mse): scancode = 0x3c
> 688888.335117: event type EV_MSC(0x04): scancode = 0x3c
> 688888.335117: event type EV_SYN(0x00).
> 688888.475123: lirc protocol(mcir2-mse): scancode = 0x3c
> 688888.475142: event type EV_MSC(0x04): scancode = 0x3c
> 688888.475142: event type EV_SYN(0x00).
> 
> So I added this to the file and reloaded:
> 
> 
> [[protocols]]
> protocol = "mce_kbd"
> [protocols.scancodes]
> 0x3c = "BTN_LEFT"
> 0x5a = "BTN_RIGHT"

Unfortunately this IR decoder doesn't work very well if you set keycodes
for the scancodes. It doesn't generate the necessary key-up events.
> 
> The output now is:
> 
> 
> 689080.444492: lirc protocol(mcir2-mse): scancode = 0x3c
> 689080.444510: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689080.444510: event type EV_MSC(0x04): scancode = 0x3c
> 689080.444510: event type EV_SYN(0x00).
> 689080.542540: lirc protocol(mcir2-mse): scancode = 0x3c
> 689080.542564: event type EV_MSC(0x04): scancode = 0x3c
> 689080.542564: event type EV_SYN(0x00).
> 689080.682743: lirc protocol(mcir2-mse): scancode = 0x3c
> 689080.682760: event type EV_MSC(0x04): scancode = 0x3c
> 689080.682760: event type EV_SYN(0x00).
> 689080.945699: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689080.945699: event type EV_SYN(0x00).
> 689081.073768: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689081.073768: event type EV_SYN(0x00).
> 689081.201773: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689081.201773: event type EV_SYN(0x00).
> 689081.329767: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689081.329767: event type EV_SYN(0x00).
> 689081.457773: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> 689081.457773: event type EV_SYN(0x00).
> 
> The last two lines keep repeating and the left click don't happens
> 
> Please help me with this

Thanks

Sean
