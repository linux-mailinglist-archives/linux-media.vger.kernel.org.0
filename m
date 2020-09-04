Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8192D25DBED
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 16:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgIDOkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 10:40:08 -0400
Received: from mail-eopbgr00083.outbound.protection.outlook.com ([40.107.0.83]:21061
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730454AbgIDOkD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 10:40:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4IMg45Jc3U8qFFe0gURNnyx07yilTYzvDZEQaDM30Y+7S0AZhraV9/MLh/lpIQu0MPji8JVtSq0lTw1N+Qr9CyRCijVzizU0A2lDt3jIUqBC5a9WksBuLhoPmOp+5hF1u7/D6ukxE2jfRhaONvV2oqPeY3j0uEbP1ErUIXiwQhgdGfAmiDodfZsuub/QQI1WGVQ7Qg0RrFrzMSSy0NG2zN5IaZTzbC7QTn2eXmm77FF9/a9AwW6Tk41Rc+b8ZiM92qVC3kXeGTKpwmnUj7NJYGMO+g4tDRra7sNs5WOt82BOkZMCggcMZlPTGUt1YPfmZ3LIWKGgyG/GuDKpzI0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykyAkax1MI4e6I6wyhG4tlEfkSBiJblrnWPhhXyX6vI=;
 b=lrd9HQee0Y904nuHmqpm8PBzEJX+BUCf3bOonCE5U7l12pv86tBIuL/jnhYNvZw4Da3YRCSM8rvdca5tDv/LZffhpdMfuj5d78/vWQrE2hykePZA20ODLqUMo1UEi84dUm3iA6MLehxoip9YWDjY/z1K/xvjwl1eJZ8Sm4pruYQ6NYl5n7Luz2pO0wmBApn4ha699AExfpbKjmY2Zr6/tUyC78rYMbLo45uECPCOqVjT2oW8BX1wC7i6Z/LsFJU6dcuW7W6VwSwfdwwT6egFZRQyG/c70hpJObbJRjuksvhvp/5NAt3vCyUEa9gERf9bOt2zsDMQDuD2gItflKBVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cgg.com; dmarc=pass action=none header.from=cgg.com; dkim=pass
 header.d=cgg.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cgg.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykyAkax1MI4e6I6wyhG4tlEfkSBiJblrnWPhhXyX6vI=;
 b=YsFbTTSKoDCVIr1FtIYgUVHb77RSgWdHG6+22wJ8YXEkCLQsx+ubQ6LJLSAoG5SQSvL6ZvahFygPvsTWnxB6oamidIg7fEz/Erqq3KB0rSc+TM54hzhlIyNh9t4ZnWqjqoSd5amNGS+DG859+O+UqNTdqJl/rkhb6zX5LiegURn72//vwU11R1Elx12m09WUax1Xzs8P4FbKvwhs1kFriGD8Uq9Ckqoohia3NhSt67PXIhx7tUlQCWPMVnVQVzH8ncVAjGrkeTjSx4gfxRpNm+hRWGm51rvRTKXksAxcE1taBDnI2F778jo0/YpveLCiO0G9cPWSUCBJwt8+m4MdNw==
Received: from AM5P190MB0323.EURP190.PROD.OUTLOOK.COM (2603:10a6:206:20::27)
 by AM5P190MB0308.EURP190.PROD.OUTLOOK.COM (2603:10a6:206:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 4 Sep
 2020 14:39:57 +0000
Received: from AM5P190MB0323.EURP190.PROD.OUTLOOK.COM
 ([fe80::88a0:8d32:809:a224]) by AM5P190MB0323.EURP190.PROD.OUTLOOK.COM
 ([fe80::88a0:8d32:809:a224%5]) with mapi id 15.20.3305.032; Fri, 4 Sep 2020
 14:39:57 +0000
From:   "Pasveer, Ernie" <Ernie.Pasveer@CGG.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "'epasveer@att.net'" <epasveer@att.net>
Subject: Need assistance installing a TV/FM card
Thread-Topic: Need assistance installing a TV/FM card
Thread-Index: AdaCyTcBF5vs8+K3SKC3+Z4U5S0n8w==
Date:   Fri, 4 Sep 2020 14:39:57 +0000
Message-ID: <AM5P190MB0323F3AC73879BD3423A5860EB2D0@AM5P190MB0323.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=CGG.com;
x-originating-ip: [192.159.106.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 891f5976-72c6-48c5-a2c5-08d850e06556
x-ms-traffictypediagnostic: AM5P190MB0308:
x-microsoft-antispam-prvs: <AM5P190MB0308310F5EC1ED6613535916EB2D0@AM5P190MB0308.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ac9eITdn0KyaUvR1fgo5absko0aZLJ/E/xBsP49U7dfQ2Nrk7PzvjmjCz4vV/jkNg5vqZ00ii6j9wNDqXfaK5PZ/PdwCJk+P6ZA8jUrS5Eizs14HWUtmhanyKo2fUrFEg2CM4CvIppSYEhAGNiUoYEUZk84YLY7LM7fHn15VoTF3des2+aCW+imoEK4AfmIAywmWuvmA/fVxb4A1cPDM+zwbMKKnqTIi6cGA4oHdH789oVwm0mJ/u35w5u4fCNFEBHj+Gy5T6xXWRkC1oYsjl2biIsuPT/1lkojWeEgCiNrn7JLlGc0BK+eJFRstAKKEZQDqEH5dduys8W79brEimA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5P190MB0323.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(7696005)(66446008)(64756008)(76116006)(66476007)(66556008)(86362001)(26005)(71200400001)(186003)(6506007)(4326008)(66946007)(83380400001)(8936002)(478600001)(316002)(9686003)(5660300002)(8676002)(55016002)(52536014)(6916009)(2906002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BwMuL4YEdtTOI0jtJh0MSwQoOxlFVnMKMGDP9tRWSl/VxzUhbcymQpIvtTVnvhT2VoNDOgwOL/Zr2LM2BIzusFMuFoL46WPqWhfttMb786qrkTbA7sotiqR/KGcuO9PSHGytAPYy4M4BTfAGwkAjX+QAzMpBcFe84eZYo7CwbJNphgWMcz0gvykfvyldcj5vo3lnKj78M9Wy2RkCCgh0FWDDEpKeL/LnsIyJB+9hweAM6G7eJnaxOwBS7yPsl2eHymcDN8a6tG1m6o6apwRQrJT7GiTM3RiaptO9KyXqM0MfveLKTa1q7NdXL5AFlaMt0UsDioPWp9sMMNAKCl1ZmYksMpvEz2T/aAyeDREudxwOUeyo4F2WS5D26tS/yq321itoiD9YS3KkI7C6sMZwzYfJc6+WivhHq67ASBU25WNhnX9dWy808pvDcHbupet4xkn0V1YtXlmyxrBKLN1yXdMwdTnnPbhNkRFtY5nwDnHyywfy+PrP6aPcZYQXG2NQx4RNdJ38tIoN+xa8/nbiA7CHMqlR0AUbC0Zw/l0lvuNQXTQtcbVMbBq6aGkEr9SyoXCwTNlL/anEx1fXGVuKiIMG9SCAGKopxXAsOUo5bzHHJC1YPVwTBxeY9ZSGBg37P7Hy6N4Smv4MQARVYGbxfg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cgg.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5P190MB0323.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 891f5976-72c6-48c5-a2c5-08d850e06556
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2020 14:39:57.4868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 307ea682-75e1-4701-a114-6c42f9ff0d24
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PE+8+eYAruJx+ckm7Vu3mjbITQ7L4BbUbrKtnltvRMH+2BlKTIU505oC3PzHXfkp6YOuyM+rcKDkBE4f0WInLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5P190MB0308
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I bought this low-cost TV/FM card and it seems my linux box doesn't recogni=
ze it. =20
I'm not sure what bit of info to use to attempt to force it to a specific c=
ard.

Any help would be appreciated.

Here's my info. I can provide an image of the card if needed.

Thanks.

--ernie




OpenSuse 15.2 (Kernel 5.3.18)




erniep@gracie:~$ dmesg | grep saa7134
[   12.004761] saa7134: saa7130/34: v4l2 driver version 0, 2, 17 loaded
[   12.005210] saa7134: saa7134[0]: found at 0000:07:04.0, rev: 1, irq: 16,=
 latency: 64, mmio: 0xf9fffc00
[   12.005217] saa7134: saa7134: Board is currently unknown. You might try =
to use the card=3D<nr>
               saa7134: insmod option to specify which board do you have, b=
ut this is
               saa7134: somewhat risky, as might damage your card. It is be=
tter to ask
               saa7134: for support at linux-media@vger.kernel.org.
               saa7134: The supported cards are:
[   12.005219] saa7134: saa7134:   card=3D0 -> UNKNOWN/GENERIC             =
           =20
    .
    .
    .
[   12.005881] saa7134: saa7134:   card=3D196 -> SnaZio* TVPVR PRO         =
               1779:13cf
[   12.005886] saa7134: saa7134[0]: subsystem: 1131:0000, board: UNKNOWN/GE=
NERIC [card=3D0,autodetected]
[   12.006271] saa7134: saa7134[0]: board init: gpio is 70c000
[   12.112568] saa7134: saa7134[0]: Huh, no eeprom present (err=3D-5)?
[   12.112837] saa7134: saa7134[0]: registered device video0 [v4l2]
[   12.112917] saa7134: saa7134[0]: registered device vbi0
[   12.174607] saa7134_alsa: saa7134 ALSA driver for DMA sound loaded
[   12.174648] saa7134_alsa: saa7134[0]/alsa: saa7134[0] at 0xf9fffc00 irq =
16 registered as card -1
=20
=20
07:04.0 Multimedia controller [0480]: Philips Semiconductors SAA7134/SAA713=
5HL Video Broadcast Decoder [1131:7134] (rev 01)
        Subsystem: Philips Semiconductors SAA713x-based TV tuner card [1131=
:0000]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-=
 Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- =
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64 (3750ns min, 9500ns max)
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f9fffc00 (32-bit, non-prefetchable) [size=3D1K]
        Capabilities: [40] Power Management version 1
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D0mA PME(D0-,D1-,D2=
-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
        Kernel driver in use: saa7134
        Kernel modules: saa7134
00: 31 11 34 71 06 00 90 02 01 00 80 04 00 40 00 00
10: 00 fc ff f9 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 31 11 00 00
30: 00 00 00 00 40 00 00 00 00 00 00 00 0f 01 0f 26
40: 01 00 01 06 00 00 00 00 00 00 00 00 00 00 00 00
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00




--ernie


--ernie

