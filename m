Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443022E0112
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 20:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgLUTeT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 21 Dec 2020 14:34:19 -0500
Received: from mail-oln040092074106.outbound.protection.outlook.com ([40.92.74.106]:24037
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725975AbgLUTeS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 14:34:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fculvkKCNVBPlmSWGbLQ8oWHP9fYC5+Tl+IQcWWY7f/M6mJx/nSVGdZQOnMevj37IQ2TMbI5w7HN/yTU8CMvZlKAvVqaMqziZa2hdENj3uu62sM7uA4YyezWVFAATzMbvtfBkhOGJK54Cc6JjZLlcQ2cDvvA4HCQHnC1bSeDzjcAxZhAM6sN0Byw942YwbtM9KaEJAA1l2iFg5pBIQZXDNwUTB0dHlgZO0trEyE1uoxJbUvrbX1epwcYUGLtRbIi8UsLWMfKAW16Ys57jU8AIOmIec6hoLQTftaGNMgBoavj/r5hSCuGwDZt4iuA0OfmpB9HFSVT5E9uVt6w2gTkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOCIP8/dhIfY5oVSssQ+zryKCiEvWyG5X32j/u1pRT0=;
 b=NmKh+u1uJRRPJPVFHK/Gq47XCs8zitQclwxYYgmpp1njJ7+EC8jA/HORXBbQlU4Dj4WjBTM5sWTGHtX0yomTtIr/yoqU/d0FKD2QslKspyxd51VIS2kH8km3PJPHEY5hxs1BMeZD/TlgUkilVlFqZHj+ThGgaS/Y0mj1awORrLT7UItcnkLE4k6VmszLaRGO8g5ho+byMhguE4IeX7Rx8RqXQewXC9GcOaQKW5jm4Xv45kZ8Eo5HNw/AolZ7zueT4ZyeSAWb0D0S9kj+AoO1jr/jPvZnx2Cj3cKUWw7vH5Jq0UKP6uSTKUz6hMQaLpxDbrVGCdQxyvLbkecrQetJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR04FT019.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::4c) by
 HE1EUR04HT167.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::95)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Mon, 21 Dec
 2020 19:33:29 +0000
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:7e0d::4d)
 by HE1EUR04FT019.mail.protection.outlook.com (2a01:111:e400:7e0d::117) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Mon, 21 Dec 2020 19:33:29 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:14C1297B9C424D445A5BD5CCEE4544695423CAE3FD6E84CFEBD14621E810279E;UpperCasedChecksum:2E99AA48CA5833C830DBC0FEF93A2D87630F943EBD89F8EDA5561ED4F820C052;SizeAsReceived:8881;Count:47
Received: from VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09]) by VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 ([fe80::c1ea:9b6c:f9fe:7d09%9]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:33:29 +0000
Date:   Mon, 21 Dec 2020 13:33:21 -0600
From:   Juan <observer1@hotmail.es>
To:     Sean Young <sean@mess.org>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: Help with harmony remote
Message-ID: <VI1P193MB01608CBDAF9EE16F6CA42CC681C00@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <20201221124009.GA29869@gofer.mess.org>
References: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201218100710.GA29317@gofer.mess.org>
 <VI1P193MB016010B2B176FE481020913881C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201219092703.GA14414@gofer.mess.org>
 <VI1P193MB0160CD42CE45DFEC2361043081C10@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201221124009.GA29869@gofer.mess.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-TMN:  [aHR+qpj1sBsp1do05YKng2QTbxdtPweP]
X-ClientProxiedBy: SN4PR0601CA0003.namprd06.prod.outlook.com
 (2603:10b6:803:2f::13) To VI1P193MB0160.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:c7::8)
X-Microsoft-Original-Message-ID: <20201221133059.3acebe5c@LinAppsSSH.lan>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from LinAppsSSH.lan (187.162.195.22) by SN4PR0601CA0003.namprd06.prod.outlook.com (2603:10b6:803:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 19:33:28 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 512fa8af-2cd0-4ea5-fb99-08d8a5e74b9b
X-MS-TrafficTypeDiagnostic: HE1EUR04HT167:
X-MS-Exchange-MinimumUrlDomainAge: myharmony.com#5952
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JxNsNCiKEHpLbyBmboWZ7CAn8Je7RBVcvwx1WVNGKftaIs/H8yQ8gVDdoVF+BxA0r86/+FSRgALVmQD64tPiPhIAhvSxtnynU9RpvIcrzF2WCodpfNIMBagGo2lNzdnibBVk8l+1lIfKiXCrpveeVqIPInmTe3STFTRv1cb9tBJjcoN2GGrF3HceOJty68WS/wvvPVik7OmBUheFquEOrCd59q5hPjNK5isjqOb0y+f2uToWuUwstAh4IVwnYUMJxX0wN9MNytU1CTcTYqTvqShNId0M/2kfxEV9xeUlJ8=
X-MS-Exchange-AntiSpam-MessageData: cA7OgBSVigK7ZhbC0SRmrrnSYWY+fn74WYJdr20s9s0Ru9W0jgNGmCmEkbkulIZSkixXKaCo6bBM2rqbPOdK64b+3JtrDaahVfY3XYHcRerdNqY3Z/63wrgYD8I51atkQZhdcliFHO/gznRcFjHEDA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:33:29.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 512fa8af-2cd0-4ea5-fb99-08d8a5e74b9b
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT019.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT167
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi
I was using the web client hope this is better

El Mon, 21 Dec 2020 12:40:09 +0000
Sean Young <sean@mess.org> escribió:
> Hi,
> 
> First of all, your email is unreadable. It is very to see what I wrote
> and what you wrote. Please fix this.
> 
> On Sun, Dec 20, 2020 at 07:24:28PM +0000, Jesus wrote:
> > Hi
> > 
> > ________________________________
> > De: Sean Young <sean@mess.org>
> > Enviado: sábado, 19 de diciembre de 2020 9:27
> > Para: Jesus <observer1@hotmail.es>
> > Cc: linux-media@vger.kernel.org <linux-media@vger.kernel.org>
> > Asunto: Re: Help with harmony remote
> > 
> > Hi,
> > 
> > On Sat, Dec 19, 2020 at 01:56:50AM +0000, Jesus wrote:
> > > It's a Universal Harmony 350
> > >
> > > This one:
> > > https://support.myharmony.com/en-us/350
> > > https://assets.logitech.com/assets/54199/gallery-1.png
> > >
> > > It's programable, the remote selected for the mouse is named
> > > Media Center PC SE i believe is the mce, and for the other
> > > functions of the pc part I use a remote named Intel Media Player
> > > I believe is mce too but diferent set of keys selectable I've
> > > managed to make work every button I use in the intel media player
> > > remote, for the Media Center PC SE, I only use the mouse part
> > > thats what I have tested, the mouse movement works, the left and
> > > right click are the ones not working
> > 
> > That's interesting, I did not know there was any other device that
> > generates this IR.
> > 
> > > Some recording of the ir using "ir-ctl -r" would be useful too.
> > >
> > > this is the output for the left click:
> > >
> > > +2800 -200 +300 -300 +300 -250 +300 -300 +600 -600 +300 -400 +200
> > > -350 +300 -200 +350 -300 +300 -300 +600 -300 +300 -600 +300 -250
> > > +400 -200 +400 -200 +400 -250 +350 -300 +300 -400 +200 -300 +300
> > > -300 +300 -300 +300 -300 +300 -300 +300 -300 +350 -250 +350 -300
> > > +600 -250 +350 -350 +250 -300 +300 -600 +350 -250 +350 -75800
> > > +2800 -200 +350 -200 +400 -250 +350 -300 +650 -600 +300 -300 +300
> > > -300 +300 -250 +300 -300 +300 -300 +600 -250 +400 -600 +350 -200
> > > +350 -250 +350 -250 +350 -250 +350 -250 +400 -200 +350 -250 +350
> > > -250 +350 -250 +350 -300 +300 -300 +300 -250 +350 -300 +300 -300
> > > +600 -250 +350 -200 +400 -250 +350 -600 +300 -250 +400 -75800
> > > +2800 -200 +350 -200 +400 -250 +300 -250 +700 -550 +350 -200 +350
> > > -250 +350 -250 +350 -250 +300 -350 +550 -250 +400 -600 +300 -300
> > > +250 -300 +300 -300 +300 -350 +300 -250 +400 -250 +350 -250 +350
> > > -400 +200 -350 +300 -300 +300 -300 +300 -250 +350 -200 +400 -250
> > > +650 -200 +400 -250 +350 -250 +350 -600 +300 -300 +300 # timeout
> > > 101600
> > 
> > Actually, that is the right IR for a left mouse button.
> > 
> > > > 688888.335099: lirc protocol(mcir2-mse): scancode = 0x3c
> > > > 688888.335117: event type EV_MSC(0x04): scancode = 0x3c
> > > > 688888.335117: event type EV_SYN(0x00).
> > > > 688888.475123: lirc protocol(mcir2-mse): scancode = 0x3c
> > > > 688888.475142: event type EV_MSC(0x04): scancode = 0x3c
> > > > 688888.475142: event type EV_SYN(0x00).
> > 
> > This is also the right scancode.
> > 
> > I think something else is going on. Please can you do the following:
> > 
> > echo 'file ir-mce_kbd-decoder.c +p' >
> > /sys/kernel/debug/dynamic_debug/control
> > 
> > Now press the left mouse button and see what there is in dmesg.
> > 
> > I hope it says something like:
> > 
> >         rc rc0: mouse: x = 0, y = 0, btns = L
> > 
> > This is what found in dmesg:
> > 
> > 
> > [754581.285199] rc rc0: started at state 4 (600us space)
> > [754581.285202] rc rc0: started at state 3 (267us space)
> > [754581.285208] rc rc0: started at state 4 (300us pulse)
> > [754581.285211] rc rc0: started at state 3 (0us pulse)
> > [754581.285221] rc rc0: started at state 3 (300us space)
> > [754581.285225] rc rc0: started at state 4 (350us pulse)
> > [754581.285229] rc rc0: started at state 5 (17us pulse)
> > [754581.390933] rc rc0: started at state 5 (101600us space)
> > [754581.390938] rc rc0: mouse data 0x00003c
> > [754581.390941] rc rc0: mouse: x = 0, y = 0, btns = L
> 
> I'm guessing you wrote this last thing, it all has the same quotation
> level.
> 
> So the mouse press is decoded; the issue is in the delivery.
> 
> > Please can you test the following patch.
> > 
> > I applied the patch and this is the output, it didn't worked:
> > 
> > 292.578486: lirc protocol(mcir2-mse): scancode = 0x3c
> > 274.264540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > 274.264540: event type EV_MSC(0x04): scancode = 0x3c
> > 274.264540: event type EV_SYN(0x00).
> > 292.676628: lirc protocol(mcir2-mse): scancode = 0x3c
> > 292.676647: event type EV_MSC(0x04): scancode = 0x3c
> > 292.676647: event type EV_SYN(0x00).
> > 292.816663: lirc protocol(mcir2-mse): scancode = 0x3c
> > 292.816687: event type EV_MSC(0x04): scancode = 0x3c
> > 292.816687: event type EV_SYN(0x00).
> > 293.080537: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > 293.080537: event type EV_SYN(0x00).
> > 293.208540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > 293.208540: event type EV_SYN(0x00).
> > 293.336535: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > 293.336535: event type EV_SYN(0x00).
> > 293.464540: event type EV_KEY(0x01) key_down: BTN_MOUSE(0x0110)
> > 293.464540: event type EV_SYN(0x00).
> 
> This shows that the button press has been decoded, and sent to the
> input layer. Possibly it is being ignored by libinput.

I think is getting to the ui, when i presss the button the real mouse
moves but I can't click on other thing, I suppose is waiting for the
mouse up

> 
> > It didn't change, I'm quite sure I applied the patch correctly, is
> > there a way to know at runtime?
> 
> You can check uname -r, it should the exact commit if you commited
> the patch.

I rebuild a srpm, this what uname  says
5.8.12-200.st.fc32.x86_64
st is what i use to make them diferent

> 
> So how are you loading the mce_keyboard.toml? It should be loaded by
> putting an entry in /etc/rc_maps.cfg

I'm using this command to load:

 ir-keytable -c -p rc6_mce,mce_kbd -w
 /etc/rc_keymaps/mce_keyboard-mouse.toml ; ir-keytable -v -t -p
 rc-5,rc-5-sz,jvc,sony,nec,sanyo,mce_kbd,rc-6,sharp,xmp,mcir2-mse

The real mouse don't click until I load the original file:

ir-keytable -c -p rc6_mce -w /lib/udev/rc_keymaps/mce_keyboard.toml

> 
> Thanks
> 
> Sean

Thanks again

