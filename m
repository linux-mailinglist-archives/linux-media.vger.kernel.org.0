Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D274686577
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 12:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjBALgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 06:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjBALgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 06:36:07 -0500
Received: from mout.web.de (mout.web.de [212.227.15.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70574B18A
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 03:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1675251357; bh=fsOqKtD/6VUTIowiagn42cA7p9z3XD+OVNYEwXt02hk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hBbRJfRcH6/vrVXFgxWtyh6vK4N1dUQgAsyLmdt6DsXPt57J1htax1mvqRHs6Orz9
         YpbgDauwheAq/fHXkOMuD7au649n6QHsGXCRICEUBeAPsA1HyhxCpxqEKYOi3VKyFm
         YOGGZGOwhN9p+dG6DyrOPWkC1OGZxVEbf1gqErT5lVRdpXawzOWfnVpatgPm2NS9ae
         /RJTqer4O/0jH1D6vEeUKTlGp+S0kPnZ6NQVIQkmdas56weJoipVJMmNxX3HT8b8/H
         /U/xlmXzIgcrSu0oeClq+VMnXGGhdWFbyJNh7cXNlXFFULiK4vGCA5QvVlrXfXb4vQ
         fa6SkajQ2SPOA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.40] ([89.12.34.136]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKMA7-1p47us1rId-00Lqlh; Wed, 01
 Feb 2023 12:35:57 +0100
Message-ID: <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
Date:   Wed, 1 Feb 2023 12:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
From:   Soeren Moch <smoch@web.de>
In-Reply-To: <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mgxbldINoQIwt6uxMlufPD+0xawcG9Gdbuk3eTGC4p7kPtCudJY
 wampwVRukOcWQ7PdBQ8w/1ZBEt/GbzeoYnVyKf2NLlIAT30uEJm613Vs5W0E1sjfOkkXaLC
 WKITKBzwexpEYaijdVdUDUj/Z5VT9CVp79wpeQcdSWxgmpdU1y2xAikeDkGgIkmlh/Wweuk
 7q+N+AQ5Y66Fdizo8l3sw==
UI-OutboundReport: notjunk:1;M01:P0:xH4AIEUT4yg=;uuPsCQNQXBbILbIyjyAXGl7TXjS
 917z3grCTbtXT5dsdhFGGuShxsI+kyMazh+N13d31Lh2juZBxuzdfU9R/ewaUCGRG9EgZjvEp
 15rfOj/RQdSsmMg2w6oouiRx6wT4guw44R5j2adwc3LrNLu+xe2gAmhMfGZ+mM+8+7s7wEfU0
 eluNeAEMmuNI7cY3UwvvLr1DwmGkz6Rrmowoe4E0udbRpOFs9yhMIdi3z0sZG3Pkga/b3HPwl
 gfDhzq2lHQ0CzQwQ1sKDIJ2yV2O4/kViCqKPFukzbMJbFmTJ7/tiYFRvyeOZHIHm0Gmz2Uafw
 KVar6aU64Ojg+JDu4z6M5EbHZigP1E8UgdxLwAhrwviIu9mQJMBNTWuSelE4THAj5HDHruMdg
 cVvv/iSjN2Gn1TlEICZHquNnq8aeAXdJbY6xOqw+P20iAEuPs5nXKa90A0KXEavx7keKGQZrt
 BMCp9vj8CLJtjRavXUbB/xPfonzFoO7d+Sd2sFR9KaiSZ+crRjsejuqp3C/d72ZvJYa/s9RJG
 Mf7NIXQfLtqTOlWr7yqRfAstLNq9WYgsARTuZYGs+GzLaKF+V8MsZwPbPXHV3somJpHV6rQWI
 rT/caZLCk7dxmyo2/xBdZLT/wY2ssb6aCS/+Cwn4LJuqDJyRCuvAgD1wfX3rvbezNbboTQdwB
 xjfYWtogTlvR889wwpe1qtQpX/2gDCLOo0jf61G85HWGUMfP6dkS83F4dJf8/Z2q1o4Mbge9q
 l6a8TNiv8naalwWSuf+a8ITako9EqAbhVm/h6roTRoCDzO1KoqF+U20olhooNaMUYGzXgzQKy
 9Nz9qLbrDvFqjGeLsIDynyGZvkmUhnrHzTaK4lpaf4YpljxG5bVc6MfIhPIoSDKhu1UODDwhz
 FYf565RkDmGgCZCnQgokzv6jU08p3Ed0U0fSCyBkX5+//bb+gc7TH8ig7FWmeVyf5ZrcSuTs1
 BzM8kmqoQiH2i/KmEZN5PwWHjWw=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Stefan, all,

On 01.02.23 10:15, Hans Verkuil wrote:
> Hi Stefan, S=C3=B6ren,
>
> On 01/02/2023 00:56, Stefan Herdler wrote:
>> Hello Hans,
>>
>> I'm glad to read that at least the saa7146 driver won't be removed
>> completely.
>>
>>
>> On 31/01/23 09:45, Hans Verkuil wrote:
>>> Hi Stefan,
>>>
>>> On 30/01/2023 23:19, Stefan Herdler wrote:
>>>> Hello everyone.
>>>>
>>>> This mail is a little bit long, I'm sorry for that.
>>>> But I have to describe the TV-situation in Germany roughly. Without t=
hat
>>>> knowledge it is definitely not understandable why this DVB-S cards ar=
e
>>>> still very useful here.
>>>> Reader familiar with this crazy situation may proceed to the driver
>>>> section below.
>>>>
>>>> I'm primary a user of this cards but have profound knowledge about th=
e
>>>> Hardware. I used to repair the cards for me and other users back then=
.
>>>>
>>>> I own Fullfeatured and Budget-cards and use them daily in my VDR-Syst=
em.
>>>> In Germany many channels are free-to-air in the DVB-S version only. I
>>>> would like to use these cards for a few more years until DVB-S is
>>>> deactivated or the HD-Versions of the channels become free-to-air.
>>>> I'm not willing to pay 75 Euro a year for TV-commercials in HD and I'=
m
>>>> not the only one with this opinion.
>>>> 14 million of the 17 million satelite-tv-households in Germany watch
>>>> this channels in SD-quality only (~82%)![1]
>>>> In addition uses the encrypting-system a proprietary CAM extension wh=
ich
>>>> makes it impossible to watch this channels on a HTPC legally.
>>>> This situation won't change until 2025 (by a kind of law!). What then
>>>> happens is currently completely uncertain.
>>>>
>>>>
>>>> The driver topic however is new to me, the cards where always working
>>>> out of the box. I noticed the upcoming removal right before my first =
mail.
>>>>
>>>> Honestly I was a little shocked that the driver may be removed from K=
ernel.
>>> Don't worry, the saa7146 driver won't be removed. I admit that that wa=
s
>>> my initial plan, but you are not the only one who contacted me to let =
me
>>> know that the DVB functionality is still in use. I had not expected th=
at
>>> for such old hardware, but it is clear that this driver can't be remov=
ed.
I'm glad to read this.
>>>> The card may be old and not produced any more, but they are not rare =
and
>>>> easily obtainable second hand. There are always multiple offers for
>>>> reasonable prices on the common platforms.
>>>> And the cards are running flawless on current mainboards with PCIe-PC=
I
>>>> Bridge.
>>>>
>>>> There must be a lot of SAA7146 based cards been sold in Europe. Many
>>>> brands sold them, mostly rebranded Technotrend cards.
>>>> Even Hauppauge, the most important brand, sold the TT-Budged as "Nova=
"
>>>> and the Fullfeatured as "Nexus" for years. Their own Connexant based
>>>> designs came pretty late, short before the PCIe-cards.
>>>>
>>>> I carefully estimate, at least 50% of all PCI-DVB-cards sold in Europ=
e
>>>> where SAA7146 based.
>>>> There must be still a number of users out there.
>>>>
>>>> The relevance of SAA7146 for PCI-DVB-cards is almost like the Bttv-Ch=
ips
>>>> for analog TV a few years before. At least in Europe.
>>>> And the bttv driver not deprecated despite older and using videobuf1 =
API!
>>> The underlying reason for deprecating this driver in the first place w=
as
>>> the use of the old videobuf framework for analog TV in this driver: we
>>> want to get rid of that, either by removing such drivers, or convertin=
g
>>> it to vb2 (we plan to do that for bttv and cx18). For the saa7146 ther=
e
>>> is another option: dropping the analog TV support only.
I totally agree to the vb2 conversion and would be happy to help with that=
.
>>>>
>>>> SAA7146 driver
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>> I've read a lot in the last days and the main issue with the SAA7146
>>>> driver seems to be the missing maintainer.
>>>> All other issues seem to be a result of that.
>>>> Right?
>>> Right. I'm on record as the maintainer, but I really don't have the ti=
me
>>> to do a substantial job like the vb2 conversion.
As hobbyist linux developer I also have not much time for this driver
work. Nevertheless, I want to keep the DVB full-featured cards alive and
I would spend some time on that.
>>>> And the driver desperately needs someone with expertise about the car=
ds
>>>> and the driver.
>>>> I've spotted a big chunk of unused code just by knowing which cards h=
ave
>>>> been build and which not.
Maybe we should start to remove all the unused code. With luck there is
not much left for conversion.
>>>> S=C3=B6ren Moch offered to maintain the complete SAA7146 driver in th=
e
>>>> VDRportal and in this list too. This offer includes the videobuf2
>>>> conversion too.
>>>> On condition that the support of the fullfeatured cards stays in the
>>>> kernel.
>>>> I understand that. He only owns fullfeatured cards.
>>>> And I am interested in keeping my fullfeatured cards operational too.
>>>>
>>>> I'm convinced S=C3=B6ren could handle the driver well and he is the o=
nly one
>>>> I know who probably could do that. And he is actively offering to do =
the
>>>> job.
>>> Honestly, that would be great. We really need to get rid of the old vi=
deobuf
>>> framework, it is awful. I found someone to do the bttv conversion, and=
 I plan
>>> to do the cx18 conversion. So that leaves the saa7146: it's either con=
verted
>>> to vb2, or analog video support (that's the part that uses videobuf) h=
as to
>>> be removed.
>>>
>>> Obviously, if someone wants to do the vb2 conversion, then that would =
be
>>> perfect. I was looking at removing analog video support, and that does=
n't
>>> look as easy as I thought it would be.
>>>
I only own full-featured (Nexus) cards, modified to also support a mode
of operation like budget cards. In full-featured cards there is a
possibility to re-read the decoded video output signal back, which could
be similar to how analog cards work. But I never had access to
analog/hybrid saa7146 cards, so I'm not sure I can test this mode. I
also don't know anybody with such card who could help testing.
I personally do not care much about analog card support in the driver,
but will at least check which part of analog functionality is used in
full-featured cards. Maybe the support for analog/hybrid cards and some
test coverage comes for free with full support for full-featured cards.
>> The SAA7146 driver suite is a kind of beast ;-).
>>
>> I guess it is mainly caused by the DVB-C Budget-Cards.
>> There are some having analog support too.
>>
>>> I can certainly advice how to go about converting to vb2 as I've done =
it a
>>> few times in the past. It's rather painful, mostly because it is a 'bi=
g bang'
>>> change: it ends up as a single large and mostly unreviewable patch.
OK, thanks.
>> Indeed, I've searched for some patches and all are huge.
>> I have some basic C knowledge, but no experience with kerneldrivers nor
>> vb1 nor vb2. Unfortunately such a conversion would be out of scope for
>> me. At least if it should be done in a reasonable time frame.
>>
>> S=C3=B6ren wrote the conversion would't be a big deal for him and it wo=
uld be
>> done within a few weeks.
>>
>>>>
>>>> That leads to the DVB-API part for the AV7110 which should be removed=
.
>>>>
>>>> An API conversion for the AV7110 does not make sense any more. 10 yea=
rs
>>>> ago maybe, but not now.
>>>> Working software would be broken and there will be no benefit for the
>>>> user at all.
>>>>
>>>> Converting is however not easy and a driver specific UAPI would be
>>>> necessary in any case.
>>>> The ioctl "VIDEO_SELECT_SOURCE" needed and definitely missing in the
>>>> V4l2-API (see ivtv driver).
>>>> The OSD of the FF-Cards is more canvas like, not a framebuffer. The O=
SD
>>>> ioctl are also needed and I haven't found anything in V4l2-API to
>>>> replace them.
>>>>
>>>> What about putting the 3 API-files into one driver specific UAPI file=
?
>>>> The deprecated DVB-API part could be officially removed and the
>>>> maintainer of the av7110 driver would become responsible for the API.
>>>> Could that be an acceptable solution for everybody?
>>>> Or do the ~10Kb of possible redundancy in the header hurt so much?
>>> I think this can be something that can be discussed later. It's not my
>>> main concern and not the reason why I originally planned to remove the
>>> driver. The use of videobuf is the main problem.
As already explained, my main concern are full-featured cards. With all
the required conversions for these cards done, also budget cards and
maybe analog/hybrid cards can be supported. If (full) analog support is
not testable, I also would take care of removing the remaining old
videobuf code.

But, all this only makes sense to me when full-featured cards and the
output part of the DVB API remain supported in mainline.
>>> If S=C3=B6ren wants to become an active maintainer for this driver, th=
en the
>>> vb2 conversion would be the first step. But there is a lot more that c=
an
>>> be done, I'm sure.
>>>
>> Yes he wants, that is his offer to the VDR-community.
For almost 10 years I maintain the saa716x driver [1] for
high-definition full-featured cards and related budget cards. The HD-FF
cards are the successor of the saa7146 based full-featured cards, with
the same API, very similar driver structure, and same application area
(mainly VDR). It would make much sense to maintain both drivers together
in mainline. That would be a big win for everyone, users, distributors,
and developers. But yes, first step would be to get the saa7146 driver
out of staging/deprecated.
>>
>> He just wants a kind of guarantee, that the driver for the fullfeatured
>> cards he owns stays in the kernel.
>> That is understandable for me, he would do the job voluntary without
>> been payed.
> Once it is converted to vb2 the driver can stay.
So, Hans, you will also move ttpci, av7110, and the DVB output API
documentation back from staging, when all the old videobuf code is
removed? And give up the strange attitude of "Cleanup patches for the
drivers here won't be accepted." for av7110 [2]?
> Note that the driver might need a bit more work: we use the v4l2-complia=
nce
> utility to test V4L2 API compliance of a driver, and after the vb2
> conversion the driver should pass this test. So the compliance test migh=
t
> find some other things that do not work as they should, and it would be
> really good to clean that up as well. Usually the things it finds are pr=
etty
> easy to fix.
I totally agree that all available compliance tests should pass.
Most parts of the driver are implementing the DVB API, though. Probably
only for the analog parts we use v4l2. Especially for full-featured
cards the read-back of the analog output signal is more like a debug
mode (for DVB OSD applications, VDR skin plugins) and probably not
working in isolation like a fully compliant v4l2 input device. But I'm
happy to make this as compliant as possible.
>> There is a long lasting controversy about the deprecated 3 DVB-API-file=
s
>> for the av7110 driver.
>> S=C3=B6ren stated he is tired about that discussions and looking for
>> permanent solution without having to rewrite the whole driver.
>>
>> In this case I'm just the messenger, but I would also prefer a permanen=
t
>> solution.
>> That is why I made the suggestion with the driver specific UAPI file.
>> The av7110 driver is only driver using this API-part.
>> And the modification is fairly easy and the impact minimal.
>>
>> May that be a compromise all parties can live with?
> Moving it to a public av7110.h header makes sense to me.
>
> It's a nice-to-have in my view, and moving it to a driver-specific API
> should avoid future discussions.
For me this looks it little bit different. I would like to keep all
parts of the DVB API separate, because at least 2 different drivers
(saa7146/av7110 and saa716x) are using these APIs. And again, I would be
more than happy to get saa716x upstream, so that both DVB output drivers
are in mainline. For HD full-featured cards there are most likely even
more users than for SD-FF cards.
> The fact remains that as long as
> people use this API we can't remove it, however much we would want to.
> I think the main problem has always been that we are surprised at how
> many people still use these cards. It's very similar in that respect
> to the bttv driver: very old, but still in use.
>
> The difference appears to be that the use of saa7146 cards is confined
> to a specific region (esp. Germany), whereas bttv is in use worldwide.
>
> Because of that we just miss that it is still in use.
>
> Having an active maintainer should help with that.
I already offered several times to maintain one or preferably both
drivers in linux-media. Thanks for providing such offer now. I'm really
glad to see linux-media/DVB starting to work together with the community
like any other linux subsystem.

Regards,
Soeren

[1] https://github.com/s-moch/linux-saa716x
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/staging/media/deprecated/saa7146/av7110/TODO?h=3Dv6.2-rc6

