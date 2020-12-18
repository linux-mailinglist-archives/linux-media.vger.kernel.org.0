Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA332DDDD6
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 06:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731527AbgLRFWZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 18 Dec 2020 00:22:25 -0500
Received: from mail-vi1eur05olkn2064.outbound.protection.outlook.com ([40.92.90.64]:46285
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725290AbgLRFWY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 00:22:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7qJnkGQMD1Xu391ARulm848H/Wjz72QV1X78U+T8ErQKy+34X40MqFGqvyIpBwgkVnu7dxSGLGoNGv/Vp+V1pCi9HjqQ3085JmQpEwf8tXsrqJdIIuPuXp7Q3A+LtMc7Mu38ApRb6q2fg534P+yhaGZIUwVBm9M/LBO8IJ+JSNxxeLPsbGgVyqHw52qqkZ94tmxL0VDe/Z5rCDoiV3lG95ttVOgcVelyjpbYNpRmSVMOIc6PwjW9/+QSVCDHpzYuPR29EG9EGrW3SOD/lktsqmLl6EiphFiFEGZOq0pZg9B3SBiw5DypG+jJjYr3s8gO+stc2QGtrdQ6+8B4r3EkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IMRs72jDzexY131mRfJ+nnwl2LCDhsoEyaTyyPVze0=;
 b=cZcqYVsCNeppkzgOIlwd7Di5CbpwoRGSVS1Zj+DazciUk5kwomgLgBQK0GiI173kUxM5tSKI9GFp05RwdYd+7+HgBwP4QYMpelAfTHgdJ2kvnBxghc81Qb/EHkQxUErNZ9LBsCINImZoETjYLpum6wJG8upethNU089bFSX05dhTzXhMHTYJit3it7K+Ft+4vKNObY4Rwv6yv1KWNPhAiAUhIOuSNrLmxoD3hTtw4khmiCP0jqteUzfft1ug6jP9N0n3MNEHLaKQ3cPgMM2C5O5ep/ZOIOPcamJrLQSMNcX5vbj3Wt3SsBMswtNNl5fXDFtF0NjKDilPxc59iGCogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR05FT010.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::51) by
 DB8EUR05HT236.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::407)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Fri, 18 Dec
 2020 05:21:36 +0000
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:fc0f::49)
 by DB8EUR05FT010.mail.protection.outlook.com (2a01:111:e400:fc0f::203) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Fri, 18 Dec 2020 05:21:36 +0000
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09]) by VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09%9]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 05:21:36 +0000
From:   Jesus <observer1@hotmail.es>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Help with harmony remote
Thread-Topic: Help with harmony remote
Thread-Index: AQHW1P1pj2wAAlUyIE6McsWWcr0cGg==
Date:   Fri, 18 Dec 2020 05:21:36 +0000
Message-ID: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C053D671C53FB19A656BCDBE2F2FED986933FD2EFFD639ACF3038C1FBE25985D;UpperCasedChecksum:650B2500B4D28B2E9233FC9B6D3834152FAE39E5DBD852D292BCF5E7E6581D5F;SizeAsReceived:6587;Count:41
x-tmn:  [qbZhLgjJ1tOLPnDPCM7s2hoR1KYwDwuQ]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 406a1b38-bea4-40cc-bb81-08d8a314ca75
x-ms-traffictypediagnostic: DB8EUR05HT236:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eDZ2Q/dIcff7Q8y0ds+2evMmRMAvlkbFIYKYS+iYOdz6V5nq0AbcoFskC4+Kegc4WeGY8/s84Ks2htmdbnLBxgYSwTGvWdoppFDcX5kQgxRulLz4g2F5XA5/z9+sF3LYNdeFB3DF54f0AaZsHq5uTiaoB8IS6lea1qV56hpgksKVGuzU4QDhZwx1WhGBM/Pxe3Df4SXP+4eCFl0QiNYGz5E0I7yTIjSzpRDwotYnSG0kY8x4Towpq/XWBgyKkEXk
x-ms-exchange-antispam-messagedata: vZa5a5xRLGyr/OyAfjzHp/9n5hLn4nQjLHDmiO//Xo213Y7KNxpbz27FN2+to+XO+tI8DQLlmrAclgkucophYN8qq+DtJVsFr9mzPEPokS4xal2GBqdcEWZIcq3gWrqqzJGvR6sDeoW5DjMIekr6GQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR05FT010.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 406a1b38-bea4-40cc-bb81-08d8a314ca75
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2020 05:21:36.3322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT236
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi
I have an ir harmony remote which I have configured to use as a mouse with a Intel nuc D54250WYK, I have tested un Windows 10 and it works as expected but in linux the mouse buttons don't work.
I'm using the keymap /lib/udev/rc_keymaps/mce_keyboard.toml, this happens when I press the left button:

688888.335099: lirc protocol(mcir2-mse): scancode = 0x3c
688888.335117: event type EV_MSC(0x04): scancode = 0x3c
688888.335117: event type EV_SYN(0x00).
688888.475123: lirc protocol(mcir2-mse): scancode = 0x3c
688888.475142: event type EV_MSC(0x04): scancode = 0x3c
688888.475142: event type EV_SYN(0x00).

So I added this to the file and reloaded:


[[protocols]]
protocol = "mce_kbd"
[protocols.scancodes]
0x3c = "BTN_LEFT"
0x5a = "BTN_RIGHT"

The output now is:


689080.444492: lirc protocol(mcir2-mse): scancode = 0x3c
689080.444510: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689080.444510: event type EV_MSC(0x04): scancode = 0x3c
689080.444510: event type EV_SYN(0x00).
689080.542540: lirc protocol(mcir2-mse): scancode = 0x3c
689080.542564: event type EV_MSC(0x04): scancode = 0x3c
689080.542564: event type EV_SYN(0x00).
689080.682743: lirc protocol(mcir2-mse): scancode = 0x3c
689080.682760: event type EV_MSC(0x04): scancode = 0x3c
689080.682760: event type EV_SYN(0x00).
689080.945699: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689080.945699: event type EV_SYN(0x00).
689081.073768: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689081.073768: event type EV_SYN(0x00).
689081.201773: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689081.201773: event type EV_SYN(0x00).
689081.329767: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689081.329767: event type EV_SYN(0x00).
689081.457773: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
689081.457773: event type EV_SYN(0x00).

The last two lines keep repeating and the left click don't happens

Please help me with this

Thanks for your attention
