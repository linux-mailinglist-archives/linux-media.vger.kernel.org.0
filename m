Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA7E2DECAB
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 02:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgLSB5k convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 18 Dec 2020 20:57:40 -0500
Received: from mail-oln040092073093.outbound.protection.outlook.com ([40.92.73.93]:63940
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725940AbgLSB5k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 20:57:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akmtccAEw7On+yHPIOsW7sDYk/0dutRWW/JMDEHFX1q1NrtNQs2o9dDov3jV2GqDTnTh+pDjq00dmvAgdENkSJBLCBCx2V7PnGLtzx8yZl6jriE+VoIX078uWMYV08GgrQDKHlxrQVO3fg3V9Cc5U4N/9M/eEMKF6xmYexw3mvNlrXu+xttgG2fNofFLhCY8BDZLnf92wUjUVqej/8Z1wYt4JmQwb53LKK3tH0L9WMwLq5yUBegnRwVMC816a+xOV8UNTdorEWe6F5OmLk92yLJaFAfSpxUAc7PFBMP9Gyurdq2as8ZyQ6Kr6Ayy+DCa4th0bi5spLlt2xifrRh05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzz2rL7bDupTEqeOnnr23wTBcw85OGYpv7TQ1s0me3I=;
 b=epV4L8V7B3j5SCqVNU7dL0G+z9al8cXqZRuWEBkIuG9bXBB+JLHnxH5iMCIcFRdyspo/ll049zDn1ubzYjeGeoPosgWpOfENUrFLIxTugCRC1X5+CdaDx5s5nGdmG0sAadT4Vr0qhn56LeLOoB0pJljG4oa9Q1qjsD7XeVsfwmj4/qdVyfImlEY2hO9rpVqq+6tKsWjzjxq1CcxUE18Pmxz9NPSws4Tk8oaO4jgcPmRgefz7Fiz6nFWM4FJ/tefrkX6WymFTjqAQAFMQ4dRzGShv4VCyeB2gAE94e5zl5y04L6CYW6s2LD1XF4a8n69/wxDpMtPSxvNNbEkCBkPG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR04FT022.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::44) by
 VI1EUR04HT031.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::226)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 01:56:50 +0000
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:7e0e::53)
 by VI1EUR04FT022.mail.protection.outlook.com (2a01:111:e400:7e0e::70) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Sat, 19 Dec 2020 01:56:50 +0000
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09]) by VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09%9]) with mapi id 15.20.3676.029; Sat, 19 Dec 2020
 01:56:50 +0000
From:   Jesus <observer1@hotmail.es>
To:     Sean Young <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: Help with harmony remote
Thread-Topic: Help with harmony remote
Thread-Index: AQHW1P1pj2wAAlUyIE6McsWWcr0cGqn8oR+AgAB3wqM=
Date:   Sat, 19 Dec 2020 01:56:50 +0000
Message-ID: <VI1P193MB016010B2B176FE481020913881C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
References: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>,<20201218100710.GA29317@gofer.mess.org>
In-Reply-To: <20201218100710.GA29317@gofer.mess.org>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:7CB52DEC71094F85AC7E70588EC2D64BC6466708E3570AEF56DFA7ACA992DB62;UpperCasedChecksum:462A0760480696E4B41C3F023C558803EDC03C8BCDAE9C5790C964B6A8A6513B;SizeAsReceived:6879;Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [a/QrXg+1RFwsbHkVjzXyRmuyeEB2wMcj]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a6ddd7c2-62f1-477c-2833-08d8a3c159df
x-ms-traffictypediagnostic: VI1EUR04HT031:
x-ms-exchange-minimumurldomainage: myharmony.com#5950
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDSseN7hOuOu4Um0E1BNZIVu5YXEEErR48O74pUvo4FYQr/35Q66SS4RcRPOCP/x1RR4QENI+D5jNlpsp5goQX/+yexb4Sw5by07OXAR+p4b2px2v7KxFe0oy8Vc5LKyPTDCG6f0E1iq7SBkmPgKFMYnTDUo7J1OJZ7Y3uGssFgfjr0Bo1VNvjFBU3/RaiptzEL3KbZliKYq1zB6xYQzX4KZTT9yHjM1G2PjcIRKyVFtjGzPBytZIEgQBX3rIHoBr89XJwpw/JJtJOJoQDp/AqVdkV02gT7qvAajRvmVvoQ=
x-ms-exchange-antispam-messagedata: EvLfjZB1OKsl2b5xykD05z9Bu8w0KtWdE3NVXEuL1/dmTykTuVZkDU0K1/3CMYuTbEhfPFzDdLZi5cPWNXbteSGBSqYvNJNEgGS46MTATwDDyMlFlTQht1CWB6YK42Y6h/dtECRLMr8Ftx6+Wi4CGg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT022.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ddd7c2-62f1-477c-2833-08d8a3c159df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2020 01:56:50.4178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT031
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org




De: Sean Young <sean@mess.org>
Enviado: viernes, 18 de diciembre de 2020 10:07
Para: Jesus <observer1@hotmail.es>
Cc: linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Asunto: Re: Help with harmony remote 
 
Hi,

On Fri, Dec 18, 2020 at 05:21:36AM +0000, Jesus wrote:
> Hi
> I have an ir harmony remote which I have configured to use as a mouse with a Intel nuc D54250WYK, I have tested un Windows 10 and it works as expected but in linux the mouse buttons don't work.
> I'm using the keymap /lib/udev/rc_keymaps/mce_keyboard.toml, this happens when I press the left button:

The mce_keyboard is for a very specific keyboard:

https://www.trustedreviews.com/reviews/microsoft-media-center-2005-keyboard

I suspect this is not the right IR decoder. What model is this exactly
and what buttons does it have, etc. What buttons do already work?

It's a Universal Harmony 350

This one:
https://support.myharmony.com/en-us/350
https://assets.logitech.com/assets/54199/gallery-1.png

It's programable, the remote selected for the mouse is named Media Center PC SE i believe is the mce, and for the other functions of the pc part I use a remote named Intel Media Player I believe is mce too but diferent set of keys selectable
I've managed to make work every button I use in the intel media player remote, for the Media Center PC SE, I only use the mouse part thats what I have tested, the mouse movement works, the left and right click are the ones not working


Some recording of the ir using "ir-ctl -r" would be useful too.

this is the output for the left click:

+2800 -200 +300 -300 +300 -250 +300 -300 +600 -600 +300 -400 +200 -350 +300 -200 +350 -300 +300 -300 +600 -300 +300 -600 +300 -250 +400 -200 +400 -200 +400 -250 +350 -300 +300 -400 +200 -300 +300 -300 +300 -300 +300 -300 +300 -300 +300 -300 +350 -250 +350 -300 +600 -250 +350 -350 +250 -300 +300 -600 +350 -250 +350 -75800 +2800 -200 +350 -200 +400 -250 +350 -300 +650 -600 +300 -300 +300 -300 +300 -250 +300 -300 +300 -300 +600 -250 +400 -600 +350 -200 +350 -250 +350 -250 +350 -250 +350 -250 +400 -200 +350 -250 +350 -250 +350 -250 +350 -300 +300 -300 +300 -250 +350 -300 +300 -300 +600 -250 +350 -200 +400 -250 +350 -600 +300 -250 +400 -75800 +2800 -200 +350 -200 +400 -250 +300 -250 +700 -550 +350 -200 +350 -250 +350 -250 +350 -250 +300 -350 +550 -250 +400 -600 +300 -300 +250 -300 +300 -300 +300 -350 +300 -250 +400 -250 +350 -250 +350 -400 +200 -350 +300 -300 +300 -300 +300 -250 +350 -200 +400 -250 +650 -200 +400 -250 +350 -250 +350 -600 +300 -300 +300 # timeout 101600


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

I suppose thats the problem I didn't know there where more than one type of value you can set, I only noticed the ones I saw where shorter than in the examples.

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

Thanks for your help Sean
