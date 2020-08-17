Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF432468B7
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 16:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgHQOuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 10:50:51 -0400
Received: from mout.gmx.net ([212.227.17.22]:60561 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728873AbgHQOuq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597675831;
        bh=+w20/QTTtxYbIrBo2flWrLVvPd4TGOPWDPkiy9gsock=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:To:From;
        b=KHeENJWqe3I6cKMa59mY2xPYxijgzY8hcNnBi8KWCqr5yIL5e+rghK8bI047vK2DY
         5eRiDMyp/94XOMAZOGXz2udyGe1DmCKhH3lLAeTrH2tUIpAZ2+h2/z8NZKX7VxUTo0
         2mh826ipQhj5r7o6z/JwbGo7YdJAo1Yva+atEehk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.204.88.90] ([80.187.114.90]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1kEw0X1vZO-00UKjl; Mon, 17
 Aug 2020 16:50:31 +0200
Date:   Mon, 17 Aug 2020 16:50:29 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
References: <7486393e-56b5-e460-b542-02c72525139b@gmx.de> <0fa5da29-a058-2678-e616-65c921c6389a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Enforcing color profile
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
From:   Stefan Witzel <s.witzel@gmx.de>
Message-ID: <72B7F2AA-4FCC-4842-A80B-5C4D856C0A89@gmx.de>
X-Provags-ID: V03:K1:6OQeebAacCIfoIn2YqHFbtLkEQyVbh3phB4i8rsNCdV5CBt8ZHU
 VropruUf1yLIM5kkQ1SQApDbET5Y7qsbCGZEdvcPbXdUDk3KHC3qZ9LtJNmdzFcNIwmQsZl
 lkDgw0SSMcBE/qDN8nvG/Z7pXae8k06fsiN7sznnZxHk5Voo8GHxZ386KYgqfhiTBp4pZJk
 RCYnttwaX2qDU6I2BmbnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YgG9semm3tk=:pnfahnEiXSkvIUNHOc01ND
 WpFOBWPY7jqDvrsHnWaqt/6i3djZ6mv6pfkSwRFMIAOhXQT84MhwfOvTKvXNE2WCNxbFuG3AR
 6xscOv9JcAYiMoWziIJAK7nLB8cXWAJ9PAfauctCCXmJ26DH5Wnx+rNCuAJP+U3nM8GT47vZD
 qX/zxRuc2K9DMh2AiU7gmJF71NigwM55kKbfEm6d7lXTJnUwilJewOgLXoRDH8LvAQF+ZuSUb
 b4d/upnnjwD4V9faOPJSOpYFUO2EPvO9Mzm71HLlNsWIeCHhjFCmBLVEje0Gy1U67EZZxw1PK
 7uL7ARi5VXIrJGeUpms/TiVFzwbyvH9D7NbBff0xtJ70Jpgz3dwTkNGgjBR7/xDN4cxNOgpZO
 fhR9qe2lkrQzSfwa5Czl635tmmhdh6miegyv/0VLE87yPp+KySgqYfqf4EvQHi5bt+LqUBluz
 qmtxHFbg2SOwSHxu1DKaH23BSDKThMpRx73VheLA48nKcmrT97nPKK6Dc4dYHnbILqHszMjwN
 z0QqmRLCAOMORT7iZQzvaZ9vkCr3d+eDjXG1RhOQrGikdc7/poMixTx3SVgcA//NCycHnft5O
 jc5eUaVy7v2zRzg/y9z0Bd1T8Hybs0S6d3Uln+go46YJ/9rs77lEDzpKZszaPmWEErX4hMKz1
 SBivMwogw0A/VdwMJLYGHPd9nj5lVsY/5b4NRy8NfGe9yC3zSnVr641J3YYRyQ4mYDa2j/Fmx
 bOiZ1VqGALUeF2BYLeKvgl4Hrr8fO+Vq7qM21RDVKMk/XTvVXFWWD+K1riSOzSZ6fbDXjuMAx
 wMbImohDK8Sk432wOLwBpaxSgv5zfoqBc8EH/XDC9DYYacCh9+LAkuRTcj3mjFxc0LLQeStZC
 NinPdcqTlPRyIoHhg6FuLUppKR3BDm53167m/2A7WIdu4VKTpxThAhkQvkbeJngopBbrt7+9x
 RuqKZwx59Cgs+viBdCuLobzplD1JwA/58VfGRrW5ZutcpsJoBBYy4FnKdtvgUjFtg6qVEpkri
 iFQZSxyYUnhynnc5qUwPR0SNkFgsNbP3lb1fRFOuuWoKmQmRsUQnwsd9Xp4w3Xdoxs7SlSzBk
 mS5EIPbSshURH/CraO5fEmatYZ2WifGq2ZMQNStbUem3+ArfC8McL9d6e5JB7xuR7QQkQBfKY
 lWgYkZiYkRMIpcvBJJb4wTQjjmCRsVknfnzVHELU/2eAfuzQ4WEMhu5HlDV9FBjLFow0/i6jb
 ivigklS30UMbcYnvE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I suppose it is ultimately an application bug=2E I was just hoping that th=
e v4l driver cold somehow artificially restrict the device's feature list s=
o as to make the buggy application (which seems to be pretty much any exist=
ing web conference app) work=2E That would be like the hardware workaround =
but on driver level=2E

I do not yet have the device myself, so I'm relying on information from th=
e website I quoted=2E I very much appreciate that you took the time to repl=
y! I might come back with more concrete questions once I have the device=2E

Thanks a lot! Best,
Stefan

Am 17=2E August 2020 15:34:00 MESZ schrieb Hans Verkuil <hverkuil@xs4all=
=2Enl>:
>On 17/08/2020 14:09, Stefan Witzel wrote:
>> Hello,
>>=20
>> I am not a V4L developer so if this is not the right place to bring
>up
>> the issue please tell me who to contact instead=2E
>> The page [1] documents a problem with a particular device "Elgato Cam
>> Link 4K" which provides various format options among which most
>software
>> does not consciously pick the one which it implicitly expects leading
>to
>> problems=2E There is a software workaround, transcoding and looping
>> through a virtual device and a hardware fix flashing the problematic
>> profiles away=2E
>> However it appears to me that the most satisfactory solution is
>hinted
>> at in the sentence
>>=20
>>> I couldn't find any option in V4L to force selection of 'YUYV
>4:2:2', so instead
>>=20
>> So my question is: what changes would be necessary to allow v4l2-ctl
>to
>> enforce a particular format and who would be the right person to ask
>to
>> make such changes?
>
>It's there already:
>
>v4l2-ctl -v pixelformat=3DYUYV
>
>That will do the trick=2E
>
>If you plug in the device and run 'v4l2-ctl -V', which pixelformat does
>it
>report? I would expect it to be YUYV since that's first in the list=2E
>
>If apps like Discord pick YU12 instead, then that's weird=2E That's
>something that
>the application does, and v4l2-ctl won't help with that=2E I=2Ee=2E, it
>appears to be
>an application bug=2E
>
>One other alternative is that the device has broken 4:2:0 support, i=2Ee=
=2E
>it reports
>these formats, but they don't actually work=2E You can use qv4l2 or
>qvidcap to test
>if these 4:2:0 formats are working=2E
>
>Regards,
>
>	Hans
>
>
>>=20
>> Best regards,
>> Stefan
>>=20
>>=20
>> [1]
>https://assortedhackery=2Ecom/patching-cam-link-to-play-nicer-on-linux/
>>=20
