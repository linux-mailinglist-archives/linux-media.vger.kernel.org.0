Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E3C6C8766
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 22:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjCXVVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 17:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCXVVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 17:21:17 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C034118164
        for <linux-media@vger.kernel.org>; Fri, 24 Mar 2023 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1679692866; i=herdler@nurfuerspam.de;
        bh=/HsbQiOpLOOfcpisGTs1/QvguJ7Xm1MDeR1cOwdmTnc=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=XFVim0X10sfN7fMPIaoB48PRV2SzvrFs0ACJ7lvyy0OhacMzX5MLRJnu0bD1cP2lK
         ftkXeJIyKkB/GzVnRrZoFPtYSpcQGoB24fRd8qZBqd1t27yYwxSxzIaFICcq0hm7bw
         LKsI/0Ny7T7peEl8lO6iWIqO0PC9rJKcUAn9lAQ+Id2EiZjHO8yv4XR0ZPMtrAdnEw
         Vn4KCnrEtFAzsU33WC+BG/D9QztqxgFjnt2PV3G6nqLG7Dv4zNEtaot/IEgjoSSp9G
         LcEXdx88scOSSuaZzvDHADhCKyikqt9eOz1Pc7bZUYkTZaUdnT63wEszPUsICyKIOh
         iuqGIMkaCbGYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.187.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGe1-1q634j2uu3-00RGtU; Fri, 24
 Mar 2023 22:21:06 +0100
Message-ID: <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
Date:   Fri, 24 Mar 2023 22:21:06 +0100
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
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pvtE/3nSjsjmjKzDYs5NUnawPg1+AZdjwq2RzxkVaeh5SyJn5ZT
 pMIUi483nFRTNcf91IxvS8FN++yo6hesNxrrjxTV/OXKz2jBwK35bvX6htJTl44PFO8iZ9O
 BCGxdkmyKTZFV5bGsgjRSsHJKivHpqy1n1341YIQpZ4MyUDGgjTI8z6lNRXWcm7h7TLMl6l
 yN5dPhacezHqyuI58hLAA==
UI-OutboundReport: notjunk:1;M01:P0:TpkNcaJ9PVY=;/iyPH1ODxLuZv9IuoNiWPKeX3Av
 grm49L/bp97nqOFqpCEZyiXoRc/y69uYTenTgNfN3pIQMZRvfWO9ClGStb7kInH/SyO4VoNlO
 DlrdSIXD+SyzkL6+3cwp60bRADNI36PAaDL8QB62GKkkrJboWlSwg4/oewtCKWhq99jTgfbg7
 DpVdMrYI6dcg8D0Mb5m3Q1Zf7W0hJ9fjRUQY8G+6VFbrfl1RHeeiyROsKOmOEfPqazekoYfDP
 3ETmmLmbfnkLzK5pEkUKZdti2k+ewR1n5Up8Dzj9q4snDGhfhOiXI+f9OSb6VFnrFF3FzCIpL
 YCmkviUFoSfyS9wsxZSdG6kwKRAfgm1N09J/nqjmWtAd5AK35JcPVrUyIQeDOtmnh6BX/bZOo
 abuoiYdePsAni7RSg16jW1vW1OvHttReaa5P7M5c8pmWjYlQUgOiXEAjgPkc/7RmpBxzRav2Q
 ln4FoOvHew3aEOuMt3lGDY/T3AfjjFvVXdqFo9CPu7QNX3zmsilrcaJudIOTrsLCKL49RezjF
 isnuYbkdeNuNwlVANro2cKZ2zR7rcHtLrdm0aj3l3c8fBHVqDoZ0o3CnRkEGwpx/aJnWcoDpj
 kgP89Li2Atz4Oru4+E1uc2Nn8DYBAv56LrBj54qzaoJof3eK71Y7cqYN+JBZElmjr3zC7Uihg
 ZHJ89ESQSmF6frZ5iGQd64b6gEtvsYOPGh8cil0HUGSQfHXNz0K+bBds31TXMNm+GWnMZ5d63
 xIiRGGPrinWXCk+OEQd7FQJwkkK6eXLw5KLmXIFfio/XVLYK1/VBzAiZD+5BBOtgWFox5izsC
 5N1Wrk3NBFyDWMTBKyE0BEmGskwgFYZYfHGjpisQHmHPSgShb4xiepoaTX00iKeuqZDB2DfoD
 s/t3H/qKBt3ZGEFLI1URYuzQxXb7lkiHMWpcBLLYr0OqkZrL3tU4KCrW9nwU0qTlhjxhy6/Tg
 UTo9txXrTXzoT/BavDcLIvmXkVo=
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

great to read, that it is finally done, thank you for your work!


On 24/03/23 11:40 Hans Verkuil wrote:
> On 24/03/2023 11:37, Hans Verkuil wrote:
>> Hi all,
>>
>> I finished the vb2 conversion and tested what I could test. I am missin=
g
>> 'full featured' hardware, so I could not test the analog video capture =
part
There is some miss understanding.
At VDR 'full featured' refers to all DVB-cards with decoder and OSD.

I wasn't aware, that this definition doesn't seem to be common, sorry.
>> of that. It's not clear to me if VBI capture is also supported on those
>> cards, if so, then that needs to be tested as well.
>>
>> Note that there is one userspace-facing change: the VBI output settings
>> are kept, even if the vbi device is closed by the application.
>>
>> Before you had to open the vbi device, format the slice VBI output, and
>> write sliced VBI data to it. Closing the device would reset how VBI out=
put
>> behaves. That is not in spec with the V4L2 API. The format is kept afte=
r
>> the device is closed.
>>
>> Any application that uses VBI output and that wants to keep the same
>> behavior would have to call VIDIOC_S_FMT with a struct v4l2_sliced_vbi_=
format
>> with a service_set field set to 0 to indicate that you don't want to
>> output any VBI anymore.
>>
>> If this is a problem, then I can make a module option that selects the =
old
>> behavior.
>>
>> BTW, if anyone has a spare full-featured card (i.e. with analog video c=
apture
>> as well), then I would love to take it off your hands so that I can tes=
t that
>> myself!
There are only DVB-C boards with analog features.

I personally never had cable-TV nor own any DVB-C cards.
But I try to find such a card with an analog module on it.
>>
>> This series has been tested on the two Hexium boards, the mxb board, an=
d two
>> av7710 boards (DVB-C and DVB-T).

I can test on the DVB-S hardware.

But let me finish the API-documentation fist, it is almost done.
There are only the complains from chackpatch left to fix, I hope it is don=
e quickly.


Regards
Stefan


>
> It does help if I point to the patches :-)
>
> The patch series is here:
>
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D10140
>
> It's also in my git tree:
>
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=3Dsaa7146-clean
>
> Regards,
>
> 	Hans
