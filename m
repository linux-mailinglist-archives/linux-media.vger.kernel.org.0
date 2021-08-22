Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76F13F4040
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 17:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233748AbhHVPWe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 11:22:34 -0400
Received: from mout.web.de ([212.227.15.3]:41217 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230462AbhHVPWd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 11:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1629645708;
        bh=860Zt+JramQEvlQidiEkBsuSHJWmICEbxRRSx945PJ8=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:References:Date:In-Reply-To;
        b=JUEBEGO4nEdHugiTbr3TXVSD9Ur/fLlBB3zAht/9Fd+5hWhvx6f/yo5eXZrSdvCpl
         r7mtWrynB69zBlECDhKEK+/myfp2Qo+CiVLHoGDbM5fRo0RzDHB818MVPs0HVO+kyv
         yhws7LcWdWl6TD0/FRtw/daDZhNgDr6nW3p7sQcQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([77.13.235.78]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LgHau-1mnqfY2UDc-00nfBH; Sun, 22
 Aug 2021 17:21:48 +0200
From:   Soeren Moch <smoch@web.de>
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
 <20210819133128.45ef4353@coco.lan>
Message-ID: <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
Date:   Sun, 22 Aug 2021 17:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819133128.45ef4353@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:fqcIm+vf8kqr3TA5mGerxA+BaQ2XZ7dQ/Xjtp4SovAstTl3Ji9W
 YMeWBLs0bU9hoz551N5bOTPgbvphBMGqYCMMt3z4K19HJBQyqOgf1WSPEHC+pAH6v9wzA7h
 CXB5XIMmjQxSl9TIgPXRm18rIAX77+n8QXyWsh7eLeNhEnomjKszzk+5mh6oNflDsncwmK8
 9u8EeMRY7WEdwlWUADl0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NyD+xiZCus8=:8u4Sr9WKgXbVtdIQ9iIQHd
 +R90NRpdbxNcFqxgAehNsk+vT8JdCLmmfm90OKwqncL6NLJ44P713XqDnDYmRZPQYoinqR2Cm
 OXlHsE7ISitpEb97A7g6JgZpvkiLeeR8IOcVmTpumm1jB4ncuysnxr+tIef+pv2tqXZJ2VjaH
 x03GySlOSmzjqln3xJA5CY0lQwu9H/HqVRdjvW4dQw7n0SblEUsC0k7hf0JQa92dpSBJ354RQ
 DJxREpbRcehLFNsIs45bsrJNXuMuPpH0+C2fT+CXRqAg1m9tesioyttMSXKV/Itgfqyh3es0U
 Yf70L9mpF3gpXcnTp/aZ0PhIr2mUdZ/HGRzNK5WsOMGwxdZKy+n2AZVH7BgMv7293t3YO31bt
 P89s3jIhACxAX6tMcZU6trdRJvSFtg6Oxwi4osr2IZi+8sy940z8uLeFmwhd+Zzq22QSIUfx2
 ltfi8E8FkngOcKI9ymC/RX4fBknx04dsGvX0WpiFnxxxfrZ4lkZ+qewcAKjlehnZKGzOdaNkA
 UfOL32qlO1Y4BZnhBQ1xSuC0Cei0YjC1eUSoOkxvpk72BYrh66jy5yfnpYz5pdO+pbt0tBdOz
 s5YRoMtwVzqdVWE6bI1dU/vYl1wDbAMM5J7MiME98iSugmRuPoMfRWWjHj0Vsbj90kB+TBRmR
 /B5dGBFt+TMTv3HDn95r5yiUxj6tzgt1Y25Yro6FAKMLftCth/rRFUW+aaqAZotaQJMkbqN6t
 7cU8cwtcsgVI9LMZte+sNtbfPKPYPU5wK16LLNikRPK+GqOuzLHNzKxGxY2NcnfuyqBZ3t/i3
 Wz81rhgt9CFwyWkljDu3KnyCfgVkOoQixSnlwyOQ3DlSrHQYLQTjQT8kVKR56VSZd4B7UIDnW
 Za9gxJnM/TDqTBGtQ+r2OO2p7K3Zbh6v6nGpAQcNpwEzLxzSUyUYInNcENYFzZ6R8NX9/s40g
 wMVFAP7EptntyKNDH7Saont8latoRmtKPYQZFVi4WCUSSR4b3bvUrJX7O7WAdsa0H7AHaSDNC
 T5ysCoR7bfepM3luo0eqJU4DHhMXdcbKSb3hfXVlE+jQASS8n4F+MYnScv0dlR1ADYz+hgiSF
 3bp5EA66vWo+iejl5Iecv60ezAuqKndnZYs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 19.08.21 13:31, Mauro Carvalho Chehab wrote:
> Em Wed, 11 Aug 2021 14:15:02 +0200
> Soeren Moch <smoch@web.de> escreveu:
>
>> Commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177 ("media: dvb header
>> files: move some headers to staging") moved audio, video, and osd parts
>> of the media DVB API to staging and out of kernel headers. But this is
>> part of the media userspace API, removing this causes regressions.
> There's no regression: a legacy driver (av7110) for a device that stoppe=
d
> being manufactured 15 years ago and that doesn't work anymore with curre=
nt
> Digital TV transmissions was removed, together with the API that it was
> implemented inside such driver's code.
What you write here is simply not true.

The "device" (saa7146/av7110-based full-featured DVB card) is working
well. Also with current Digital TV transmissions (e.g. Astra Satellite
TV in Europe). The DVB API never was implemented in driver's code, it is
linux userspace API (include/uapi/linux/dvb/).

You moved files out of the uapi part of kernel headers, parts of e.g.
RedHat userspace stops to build due to this. So it is a userspace
regression.
> More details below.
>
>> There
>> already is a RedHat bug filed against this [1], and cannot be resolved
>> there, of course. Please revert the above mentioned commit.
>>
>>
>> Linus,
>>
>> Please help to keep the media DVB API intact. From all my previous
>> experience with Mauro, he would otherwise just ignore this request and
>> later claim: it was removed and cannot be brought back. The userspace
>> behind this API is a program suite called VDR ("video disk recorder"),
>> which was part of the linux media ecosystem from the beginning, is stil=
l
>> part of linux distributions like RedHat/Fedora, Debian, SuSE, Ubuntu,
>> easyVDR, yaVDR, is actively developed further, and runs with a bigger
>> community behind it.
>> =C2=A0
>>
>> Mauro,
>>
>> From many previous discussions you know that the av7110 driver, the DVB
>> API, and especially also the output part of it, is in active use.
> The av7110 hardware was developed up to 1999. Its Linux API was implemen=
ted
> by a company called Convergence which has long gone (they stopped workin=
g
> on it back in 2004, afaikt). The av7110 production stopped ~15 years ago=
.
But the cards work perfectly well. I own two such cards, there is no
problem at all with them. Other members of the community even test with
-rc3 kernels and file RedHat bugs. So there clearly is interest in them.

The DVB API was developed by Convergence, maintained by folks on
linuxtv.org later, adopted by other companies (Fujitsu-Siemens,
Technotrend) which developed boards and maintained drivers. There still
is a community behind this, e.g. on vdr-portal.de .
> This is a legacy hardware, which supports only the first generation of D=
VB
> standards, and had an integrated MPEG-2 decoder. As most DVB transmissio=
ns
> use MPEG4 or newer encoding schemas that didn't exist back in 1999, it
> doesn't make any sense keeping such driver upstream nowadays.
As I wrote in my previous email: most private TV stations in Germany
provide their free-to-air satellite programs MPEG-2 encoded only.
Therefore this is very popular and it absolutely makes sense to keep
this driver upstream.
> The API that got removed was written to control the av7110 MPEG-2 decode=
r,
> and was never integrated at the DVB core: the av7110 had a driver-specif=
ic
> implementation inside its code.
This is simply not true.
The DVB API is linux userspace API, absolutely nothing driver specific
inside driver's code.

Also this API is not specific to any audio or video encoding standard as
you imply here.
> Besides that, the API was never fully documented: there are several ioct=
ls
> from the now removed API that never had any in-kernel implementation, no=
r
> had and descriptions at the specs. None of the current upstream maintain=
ers
> have any glue about what such ioctls are supposed to do, nor do we have =
any
> av7110 hardware to test it.
It's not the fault of the community that you have no clue about this API.
So let someone maintain this API and driver who has clue about API,
driver, hardware and the userspace behind all this.
>> I also
>> asked several times to pull the saa716x driver [2], which also
>> implements the full DVB API, among others for the successor cards of
>> saa7146/av7110-based so called full-featured DVB cards. I also offered
>> several times to maintain both drivers, and the related API.
> The saa716x driver you're mentioned is an out of tree driver.
> We don't keep APIs at the upstream Kernel due to OOT drivers.
Strong words to distract from the main point:
This regression report is about upstream DVB userspace API and the
saa7146/av7110 driver, both part of mainline linux for a long time.
> Btw, there's no need for that: if you have an OOT tree, you can simply
> place the API headers for whatever API your device requires.
Thanks for answering questions that nobody asked.
> -
>
> Now, if you want to upstream your driver, I gave you already a
> way to do it in the past: we need to develop an interface that it
> is not dependent on any hardware-specific functionality, but can
> be evolved with time and can support different families of codec
> protocols. It should also be properly documented.
The DVB API already is an interface that is not dependent on
hardware-specific functionality. This can be seen easily as the exact
same userspace API is used by the saa7146/av7110 and by the saa716x
driver for totally different hardware. The DVB API is about sending and
receiving DVB streams and controlling hardware that is related to that
(e.g. PID filters, conditional access devices, OSDs). There is nothing
about controlling codecs in this API, as I already told you. You will
not find any documentation about how this API controls codecs, because
it simply is not used for this purpose. The DVB API does not care about
the type of audio and video streams that are encapsulated in the DVB
stream. The DVB output API is designed to not even know if a stream is
sent to a codec device, it could e.g. be a dvb-t modulator or any other
type of DVB transmission device.
> Those are the goals already achieved by the V4L2 codec API:
> it already supports MPEG2, MPEG4, HEVC and other types of codec,
> and can easily be integrated with a DVB device via the media
> controller API.
V4L2 is great for controlling codecs. But there is no such functionality
required in the saa716x driver, so why should I use this API there?

The TT S2-6400 card can of course handle MPEG-4 AVC, I also told you
that. Why do you repeatedly refuse to accept this fact? The DVB API
simply does not care about codecs, so the saa716x driver does not need
to know at which point in time it sends a DVB stream with MPEG-2 encoded
video, or when with MPEG-4 AVC encoded video, or HEVC, or VVC. There is
nothing to control for v4l2.

Mauro, since you wrote again you have no clue about the DVB output API,
please stop spreading wrong claims about this API. Please stop fighting
against the community that uses this API, long existing drivers
implementing it, and existing and working related hardware. If you don't
can or want to maintain this API, let others do the job.

Also please explain what exact problem you encountered with
full-featured DVB cards, that you think is so severe to justify the
removal of the driver. Especially as you wrote above that you do not
know the driver (and probably the related userspace application) and
have no hardware to test.

> Thanks,
> Mauro
Mauro,
you stripped almost everything from my previous email, you did not
answer any questions or gave any explanation for your behavior.
You refused the fact, that you caused userspace regressions, this is
what this email thread is about. What is that supposed to mean? You
really do not know the difference between linux userspace API and
private driver headers?

Your answer was not helpful at all in resolving the reported regression.
So I repeat my request from the previous email:
Please
- revert this userspace API breakage still for 5.14
=C2=A0=C2=A0 (commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177)
- move the related documentation back from staging
=C2=A0=C2=A0 (revert commit 793e52d4e77d49737ad83cb11925c98f4907fcb1)
- move the long existing and working av7110 driver back from staging
=C2=A0=C2=A0 (revert commit 989cf18ed08f8b6efd1d1592d1d0108fa09b98f5)
- consider pulling the saa716x driver (based on the current 5.13 branch,
=C2=A0=C2=A0 I'm happy to provide a new pull request)
- transfer maintainer-ship for this to me

Regards,
Soeren

