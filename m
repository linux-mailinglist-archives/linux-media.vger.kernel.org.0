Return-Path: <linux-media+bounces-1300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C557FCAD2
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 00:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAC2283008
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 23:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD0359B5C;
	Tue, 28 Nov 2023 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mk3r3nnd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5B21AD
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 15:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701214008; x=1701818808; i=wahrenst@gmx.net;
	bh=7VxZ5irguCzXklSt6/a5AmmzzZot3iiHbJURCJI+0B4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=mk3r3nnd7Pqb0nToNoGG+7mzyOKKVEJFyKk474WkL/VJ9ud0X5bXFkavl6SL157Y
	 zI/up6AvSCiYavJHDe1KJXk6IS1tk+hUXSf1g4x5M7XHkVvu7N2j+Mtvc7gP5zTtp
	 +qDNdmIVDCpcAH+7eLWOMHWxApkxjZ9cp3EFcSM8wxx8iWNc8jPpacMYSNdC68j9W
	 WzAyH0ppnZB5xcKqJABmXqjs2Wvi+PTeJlnvoXAjK/lnt62LzcBVMsNIdSWCQZcRh
	 7myBtV8Sk9HUpWyEDjoE2oi6r8XEnjFbMO2wcSFIyoBd8OICMipaZJK2+LYhGtwub
	 4oD3mTwd/TU2DVHzJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wll-1rJR7R0Fi5-012FyQ; Wed, 29
 Nov 2023 00:26:48 +0100
Message-ID: <42cd081f-bee9-49ff-b8f6-17ec58f43058@gmx.net>
Date: Wed, 29 Nov 2023 00:26:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] staging: vc04_services: Drop custom logging
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231128201926.489269-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u3zco7Ilg0AUWIFZ/Opll0dTjNVQtg///HlPNwlcSPJFHNpdSab
 FOYjs2uygLdgFGzsSI/bAmNqMXSqIs4HPfmU69WFHlddX3jOSadk8EkP34veWO0coi8P31x
 HwYVKw+ZgMLWO7yCuzq2spYCDDjrPRI1MyVNxuS26ObOBi1ywxJZ6dafvFkO7zyJZ1RZXvE
 PPltKxwDpbAWC1SDaGCow==
UI-OutboundReport: notjunk:1;M01:P0:1YOAJVuDSnk=;ZycWI59MqswEc38XZRbdilcA+KY
 fMW/Qd6kJ4YDHV/PrAlv4EYLYPm8T/Kz7MEmH2uCbmC4cXhrZXgt2mAsgwbehulfPKyYZ0U6j
 4/ZcbR1jhBHn457cmy+3IM9crkq75D/zoVU2tPg0wRatbxezZf6SUJFsIyaROQphbv+6eggfY
 yZ3oPbHJsE5wp5r+EMrCuaBoSsFK//mNZJFyI3Ceaydb3dYKhddrJHopYfXcfR/csnExgx15j
 1tQV/8HP34RqCPG6/BXZoBYqnF6Iw4hqmongXWHRTJLInxGYyVuF1Wy47N34zHH9l76qSbdiO
 Evn2mFayNpYv/pmuxqO+mHh3jRjJS0N7/EYTR0gzB4tGz2Jrg2IEk+FvPyzivmD0wda5yrCRY
 nl75+Hm/UqZVmmugMlS1n/LV3w/8wN9lvt26IDrKmdENE0rUSASEWyK/iM5Je0EI6Y7il4T2f
 iyRiSULT5q3ujpMfw5lOxKY7+HecW/Vg62aKB9rFF+Nl87DoLuX6JoqE7kL5xpMItVTONySAU
 0nU+k418Ski00sdXbIGRg3qmWkJFgwkIEaQTzNxiwSWQv3PsBdK8KX2e00FRHWxu4HKjoUrCm
 LBcYb6X+yJdwNESmUauzAs6knsErp1eSzhluvOiDN4CVxGUHoS/74kO2FJwpOH0lTMxHgxzeb
 MgXB868tPlkUSjFcVy2y1TbwbeKGiNC4VL7pnkYBJbONwOORiu0YWFH+2KS38TJP2IG1ijjRX
 k++3+w/cLWX9yiBUq98qffLeeWLnWeyezJmONJK9V35cpbxygCcyfVzCDo2FWeQxJvVKVix9w
 tlqB6E9WtQ690+3/dsLzAr4CnGfHVZRQngY7x1dlGlhSopeHcAafrhkeRHTCw0tiaSAlEmGWE
 lrhrE5zxVzEk6KVJ2MONC1KGyN5OP468L7z9bO+UQmNcHeReZDwg7mXi3HVuzE0mHFOfkjrxV
 OQ5iNQ==

Hi Umang,

Am 28.11.23 um 21:19 schrieb Umang Jain:
> This series also removes the vchiq_log_* macro and makes use of dev_dbg(=
)
> directly.
sorry, i didn't had the time to follow the logging discussion, but the
following commits:

staging: vc04: Convert vchiq_log_error() to use dynamic debug
staging: vc04: Convert vchiq_log_warning() to use dynamic debug
staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug

changed the logging behavior. I don't think it's intended to move
everything to dev_dbg.

I would expected the following mapping:
vchiq_log_error -> dev_err
vchiq_log_warning -> dev_warn
vchiq_log_info -> dev_info
>
> Patch 1/5 is fix. It prevents passing NULL to one of vchiq_log_error().
> The function there in question, does not have any users as of
> now. However, it is going to be used by the vc-sm-cma and bcm2835-isp
> drivers (posted on list for review [1]). There was discussion on v1,
> whether I should drop and add the function later, however, didn't
> conclude.
>
> Patch 2/5 removes vchiq_log_error() macro
> Patch 3/5 removes vchiq_log_warning() macro
> Patch 4/5 removes vchiq_log_trace() macro
> Patch 5/5 removes vchiq_log_debug() macro
>
> This completes the following TODO item:
>
> ```
> * Cleanup logging mechanism
>
> The driver should probably be using the standard kernel logging mechanis=
ms
> such as dev_info, dev_dbg, and friends.
> ```
>
> [1]: https://lore.kernel.org/linux-media/20231109210309.638594-1-umang.j=
ain@ideasonboard.com/
>
> Changes in v2:
> - Separate out one fixup patch from v1 (Patch 1/9)and send separately
> - Drop usage of log_type() and log_category() helpers. Directly use
>    dev_dbg() as suggested by Greg KH.
> - Drop __func__ annotation from all logs. Dynamic debug has 'f'
>    decorator flag which can be used instead of manual __func__
> - Reword commit messages.
>
> Umang Jain (5):
>    staging: vc04_services: Do not pass NULL to vchiq_log_error()
>    staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
>    staging: vc04_services: Drop vchiq_log_warning() in favour of dev_dbg
>    staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
>    staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg
>
>   drivers/staging/vc04_services/interface/TODO  |   5 -
>   .../interface/vchiq_arm/vchiq_arm.c           | 176 ++++----
>   .../interface/vchiq_arm/vchiq_connected.c     |   8 +-
>   .../interface/vchiq_arm/vchiq_connected.h     |   4 +-
>   .../interface/vchiq_arm/vchiq_core.c          | 402 +++++++++---------
>   .../interface/vchiq_arm/vchiq_core.h          |  38 --
>   .../interface/vchiq_arm/vchiq_dev.c           |  92 ++--
>   7 files changed, 315 insertions(+), 410 deletions(-)
>


