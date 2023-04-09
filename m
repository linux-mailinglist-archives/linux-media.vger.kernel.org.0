Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D556DC1EC
	for <lists+linux-media@lfdr.de>; Mon, 10 Apr 2023 00:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjDIWgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 18:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIWgV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 18:36:21 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A8030EB
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1681079769; i=herdler@nurfuerspam.de;
        bh=nD951bOzXZxLyFP9KrkiOV435O4U8/3+U3Ltbk8E17U=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=XTDspRIJt8oeiZygd1l7CXQ+8J/n6FlNoDA6TFukqtL5BE7v1lLCs8vmXRUeXtcIC
         CUNFHBcMHjXctZCrvoWJ1yB+wtMtawGqLAF33VZ5CBVMTRSoU8OZ7b7zi3As946c55
         eRaarf9T4hjH7ZxyWHigkMwQGjXSB8XbuiEuv453puqFIOr77zud7mR2W35lBs0F/c
         H/Nkho8Q4yYiPaRqmAkLOh+/BwMhs7LcFnsOAJeD2cQloFJaDh6uUVnG23hYWnuK6T
         aJhz13j9JBEQGY+XS0TqeZtSg//o2eiduh6cIr1+LXLayEgSSnip8DEjbP4LpQdwLB
         GgqIbYfAa2f3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([185.101.174.7]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVNB1-1pukBC1BgN-00SKPp; Mon, 10
 Apr 2023 00:36:09 +0200
Message-ID: <60ee8312-fecb-3fc6-6496-95ab894bc7a1@nurfuerspam.de>
Date:   Mon, 10 Apr 2023 00:36:08 +0200
MIME-Version: 1.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: de-DE, en-US
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
 <9dec250e-72b2-3c03-c01d-e211a270a751@nurfuerspam.de>
 <fc0244d7-1edc-d0f9-1777-65521d781d7b@xs4all.nl>
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <fc0244d7-1edc-d0f9-1777-65521d781d7b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a2d4lNO3Afk32qIYieS1bUns5QUd/C0J/pGoPSEzdQnrmoAesGM
 vo4/WCI/A3uFJLFXqLy0IQ33QtXgpIwxsqjWFaHvNBORKDEL3WI1lTMVyYHM8h76/TxFVdA
 G5LFwo6/AyFn9i6rJI76uvVBas+b5oSV8tzM7hZDPeArYlVSPgS3NhxHoSi78IRDi0IYDzL
 irM6DfaknWZS+IHD4tPVA==
UI-OutboundReport: notjunk:1;M01:P0:TEsQT4he48M=;HPNybebABzc4Is+5QEhIb1aXwRs
 E3bXljIeET7X6rPFNcw1/zhoH0yUmrV7/geJTr0FZ5i/gCk527RjJsbOYEoViDo3jeWvzFDOK
 zkuo9G0qa/vudvGskggpFRhHIBWrnUPEhYiik4P9DJoantdgEAIIEAXXjz2ChmOfmhDka7Oyy
 TZlYS07kijhKtgedDZs6HJo/MoWCZgZxr7cnIu79HvndhG93CRndM4PBot8SmyuHGHaVnEO/I
 KmCutq8A66xpnCPfS4CNXW3qDkqytrqf1U7faRDoVfY1XGY2XNGEV449AC5pCoQrt5jqJHEUA
 SHtwYn1lp3a/auCBqWTMsU3gDg7b4rlZiZMr/zCfljSF6wuPRJBpTQMjUYcoJzrjhSUUk5aR4
 w+PxCeKftoTaotcgClyphZkGFri8AAbApshlXhpKeOfkIwGDkW6lKbrsMH6sXhF7lHk2TT1H6
 To0X4oYWTbLp1YaBlpju48TLQOMoyiuuVKMxvNCp6XqVaEJY9TO1suG9JLi7B35/VcLe+bxAH
 6KWYJ/deQ9VnOsqvTauXeseHwh+p14bfp8NnB10F+XLwgfjbagtCggQe95DaHSF8xbWlApz0/
 GnwukX/lMh0gJzpjouK6BzUxdpqwh793sFQihyYM98TtiQIB9D3PjKH5KtitpYBALk1t5X7Rq
 ijxAk34pZS/T8Zz3a8qUXA503Dd+yTk3rFl90UnkgBzVSnS5BLngMjM4odUUUcK1/XFfQl7A9
 MwcX93776jp7K34gel6oUeKHkAg2eh6ONyEuYYjaTJPF8ng5ZBBg1D0PV914YBq4h9FiXMeg0
 BZuDJP/oW5pwXSDqiNAzL8gJt15fo+iVYSd+YU3Bh9b4qqkhUwwo94s4XuykbrW04ggRGqfgj
 POvitj2BiLl88aFuHyZR6RHHEk5PSX5hB0N6Tc7ohd1vc4iNan4PYms4Wv5PHPgchpqtFz7h/
 +/VlQrp0QNryaHutERa4PYyUQD8=
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

On 07/04/23 09:04, Hans Verkuil wrote:
> On 07/04/2023 00:43, Stefan Herdler wrote:
[...]
>>
>> VBI output is used to switch the aspect-ratio via WSS.
>> this should be supported by any av7110 card.
>>
>> The software is run a daemon or plugin, so the userspace-facing change
>> shouldn't matter.
>>
>> I'll test this as soon as possible.
>>
>>
>>
>>
>> I've done only basic testing so far, but unfortunately it already faile=
d.
>>
>> The test:
>> Switch to a channel[*] and view the decoded video with tvtime.
>>
>> The resulting picture is corrupted.
>> Almost green with some pink traces at the outlines.
>>
>> It reminds me to YCbCr component-yideo on a RGB-input.
>> Maybe the input-format of saa7146 not set correctly?
>>
>> The OSD is equally affected, but the card seems to run stable.
>
> That's weird. When you are in this state, can you run
> 'v4l2-ctl -V -d /dev/videoX' for the video device that tvtime
> is using? I'll try to test it with tvtime as well next week.
> I have done my tests using qvidcap and qv4l2, and that looked fine.

I've done some more testing and the result is somehow confusing to me.

At first I tried qv4l and it shows correct videos with any driver.
And with any pixel format setting I tried.


After boot /dev/video0 (there is only this device) starts always with
this settings:
Format Video Capture:
        Width/Height      : 384/288
        Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
        Field             : Interlaced
        Bytes per Line    : 1152
        Size Image        : 331776
        Colorspace        : SMPTE 170M
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :


On the working "old" driver tvtime switches to the following settings:
Format Video Capture:
        Width/Height      : 720/576
        Pixel Format      : 'UYVY' (UYVY 4:2:2)
        Field             : Interlaced
        Bytes per Line    : 1440
        Size Image        : 829440
        Colorspace        : SMPTE 170M
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Limited Range)
        Flags             :
It seems tvtime needs this 'UYVY' pixel format to work.


On the "new" driver, with patches [1], tvtime switches to:
Format Video Capture:
        Width/Height      : 720/576
        Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
        Field             : Interlaced
        Bytes per Line    : 2160
        Size Image        : 1244160
        Colorspace        : SMPTE 170M
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :
And now it is getting weird:
I can switch to the correct 'UYVY' settings using qv4l.
But tvtime always switches back to 'BGR3'.

Using qv4l while tvtime is running doesn't work and sometimes
causes freezing of both programs (on all drivers).


I have also build a new driver just without the patches [2].
It shows the "old" correct behavior.
So I think, the cause of the change must be somewhere in the
patches.



Btw.:
I also tried to open the video device with the usual
media-players, but I had no luck so far (with any driver).


Regards

Stefan


[1] git checkout -B saa7146-clean 837736a79a76c9becddf0caf905b27c144a64030
[2] git checkout -B saa7146-clean 2653fad0d8a9625667e9a78133ea9e1245b7c40c

>
> Regards,
>
> 	Hans
>
[...]
