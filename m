Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82162728F6
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 16:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgIUOtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 10:49:10 -0400
Received: from mout.gmx.net ([212.227.15.19]:46317 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728060AbgIUOtF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 10:49:05 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 10:49:03 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600699740;
        bh=JTW/4AIrJOCO6UiwIpdIgizR3dLGGmAd4c9nlLddjk0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Omwao5lXZn3NABRlBQlaZnyESiZWyKp59VwX2w7UHOl8tsfONEL6iFe0/8gfDHWFC
         GD2cuqKMNtWfpqhhkwmkzab0zmksch5J3MOcyyVNhybgc2tK91SJVhsSBt0idoCt/g
         kIqz/mLTL6Yr2lfVSim+OGt1Mkmfc7qPpKuv6VfI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.2.229.58] ([134.176.245.81]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1kxWsv0FDz-00hyPj; Mon, 21
 Sep 2020 16:43:54 +0200
Subject: Re: Enforcing color profile
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
 <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
 <72B7F2AA-4FCC-4842-A80B-5C4D856C0A89@gmx.de>
 <ede0342b-3975-15e3-a8d8-98886456b489@gmx.de>
 <20200901163325.5feb2874@coco.lan>
From:   Stefan Witzel <s.witzel@gmx.de>
Autocrypt: addr=s.witzel@gmx.de; keydata=
 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
Message-ID: <f6593d8f-1eea-91af-792d-286d05b4db98@gmx.de>
Date:   Mon, 21 Sep 2020 16:43:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901163325.5feb2874@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZM+MeOJroEOk+nAsHmpj46JnOb6acu4q2jTDRYpg9jM0d+mKnux
 7uoTz7UAHz1JtxW1aWTfB1OeEAxahTsty1CEI0TSZRXkYYyoi6iZknzKGe8l8ZLeKe3HIx6
 L1Rat2eK6tbmCEJf7JDjsJnOZrYR4vq30tptlod74kIMGg580FeOnodrvKJu36vtChUfDkA
 5tC1WJiCtBlP+7PgO+vQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5UY7+9c9QhY=:hoZfX3SRYmK2+TPAdbyS05
 hBySiuBUdxilZIx2UHvg3Bz6qMroknzYjhe0V4QmWwoob9V7onmKet/5qqmvr59DNeyMxqadk
 1jPmZDK6xahNlRv+HoXmy1sKZuBKvO4VX77AsVN+joBQ/3hVXFs0M+jdl9Bj1W+sqAdnvyesq
 yLFqC74gAHydoFAaDnzrUBtURmuUeE/QyhJ3LTgnqUS2Xh4ZVWVUf1DHcUgQo+LFwHesQYtzz
 bwoGgqJnIlWGc/1KUyjhJrBBVaMTG0T3pf3CqTuZubVMpAyoofJouTbfclP7S2PQBpn9DWLgW
 NbPixR4qBltMesUE5Xv+99z2XmzJX88ZnFe+wRPW0H95e0Pwbz2KbxQ4ejHeWLFYWRef58ZGp
 oT15NJny6ICeJWtdFEU34XAN7oXynv/sQ/GeJ2cHVtf5G/LxYeqr9qxatu467MZAx2n4l2p83
 U27cev5RIeWr51uWQTtcklG4fYk903J3JCGIp1oVS2B2ElJ/HFr1N0Fwm0PtjxbzWj1VWQzzf
 nBhKe5Ygymcr28HUZQ0g/YWi3goJQvlTld93zGOahJ2kiqr6lRIbEQ5Yn4MzbKdVWI33pBvZZ
 g88vwU73HQN+dfyKyy/e4arVqJvu4RtXrDa4HZEThSEbymKlmxtSA2zO0iSBFkgIA2bE6h50F
 iy0xC4izF59PPSs9YL3fbEw3JWsQfAwx7GVkBTJf4MX79mgDEtXrfC8PXiYutUNYb8g6h4Wpn
 JY/XT19gnlOfF38GUHEN0wi+6GLgfPEZhUr0nFHp2lm7w4uWy0PRyat5fUzJ2ikN3qZ7symxH
 7pjfX4PW6BKcJJ3w4mB4LVCNpN3Fj4K+K992Rrl2lftcsOttlGs2sUNz0osqDkuvSYsVL1681
 4RwP8dGjEezAy9f+4bE76Pm0q/3D815YMvn/90mv89Rin3dP0NrdQRZBO3DyvYfGcTMdbRZv0
 iBjtBiZD8CqW+maOFxubUwUDJnOcTxUu7eH7V5kFxgMMH8gU8ki21IgF4u5DiKxb+FmljUJUC
 nwAEI6ve3nB9Wjo2pIf6lVT3Du0dhKkf/68W9WZOjptrYqASO90Dbavu+il+dX6PY4pyhsGSF
 vL597fo1vWcvMh5XLAf8ihL4hrvw+WWXFIhRdLIEq+4NO/jhmb6R+Gs8HI+COBIDfIaLtWGmA
 UOdbtTbwGc6MKJpG/IAacM0YIhv4eyCgbGFogvQPFnbaji0hNhlkBHsTLe9wPmnLubS16+3W1
 JOy7neFqGKcfFv3JM
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Sorry for replying so late. All you say is correct. I tried qv4l2 now
and it confirms what you are suggesting: YUYV works fine, NV12 and YU12
show strangely distorted variants of the actual image. I would have sent
you a picture but qv4l2 crashed when I tried (even for YUYV).

Best,
Stefan

On 01.09.20 16:33, Mauro Carvalho Chehab wrote:
> Em Tue, 1 Sep 2020 15:37:23 +0200
> Stefan Witzel <s.witzel@gmx.de> escreveu:
>
>> Hello,
>>
>> Just in case someone should stumble across this thread: An appropriate
>> solution is available here:
>>
>>   https://github.com/xkahn/camlink
>>
>> As pointed out by Hans before the described problem is technically an
>> application bug, so one might say it should be fixed on application
>> level, which is what the solution above does.
>
> Hmm... let me try to understand something. I don't have this device.
> I'm just curious about what's happening here ;-)
>
> After looking at the patches and at:
> 	https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
>
> it sounded to me that the UVC driver reports support for 3 different
> fourccs:
>
> 	Pixel Format: 'YUYV' # V4L2_PIX_FMT_YUYV
> 	Pixel Format: 'NV12' # V4L2_PIX_FMT_NV12
> 	Pixel Format: 'YU12' # V4L2_PIX_FMT_YUV420
>
> all of them at 1080 p resolution.
>
> It is very common that devices would support multiple video
> formats. So, the above looks fine on my eyes, provided that the
> device has support for those 3 YUV format variants.
>
> -
>
> If I understood well, YUYV works fine (with is a variant of 4:2:2).
>
> The problem is with 4:2:0 formats (NV12 and YU12):
>
> 	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-n=
v12.html
> 	https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/pixfmt-y=
uv420.html
>
> that don't work properly with Discord. Is that right?
> Btw, are both NV12 and YU12 broken there?
>
> Did you try using those formats with a different application,
> like qv4l2 or qvidcap?
>
>>
>> Best,
>> Stefan
>>
>> On 17.08.20 16:50, Stefan Witzel wrote:
>>> Hi Hans,
>
> Please don't top-post!
>
>>>
>>> I suppose it is ultimately an application bug. I was just hoping that =
the v4l driver cold somehow artificially restrict the device's feature lis=
t so as to make the buggy application (which seems to be pretty much any e=
xisting web conference app) work. That would be like the hardware workarou=
nd but on driver level.
>>>
>>> I do not yet have the device myself, so I'm relying on information fro=
m the website I quoted. I very much appreciate that you took the time to r=
eply! I might come back with more concrete questions once I have the devic=
e.
>>>
>>> Thanks a lot! Best,
>>> Stefan
>>>
>>> Am 17. August 2020 15:34:00 MESZ schrieb Hans Verkuil <hverkuil@xs4all=
.nl>:
>>>> On 17/08/2020 14:09, Stefan Witzel wrote:
>>>>> Hello,
>>>>>
>>>>> I am not a V4L developer so if this is not the right place to bring
>>>> up
>>>>> the issue please tell me who to contact instead.
>>>>> The page [1] documents a problem with a particular device "Elgato Ca=
m
>>>>> Link 4K" which provides various format options among which most
>>>> software
>>>>> does not consciously pick the one which it implicitly expects leadin=
g
>>>> to
>>>>> problems. There is a software workaround, transcoding and looping
>>>>> through a virtual device and a hardware fix flashing the problematic
>>>>> profiles away.
>>>>> However it appears to me that the most satisfactory solution is
>>>> hinted
>>>>> at in the sentence
>>>>>
>>>>>> I couldn't find any option in V4L to force selection of 'YUYV
>>>> 4:2:2', so instead
>>>>>
>>>>> So my question is: what changes would be necessary to allow v4l2-ctl
>>>> to
>>>>> enforce a particular format and who would be the right person to ask
>>>> to
>>>>> make such changes?
>>>>
>>>> It's there already:
>>>>
>>>> v4l2-ctl -v pixelformat=3DYUYV
>>>>
>>>> That will do the trick.
>>>>
>>>> If you plug in the device and run 'v4l2-ctl -V', which pixelformat do=
es
>>>> it
>>>> report? I would expect it to be YUYV since that's first in the list.
>>>>
>>>> If apps like Discord pick YU12 instead, then that's weird. That's
>>>> something that
>>>> the application does, and v4l2-ctl won't help with that. I.e., it
>>>> appears to be
>>>> an application bug.
>>>>
>>>> One other alternative is that the device has broken 4:2:0 support, i.=
e.
>>>> it reports
>>>> these formats, but they don't actually work. You can use qv4l2 or
>>>> qvidcap to test
>>>> if these 4:2:0 formats are working.
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>
>>>>>
>>>>> Best regards,
>>>>> Stefan
>>>>>
>>>>>
>>>>> [1]
>>>> https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
>>>>>
>
>
>
> Thanks,
> Mauro
>
