Return-Path: <linux-media+bounces-1690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B727F805E7A
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 20:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 692C4B21119
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 19:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D746D1D7;
	Tue,  5 Dec 2023 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gt9sLDon"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A525C188
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 11:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701803888; x=1702408688; i=wahrenst@gmx.net;
	bh=KI1+Y8fdfOQSL9W8lxPeCK55g2DzejtsREPuvBG7UgI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=gt9sLDonty5kNO5nsLaBhye7qQXnQCBsciDVrJN5Dg5tupE/w3hggQ7AqUoGC+mA
	 UBrLDO5Hqo3X46kulPmecr43BQRsN0vgXy8lQggxEArmsOkLlrAwlpEgTOONY0fvD
	 yFIP7xn7wHyw0jx2hu8Hf1Z+V6tbGMSlp0alk/H3eKQhjf8FmmL1qKjlJb9ZIox3v
	 cauco29aXfDomrzKwnNmXzPxLavb2EWB+dlzCQVMuZdSfCVgf5yz249HAOxgmM5jq
	 cCIzW/mWY4wN7yIojEJYvGPIhZPBHbOSXwz1rsDNPprmxjN8OnILbXiOIOAOEZlzU
	 tRMmgPC6GARAsf7sTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1rbdD41P9q-00qVwy; Tue, 05
 Dec 2023 20:18:08 +0100
Message-ID: <8d3304d4-743c-4670-ad8d-d31535738664@gmx.net>
Date: Tue, 5 Dec 2023 20:18:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] staging: vc04_services: Drop custom logging
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231128201926.489269-1-umang.jain@ideasonboard.com>
 <42cd081f-bee9-49ff-b8f6-17ec58f43058@gmx.net>
 <a87efe94-b3fb-a360-dfcd-db2097b89d6f@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <a87efe94-b3fb-a360-dfcd-db2097b89d6f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rZXCDokQ3qd9YviLdzrUIpWlqoNoLBBDXMQei1RmQvivnga2goy
 m/d31KtwSsiiX+6ACmIrCQi0AlReBhzVjatsOe6GJ779W12vQc+06zvSETvGF+nSIdykGBJ
 i31PEAU0wtTKPd9ra5VCPQICoBqHbTcHA3WVwStC1+bQ0ONhdlItVfq87G7SkAerVq7hLa3
 5UGGKTEXYYf/Xw3587aJw==
UI-OutboundReport: notjunk:1;M01:P0:jZcQ03A9bW4=;FNHseeRlwZ41rVS3cMhmQN9LN0I
 u/UWy7tGBNjA7ld1DByldFfdq7FwQc1uMX71XdxSMWhzm/L+3tqfcmQW08B9/0fxneQKBb30b
 Chh6jhDB/ymH4ERuX4OXmST6nPx3/+5Sqg/8Sz+vmUC3TBRWecpzz8MNdcLigWROjigLWt0Lq
 f3NzfGC0m0WpoDFBMWFMWYSfdXFKqjIxtbSjagwOaq1CslGg/IZRBLsNVUs++WZZu/RQyD/Gs
 UuO8pq2sYBLY+ke49LqS/sw3ph93SzrY8vVfxSZkndnpT43cW+Ym2hyQzehqzBW5JETmv4LeR
 r8pxzf81Fss1JEGRIZKR1p6LTMLdZyb7/AhyG2xw+JMxJW4wwnTj+aJ61uvezneqiRfjMzkKh
 mC7M4ZL3LUwybJ0xOoLZKRCoFJy4UnQgO9SqT5ZFT6mbNEbPz6qDiVD1jmSO3zRA+vbQWaYZr
 3OHgUqfLt4W81NBYqiG3FxzgXzDval+54PX389LYRCuKDtsDzMobgqJfibqBy2mOJU0AtusqP
 N+v2sguD+rXRoWxVT/u1DSjWU3Y08aORKOFJ00oSL5++oZzm3T1mQ6c57eit5L80TpZDZXDWg
 Inq9+bLZPZFYAnmoEhqOwLg7740RlHEzwBeS6jSq+t4xrDj/ibtKbF2y20ij3VdZuX8eFEw5X
 U/wg519LGiDrdO2N/O0suZlIGEiTZfUo97fWn9fTKHroL5iCWmK0XD/WK0ksVi+BeB/h46Wxr
 UPiby6om7M8s47B4oV3EomIKpJ3NiNl/G1W9qf+pWj/Yt32Ladj1CtwsjC0eSA2xOqRBzJcTT
 O+XWPzo/VNQnonlljDGqt+o3M33o3fOS5Ar2MO51dE3mCtkul+XIlAd8HZT/qNhZvy9IhPb4u
 YXUmuIHQVWzxpQf25/BdKPZ86YhgsxH1Udc2IrbIVGAXc7xTupolF6s6PDG7qSC+fG2nvT/Fb
 kvVkQlstiTyZ+12jYUFUZ810AzE=

Hi Umang,

Am 05.12.23 um 07:39 schrieb Umang Jain:
> Hi Stefan,
>
> On 11/29/23 4:56 AM, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 28.11.23 um 21:19 schrieb Umang Jain:
>>> This series also removes the vchiq_log_* macro and makes use of
>>> dev_dbg()
>>> directly.
>> sorry, i didn't had the time to follow the logging discussion, but the
>> following commits:
>>
>> staging: vc04: Convert vchiq_log_error() to use dynamic debug
>> staging: vc04: Convert vchiq_log_warning() to use dynamic debug
>> staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debu=
g
>>
>> changed the logging behavior. I don't think it's intended to move
>> everything to dev_dbg.
>>
>> I would expected the following mapping:
>> vchiq_log_error -> dev_err
>> vchiq_log_warning -> dev_warn
>
> For this I agree,
>> vchiq_log_info -> dev_info
>
> However, I think vchiq_log_info and vchiq_log_debug should be moved to
> dev_dbg.
>
> Otherwise, I think they'll spew a ton of information to dmesg by default=
.

generally i agree. Unfortunately we need to double check every log
message, because some of them are unnecessary.

>>>
>>> Patch 1/5 is fix. It prevents passing NULL to one of vchiq_log_error()=
.
>>> The function there in question, does not have any users as of
>>> now. However, it is going to be used by the vc-sm-cma and bcm2835-isp
>>> drivers (posted on list for review [1]). There was discussion on v1,
>>> whether I should drop and add the function later, however, didn't
>>> conclude.
>>>
>>> Patch 2/5 removes vchiq_log_error() macro
>>> Patch 3/5 removes vchiq_log_warning() macro
>>> Patch 4/5 removes vchiq_log_trace() macro
>>> Patch 5/5 removes vchiq_log_debug() macro
>>>
>>> This completes the following TODO item:
>>>
>>> ```
>>> * Cleanup logging mechanism
>>>
>>> The driver should probably be using the standard kernel logging
>>> mechanisms
>>> such as dev_info, dev_dbg, and friends.
>>> ```
>>>
>>> [1]:
>>> https://lore.kernel.org/linux-media/20231109210309.638594-1-umang.jain=
@ideasonboard.com/
>>>
>>> Changes in v2:
>>> - Separate out one fixup patch from v1 (Patch 1/9)and send separately
>>> - Drop usage of log_type() and log_category() helpers. Directly use
>>> =C2=A0=C2=A0 dev_dbg() as suggested by Greg KH.
>>> - Drop __func__ annotation from all logs. Dynamic debug has 'f'
>>> =C2=A0=C2=A0 decorator flag which can be used instead of manual __func=
__
>>> - Reword commit messages.
>>>
>>> Umang Jain (5):
>>> =C2=A0=C2=A0 staging: vc04_services: Do not pass NULL to vchiq_log_err=
or()
>>> =C2=A0=C2=A0 staging: vc04_services: Drop vchiq_log_error() in favour =
of dev_dbg
>>> =C2=A0=C2=A0 staging: vc04_services: Drop vchiq_log_warning() in favou=
r of
>>> dev_dbg
>>> =C2=A0=C2=A0 staging: vc04_services: Drop vchiq_log_trace() in favour =
of dev_dbg
>>> =C2=A0=C2=A0 staging: vc04_services: Drop vchiq_log_debug() in favour =
of dev_dbg
>>>
>>> =C2=A0 drivers/staging/vc04_services/interface/TODO=C2=A0 |=C2=A0=C2=
=A0 5 -
>>> =C2=A0 .../interface/vchiq_arm/vchiq_arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 176 ++++----
>>> =C2=A0 .../interface/vchiq_arm/vchiq_connected.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 8 +-
>>> =C2=A0 .../interface/vchiq_arm/vchiq_connected.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +-
>>> =C2=A0 .../interface/vchiq_arm/vchiq_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 402
>>> +++++++++---------
>>> =C2=A0 .../interface/vchiq_arm/vchiq_core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 38 --
>>> =C2=A0 .../interface/vchiq_arm/vchiq_dev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 92 ++--
>>> =C2=A0 7 files changed, 315 insertions(+), 410 deletions(-)
>>>
>>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


