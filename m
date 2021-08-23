Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424F63F4CD8
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 17:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhHWPBE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 11:01:04 -0400
Received: from mout.web.de ([212.227.17.12]:39387 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231983AbhHWPA1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 11:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1629730774;
        bh=a4WhaPT6gv63nVGt/HCEYTkVq5Nbwpq09UjVi6R6Rko=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nfWPxcXtXSwRK+DRdoe6KxHqDvnQ826L6G0Geo+T15kvl488JnVb26qegAlV1jlTo
         nNNTuiLcRc6xI+m3zayXazNPskdbZqaMIjGH1+6IeuIUpQBleTAtcxjuH1HQLmAgGN
         iYXA31K7wWz8im5yC3EyUed+EYJSdZdA155siNeI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.27] ([78.55.218.194]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIc7b-1mEYG83bmP-00EhnP; Mon, 23
 Aug 2021 16:59:34 +0200
Subject: Re: [Regression 5.14] media: dvb userspace api
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
 <20210819133128.45ef4353@coco.lan>
 <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
 <20210822194709.4b9d33d4@coco.lan>
From:   Soeren Moch <smoch@web.de>
Message-ID: <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
Date:   Mon, 23 Aug 2021 16:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822194709.4b9d33d4@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Provags-ID: V03:K1:OZ1j3746lwf4K/MJbCkfQ7YyOEGaSPBJFZMQ1Tb1rsPZckluR9y
 q1GLqkbCTO1LfpEIpDaJ8KqDTlz1R0N4Crb38CvqxP8CmwjuoV2JFsNaC9K4y0iiFjEYoGC
 I+vGhvnX9Hmaifm2PMfUi32ei9T/rnw/XM0JDIsYlBN79twQUSfc44Gwh5cNwF1nz58xbB+
 ebhwHdZ6XH/zyGElIW+6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E5kDviQ3xkY=:AG92lOO2Uljb8DJA2ylU9L
 ngdpE5EjJRMp4Pr77m5T0J/W8FN/J4jG3VLFYPivJrXegAqvVE+HudJ5WpLrX+bQ6LXXgHtpe
 2F7BDkzNv6eImd8buVRvP0PwUHgoZNCe7G/ej6JM1tWk+PYYAFG5NCxReZq8ypaL/mNXRud7P
 SzBHB0TEz55+ZG/W/Wug1kSfNuR0eWuCTglP5sITFGqRRG8CRL+LOyJYzF8HNRBMeZca3bGxt
 YnPwiTds861YsSCFBCSZ/pJUM8lAi0gHZ1oMJGMHbBg7lLaDcD/7A2XPQCqv4a63edt9yq+3O
 V9CT6DCSTrQmWZ7K2eGH4FgjSZVl/spk6xN5N2/JIeNUBavLcxf9KiPx/VnObDiyByAlwGqfu
 xr+//rSHAm5fuqbbFdltCQBcWzrRFPGPQZk5pCvwvBu7gQAwbBAupjb8r8bbAbRsEbeQQNxsi
 x6G4SyuV8VRkyEAgJ7n2P4mXRPNQOV5IvBCS7R+/4YexEqEcTNnstSWZNMQYHXRkhwClyst7t
 B5mvg/LNPcwX9lzXHeawyRqRx4vb6NyMiz5KCqxcj3t8VSlz/i73pERETSkIWE4UZhhhelqKO
 rxGgKAU/WdTi9tOUJbGnFSJATfGZ4+vCebmvdM1cjFNZCGvJ9y4oRg0+9j+FMPohxAd8XnF+R
 TF8cuDeNmnkWeC7acJtc3YaszgDtkEQjKJasAsbllpNmyJ8CzBw7NLkKzmDH0hq9TGXPBBHUc
 i+zVaQuXFg0PFjaORhIPvZZgfdWd9IZFJJctW8wRD/IKKNLfmKnKR/MHJFmTUhabT7HTYi+th
 sFwZ1j8tXZdOCyh3kbRaVlntKALAyBtPJr+Dw+Q6QupmZcwnKRPBQkPrdcTG1YxyVHAeZMjBD
 bBe+fPL4UvXBEdEHYeW0eE3cjjSZcOlSI4sxECXFhxBsIk1MYP7TsIE1ndVcW0eBt69hl6i4g
 +J0IMlgU+dP+qXo0HvtkOEVHEm2HRjNsvFUsCdW1y3J90X+/B0HJ9HOHUMhsSFCA0jNNMiw7A
 zipfV8WM8BvDe8K/i/AOP/2ksMmhlyzZG60U8FXt2PHGzO2hewXxgeD4kvRLNxtWsrEz4ksPi
 J6N4VfHqZzag392k4/lvSacG7RREQIJn+6Y
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 22.08.21 19:47, Mauro Carvalho Chehab wrote:
> Em Sun, 22 Aug 2021 17:21:41 +0200
> Soeren Moch <smoch@web.de> escreveu:
>
>>> There's no regression: a legacy driver (av7110) for a device that stop=
ped
>>> being manufactured 15 years ago and that doesn't work anymore with cur=
rent
>>> Digital TV transmissions was removed, together with the API that it wa=
s
>>> implemented inside such driver's code.
>> What you write here is simply not true.
>>
>> The "device" (saa7146/av7110-based full-featured DVB card) is working
>> well.
> Probably not true - at least for some av7110-based boards - as there was=
 a
> regression that no user ever noticed:
>
> 	https://lore.kernel.org/lkml/20210503115736.2104747-59-gregkh@linuxfoun=
dation.org/
Did you read the patch? Ignoring errors may be wrong, but this causes no
regression for any user because i2c transfers to the frontend simply
just succeed always in normal operation.

BTW, for me this is another mess you created here. Why did you move the
frontend driver out of the dvb-frontends directory into the av7110
driver, that as such is totally independent from the sp8870 frontend?
>
> This was noticed only too late, due to a review of the offended patch
> caused by "hypocrite commits"[1].
>
> [1] https://lwn.net/Articles/854645/.
All this is totally unrelated to this regression report on the DVB
userspace API.
>
>> Also with current Digital TV transmissions (e.g. Astra Satellite
>> TV in Europe). The DVB API never was implemented in driver's code, it i=
s
>> linux userspace API (include/uapi/linux/dvb/).
> The DVB API used by all upstream drivers is implemented inside the DVB
> core (at drivers/media/dvb-core/).
Simply not true.
The headers in include/uapi/linux/dvb/ define the DVB userspace API.
Parts of this API have only one in-tree user: the saa7146/av7110
driver.=C2=A0 Other parts are used from many drivers for tens, probably
hundreds, of different hardware devices, so common helper functions in
dvb-core make sense.
>
> The "full-featured" API consists on the DVB API + some extra ioctls
> defined at the uAPI headers, plus an av7110 implementation, which
> covered only part of the ioctls that were defined at the headers.
The DVB API is a well-designed API, in contrast to what you repeatedly
claim designed independently from special hardware requirements.
There are several parts of the API (frontend, dmx, ca, net, audio,
video, osd). Hardware devices implementing all related functionality are
called "full-featured cards" (in contrast to budget cards or e.g. all
types of DVB sticks that usually implement input functionality related
to the frontend and dmx part of the API, there is no "full-featured API").
All defined API calls are integral part of the API, there are no "extra
ioctls" just because you personally like some API calls more than others.

Yes, not all defined API calls had been used by in-tree drivers. You
already removed these API call definitions some time ago, what causes
real pain for the users of the out-of-tree saa716x driver with no
advantage for in-tree linux-media. But at least this did not cause
regressions for in-tree drivers and the related userspace applications.

This time you removed API call definitions that are used by the in-tree
saa7146/av7110 driver. This causes regressions for the users of this
in-tree driver, because the related userspace-application stops to
build. This exactly is what this regression report is about.
>
>> You moved files out of the uapi part of kernel headers, parts of e.g.
>> RedHat userspace stops to build due to this. So it is a userspace
>> regression.
> Again, this is not a Kernel regression.
Yes, it is a userspace regression caused by your changes of the linux
DVB userspace API.
> There isn't a single bit of
> code inside the Kernel that it would require the "full-feat" uapi.
This is obviously wrong, since the in-tree saa7146/av7110 driver
implements the removed API call definitions.
>
> If an app implements support to some OOT driver(s), it has to carry on t=
he
> OOT userspace code for such driver(s), together with any needed headers =
for
> such support. So, you should submit a patch to such app maintainers
> directly - and/or to the distro packages that would have packages
> providing support for such OOT driver(s).
>
> Btw, as far as I'm aware, Red Hat's Kernels don't come with the
> saa716x OOT driver.
Mauro, please stop spreading FUD.
This regression report is about the part of the DVB API that is
implemented by the in-tree saa7146/av7110 driver and it's related userspac=
e.
Both are part of the RedHat linux distribution.
>
>>> The av7110 production stopped ~15 years ago.
>> But the cards work perfectly well. I own two such cards, there is no
>> problem at all with them. Other members of the community even test with
>> -rc3 kernels and file RedHat bugs. So there clearly is interest in them=
.
> Nobody is telling otherwise. If people want to use OOT drivers, that's
> OK. Nobody is preventing people to use it, nor to use the apps developed
> for such devices.
This discussion here is about av7110, see the 3rd-level citation "The
av7110 production stopped ~15 years ago." above.
And the saa7146/av7110 driver is in-tree, and the related userspace
experences regressions that I report here.
>
> Keeping av7110 in-kernel has been a waste of limited upstream developmen=
t
> resources.
Simply not true.
The driver is used, therefore it is not wasted time to maintain it.
And for years I repeatedly offered to do this maintenance, transfer
maintainer-ship and you immediately git rid of this "overwhelming
burden" to maintain this driver.
As additional advantage I understand the driver and related API, do the
required maintenance for the similar saa716x driver (out-of-tree)
anyway, and have hardware to test (for both drivers).
> A couple of years ago, we needed to fix the av7110 API due to
> year-2038 issues.
Simply not true.
Nothing in this driver or the DVB API is related to wall-clock time.
Only DVB timestamps are used. So there is no year-2038 issue.
> From time to time, we get bugs affecting it (even security
> ones), as the code has been bit-rotting for a long time.
Simply not true.
Oliver Endriss did a great job in maintaining this driver, and it still
works perfectly fine.
> The most recent one
> probably broke the driver without nobody noticing it for a couple of Ker=
nel
> reviews, as mentioned above.
No, see above. The linked patch caused a bug, but no user-visible
regression.
And this DVB-T frontend is optional anyway and not very popular.
>
>>> This is a legacy hardware, which supports only the first generation of=
 DVB
>>> standards, and had an integrated MPEG-2 decoder. As most DVB transmiss=
ions
>>> use MPEG4 or newer encoding schemas that didn't exist back in 1999, it
>>> doesn't make any sense keeping such driver upstream nowadays.
>> As I wrote in my previous email: most private TV stations in Germany
>> provide their free-to-air satellite programs MPEG-2 encoded only.
>> Therefore this is very popular and it absolutely makes sense to keep
>> this driver upstream.
> It is probably a lot easier to get a modern DVB "budget" card with
> supports not only MPEG-2 but all encoding standards than to find an
> old "full-feat" DVB card with av7110 those days.
Maybe. But when the most popular satellite TV provider broadcasts MPEG-2
encoded video and people are happy with their working cards, why throw
away a running system? Besides that, people usually use full-featured
cards together with additional modern budget cards/sticks to be able to
record different DVB programs while seeing a different program as liveview=
.
>
> Who still provides saa71xx chips those days? As far as I'm aware,
> Philips semiconductors (who used to produce such chipsets) was split
> into NXP in 2006, and the entire digital TV chipset line moved
> altogether. I can't find any references those days to any saa71xx
> at either NXP or Philips websites.
This documentation is only provided with non-disclosure agreement.
Luckily I received such documentation under NDA together with firmware
code and schematics. So I am in a very good position to maintain this.
>>> The API that got removed was written to control the av7110 MPEG-2 deco=
der,
>>> and was never integrated at the DVB core: the av7110 had a driver-spec=
ific
>>> implementation inside its code.
>> This is simply not true.
>> The DVB API is linux userspace API, absolutely nothing driver specific
>> inside driver's code.
> From upstream PoV, it is an av7110-specific API, as all in-kernel suppor=
t
> was inside av7110 driver's code.
And from userspace point-of-view ist is linux userspace API.
>
>>> The saa716x driver you're mentioned is an out of tree driver.
>>> We don't keep APIs at the upstream Kernel due to OOT drivers.
>> Strong words to distract from the main point:
>> This regression report is about upstream DVB userspace API and the
>> saa7146/av7110 driver, both part of mainline linux for a long time.
> Removing a legacy driver is not a regression.
This in-tree driver is actively used by a whole community and works
perfectly fine. The corresponding userspace applications are in many
major linux distributions. Why are you fighting so hard to remove this
driver and kill the community and the userspace behind it?

If linux would only contain drivers for hardware that is personally used
by subsystem maintainers, then I think this would be a very poor user
experience.
> See, you're the one
> trying to distract from the main point:
>
> The saa716x driver is OOT. There was never any upstream support
> for it. None of the patches you're mentioning prevents anyone
> to keep building it as an OOT driver.
>
> What it was removed was the av7110, together with the API header
> files that were used only by this single driver.
And the userspace. And this causes regressions, e.g. in RedHat. And this
is what this regression report is about.
>
>> you stripped almost everything from my previous email, you did not
>> answer any questions or gave any explanation for your behavior.
> I striped the points already discussed with you when I gave you
> feedback about the saa716x patchset [2], as this is a completely
> separate discussion than the removal of av7110 support.
It's indeed a separate discussion. But you brought up this topic here.
If someone wants to learn how something works and why it is implemented
the way it is, I'm happy to explain. Unfortunately you always
immediately shoot down this discussion with: implement something else,
no explanation why, no technical discussion about pros and cons of
alternative implementations.
>
> In summary, it makes no sense to claim that saa716x OOT driver
> broke because a different driver was removed upstream.
I nowhere claimed that. It's not me who is bending truth and twisting
words all the time.
>
> Thanks,
> Mauro
>
> [2] https://lore.kernel.org/linux-media/20180307121438.389f411c@vento.la=
n/
Mauro, please explain why you act as you do, especially as this is so
totally different from what I know from other linux subsystems.

There is a great DVB API and lots of drivers implementing it upstream
for decades. There is a community behind it and related userspace in
many major linux distributions. Working hardware also in newer generations=
.

You do not understand this API (as you wrote yourself), but you kill all
technical discussions immediately when I explain details.

You write maintaining this DVB API and drivers is "waste of limited
upstream development resources", but you completely ignore my offer to
take over maintainer-ship and kill every reference to this offer
immediately in your answers. On the other side there is apparently
plenty of time for whitespace cleanup, comment cleanup, character
encoding cleanup, documentation reference fixes. There is nothing wrong
with this, but I think it's a bad excuse for not having time to maintain
DVB drivers (for what you are paid according to the MAINTAINERS entry).

You recommend to maintain drivers out-of-tree, just because you don't
like the API the driver implements, although this API is part of linux
media for decades. No technical discussions, no idea how to support the
community.

Now you try to kill working in-tree drivers, you cause regressions for
existing userspace applications. No explanation of any reasons, no idea
how to solve this issue. No effort to work with the community.
No progress here in all the emails in this thread. For me every answer
sounds like: I do what I want anyway, shut up! Or which point I missed her=
e?


Linus,

Is what I described directly above the new linux maintenance policy?=C2=A0=
 Or
is linux media a private kingdom where the community should keep away?
Is this a place where the subsystem maintainer is on a mission to
destroy everything instead of maintaining and improving it? Please tell
me what I understood wrong here.

Thanks,
Soeren

