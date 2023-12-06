Return-Path: <linux-media+bounces-1771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1F807A8C
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A07282545
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 21:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA4070979;
	Wed,  6 Dec 2023 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="EvIwKEfX"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CE398
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701898475; x=1702503275; i=wahrenst@gmx.net;
	bh=dtsSHpdTpI7NsjyKdbgYipt6z6Sb6wAgMtB7ImbZGNA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=EvIwKEfXUQnzXxzdMwXhoK0XN4Tc5XVbiDwG+vlccqqxjpyFNy0jD3NujRdYVoH5
	 cNQ5kwgJfOX7OsKNJEC7h/L1o2W+90u7Rz7Jtc4aGGfwHguv83NSID7xILtvUVhNj
	 dlvmYd3wj4VNTwisKqEW3WgJc186UOWGxG4Ut+KmGpPdI6yRw5e6BBA+W+PT80U3i
	 AuSexdzdIOZD93LnnogRDKXHa+V4M/myiUrK6tVk9gjZvCHxdU0nx31O1b6gML06V
	 hRwN+CKcXZXT6koFxo7kiBqCGyJyl0GSeEZrlWFZ9M/OzGXibalMdxo5B/8S2F9KH
	 A5s4IYEF6iha0FJWhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1qvFwC1rtf-00Jev3; Wed, 06
 Dec 2023 22:34:35 +0100
Message-ID: <3920385c-3c10-471a-ba82-8e48ba34f6a5@gmx.net>
Date: Wed, 6 Dec 2023 22:34:34 +0100
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
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <6a8566c0-bd26-4ec1-9f7d-d58bbed8411c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8zHe5RHs7f/HQMdgDj774+Lsqvy77xEa92roI6j6YXap/YjrwL2
 V58g9mTiHdTtuoK9fZOJiymaQtR2LAStyFrFI3NvZ3cJEsYCkvmCsMybg1BgsFjlBW5MED+
 aZOq/yAeGtq5YqqKUUr6iH6jBgOZIZfXBzYsAIznFYX9S+WJkVr+pwLc/Tmpz7GNcmVykn8
 EWGX50XBw533PpVCk2QZg==
UI-OutboundReport: notjunk:1;M01:P0:xVy0RIwduh4=;U2ug8ifRWXwg23zxZBzzb3CuNcm
 9w3NntYtm8AR1o3oTwv8bBO9awVf3x+So2ctinfn0nk1bitX5eThN1IcRLdLdLuyVXLaXi1GW
 KC7sutiFX321JXZqZuhMB0huLH6p6UP6kUSEH4kmgQQD2oFYryVCNTwTkfG/XOg5dAyz4tutR
 BSVKWnbb5NbTJkc5f8m+6vZ32Cb9gbMS6lOugFkaE1B9wUCq1FOUV4N0GY6y2Js/C4X14eHWh
 xfGcHp9vHBKxlONhGf/BZiWXjrViewqlgDOZVGEIUEIkPmqOZODHGIAkwgEDeRO6zB/q6pfN4
 PfeTCDcLDQFf7pv/m1W1k0ZuXvtpeFmIeO7zywvJQ12/KK9QRx9UpMc7eUQk5OhAraj1dUcGZ
 mkCG/47JBgkQQrrL/3iLjkCRxEsFQQVQFGtLnWDZoiJEpy0wKw44FA3mawyQTkIZXMmkBVbML
 MIGgGXiWv638Ojd7IwkDJJFuiKyiUvzEIf1fuzIoKz8DxzxAcCw2v1UN8CmJquNE5mBIrf+kO
 RZVrt8MEs5fmKGVoAKOlnkyEG1Ev8aaZp50dcPrR0P31laJ6KPVHxKmglkNDzLyNGDSW9DqJb
 RznQrcjmIkiJo3pQ1B/omxKXhphczqUOH2uxK0Sc85JsJvOWhKlbFzINmAEfQaE+gwzvypu9p
 1cy/+o4gmtC5FNXgWzo5HjVfaB5xoV6wEu7iAw/kBl+kled1FVz4SvFdiQZhFMPPw1DQ4K6zJ
 vW60z/HrRKUr6InSHQ+nDc2qEm5WasVFpEQEEYuwnJBj5+ykl24BCseG7JeLHoaipeuvyR6ty
 PHd+9kz1fBlRXX4JYF0WB8RvgyXRHb0neczXvl3vvOmfO3jD5Qo/AmlXJZJtWwv9qEi8EsLNp
 DSlsY8ekJ1CxuP+RlptvQKSdLK6o0AV/BrvFqIXSUzUwxI7XZ2WdaFLc2GeZVfEeUzaiALzze
 FUoZG7iYOU0QJW4BRliZqIowDwk=

Hi Umang,

Am 06.12.23 um 06:27 schrieb Umang Jain:
> Hi Stefan
>
> On 12/6/23 1:02 AM, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 05.12.23 um 09:41 schrieb Umang Jain:
>>> Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usag=
e
>>> of dev_err() directly.
>> sorry, i missed to review the last change. So the change won't be that
>> trivial.
>
> All the changes you said are valid and I have taken a note of it.
>
> However, I think it would best that if we can address them in a
> separate series on top of this (and I will do it). It would seem to be
> streamlined on top of this.
i would address the comments as separate patches and then finally
convert the trivial rest with such a patch within one series. This
avoids unnecessary changes and reviewes. But that's just my opinion.

Best regards

