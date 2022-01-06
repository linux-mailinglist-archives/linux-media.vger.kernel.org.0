Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963854863CE
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 12:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbiAFLlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 06:41:53 -0500
Received: from meesny.iki.fi ([195.140.195.201]:44534 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232322AbiAFLlw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 06:41:52 -0500
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 2520C205BD;
        Thu,  6 Jan 2022 13:41:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641469311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z82fnGiQc7teitub1B5sPV2+eA7bsBaYWT93Eqf37/8=;
        b=xhVXq19ynBMpwqZ1bWmeSLoUYCH9JWQJuMc9WPm761IMECVmsb5RpKmHtBxhN3KPLgTdTd
        agXTd4Hpb3C1VuqNpoUzjSsByeV4Ie7bmm30sg1FY4AppkTq3B38UYqH2vjCkV2ig6jYod
        cVd2BOm1uZp6QoaCf2nGapqGC4rxJPU=
Date:   Thu, 6 Jan 2022 13:41:48 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YdbVfObDZZnFIDc3@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CY09w5fKZ0SZPSAa"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220105095355.GA6428@gofer.mess.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641469310; a=rsa-sha256; cv=none;
        b=HpjecuuV4we4vUkGMA08cQ5gSx7hUnJHo8+AVszOU7aw6kKhOcj5sLLGEcmmU0NkWkVe79
        tmpydguR59FsjS/gg4y9p9l6GJKruHnQRyZmNx2N4gM6NOOnul4PyrSR5KLihdGVv0P+AG
        cfX/aM0RPOG1nXQ9w9tAOHmGhF58mLk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641469310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z82fnGiQc7teitub1B5sPV2+eA7bsBaYWT93Eqf37/8=;
        b=B61ulsOweZ3+zmdf8X662+VOuR6wThjWQH/I54aoQBvicXtEZntgmX+SJ7XITI6gqWOu2D
        NEhOkHaDhDXA5SKXbLKFZSF4s2TSNP96PrZHSx/w2TF0w6aBhvKph8C/3N4Kk4d/iSRKH7
        TNBUCErHeF+806DkE9yG9pt0+0tyNNs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--CY09w5fKZ0SZPSAa
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Wed, Jan 05, 2022 at 09:53:55AM +0000, Sean Young wrote:
>On Tue, Jan 04, 2022 at 06:07:06PM +0200, Marko Mäkelä wrote:
>> I tested once more the stock driver (value=200) with the NEC 
>> protocol.  The GNOME volume control would only react to the initial 
>> press of the button, not on the repeats. Also in ir-keytable -t, I 
>> only see one key_down/key_up followed by LIRC-only messages:
>>
>> 2776.698529: lirc protocol(nec): scancode = 0x1e
>> 2776.698539: event type EV_MSC(0x04): scancode = 0x1e
>> 2776.698539: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>> 2776.698539: event type EV_SYN(0x00).
>> 2776.824077: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
>> 2776.824077: event type EV_SYN(0x00).
>> 2776.909965: lirc protocol(nec): scancode = 0x1e repeat
>> 2776.909973: event type EV_MSC(0x04): scancode = 0x1e
>> 2776.909973: event type EV_SYN(0x00).
>> 2777.121976: lirc protocol(nec): scancode = 0x1e repeat
>> 2777.121983: event type EV_MSC(0x04): scancode = 0x1e
>> 2777.121983: event type EV_SYN(0x00).
>
>Here the is such a delay between the the first message and the repeat,
>that rc-core does not honour the repeat any more.

I repeated the experiment with a stock Debian 5.15.0-2-amd64 kernel 
(based on 5.15.5). First, I checked the RCU with a digital camera.  
Because the blinking of the IR LED appeared a little erratic, I replaced 
the CR2025 cell (voltage=3.25V) with a better one (voltage=3.3V). It got 
brighter and better in the digital viewfinder, but there was no 
improvement for ir-keytable -t:

Testing events. Please, press CTRL-C to abort.
25559.898935: lirc protocol(nec): scancode = 0x1e
25559.898948: event type EV_MSC(0x04): scancode = 0x1e
25559.898948: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
25559.898948: event type EV_SYN(0x00).
25560.024055: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
25560.024055: event type EV_SYN(0x00).
25560.110134: lirc protocol(nec): scancode = 0x1e repeat
25560.110141: event type EV_MSC(0x04): scancode = 0x1e
25560.110141: event type EV_SYN(0x00).
25560.322180: lirc protocol(nec): scancode = 0x1e repeat
25560.322188: event type EV_MSC(0x04): scancode = 0x1e
25560.322188: event type EV_SYN(0x00).
25560.534173: lirc protocol(nec): scancode = 0x1e repeat
25560.534180: event type EV_MSC(0x04): scancode = 0x1e
25560.534180: event type EV_SYN(0x00).
25560.746156: lirc protocol(nec): scancode = 0x1e repeat
25560.746163: event type EV_MSC(0x04): scancode = 0x1e
25560.746163: event type EV_SYN(0x00).
25560.958173: lirc protocol(nec): scancode = 0x1e repeat
25560.958181: event type EV_MSC(0x04): scancode = 0x1e
25560.958181: event type EV_SYN(0x00).
25997.954229: lirc protocol(nec): scancode = 0x1e repeat
25997.954241: event type EV_MSC(0x04): scancode = 0x1e
25997.954241: event type EV_SYN(0x00).
25998.166182: lirc protocol(nec): scancode = 0x1e repeat
25998.166189: event type EV_MSC(0x04): scancode = 0x1e
25998.166189: event type EV_SYN(0x00).

Note the very long delay between 25560 and 25997. For a couple of 
minutes, after I had released the VOL+ button, I did not touch the 
remote control unit. Then I pressed the FULL SCREEN button.

Despite the very long delay, no key_down or key_up event was being 
generated. This would suggest a software bug and not an issue with the 
coin battery voltage dropping too much due to the power draw.

Also, the scancode=0x1e of the VOL+ button appears to be wrongly 
repeated for the FULL SCREEN button. According to the following 
experiment (and the attachment), FULL SCREEN should be scancode=0x40.

>It would be interesting to see the output of usbmon while IR is being 
>received when IR is being dropped

OK, https://docs.kernel.org/usb/usbmon.html was new to me.

I unplugged the device, plugged it in, then started the following and 
started a long press of the FULL SCREEN button:

sudo cat /sys/kernel/debug/usb/usbmon/3u > 3u.out
sudo ir-keytable -t > ir-keytable.out

>and also see if experimenting with removing some entries from 
>refresh_tab makes any difference (just a guess).

Can you give a more specific hint? I am not only a relative kernel 
newbie, but also a USB newbie.

	Marko

--CY09w5fKZ0SZPSAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="3u.out"

ffff8c7d7ce5d980 1465660083 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1465661736 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1465864064 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1465865701 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1466049753 C Ii:3:003:1 0:8 4 = 00010000
ffff8c89c3b34900 1466049775 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466057745 C Ii:3:003:1 0:8 4 = 0002ff00
ffff8c89c3b34900 1466057761 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1466068073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1466069716 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1466105747 C Ii:3:003:1 0:8 4 = 00fe0100
ffff8c89c3b34900 1466105763 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466113741 C Ii:3:003:1 0:8 4 = 00fb0200
ffff8c89c3b34900 1466113756 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466121747 C Ii:3:003:1 0:8 4 = 00f70200
ffff8c89c3b34900 1466121763 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466129744 C Ii:3:003:1 0:8 4 = 00f40100
ffff8c89c3b34900 1466129761 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466137746 C Ii:3:003:1 0:8 4 = 00f00000
ffff8c89c3b34900 1466137762 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466145743 C Ii:3:003:1 0:8 4 = 00f1ff00
ffff8c89c3b34900 1466145759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466153745 C Ii:3:003:1 0:8 4 = 00eefd00
ffff8c89c3b34900 1466153761 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466161744 C Ii:3:003:1 0:8 4 = 00eefc00
ffff8c89c3b34900 1466161760 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466169746 C Ii:3:003:1 0:8 4 = 00f1fd00
ffff8c89c3b34900 1466169762 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466177743 C Ii:3:003:1 0:8 4 = 00f0fc00
ffff8c89c3b34900 1466177759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466185744 C Ii:3:003:1 0:8 4 = 00f2fd00
ffff8c89c3b34900 1466185760 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466193746 C Ii:3:003:1 0:8 4 = 00f4fd00
ffff8c89c3b34900 1466193762 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466201747 C Ii:3:003:1 0:8 4 = 00f4fd00
ffff8c89c3b34900 1466201762 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466209743 C Ii:3:003:1 0:8 4 = 00f6fe00
ffff8c89c3b34900 1466209759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466217740 C Ii:3:003:1 0:8 4 = 00f7fe00
ffff8c89c3b34900 1466217757 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466225743 C Ii:3:003:1 0:8 4 = 00f9fe00
ffff8c89c3b34900 1466225759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466233741 C Ii:3:003:1 0:8 4 = 00fbff00
ffff8c89c3b34900 1466233757 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466241745 C Ii:3:003:1 0:8 4 = 00fc0000
ffff8c89c3b34900 1466241761 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466249746 C Ii:3:003:1 0:8 4 = 00fe0000
ffff8c89c3b34900 1466249762 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1466272073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1466273717 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1466305750 C Ii:3:003:1 0:8 4 = 00ff0000
ffff8c89c3b34900 1466305766 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466313741 C Ii:3:003:1 0:8 4 = 00fe0100
ffff8c89c3b34900 1466313759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466321743 C Ii:3:003:1 0:8 4 = 00fd0000
ffff8c89c3b34900 1466321759 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466329748 C Ii:3:003:1 0:8 4 = 00fd0200
ffff8c89c3b34900 1466329764 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466337744 C Ii:3:003:1 0:8 4 = 00fd0100
ffff8c89c3b34900 1466337761 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466345744 C Ii:3:003:1 0:8 4 = 00ff0100
ffff8c89c3b34900 1466345760 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1466353742 C Ii:3:003:1 0:8 4 = 00ff0100
ffff8c89c3b34900 1466353758 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1466476071 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1466477703 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1466680070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1466681707 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1466884076 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1466885721 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1467088067 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1467089703 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1467292068 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1467293705 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1467496065 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1467497701 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1467700069 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1467701713 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1467904074 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1467905715 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1468108070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1468109719 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1468312075 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1468313713 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1468516073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1468517746 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1468720070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1468721710 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1468924064 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1468925711 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1469128072 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1469129718 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1469332069 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1469333705 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1469536071 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1469537709 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1469740075 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1469741714 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1469944060 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1469945691 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1470148065 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1470149700 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1470352073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1470353705 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1470353724 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1470355376 C Ci:3:006:0 0 1 = 46
ffff8c7d7ce5d980 1470355396 S Ci:3:006:0 s c0 00 fc00 0201 0046 70 <
ffff8c7d7ce5d980 1470357618 C Ci:3:006:0 0 70 = ffb5598c 0b8c0b8c 0b8c0b8c 0b8c0b8d 0a8d0a8d 208d208c 218d208d 208c218d
ffff8c7d7ce5d980 1470357639 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1470359235 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470359255 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1470360851 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470360872 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1470362466 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470564064 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1470565694 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1470565714 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1470567336 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1470567356 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1470569025 C Ci:3:006:0 0 6 = ffb42c8d 7f40
ffff8c7d7ce5d980 1470569045 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1470570644 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470570664 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1470572269 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470572289 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1470573885 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470776070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1470777708 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1470777727 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1470779382 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1470779401 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1470781069 C Ci:3:006:0 0 6 = ffb52b8d 7f40
ffff8c7d7ce5d980 1470781089 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1470782682 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470782702 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1470784297 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470784317 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1470785911 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470988073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1470989711 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1470989729 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1470991364 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1470991385 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1470993062 C Ci:3:006:0 0 6 = ffb42c8c 7f40
ffff8c7d7ce5d980 1470993083 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1470994678 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470994699 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1470996300 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1470996321 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1470997912 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471200070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1471201712 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1471201731 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1471203364 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1471203385 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1471205048 C Ci:3:006:0 0 6 = ffb42c8c 7f40
ffff8c7d7ce5d980 1471205069 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1471206664 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471206684 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1471208276 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471208296 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1471209895 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471412067 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1471413727 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1471413747 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1471415382 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1471415403 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1471417070 C Ci:3:006:0 0 6 = ffb42c8d 7f40
ffff8c7d7ce5d980 1471417091 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1471418693 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471418713 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1471420311 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471420331 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1471421927 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471624070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1471625720 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1471625739 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1471627383 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1471627405 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1471629084 C Ci:3:006:0 0 6 = ffb42c8d 7f40
ffff8c7d7ce5d980 1471629105 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1471630701 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471630721 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1471632320 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471632341 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1471633934 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471836075 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1471837735 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1471837754 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1471839387 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1471839407 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1471841083 C Ci:3:006:0 0 6 = ffb42b8d 7f40
ffff8c7d7ce5d980 1471841103 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1471842697 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471842718 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1471844319 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1471844340 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1471845937 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472048071 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1472049714 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1472049734 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1472051367 C Ci:3:006:0 0 1 = 06
ffff8c7d7ce5d980 1472051388 S Ci:3:006:0 s c0 00 fc00 0201 0006 6 <
ffff8c7d7ce5d980 1472053056 C Ci:3:006:0 0 6 = ffb42b8d 7f40
ffff8c7d7ce5d980 1472053078 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1472054673 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472054695 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1472056295 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472056316 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1472057913 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472260078 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1472261734 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1472261753 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1472263394 C Ci:3:006:0 0 1 = 03
ffff8c7d7ce5d980 1472263415 S Ci:3:006:0 s c0 00 fc00 0201 0003 3 <
ffff8c7d7ce5d980 1472265067 C Ci:3:006:0 0 3 = 8d7f40
ffff8c7d7ce5d980 1472265088 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1472266681 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472266702 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1472268300 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472268321 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1472269915 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472472070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1472473714 C Ci:3:006:0 0 1 = 83
ffff8c7d7ce5d980 1472473734 S Ci:3:006:0 s c0 00 fd0b 0201 0001 1 <
ffff8c7d7ce5d980 1472475383 C Ci:3:006:0 0 1 = 05
ffff8c7d7ce5d980 1472475404 S Ci:3:006:0 s c0 00 fc00 0201 0005 5 <
ffff8c7d7ce5d980 1472477081 C Ci:3:006:0 0 5 = 8a2c8d7f 40
ffff8c7d7ce5d980 1472477102 S Co:3:006:0 s 40 00 fd01 0211 0001 1 = 03
ffff8c7d7ce5d980 1472478698 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472478719 S Co:3:006:0 s 40 00 fd09 0211 0001 1 = 80
ffff8c7d7ce5d980 1472480318 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472480339 S Co:3:006:0 s 40 00 fd02 0211 0001 1 = 80
ffff8c7d7ce5d980 1472481934 C Co:3:006:0 0 1 >
ffff8c7d7ce5d980 1472684073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1472685714 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1472888065 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1472889710 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1472921838 C Ii:3:003:1 0:8 4 = 00020000
ffff8c89c3b34900 1472921857 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472929833 C Ii:3:003:1 0:8 4 = 0004ff00
ffff8c89c3b34900 1472929849 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472937833 C Ii:3:003:1 0:8 4 = 0007fe00
ffff8c89c3b34900 1472937849 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472945835 C Ii:3:003:1 0:8 4 = 0007ff00
ffff8c89c3b34900 1472945851 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472953836 C Ii:3:003:1 0:8 4 = 000afe00
ffff8c89c3b34900 1472953852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472961836 C Ii:3:003:1 0:8 4 = 000cff00
ffff8c89c3b34900 1472961852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472969832 C Ii:3:003:1 0:8 4 = 000b0000
ffff8c89c3b34900 1472969848 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472977832 C Ii:3:003:1 0:8 4 = 000b0000
ffff8c89c3b34900 1472977847 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472985837 C Ii:3:003:1 0:8 4 = 000c0000
ffff8c89c3b34900 1472985852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1472993835 C Ii:3:003:1 0:8 4 = 000e0100
ffff8c89c3b34900 1472993852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473001833 C Ii:3:003:1 0:8 4 = 000d0100
ffff8c89c3b34900 1473001848 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473009833 C Ii:3:003:1 0:8 4 = 000c0100
ffff8c89c3b34900 1473009849 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473017837 C Ii:3:003:1 0:8 4 = 000d0100
ffff8c89c3b34900 1473017853 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473025834 C Ii:3:003:1 0:8 4 = 000b0100
ffff8c89c3b34900 1473025850 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473033830 C Ii:3:003:1 0:8 4 = 000a0000
ffff8c89c3b34900 1473033846 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473041832 C Ii:3:003:1 0:8 4 = 000b0000
ffff8c89c3b34900 1473041848 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473049836 C Ii:3:003:1 0:8 4 = 00090100
ffff8c89c3b34900 1473049854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473057837 C Ii:3:003:1 0:8 4 = 00090000
ffff8c89c3b34900 1473057852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473065842 C Ii:3:003:1 0:8 4 = 00080000
ffff8c89c3b34900 1473065857 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473073827 C Ii:3:003:1 0:8 4 = 00070000
ffff8c89c3b34900 1473073843 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473081836 C Ii:3:003:1 0:8 4 = 00060000
ffff8c89c3b34900 1473081852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473089838 C Ii:3:003:1 0:8 4 = 00050000
ffff8c89c3b34900 1473089854 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1473092073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1473093708 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1473097837 C Ii:3:003:1 0:8 4 = 00040000
ffff8c89c3b34900 1473097852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473105837 C Ii:3:003:1 0:8 4 = 00040000
ffff8c89c3b34900 1473105851 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473113836 C Ii:3:003:1 0:8 4 = 00030000
ffff8c89c3b34900 1473113852 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473121838 C Ii:3:003:1 0:8 4 = 00020000
ffff8c89c3b34900 1473121854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473129837 C Ii:3:003:1 0:8 4 = 0003ff00
ffff8c89c3b34900 1473129854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473137839 C Ii:3:003:1 0:8 4 = 00030000
ffff8c89c3b34900 1473137854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473145835 C Ii:3:003:1 0:8 4 = 00030000
ffff8c89c3b34900 1473145849 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473153842 C Ii:3:003:1 0:8 4 = 00020000
ffff8c89c3b34900 1473153857 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473161838 C Ii:3:003:1 0:8 4 = 00010000
ffff8c89c3b34900 1473161853 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473169838 C Ii:3:003:1 0:8 4 = 00010000
ffff8c89c3b34900 1473169853 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1473296066 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1473297699 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1473393843 C Ii:3:003:1 0:8 4 = 00000100
ffff8c89c3b34900 1473393858 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473401838 C Ii:3:003:1 0:8 4 = 00ff0000
ffff8c89c3b34900 1473401854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473417836 C Ii:3:003:1 0:8 4 = 00000100
ffff8c89c3b34900 1473417852 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1473500070 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1473501702 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1473505841 C Ii:3:003:1 0:8 4 = 00ff0100
ffff8c89c3b34900 1473505858 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473513837 C Ii:3:003:1 0:8 4 = 00ff0100
ffff8c89c3b34900 1473513854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473521842 C Ii:3:003:1 0:8 4 = 00fe0100
ffff8c89c3b34900 1473521859 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473529844 C Ii:3:003:1 0:8 4 = 00fd0100
ffff8c89c3b34900 1473529860 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473537844 C Ii:3:003:1 0:8 4 = 00fd0200
ffff8c89c3b34900 1473537861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473545838 C Ii:3:003:1 0:8 4 = 00fd0100
ffff8c89c3b34900 1473545854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473553838 C Ii:3:003:1 0:8 4 = 00fc0200
ffff8c89c3b34900 1473553854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473561845 C Ii:3:003:1 0:8 4 = 00fd0100
ffff8c89c3b34900 1473561861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473569838 C Ii:3:003:1 0:8 4 = 00fb0100
ffff8c89c3b34900 1473569856 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473577837 C Ii:3:003:1 0:8 4 = 00fb0200
ffff8c89c3b34900 1473577854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473585838 C Ii:3:003:1 0:8 4 = 00fa0100
ffff8c89c3b34900 1473585854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473593838 C Ii:3:003:1 0:8 4 = 00fa0100
ffff8c89c3b34900 1473593855 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473601839 C Ii:3:003:1 0:8 4 = 00f70000
ffff8c89c3b34900 1473601855 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473609841 C Ii:3:003:1 0:8 4 = 00f80200
ffff8c89c3b34900 1473609856 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473617838 C Ii:3:003:1 0:8 4 = 00f70100
ffff8c89c3b34900 1473617854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473625840 C Ii:3:003:1 0:8 4 = 00f60200
ffff8c89c3b34900 1473625856 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473633838 C Ii:3:003:1 0:8 4 = 00f70200
ffff8c89c3b34900 1473633856 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473641842 C Ii:3:003:1 0:8 4 = 00f70300
ffff8c89c3b34900 1473641859 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473649838 C Ii:3:003:1 0:8 4 = 00f90200
ffff8c89c3b34900 1473649854 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473657845 C Ii:3:003:1 0:8 4 = 00fa0100
ffff8c89c3b34900 1473657861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473665840 C Ii:3:003:1 0:8 4 = 00fa0200
ffff8c89c3b34900 1473665856 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473673842 C Ii:3:003:1 0:8 4 = 00fc0100
ffff8c89c3b34900 1473673858 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473681842 C Ii:3:003:1 0:8 4 = 00fb0100
ffff8c89c3b34900 1473681858 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473689809 C Ii:3:003:1 0:8 4 = 00fc0100
ffff8c89c3b34900 1473689824 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473697840 C Ii:3:003:1 0:8 4 = 00fb0100
ffff8c89c3b34900 1473697857 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1473704065 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1473705708 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1473705818 C Ii:3:003:1 0:8 4 = 00f90000
ffff8c89c3b34900 1473705832 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473713840 C Ii:3:003:1 0:8 4 = 00fa0100
ffff8c89c3b34900 1473713857 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473721848 C Ii:3:003:1 0:8 4 = 00f90000
ffff8c89c3b34900 1473721863 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473729843 C Ii:3:003:1 0:8 4 = 00f90100
ffff8c89c3b34900 1473729860 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473737843 C Ii:3:003:1 0:8 4 = 00fa0000
ffff8c89c3b34900 1473737859 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473745843 C Ii:3:003:1 0:8 4 = 00fa0100
ffff8c89c3b34900 1473745859 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473753844 C Ii:3:003:1 0:8 4 = 00fc0000
ffff8c89c3b34900 1473753861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473761846 C Ii:3:003:1 0:8 4 = 00fc0100
ffff8c89c3b34900 1473761862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473769846 C Ii:3:003:1 0:8 4 = 00fd0100
ffff8c89c3b34900 1473769862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473777843 C Ii:3:003:1 0:8 4 = 00ff0100
ffff8c89c3b34900 1473777860 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1473785843 C Ii:3:003:1 0:8 4 = 00ff0000
ffff8c89c3b34900 1473785859 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1473908072 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1473909713 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1474065853 C Ii:3:003:1 0:8 4 = 00000100
ffff8c89c3b34900 1474065870 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474073847 C Ii:3:003:1 0:8 4 = 00010000
ffff8c89c3b34900 1474073863 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474089846 C Ii:3:003:1 0:8 4 = 00020000
ffff8c89c3b34900 1474089862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474097844 C Ii:3:003:1 0:8 4 = 00030100
ffff8c89c3b34900 1474097861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474105844 C Ii:3:003:1 0:8 4 = 00030100
ffff8c89c3b34900 1474105860 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1474112067 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1474113701 C Ci:3:006:0 0 1 = 00
ffff8c89c3b34900 1474113851 C Ii:3:003:1 0:8 4 = 00060200
ffff8c89c3b34900 1474113868 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474121848 C Ii:3:003:1 0:8 4 = 00060200
ffff8c89c3b34900 1474121866 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474129850 C Ii:3:003:1 0:8 4 = 00080200
ffff8c89c3b34900 1474129866 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474137845 C Ii:3:003:1 0:8 4 = 00070200
ffff8c89c3b34900 1474137861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474145848 C Ii:3:003:1 0:8 4 = 000a0200
ffff8c89c3b34900 1474145864 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474153848 C Ii:3:003:1 0:8 4 = 00090100
ffff8c89c3b34900 1474153865 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474161847 C Ii:3:003:1 0:8 4 = 00080200
ffff8c89c3b34900 1474161863 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474169846 C Ii:3:003:1 0:8 4 = 00080100
ffff8c89c3b34900 1474169863 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474177846 C Ii:3:003:1 0:8 4 = 00070100
ffff8c89c3b34900 1474177862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474185845 C Ii:3:003:1 0:8 4 = 00070100
ffff8c89c3b34900 1474185864 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474193845 C Ii:3:003:1 0:8 4 = 00070000
ffff8c89c3b34900 1474193861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474201845 C Ii:3:003:1 0:8 4 = 00060000
ffff8c89c3b34900 1474201862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474209847 C Ii:3:003:1 0:8 4 = 00060100
ffff8c89c3b34900 1474209862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474217846 C Ii:3:003:1 0:8 4 = 00040000
ffff8c89c3b34900 1474217861 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474225846 C Ii:3:003:1 0:8 4 = 00040000
ffff8c89c3b34900 1474225862 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474233848 C Ii:3:003:1 0:8 4 = 00020000
ffff8c89c3b34900 1474233863 S Ii:3:003:1 -115:8 4 <
ffff8c89c3b34900 1474241850 C Ii:3:003:1 0:8 4 = 00010000
ffff8c89c3b34900 1474241865 S Ii:3:003:1 -115:8 4 <
ffff8c7d7ce5d980 1474316071 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1474317703 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1474520072 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1474521709 C Ci:3:006:0 0 1 = 00
ffff8c7d7ce5d980 1474724073 S Ci:3:006:0 s c0 00 fd01 0201 0001 1 <
ffff8c7d7ce5d980 1474725716 C Ci:3:006:0 0 1 = 00

--CY09w5fKZ0SZPSAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ir-keytable.out"

Testing events. Please, press CTRL-C to abort.
26046.362562: lirc protocol(nec): scancode = 0x40
26046.362575: event type EV_MSC(0x04): scancode = 0x40
26046.362575: event type EV_KEY(0x01) key_down: KEY_FULL_SCREEN(0x0174)
26046.362575: event type EV_SYN(0x00).
26046.488063: event type EV_KEY(0x01) key_up: KEY_FULL_SCREEN(0x0174)
26046.488063: event type EV_SYN(0x00).
26046.573953: lirc protocol(nec): scancode = 0x40 repeat
26046.573962: event type EV_MSC(0x04): scancode = 0x40
26046.573962: event type EV_SYN(0x00).
26046.785977: lirc protocol(nec): scancode = 0x40 repeat
26046.785985: event type EV_MSC(0x04): scancode = 0x40
26046.785985: event type EV_SYN(0x00).
26046.997980: lirc protocol(nec): scancode = 0x40 repeat
26046.997988: event type EV_MSC(0x04): scancode = 0x40
26046.997988: event type EV_SYN(0x00).
26047.209964: lirc protocol(nec): scancode = 0x40 repeat
26047.209972: event type EV_MSC(0x04): scancode = 0x40
26047.209972: event type EV_SYN(0x00).
26047.421995: lirc protocol(nec): scancode = 0x40 repeat
26047.422003: event type EV_MSC(0x04): scancode = 0x40
26047.422003: event type EV_SYN(0x00).
26047.634003: lirc protocol(nec): scancode = 0x40 repeat
26047.634011: event type EV_MSC(0x04): scancode = 0x40
26047.634011: event type EV_SYN(0x00).
26047.846005: lirc protocol(nec): scancode = 0x40 repeat
26047.846013: event type EV_MSC(0x04): scancode = 0x40
26047.846013: event type EV_SYN(0x00).
26048.057982: lirc protocol(nec): scancode = 0x40 repeat
26048.057990: event type EV_MSC(0x04): scancode = 0x40
26048.057990: event type EV_SYN(0x00).

--CY09w5fKZ0SZPSAa--
