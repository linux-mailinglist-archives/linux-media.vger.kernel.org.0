Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7241A258F47
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 15:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgIANhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 09:37:53 -0400
Received: from mout.gmx.net ([212.227.17.22]:55165 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728198AbgIANhi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 09:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1598967444;
        bh=WXN7/cFCfSOAcWuJzDA5jUyAsyoaUbnzBto3FdcPmVg=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=iJvhG92If0wu86SQtCWzpCmYbfGsRNjdsgFF6oqmOHi6zVLU/wlPkB2dpEj9NWcjC
         vXsRp915F3373IGweO1xUnChkPHRczBCWl+As1+5pjzwsWzJjELsRkfBk+qPOl1OIW
         W/kB2krPh1UcGN2VQp3Ws98fJFOtFcvCgyrCC8NY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.22] ([188.101.118.218]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1k2c6s0DsU-00S8Am; Tue, 01
 Sep 2020 15:37:24 +0200
Subject: Re: Enforcing color profile
From:   Stefan Witzel <s.witzel@gmx.de>
To:     linux-media@vger.kernel.org
References: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
 <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
 <72B7F2AA-4FCC-4842-A80B-5C4D856C0A89@gmx.de>
Autocrypt: addr=s.witzel@gmx.de; keydata=
 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
Message-ID: <ede0342b-3975-15e3-a8d8-98886456b489@gmx.de>
Date:   Tue, 1 Sep 2020 15:37:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72B7F2AA-4FCC-4842-A80B-5C4D856C0A89@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sa+IbVrkpE8FpeYqzNyR/0p5WAdgqupCaLDEDxHLWt6+luaiWmi
 A/OsEcpY1AB4s1G00XHdQ262SDKvl+vpudFA8ZcCmtmeCqrcrHhQLI5ZAIxIACnoLnQfCy+
 PjKEwin8/2eAwQp0rcy5Nso5QQTvOjSjUlpZC5vDQYgONvZRnga52ivPriFP7crBPso7kga
 nVIAx+wHMvFCY85QfMQhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K6MqXWV+Fx0=:JEaNs4j2YtkRa38rA/xh4m
 O38t59w+vdQRT2s+EfvJZuZSC+mwIYdtlLJjyYIFduafO/B+qdfxIrzodc+0FxjCRhBTwF5+k
 ZUr91+EddbWTjDOsXjiYz2bTsyP4thcpiYby3HgOk+UwXjznuWnPsAvMLSNr2lqCW10q/qHXc
 A81oxYQe5KRAdDkAM1IDG38bcIvflMsfNJ+4k8Otav5g+QXPzwQYeP2B7GTsVn7ORoSEcFysz
 WLelA8lFQPNWexqkwiblSJKJKqJ8+XiB3sdVA8lSrLl2y0WK31iKAFS8S8OmIvSS118hA4SrE
 2VDReJzJ16hJGwc9KU01XtOWIJhm625XlyKLVufk4aCx8OyYrtbTxXGR+JJ9O+YvxCLqKprrp
 AsLdBJMExytDEHiY/CGdjrxNizx/bmb+KDpeDnWCSmwsogkBcACJjENl+Oaakei2ARO1SV8kc
 OA7nO5lucSFz8RL7TzQIP58ziUzTmXeh+yGW6GHsoAXe8m3tqv1oqSQfVMozeynX1XbxXeemo
 B0/4OSs5MiXh/3cwJQ3zjnzzF35bnHjN1ZklievsodwErr+VVzraHt22KkaMBz+emHERjBLoH
 7Iw8Z1a0oiBkGoqMQnld6eefzS/DoARbSXQWa8aFxVjDuzZud7KXSJEFXvtgR4VFZMFu2xBg9
 dAPcBkWr9OcvYeiOrI0DpRYkz8du1dGr3TT0tD5U447xthH6jiMAVziMlOtDquedyNeqlvYko
 ILngR9P+EMncOpfbZS5RqNhSVTXkF28j+K9UJnGPgQn71GymDWkbBBqM3PV+jG5IitS+hKOxR
 Qt9NxxkKEbvL4X1gIqKfxGFeDWJB8BSB4X4n+61zGuvf92qtCYp2Oa1DBF/FafYweNsvJ1Yjj
 9VODrI5UkPe87rSBK4ritNCSHueMbJypVm5sYQdn4Hx19GtsUpCiUgUSZ2RvqWfH7Z+puCOUu
 nFLMxJ9vuRTQ2da5yzPz6th9H0l1JrmbJ2fGylVRaM/02UL2XpheihfGzDdtU2RH8D53bvKhY
 EqdVVwa38ah+lFiZpuAwrCan2Vgqaga9q9iHg9FJTQXg3IrwvNESKTNRYNsv8zOlTs6lub+0F
 k1FKuwPes8CYL5qATd4rA8TZNWTPwv25x2nTkPrXNbUy7+Duln/dQ6YD9G6yT/4hmXEWORNmN
 m5ykbDl/Kci6KyknSK6Mgrv443lO3g1lb9ppb/h/WwwuiIFnXdL5dk0ZBHesiATaV8AXkDbg6
 VtHJH5eQG0Rb9+BqS
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Just in case someone should stumble across this thread: An appropriate
solution is available here:

  https://github.com/xkahn/camlink

As pointed out by Hans before the described problem is technically an
application bug, so one might say it should be fixed on application
level, which is what the solution above does.

Best,
Stefan

On 17.08.20 16:50, Stefan Witzel wrote:
> Hi Hans,
>
> I suppose it is ultimately an application bug. I was just hoping that th=
e v4l driver cold somehow artificially restrict the device's feature list =
so as to make the buggy application (which seems to be pretty much any exi=
sting web conference app) work. That would be like the hardware workaround=
 but on driver level.
>
> I do not yet have the device myself, so I'm relying on information from =
the website I quoted. I very much appreciate that you took the time to rep=
ly! I might come back with more concrete questions once I have the device.
>
> Thanks a lot! Best,
> Stefan
>
> Am 17. August 2020 15:34:00 MESZ schrieb Hans Verkuil <hverkuil@xs4all.n=
l>:
>> On 17/08/2020 14:09, Stefan Witzel wrote:
>>> Hello,
>>>
>>> I am not a V4L developer so if this is not the right place to bring
>> up
>>> the issue please tell me who to contact instead.
>>> The page [1] documents a problem with a particular device "Elgato Cam
>>> Link 4K" which provides various format options among which most
>> software
>>> does not consciously pick the one which it implicitly expects leading
>> to
>>> problems. There is a software workaround, transcoding and looping
>>> through a virtual device and a hardware fix flashing the problematic
>>> profiles away.
>>> However it appears to me that the most satisfactory solution is
>> hinted
>>> at in the sentence
>>>
>>>> I couldn't find any option in V4L to force selection of 'YUYV
>> 4:2:2', so instead
>>>
>>> So my question is: what changes would be necessary to allow v4l2-ctl
>> to
>>> enforce a particular format and who would be the right person to ask
>> to
>>> make such changes?
>>
>> It's there already:
>>
>> v4l2-ctl -v pixelformat=3DYUYV
>>
>> That will do the trick.
>>
>> If you plug in the device and run 'v4l2-ctl -V', which pixelformat does
>> it
>> report? I would expect it to be YUYV since that's first in the list.
>>
>> If apps like Discord pick YU12 instead, then that's weird. That's
>> something that
>> the application does, and v4l2-ctl won't help with that. I.e., it
>> appears to be
>> an application bug.
>>
>> One other alternative is that the device has broken 4:2:0 support, i.e.
>> it reports
>> these formats, but they don't actually work. You can use qv4l2 or
>> qvidcap to test
>> if these 4:2:0 formats are working.
>>
>> Regards,
>>
>> 	Hans
>>
>>
>>>
>>> Best regards,
>>> Stefan
>>>
>>>
>>> [1]
>> https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
>>>
