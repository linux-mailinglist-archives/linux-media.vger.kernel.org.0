Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02603E9048
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237497AbhHKMQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 08:16:21 -0400
Received: from mout.web.de ([212.227.17.11]:51815 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237567AbhHKMPo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 08:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1628684104;
        bh=bCm4tjCEKGya1lR1pfJS85TQJwR1Rm1ZCPAbnHFFDnY=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
        b=Q8udKDx1bKDAh+d0e/JdqRPS12A8y6zNiuCpsHV84dY7OjmQL9dp5xg+ERR9FH/0I
         kqUtRZXJWFlyYdYnnODnn+SyRkxeL8uAfTCuF53WZND+i6Xc6oLKga7y0RW2CyLdon
         K01ta3ghpggqtKcEDr5wNB7zl5u+3L7nQ6vjTm10=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.9.8.2] ([79.220.232.62]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N30dT-1nGIOT19WH-013LMK; Wed, 11
 Aug 2021 14:15:04 +0200
From:   Soeren Moch <smoch@web.de>
Subject: [Regression 5.14] media: dvb userspace api
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
Date:   Wed, 11 Aug 2021 14:15:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:gkYID2/Xgmh9OQpg/093l869RKptm7eldTKehbYkaMJnHdSbpNh
 kLd4NFWd/IX7xBDwfE2wSbZ2ZaEMGCgkidskhH/QdXDCHvtj9QbNkjWsg7UxJEjPKoDvBE4
 aRo2fdFablJOKSWiLZ+kltvfPTNgY/S4dZ9wZNDXpnDB+zHh/xtEgFMT1WbMGZRy/1IhBDb
 Hi1TyPK/G51ZjzKKy2fGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ipRMMrdLfRE=:d6G4NBUEvkchp4GUuoCq8c
 YypMq0u39YRq+4pkrXKNn+MNNCTOJ3XQUTNXdSAqPxFjxOPq6rp5dx+K7rcuITmteh3RFrBo7
 KVY25G+5qFgOjlNrzrSxf2A1yn6aMMIqVlHozVWuBkFYPwLKGYoY/flWh99yLRt79qfOPblD0
 8YACxhGHeOVhN8kDhbMxw7D7dvbt1KPBLpS5cFQv/t/yoEPcZNX0ID4mPoHBSImOKqLSSZHO1
 nx/+YXJlPuwvf918sL+QfuM0RPAUPQe+BlqghzKc4ZWnc1/lPVF4EN/eSfujvxQTHkh7faDvp
 2LfSTanqlo74r2vg9uZqF3XzRGbUJKHSIPfVZ4GW6iC1DEzsQD2afZysvG9jGdZBdzY3/DZMj
 RIPibDts7xIsg4w44WT+vxaw/Tnboj3/tAgeWAGdu5HPcjZHM75XpP8fHh9pio9weWvXZ5OtH
 gWuvER+Z1OFVISLD9F8UTRBA5FXKPhow1yLdzF2jbwJNi6Z/C1ZwsU2tSKnp55u58LFclv7jt
 Rj0+570BrzxRedKRkQzYZUQdFQxrB3w0auVetLYM6zQO1sxia+ek14/9tCWjiFqMFQ0gcIRkJ
 W+0mRMzz5EH/t7iDHKZ+ZCCNBRaNUYnymA1YMKoa+5JgsBrh8c7+lnEn2hijJT8kXgR1jmXy4
 kof0nn8ITChPTe8Hlx16+C5033N4rpeArDjb9+4W4KvWHdekelH844YpxcGbuhOY/ywo0KxcO
 MK21DvypMzQ1+mO6o2DfL0S2gPi9OSYsat7VO/LA3nTwTiH3RHgAVTyThTVY/B4eRqJAzXlBk
 j0h5q8qilDa3IHOwPf+toKvFwgzOLin/pTJTdLlHlUX0ACQH6e9j4zLGMIa5ZsjUVYg/TCs/2
 XW67nUK+8iyRZg67fAhnhJpESYLi0Ujm/VHm8lc+Fx9zBXXbbpmHMkSAvnTKUoyO9nIMuWV5V
 RClkAB8L1ISXlknnhbbOktNs8f/9pYvUacfFuhg1JibwUUi+ij5//TPwJFw10eP6RltLPsfuW
 oicWWay3Kr2/Pu+mijfH/HGGRIt1ijgboZ5VMvwNL1j+CO0FDJ1E63tiWBN0nNrKg73Wl4Ess
 ViVyI7IojLzMEFQKgmfsy7bL+WzrvEUrk6G
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177 ("media: dvb header
files: move some headers to staging") moved audio, video, and osd parts
of the media DVB API to staging and out of kernel headers. But this is
part of the media userspace API, removing this causes regressions. There
already is a RedHat bug filed against this [1], and cannot be resolved
there, of course. Please revert the above mentioned commit.


Linus,

Please help to keep the media DVB API intact. From all my previous
experience with Mauro, he would otherwise just ignore this request and
later claim: it was removed and cannot be brought back. The userspace
behind this API is a program suite called VDR ("video disk recorder"),
which was part of the linux media ecosystem from the beginning, is still
part of linux distributions like RedHat/Fedora, Debian, SuSE, Ubuntu,
easyVDR, yaVDR, is actively developed further, and runs with a bigger
community behind it.
=C2=A0

Mauro,

=46rom many previous discussions you know that the av7110 driver, the DVB
API, and especially also the output part of it, is in active use. I also
asked several times to pull the saa716x driver [2], which also
implements the full DVB API, among others for the successor cards of
saa7146/av7110-based so called full-featured DVB cards. I also offered
several times to maintain both drivers, and the related API.

=46rom your side there was no support whatsoever for this DVB API, you are
fighting to remove it, against better knowledge that this is used. You
gave no technical reason for this. Just, "it is an old API, I don't like
it". And you wrote, that you do not understand it. This probably is the
main reason for all the related problems. Your request to convert
everything from the DVB API to the video4linux2 API is like "I don't
like serial drivers, it is an old API, convert everything from serial to
drm-framebuffer drivers, if you want to get boot messages out of the
kernel."
DVB and v4l2 are totally different APIs with different purpose,
different supported hardware, different supported userspace
applications. Just because there are much more drivers implementing v4l2
than DVB output is no good reason to kill this API, associated drivers
and the community that keeps all this running. If you don't want to
maintain the full DVB API and av7110/saa716x drivers any longer, which
is obvious, there is a better solution than just ripping all this out. I
just renew my offer to take over this job.
If there really is a broken frontend support for av7110, I will have a
look at this. Can you provide more detailed information about this?
There are many flavours of this card with different frontends, so maybe
I missed this. Your commit message "the decoder supports only MPEG2,
with is not compatible with several modern DVB streams" is at least
misleading. The most popular satellite TV provider in Germany (Astra)
still transmits most of the interesting programs MPEG-2 encoded, so also
this is actively used and no reason to retire this card.

In all my previous discussions with maintainers from arm/mvebu, arm/imx,
arm/rockchip, arm/soc, net, net/wireless, staging, usb, I always
experienced technical support and fruitful discussions, which lead to
fixed bugs, working hardware, and happy users.
Only media is special. Here it can take up to five months, 3 full linux
release cycles, to get a patch merged that was marked as fix and marked
for stable, with only a single review comment in all that time: add more
comments. In media the supporter recommends to maintain drivers outside
the kernel, because people are happy with that. Of course nobody in the
related community is happy with that, and maintaining the driver itself
is the easiest part for me. Other people maintain scripts and how-tos
for integrating the driver into different distributions with different
update policies and scripts, that is even more work. All that would not
be necessary, if the driver would just be pulled.
So I really hope we also for media can come to a point, where supporters
support the community, where maintainers maintain drivers they
understand, patches are reviewed benevolently within reasonable time,
and existing drivers with working hardware and happy users, only
implementing long existing APIs (in mainline), are kept working,
especially when someone exits who volunteers to maintain this.

So please
- revert this userspace API breakage still for 5.14
=C2=A0 (commit 819fbd3d8ef36c09576c2a0ffea503f5c46e9177)
- move the related documentation back from staging
=C2=A0 (revert commit 793e52d4e77d49737ad83cb11925c98f4907fcb1)
- move the long existing and working av7110 driver back from staging
=C2=A0 (revert commit 989cf18ed08f8b6efd1d1592d1d0108fa09b98f5)
- consider pulling the saa716x driver (based on the current 5.13 branch,
=C2=A0 I'm happy to provide a new pull request)
- transfer maintainer-ship for this to me
=C2=A0

Linus, if you would accept a direct pull request from me, I would be
happy to provide one, for the requested reverts (for 5.14) of in-tree
DVB API and av7110 driver, but also for the long existing but still
out-of-tree saa716x driver (for 5.15).

Thanks,
Soeren


[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1989125
[2] https://github.com/s-moch/linux-saa716x
