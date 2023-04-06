Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6556DA5F0
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 00:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238089AbjDFWn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 18:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjDFWnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 18:43:25 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2765E72A6
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 15:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1680820992; i=herdler@nurfuerspam.de;
        bh=FDgFS9/PckMQN8MoHF3RmebXboUWpTDEbAnhvvuGlGk=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=S7tcAv5lrb++1K7BS9qtJmZW449JYwJnQtDxFdrqlvT0ViXQ9aqy59IseSV2pqn57
         pIOsLJM+djglM4Fczk9QkZ3frwDO6tulIz9Cu0GdmZRnha7uObA4x97PivCcJCBxr2
         U9UXTCz1Y4SM0ur+msOxlCXjDmB7Er1+hYMM6H3SjxRoNO1Myr8pkoZKuur8ICHM8S
         gWrFzsRdykCDrEab4GnJvIEwCx/aBvC/cMAU+I9z2gQC/Ajw5VprnW3GI3VX+3PFX4
         khu0P8UtKkqUZDn4pj4SkVe3KBh02wVRh1T9zTM5Joj6bdlweCiDvoyyX8HJuuomLK
         mq9CeKeN1IvrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([185.101.173.13]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQXN-1qa2yr1673-00sLhk; Fri, 07
 Apr 2023 00:43:12 +0200
Message-ID: <9dec250e-72b2-3c03-c01d-e211a270a751@nurfuerspam.de>
Date:   Fri, 7 Apr 2023 00:43:11 +0200
MIME-Version: 1.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: de-DE, en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
 <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
 <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
In-Reply-To: <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:61O72qIQu4kTLt4/0Sk9OzbnGtX1E8cdbYtkm4ruhdxXl3PLQKe
 kspoj9pcWXZuBX0DFgSdg4GjEUjwzgivuiNhNRPVNAwaVFzitU0kR0y7ro9W93dh77tXJmX
 MkzWrCBCDc3W/yoz6iu2addK6Za9IU9gMkdtnYpA+/zSrNeZ8+mGTETOluHcAeBlS+oR2gP
 /yFCqbFjdETT61zANyVEQ==
UI-OutboundReport: notjunk:1;M01:P0:XKvOnJE68AI=;cZ11f4U5f00Q72SdW+t9LJngWuh
 ui3rSAt8frYOHNtgEqggzbKgoAkpCSWRCsfFzS1xH2hxTqGGa/rS1oUKU1VUigEn/9YErTehg
 PggZOoBDDehvNfETHOlzzELg3QdUJHCoiYJP7+TWc+LvKeHR465riez5XXhL1C4wV+AjbC7QH
 dCphIPOKidA1VODco1/bwTs2sziJQ2WLjtaTxeVrUF8757VymR2Eg8fCFaUlllMzTegvN9FB6
 oOCUYjHrfWTcqB4zlLOaqrzlWKDReU38ob9J0TCqGO98xRWNFvwPISqdPigJ338ntNF2YVgZ5
 gtPU4UeHr00je2h7/uz7IulwP7xonvPaQqB0x4ASDpQ0hveVUPIEb6luvg2+c7G+rgU8vB+5j
 XLaHP3dEy+fIty7yfMdL+tGLjd4aPoTAfph1+pYt0cPJz06xiyLKqe/PcBO9zAiFXyCXDI7/K
 DCqxt/Y6k+nHRpBLOWTPKosjsrbpem2qnKd1pfvOrMrVKrL3aOa8RMafu/tvffdyqa/iUM3XN
 yADTWavEoVYrS9+Q8Tn7aU64XQNCl+t0NQqVURpcAnSKF9XOfuQwBb9lu0uxqAeF/U3p5vaz7
 QGD3Ad9770/+jb8D5os+psjiRma6EBTGjIQTme/pyj0P02in1HPTC42Ro97QfABTx+RvhRtSk
 9ahm1Dthl2zGoRcLGsZ5ryJhCy1aUomfgAfkME3AdCD0gzbeAuBzK5mQkPiHGiZ0PitKygNYO
 FpPyPDuo4nuDCy3yvg8wMeJhy4I2T9yUQNlwpHQyH06zJYt9cGzz4yC6m39QI2pTzE6UNzp3m
 w6gm845Dj8JKooKOwft1jXk9SEcapGk4fbfHtPlLlNn1P1wD+6OjehNyHvTePlHsWE/aBywX8
 vcdJruKXyhWpOnN+xnTOQ282H0Bhh7UJI4zvRLV5x7GZjwbE2tGggbNba4P+TQoRgAAilasRT
 0CURxkFKuI6KgYnDWrl/tJq7eKY=
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I'm sorry for my late replay, but it was quiet troublesome to build
a kernel with the patch, also running on the rest of my hardware.


On 24/03/23 22:21, Stefan Herdler wrote:
> Hi Hans,
>
> great to read, that it is finally done, thank you for your work!
>
>
> On 24/03/23 11:40 Hans Verkuil wrote:
>> On 24/03/2023 11:37, Hans Verkuil wrote:
>>> Hi all,
>>>
>>> I finished the vb2 conversion and tested what I could test. I am missi=
ng
>>> 'full featured' hardware, so I could not test the analog video capture=
 part
> There is some miss understanding.
> At VDR 'full featured' refers to all DVB-cards with decoder and OSD.
>
> I wasn't aware, that this definition doesn't seem to be common, sorry.
>>> of that. It's not clear to me if VBI capture is also supported on thos=
e
>>> cards, if so, then that needs to be tested as well.

I have talked to the "cable-guys" and they didn't know about VBI capture.

The whole analog capture of this cards was never very popular with VDR.
The signal had to be encoded on the fly, this was never reliable as the
PVR-cards with encoder.

I think it is o.k. to leave it untested.
>>>
>>> Note that there is one userspace-facing change: the VBI output setting=
s
>>> are kept, even if the vbi device is closed by the application.
>>>
>>> Before you had to open the vbi device, format the slice VBI output, an=
d
>>> write sliced VBI data to it. Closing the device would reset how VBI ou=
tput
>>> behaves. That is not in spec with the V4L2 API. The format is kept aft=
er
>>> the device is closed.
>>>
>>> Any application that uses VBI output and that wants to keep the same
>>> behavior would have to call VIDIOC_S_FMT with a struct v4l2_sliced_vbi=
_format
>>> with a service_set field set to 0 to indicate that you don't want to
>>> output any VBI anymore.

VBI output is used to switch the aspect-ratio via WSS.
this should be supported by any av7110 card.

The software is run a daemon or plugin, so the userspace-facing change
shouldn't matter.

I'll test this as soon as possible.




I've done only basic testing so far, but unfortunately it already failed.

The test:
Switch to a channel[*] and view the decoded video with tvtime.

The resulting picture is corrupted.
Almost green with some pink traces at the outlines.

It reminds me to YCbCr component-yideo on a RGB-input.
Maybe the input-format of saa7146 not set correctly?

The OSD is equally affected, but the card seems to run stable.



* I used VDR for this, but it shouldn't matter.

Regards
Stefan

>>>
>>> If this is a problem, then I can make a module option that selects the=
 old
>>> behavior.
>>>
>>> BTW, if anyone has a spare full-featured card (i.e. with analog video =
capture
>>> as well), then I would love to take it off your hands so that I can te=
st that
>>> myself!
> There are only DVB-C boards with analog features.
>
> I personally never had cable-TV nor own any DVB-C cards.
> But I try to find such a card with an analog module on it.
>>>
>>> This series has been tested on the two Hexium boards, the mxb board, a=
nd two
>>> av7710 boards (DVB-C and DVB-T).
>
> I can test on the DVB-S hardware.
>
> But let me finish the API-documentation fist, it is almost done.
> There are only the complains from chackpatch left to fix, I hope it is d=
one quickly.
>
>
> Regards
> Stefan
>
>
>>
>> It does help if I point to the patches :-)
>>
>> The patch series is here:
>>
>> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D10140
>>
>> It's also in my git tree:
>>
>> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dsaa7146-clean
>>
>> Regards,
>>
>> 	Hans
