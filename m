Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9165681DEE
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 23:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjA3WTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 17:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjA3WTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 17:19:44 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1223AB5
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1675117177;
        bh=RTE2O48W47ITrVBrjiGTMpfclWMIAL5Ib3PxhiJ5u7M=;
        h=X-UI-Sender-Class:Date:From:Subject:Cc:To;
        b=QtjlWBKDRNRj1kgR2FapWcD9Fv8lJjAGb9f+g8vZQD8FidvY8zYkTc+BdZ7MiVQo7
         HXIlBb7MZkNfciEDxo/C09YB6wMwiuuWkmhKOaGt8336ea92xxkH2kiTIymrISFkTp
         0Gs7d2Td+QSAjjcJkm4BhnEXR/XZKDtqKQBshJ9Cmxv15s2PiI2heGhkeGqW89HlSR
         j1sfXKqZTun7N10IslJ5AP+k/5k1H42sGubTg1gY6j4E7Q4D/jIEF6KJVvCmmYR/Hf
         CzpHxmqyAgdZZ7gmFv8Bs3d1BJse0duwV8Qk+BErhMz4Gl6gCd0EJgECWqrzPoerII
         DcDvYZoNVdDcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([213.232.102.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9dwj-1obivs2INh-015VtU; Mon, 30
 Jan 2023 23:19:37 +0100
Message-ID: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
Date:   Mon, 30 Jan 2023 23:19:37 +0100
MIME-Version: 1.0
From:   Stefan Herdler <herdler@nurfuerspam.de>
Subject: Future of the SAA7146 drivers
Content-Language: en-US
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Soeren Moch <smoch@web.de>,
        Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c98OmAL3fZWtKaSWwaS2d8iZr1dxmjsjWrAXtAJMsZ4quv2rBc0
 8gx5t7zabcdQ+WQtRsVeryaXIjP3qmFbAgg8CgbaHa77Bj28ulEwZkq9db0woo1hhbh8DpX
 HogZCJ7wTQD346ASinp/rYNN+yx2A2zJbSBkYaJIMm1LAOHb2ZZcPMT3kC03qDQGAmC/Fww
 QROHom/uutFQ6BccDZIGw==
UI-OutboundReport: notjunk:1;M01:P0:a+UdzaBezXY=;f1UGRZYECY3SoEoF2frluvPN+sW
 BJmoCB3X+sow9u0Yl84GQthSXt/QbhZbf+Xx/xnM0pKcNTDxscbiR1fAxauURLb8sP/nXhitb
 HwotDqatTAQivTg1f4bkrpExC/IyR2bpaNzPWkipUAVrjhuXAosafoo5hqu/Ozh95UIyUSp6r
 Hnasa9AGhQJbqjKfdMZEKR56wifWfen23ba0FNjf4DFQEb2yYvIBwaMMWz/9JSfpYtVTkRNVp
 Vj+O+ELC6C7NKNWKhSlT6oQYxvdTDe6m2JwW8/leGY6YZKUaG0wnnPycLAIGl86wvkP02+AAC
 5yBOjQw6Nk+98+8G/+3K6VDRb9SHBpFFur5jNjYcznOt1q+HOh5dyNUGSYDR3/mD98zarthGv
 KHy4O+7E7qDFuFepmYRu8IsCPqf+oD3KSBjq9jzGhtW0qbFTb6qq55fAzQYJ7wzpf5x/VYVlo
 myn5dqE93+zhImFoJg7gwqjb4HoouTz3PBtko2aopUg8eVOxZwLBYPio8ivWewifvda0Uazb4
 nGm2sN/4REj+KesvgUoDfUxogTyBc9g0syjxiSaCVo23iXQ0lQDfYQ8CcpgAcOkLA1COhOg/I
 ijDCkTm8qD1wgPMu12gKmQyDexXc4yvs7eGCeTJ3h7CV5B5wdSQgLerb6QmKsEm3PWXW2h0+N
 w9BUwun97nN27VV1G66cVw0aMyf51Tu2TORtg3KjQwJ1qs+uRASquHoKc+BV6vms2GD1sE2t9
 ugp3MC6hXywt519tv3tg/dVAb+Tn6m0waDCsW2QAyKaF/dgtx0rg4pK80urmOt2d19A/HtIZQ
 YMu0KrFIgAM3W9PtRijNgnu/tGDG1e0DxhL4YqURhFt/lMjUUxpjKwUN7gmlnW3OIzb96mYCS
 +/D+PIgnFfwG/wEQsL9q1DqtDQy8O1VGt1Jc9xoXd5JggAYe0ILpAya7fYObez3F+TCuqtrcF
 by/tIMW0f7preMXUhUWRbHn057A=
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone.

This mail is a little bit long, I'm sorry for that.
But I have to describe the TV-situation in Germany roughly. Without that
knowledge it is definitely not understandable why this DVB-S cards are
still very useful here.
Reader familiar with this crazy situation may proceed to the driver
section below.

I'm primary a user of this cards but have profound knowledge about the
Hardware. I used to repair the cards for me and other users back then.

I own Fullfeatured and Budget-cards and use them daily in my VDR-System.
In Germany many channels are free-to-air in the DVB-S version only. I
would like to use these cards for a few more years until DVB-S is
deactivated or the HD-Versions of the channels become free-to-air.
I'm not willing to pay 75 Euro a year for TV-commercials in HD and I'm
not the only one with this opinion.
14 million of the 17 million satelite-tv-households in Germany watch
this channels in SD-quality only (~82%)![1]
In addition uses the encrypting-system a proprietary CAM extension which
makes it impossible to watch this channels on a HTPC legally.
This situation won't change until 2025 (by a kind of law!). What then
happens is currently completely uncertain.


The driver topic however is new to me, the cards where always working
out of the box. I noticed the upcoming removal right before my first mail.

Honestly I was a little shocked that the driver may be removed from Kernel=
.

The card may be old and not produced any more, but they are not rare and
easily obtainable second hand. There are always multiple offers for
reasonable prices on the common platforms.
And the cards are running flawless on current mainboards with PCIe-PCI
Bridge.

There must be a lot of SAA7146 based cards been sold in Europe. Many
brands sold them, mostly rebranded Technotrend cards.
Even Hauppauge, the most important brand, sold the TT-Budged as "Nova"
and the Fullfeatured as "Nexus" for years. Their own Connexant based
designs came pretty late, short before the PCIe-cards.

I carefully estimate, at least 50% of all PCI-DVB-cards sold in Europe
where SAA7146 based.
There must be still a number of users out there.

The relevance of SAA7146 for PCI-DVB-cards is almost like the Bttv-Chips
for analog TV a few years before. At least in Europe.
And the bttv driver not deprecated despite older and using videobuf1 API!


SAA7146 driver
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I've read a lot in the last days and the main issue with the SAA7146
driver seems to be the missing maintainer.
All other issues seem to be a result of that.
Right?

And the driver desperately needs someone with expertise about the cards
and the driver.
I've spotted a big chunk of unused code just by knowing which cards have
been build and which not.

S=C3=B6ren Moch offered to maintain the complete SAA7146 driver in the
VDRportal and in this list too. This offer includes the videobuf2
conversion too.
On condition that the support of the fullfeatured cards stays in the
kernel.
I understand that. He only owns fullfeatured cards.
And I am interested in keeping my fullfeatured cards operational too.

I'm convinced S=C3=B6ren could handle the driver well and he is the only o=
ne
I know who probably could do that. And he is actively offering to do the
job.


That leads to the DVB-API part for the AV7110 which should be removed.

An API conversion for the AV7110 does not make sense any more. 10 years
ago maybe, but not now.
Working software would be broken and there will be no benefit for the
user at all.

Converting is however not easy and a driver specific UAPI would be
necessary in any case.
The ioctl "VIDEO_SELECT_SOURCE" needed and definitely missing in the
V4l2-API (see ivtv driver).
The OSD of the FF-Cards is more canvas like, not a framebuffer. The OSD
ioctl are also needed and I haven't found anything in V4l2-API to
replace them.

What about putting the 3 API-files into one driver specific UAPI file?
The deprecated DVB-API part could be officially removed and the
maintainer of the av7110 driver would become responsible for the API.
Could that be an acceptable solution for everybody?
Or do the ~10Kb of possible redundancy in the header hurt so much?


The further deferring of the removal by a few years would be a kind of
solution for me too.
But I don't think it's a good one.


Any other ideas?


As a pragmatic user I'm interested in a solution to keep my cards running.
Probably finding a compromise all parties can live with.
I'm not interested in a lengthy discussion about APIs leading to nowhere.

Regards
Stefan



1.
https://www.dwdl.de/magazin/88023/sdrepublik_deutschland_privatsender_mit_=
hdstrategie_gescheitert/?
In German only, sorry.
