Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785B9683AC4
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 00:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjAaX4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 18:56:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbjAaX4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 18:56:23 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA2A1F5D8
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1675209371;
        bh=r23dkWZUrA1kSy+h/h/JXNvvj93xvyvC1gwJxngI6Ck=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=QhIh9e2KZdWeMPaCFL71eDO/eUlsDZ9vbwEhH5KPIoiZlN8GdB/6lzjTWHCVGgbxE
         kWtTfbkAiCWuhDNLEv31PnP8f8xp3WSjw5IHrI6TfvHLS7aB5CTMYT/BL4tHh6nfhk
         xln9ubDiK9UBLOVCSCkc+s5J1cBkJJsp8notD0IAM81a1b2wMg+kC+vQaN718YddnT
         y6VEllcakP5m9MI/rojROdFTtgCkbiin7qHYa/geZM4VDgvK17sBQgCHbtnRy3deVt
         DRlXbNt++tDuNBZL2AXXoTSckq60dlZQBJRbeiIg65SSNfTx+nHQLgwSa1vDoh+WjO
         EvCFEEVmNL3ag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.181.11]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1ofSDh1hTu-010Idb; Wed, 01
 Feb 2023 00:56:11 +0100
Message-ID: <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
Date:   Wed, 1 Feb 2023 00:56:11 +0100
MIME-Version: 1.0
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Soeren Moch <smoch@web.de>, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:22kegexsAF9/xlxrns3mbXxhrh+gYJxJaGGanK94GYdZdhon/4p
 yRBNw0Um4CpzknRrUGHauiLLE5wXqGqlBOhrkPA/myPBK78Fxm5czfCi5S4r7i0ZJ5e3cie
 w2ED2LJHW2nCd3WF2vJV/7WGjde4UnFQP2MZH98soB5pWBsconzcNglM7zJTGaKlLcclm21
 NpVRHeb0/8AFOybQS+sUQ==
UI-OutboundReport: notjunk:1;M01:P0:VtNvWSaV0T4=;EDXbkaISPS068zlQoNeEd9rKhfA
 01YBcKtCO6x2lUIanWCJEL/TBj9A2j1LmJnXAsn99VTIXqS6V8dHAltlNDEGYq29vPwwNJVym
 yNT4pCXHuLYoVGqFRs7ezcubJHv5EjLflk9bGFYpCERLgQ2EB2yI0sz26/qlK5iD3bN0QefE1
 1nKRVFUr8rI5nDJcLg7f9jQ6FBiQwqlsGoF+btD70QsRGE81EYUx61WJLQEBGiU4GV3MFU2Oa
 KczC0zkHPxg9PU6Q21i3gIUOvxZA9SFY49R9IuyGAXWErzVCr2ZK1hfDfbIlyR6Nr5ZizgpW4
 oPPaznwAtZmSv/KvxdiuA7c09vNeOv5qm23X+OuYcOow1LiPu8KLZCokz0SBg6cEwMIXByV1j
 KvdHZmpkbeOtzUltf21kXQpcJUUaBgNsganxkRJ5cgUQSnFXb+HDjk7I46Zeg49Di5UtXz41D
 rW1p9/ME6sXD/KCAJ/SZ3BknRU2VbHRD3D1dmff8Pjwl80vscMZgnxXTLIe990UOwuYDa310s
 QGkrJaicasOUjtYP5WHbzjHnqUkS2zkAPkKQ36Te4dXG/OyV8rm/gyGEelVYhaIXPu6IHITk2
 hVfs0Q3rIX+Vdp5735Q+RftVXkuXAQWn4U06kE2NY0Ohu+XhaLVdh/8A6oe8cDfik/GJr6XxU
 Ld9JXuady+WW6kXHZ0OlyTeuTkuAoFyTahls9JHkQGwbcIa67x06a8n2FrONcL4lQUt0Ay6AM
 xMFqXHcpeLJpNKstupzVt3VPwxiKXHBY0Q8vFI9pVk6+xKLqsMJulhGVg3L+XnSOgwAto8t1D
 R0HS5e6UtbT1D7NSMYQYYjafste4uVgW2FrdlymKIW5JkMk8kGjgcQP4aWMEv1d1Rq9VBOdZn
 AHBpwsMaH3GnVAhqeAQMAbI/jir2yPc7HVgCC8l94KTvuBYlg5hZw8TqA4v1+kEMH4BxDdjwG
 JA1UcdwiIYEfeEpQMjQJTpC9I88=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

I'm glad to read that at least the saa7146 driver won't be removed
completely.


On 31/01/23 09:45, Hans Verkuil wrote:
> Hi Stefan,
>
> On 30/01/2023 23:19, Stefan Herdler wrote:
>> Hello everyone.
>>
>> This mail is a little bit long, I'm sorry for that.
>> But I have to describe the TV-situation in Germany roughly. Without tha=
t
>> knowledge it is definitely not understandable why this DVB-S cards are
>> still very useful here.
>> Reader familiar with this crazy situation may proceed to the driver
>> section below.
>>
>> I'm primary a user of this cards but have profound knowledge about the
>> Hardware. I used to repair the cards for me and other users back then.
>>
>> I own Fullfeatured and Budget-cards and use them daily in my VDR-System=
.
>> In Germany many channels are free-to-air in the DVB-S version only. I
>> would like to use these cards for a few more years until DVB-S is
>> deactivated or the HD-Versions of the channels become free-to-air.
>> I'm not willing to pay 75 Euro a year for TV-commercials in HD and I'm
>> not the only one with this opinion.
>> 14 million of the 17 million satelite-tv-households in Germany watch
>> this channels in SD-quality only (~82%)![1]
>> In addition uses the encrypting-system a proprietary CAM extension whic=
h
>> makes it impossible to watch this channels on a HTPC legally.
>> This situation won't change until 2025 (by a kind of law!). What then
>> happens is currently completely uncertain.
>>
>>
>> The driver topic however is new to me, the cards where always working
>> out of the box. I noticed the upcoming removal right before my first ma=
il.
>>
>> Honestly I was a little shocked that the driver may be removed from Ker=
nel.
>
> Don't worry, the saa7146 driver won't be removed. I admit that that was
> my initial plan, but you are not the only one who contacted me to let me
> know that the DVB functionality is still in use. I had not expected that
> for such old hardware, but it is clear that this driver can't be removed=
.
>
>> The card may be old and not produced any more, but they are not rare an=
d
>> easily obtainable second hand. There are always multiple offers for
>> reasonable prices on the common platforms.
>> And the cards are running flawless on current mainboards with PCIe-PCI
>> Bridge.
>>
>> There must be a lot of SAA7146 based cards been sold in Europe. Many
>> brands sold them, mostly rebranded Technotrend cards.
>> Even Hauppauge, the most important brand, sold the TT-Budged as "Nova"
>> and the Fullfeatured as "Nexus" for years. Their own Connexant based
>> designs came pretty late, short before the PCIe-cards.
>>
>> I carefully estimate, at least 50% of all PCI-DVB-cards sold in Europe
>> where SAA7146 based.
>> There must be still a number of users out there.
>>
>> The relevance of SAA7146 for PCI-DVB-cards is almost like the Bttv-Chip=
s
>> for analog TV a few years before. At least in Europe.
>> And the bttv driver not deprecated despite older and using videobuf1 AP=
I!
>
> The underlying reason for deprecating this driver in the first place was
> the use of the old videobuf framework for analog TV in this driver: we
> want to get rid of that, either by removing such drivers, or converting
> it to vb2 (we plan to do that for bttv and cx18). For the saa7146 there
> is another option: dropping the analog TV support only.
>
>>
>>
>> SAA7146 driver
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> I've read a lot in the last days and the main issue with the SAA7146
>> driver seems to be the missing maintainer.
>> All other issues seem to be a result of that.
>> Right?
>
> Right. I'm on record as the maintainer, but I really don't have the time
> to do a substantial job like the vb2 conversion.
>
>> And the driver desperately needs someone with expertise about the cards
>> and the driver.
>> I've spotted a big chunk of unused code just by knowing which cards hav=
e
>> been build and which not.
>>
>> S=C3=B6ren Moch offered to maintain the complete SAA7146 driver in the
>> VDRportal and in this list too. This offer includes the videobuf2
>> conversion too.
>> On condition that the support of the fullfeatured cards stays in the
>> kernel.
>> I understand that. He only owns fullfeatured cards.
>> And I am interested in keeping my fullfeatured cards operational too.
>>
>> I'm convinced S=C3=B6ren could handle the driver well and he is the onl=
y one
>> I know who probably could do that. And he is actively offering to do th=
e
>> job.
>
> Honestly, that would be great. We really need to get rid of the old vide=
obuf
> framework, it is awful. I found someone to do the bttv conversion, and I=
 plan
> to do the cx18 conversion. So that leaves the saa7146: it's either conve=
rted
> to vb2, or analog video support (that's the part that uses videobuf) has=
 to
> be removed.
>
> Obviously, if someone wants to do the vb2 conversion, then that would be
> perfect. I was looking at removing analog video support, and that doesn'=
t
> look as easy as I thought it would be.
>
The SAA7146 driver suite is a kind of beast ;-).

I guess it is mainly caused by the DVB-C Budget-Cards.
There are some having analog support too.

> I can certainly advice how to go about converting to vb2 as I've done it=
 a
> few times in the past. It's rather painful, mostly because it is a 'big =
bang'
> change: it ends up as a single large and mostly unreviewable patch.
>
Indeed, I've searched for some patches and all are huge.
I have some basic C knowledge, but no experience with kerneldrivers nor
vb1 nor vb2. Unfortunately such a conversion would be out of scope for
me. At least if it should be done in a reasonable time frame.

S=C3=B6ren wrote the conversion would't be a big deal for him and it would=
 be
done within a few weeks.

>>
>>
>> That leads to the DVB-API part for the AV7110 which should be removed.
>>
>> An API conversion for the AV7110 does not make sense any more. 10 years
>> ago maybe, but not now.
>> Working software would be broken and there will be no benefit for the
>> user at all.
>>
>> Converting is however not easy and a driver specific UAPI would be
>> necessary in any case.
>> The ioctl "VIDEO_SELECT_SOURCE" needed and definitely missing in the
>> V4l2-API (see ivtv driver).
>> The OSD of the FF-Cards is more canvas like, not a framebuffer. The OSD
>> ioctl are also needed and I haven't found anything in V4l2-API to
>> replace them.
>>
>> What about putting the 3 API-files into one driver specific UAPI file?
>> The deprecated DVB-API part could be officially removed and the
>> maintainer of the av7110 driver would become responsible for the API.
>> Could that be an acceptable solution for everybody?
>> Or do the ~10Kb of possible redundancy in the header hurt so much?
>
> I think this can be something that can be discussed later. It's not my
> main concern and not the reason why I originally planned to remove the
> driver. The use of videobuf is the main problem.
>
> If S=C3=B6ren wants to become an active maintainer for this driver, then=
 the
> vb2 conversion would be the first step. But there is a lot more that can
> be done, I'm sure.
>
Yes he wants, that is his offer to the VDR-community.

He just wants a kind of guarantee, that the driver for the fullfeatured
cards he owns stays in the kernel.
That is understandable for me, he would do the job voluntary without
been payed.

There is a long lasting controversy about the deprecated 3 DVB-API-files
for the av7110 driver.
S=C3=B6ren stated he is tired about that discussions and looking for
permanent solution without having to rewrite the whole driver.

In this case I'm just the messenger, but I would also prefer a permanent
solution.
That is why I made the suggestion with the driver specific UAPI file.
The av7110 driver is only driver using this API-part.
And the modification is fairly easy and the impact minimal.



May that be a compromise all parties can live with?

Regards,
Stefan




>>
>>
>> The further deferring of the removal by a few years would be a kind of
>> solution for me too.
>> But I don't think it's a good one.
>>
>>
>> Any other ideas?
>>
>>
>> As a pragmatic user I'm interested in a solution to keep my cards runni=
ng.
>> Probably finding a compromise all parties can live with.
>> I'm not interested in a lengthy discussion about APIs leading to nowher=
e.
>
> Me neither.
>
> Right now there are two options:
>
> 1) removal of the analog video support, keeping DVB support
>
> 2) convert the driver to vb2
>
> If S=C3=B6ren steps up as the new maintainer and does the vb2 conversion=
, then
> that would be the best solution. If nobody steps in, then I will most li=
kely
> choose option 1 in a few months.
>
> Regards,
>
> 	Hans
