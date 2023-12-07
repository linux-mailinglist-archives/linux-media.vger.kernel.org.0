Return-Path: <linux-media+bounces-1906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5A809559
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 23:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C165D1C20A90
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 22:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F01E563B4;
	Thu,  7 Dec 2023 22:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="T6KFEE4H"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C069FBA
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701988130; x=1702592930; i=wahrenst@gmx.net;
	bh=yIkkOrIVK5rLyaPwPCK2hV1Fb4ExE8ngwDBFJOAF8Fk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=T6KFEE4HPidHR016I4ycwemiTJygcGWNZefoqFFGcVAMopEfgcW5jqmJ9dxbJULW
	 biFlVGVJ7QsCOIen+ikg5QjCidRDtA6R1joI5sn2L6GyfikPiPjuX4rcjWQwEElsn
	 u4L5Bem3SCAJftjpIrOHz9RFmyyBRTzW7Eh5G+6bhGPIA9IhOuXNEhs1AzC/Zm7qR
	 6UKKOpR5k67e2zLCXrSVI90dn97e1PtHKX6wSiVuJ89A6yPa/WJRvXcEHN/fAMAj3
	 xlspy5N1bWjqfNGmaQXkR8pZmFIn981o0xINe8muLKMUS1F4GOp9ozzpiRL1NtoSl
	 1li6PiUy9A/Ut049Aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1rN1UC12Wk-013g3B; Thu, 07
 Dec 2023 23:28:50 +0100
Message-ID: <12236d9d-fe18-439e-b622-0e64ef112400@gmx.net>
Date: Thu, 7 Dec 2023 23:28:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] staging: vc04_services: Drop vchiq_log_error() in
 favour of dev_err
Content-Language: en-US
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-2-umang.jain@ideasonboard.com>
 <d6bf7115-dd15-43a0-b45a-41fc778ff160@gmx.net>
 <6a8566c0-bd26-4ec1-9f7d-d58bbed8411c@ideasonboard.com>
 <3920385c-3c10-471a-ba82-8e48ba34f6a5@gmx.net>
 <855cd4ee-86db-ca46-ce91-17303941ff82@ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <855cd4ee-86db-ca46-ce91-17303941ff82@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:44rfj2Q0ulLso+QvKlBaVECfWyp/ydLX+DM+5YVRt8qT6jqLXOt
 W4ri/nGXtjDxw16G7DKpbfCb27/TeF345Lp1ZcKo9UrK2oqsUrDWE2nCofk+Jnt59CZr4Rn
 LaVZJnFA6U/IGR4Kgf6NePqoIzKt7NqR0ymyBdkNtLOG2a4X7ADZGYqj977C+scgoxlLUuf
 c3sdWJb1cu5t3z+DYQuqw==
UI-OutboundReport: notjunk:1;M01:P0:VOC5bf0eE48=;r55t3dOV2K0SDP/4QuEGK+UhjQb
 NOWaxIYPLjK1gxgQ6IS7KY5wUWt/Ch4p8JIAteTPSt6vMeQINUlLAU/NcAO8Bt1S2DgwMSNTb
 D0ZpznihwyXz+zHah60d0FUrbz+MjCo1HiJGmbqGfbRZjF/D25DpkRuqXVwsm5tvlNRNu9O/H
 FZS5K/5s2nGQmwUYSsS58b8dzzJ1Nw/M2TY4/Dvo4l+K78G+j3+U/krUr/ioqiUSsMcusqB0T
 TWYGmmCS+yBvSHH9s9Qv7vYH+C5jWALyGHWVHn5qa+naozHoriKGNnJkDyRNI/YAcKHfa3v6U
 ztoxiF0ooddDoynnBeYIKPPvYxhG34HB/jU8bpeFe8ENtCOfUgTFSac0miPg+80MsFGAxJh0K
 +Pl3dxLYAnbm56jgoIkafgymqK4mhsDiuBX+rx+RXsnfdEW9JIXKQHrobLyHmTKSQF2MhXPuv
 EITjH1uEZwAVLx8Ks03/oB6iP6UYqT726X9WuH9eomsaXfcR0qiz3nUirnbwrOJ+17Qu/qkMM
 Vs1YFhddFe9iO/qoerdedCFvDbkW6MENhf2RfcwtOj8Uw8I6of7gcPMqyCKmnZFlwNo1OBXg6
 v3fC7Zohoaf0c1w8vKtVMYx2PoRuikipQnqg0GiqdY5xpzlIPbEOW0t528+09AoerilvLPWf1
 kcPOL8eLnjwwKcCpmuydhvmXp/sU2pj86SBiTaaa2wDMZRBxKQQwGnK0UqsA12WeFa3HA4WQn
 EtYPcB+0ppxhB46/xAX28Mc6DbbvpKGBWVBmCDtJK2EX7ULmXlWcOiQPDd7QPyu73uDUSV74T
 AHcrfQLZhM6zfZ5BlA77lgKznrt4PJ+itHkwFvZmM21Eq/Uz6YD343SSdJrI7JvqzciiPeB+7
 z7DSsMdeqN4nkF9krJEJtU8O/SRCMy3yRZZkv+KyWqxgdpRzjuz5KiRtmua425dXxIodX+wir
 1gyoRATmGThwp8C0fQ5xiYr9gAM=

Hi Umang,

Am 07.12.23 um 09:41 schrieb Umang Jain:
> Hi Stefan
>
> On 12/7/23 3:04 AM, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 06.12.23 um 06:27 schrieb Umang Jain:
>>> Hi Stefan
>>>
>>> On 12/6/23 1:02 AM, Stefan Wahren wrote:
>>>> Hi Umang,
>>>>
>>>> Am 05.12.23 um 09:41 schrieb Umang Jain:
>>>>> Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the
>>>>> usage
>>>>> of dev_err() directly.
>>>> sorry, i missed to review the last change. So the change won't be tha=
t
>>>> trivial.
>>>
>>> All the changes you said are valid and I have taken a note of it.
>>>
>>> However, I think it would best that if we can address them in a
>>> separate series on top of this (and I will do it). It would seem to be
>>> streamlined on top of this.
>> i would address the comments as separate patches and then finally
>> convert the trivial rest with such a patch within one series. This
>> avoids unnecessary changes and reviewes. But that's just my opinion.
>>
>
> Series is merged by Greg KH (Thank you).
>
> Do you have more comments on 3/4 and 4/4 or are they waiting on your
> review queue. Let me know so that I can prepare a follow up series in
> -one- go.
i was busy. I will look at the rest tomorrow.

Best regards
>
> thanks!
>> Best regards
>


