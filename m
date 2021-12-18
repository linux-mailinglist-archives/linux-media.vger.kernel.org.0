Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7A3479C95
	for <lists+linux-media@lfdr.de>; Sat, 18 Dec 2021 21:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhLRUdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Dec 2021 15:33:22 -0500
Received: from mout.gmx.net ([212.227.17.22]:37175 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230130AbhLRUdW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Dec 2021 15:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1639859596;
        bh=gOaQYADC6tt6+rvX0Z9ahWT1hrOnu8U/R9LAjZtHU6Y=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=h/i4APXJjetNjhowWu1YX4+vR9nJ4vGA7o9I1kc4j+M7A5va0FJoIJSTd4wqxLL8S
         9Qe8LGuPY4q05CxikmzKB7ZNucQvNzyXQnU/ts86+L1wdUUxd6oY8s8KJryYrcOBwj
         QU92rpA6wzfR35DqxmBk87n/J/qp6Dfjv19ArXsg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap71.server.lan [172.19.172.171]) (via HTTP); Sat, 18 Dec 2021
 21:33:16 +0100
MIME-Version: 1.0
Message-ID: <trinity-7eee9e9d-525d-4c2b-9346-53f362c89264-1639859596666@3c-app-gmx-bap71>
From:   Robert Schlabbach <Robert.Schlabbach@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     paskripkin@gmail.com, linux-media@vger.kernel.org
Subject: Re: Kernel hangs after DVB patch from July 2021 with Hauppauge
 WinTV dualHD
Content-Type: text/plain; charset=UTF-8
Date:   Sat, 18 Dec 2021 21:33:16 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211218101519.756c027d@coco.lan>
References: <6a72a37b-e972-187d-0322-16336e12bdc5@elbmurf.de>
 <20211218101519.756c027d@coco.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:aC2KnWKUTkTlZ/bNU0Pmf4qNM/Jv/HGCCy+d5MQlmw8B4tjdcBAaDGkbFYzArNyxuHyPS
 A8sN0ihN/HNZNW25y4MyWHlByd4j3oBgWrh6nmxXAoYyBj34AIWMw3BEBqUPQFl0EQZo1RCOUHwD
 b67jxVWcCNoMYEnlLDu1iXeUgI/V4KsNPlPVO3R4x84U0bcF9b2LL0kmXuNd2ipkhIabrwOx1p1n
 JTFZTwb7n9gvd3Os7oBOhSM2eB2eHEm1lfoPfS+8gpu6p3rNqSyFgTYyx020mxymwfoTnNUOc6to
 pQ=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZE1AlyNXG6k=:IK4tyFd964GHrAqxmBA+zC
 Cb+C6aO+lv3Hu7pnqtSQvKMXHojIdDPWwPM3/DxudliC1H9YBO0lvfENkn7wcgZtmSZLw+44H
 vtf+I+y6u05zcfFgWi7A9I/EHWSetEemhO5VursiAiXMzGrs84NpGKoJmwz+EFUw7S7qE5rQa
 JxPwZSHAfOZ8EK3/z2gxWBRpixIpICVADhMUo4FCIUcCPRXIcPAdhuvVgpbVXtqvc3XbwAxLv
 tMWQ9MjF0QsLWpSdyxLnVrfvl54xqHXd5hvEpIDbHASMIE5NPzc27Cr+358dLR5TiYpmVb0vi
 Um5AcGM7nRbtJ6y7n4YIa9qqPKHAQRRwTEr7bB37BPOsFr6RSFudKXxEwiQwmtbEqyyHoqDDt
 ojMQ+hdHZUHelfr1LM9i7cYesG6R6sUJoOn4S+oIZ4Iw1abLT9Dd2cl0VSr7O0e4Inrg29vYo
 480zqe8wTVyjXyyucnZ/F/Ssv6/gsJqsIO9WRmkvKuRoizFlFDAjqP94UxfWQ5Qbu3O/dvbcE
 gTvSdpTVIOyTFXjp+sXmrb4FbsIw/t4KDlJa6QuBMCSD1LrSKtGqVmToU0cNF7BGcuYt99CsX
 Kx63AoByVs1phP20I+XAhJ+NaqoaxczMt5uemV2lJD32CqTa0c4RvCGrZ2V5keejImX9EegYp
 rpp7OjRWMyq5Mx3uuDvSh6qt58Gwrx1D0F+1epWt4CAVi8TZNzUhUCt+tkW/vzDoNxAGsCOqo
 Ze878kmorNgK1X+7dESBugVfUrpnreX08t8+7r2MZj9WzoluL1Rbbk81EeByR2t940hQJALUt
 RF3Kr39
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Such patch should actually be fixing a use-after-free on disconnect.

I wonder if it's the right thing to do, though, because if you look into the em28xx_close_extension() function in em28xx-core.c:

		if (ops->fini) {
			if (dev->dev_next)
				ops->fini(dev->dev_next);
			ops->fini(dev);
		}

So doing this in em28xx_cards.c:

	em28xx_close_extension(dev);

	if (dev->dev_next) {
		em28xx_close_extension(dev->dev_next);
		em28xx_release_resources(dev->dev_next);
	}

will end up calling ops->fini() twice on dev->dev_next, no matter in which order you put the calls.

So it looks prone to double-free, but at least em28xx_dvb_fini() in em28xx_dvb.c guards against that by NULLing the dev->dvb pointer after free and checking the pointer at entry.

Still, there are redundant calls here. I think a decision should be made whether dev->dev_next is taken care of in em28xx-core.c or in em28xx-cards.c, and the code then be made consistent accordingly.

Best Regards,
-Robert Schlabbach
