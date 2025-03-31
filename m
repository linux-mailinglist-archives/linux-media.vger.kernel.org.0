Return-Path: <linux-media+bounces-29018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13EA75EC0
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A2B166514
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 06:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D25189F5C;
	Mon, 31 Mar 2025 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="aEO+dRT9"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B6643172;
	Mon, 31 Mar 2025 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743401471; cv=none; b=uDG0f4bNWmdSwiBQ4epbbiA+NVV/u/FZtmR9nfF0hl4MPa4M9nhHRqpo256ppP5xEfJ5g+QsZ+FcxfZ6gmR96gHfwyJMx/Kar35x1bg2qVK6lJ2H8teuVH4gr7zuXV8f4xfoy/iJJAaFeInP/ilbz+8vR0ib+z3Gf2wHn598Z9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743401471; c=relaxed/simple;
	bh=HZNn77hrb0VXfMZlKd0ubzAzyBLzNVKIzp1yVzahOZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeprbGr56qs+afLNlb+fen4l5LtMVO9C5BwgSJUDxyt+QIFHFY3L3nw/nYhM4qEpa3IqpQiSYpA/xm0r8AZJO4LF83ySfVGjVCZNJX/1HNARQAKd0PJ389GoPCDTWV+nt9pfPmGRIBLwvLIAWTQBqCJ97LZJ6PVdWlIKlPYnYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=aEO+dRT9; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743401461; x=1744006261; i=markus.elfring@web.de;
	bh=HZNn77hrb0VXfMZlKd0ubzAzyBLzNVKIzp1yVzahOZw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aEO+dRT9QZqVjqbYxsvbFRnyJogft4kcfxd58+DXL/PXG1RU1CX0e+8uczBDVnwe
	 He7LxR0f9BWEFe1ksiZUAW0lhZT4nCJtU65d5TiryBe+cKaWdn7vK3RVbwdq2zE2d
	 OCy6YIiqa4oRDrVijnVzVxtSHcW/KBaOAsjSEldNG1E6Q4tkB2jxOcD5EzbOCSShg
	 dN18/TcfhZohxZpjgYndb4bF/YT8ss2Hd+Eu0xHokSjHew20TleXEjTVcwl09s5Ak
	 EDWV2gheWuu5bUYS7MumkJ5mTnhftwFEeoD3sL4TpreIfMjdPlHObUXI0Lg9MX/gN
	 Kc48LdCyIMqS05PehQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJnrX-1tfgbM1CsD-00Jvop; Mon, 31
 Mar 2025 08:11:01 +0200
Message-ID: <eb8dbf9a-50c9-4bf4-b967-d6478caacaa4@web.de>
Date: Mon, 31 Mar 2025 08:10:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 08/10] media: platform: Add C3 ISP driver
To: Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
 <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
 <e99da06b-acf6-490e-b39a-a283bdb2415b@amlogic.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <e99da06b-acf6-490e-b39a-a283bdb2415b@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eKQ9p9ZXI6ZC5Dq/TI0XGGzkdzXfPrOsjZ7nQwkh+bTF7EOn4/w
 835VDv5jEFwtTfgEtOYvVIDlPedlwohx+mNmGHmow+bGNnG77Mi63Vk/x+BEihsiFaUn6ON
 +y5+Tz8vGEdQEUsVW6IjfOhCd6hQBiarI9K2lY1m0sVImfkNa41P8zBZ9e6v6tsHWvHUccj
 m64JSHakXGf9WiQLFZHkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W+kS9veyZH0=;w+mCcDEcnD4ucUjiHH7a4RlFJ0u
 8ZeVthlounxA8EC2/apVLXj4rFKDps0esfaF5Qq1FehYn4MMwdYZezElXDE9Y6aLPsEj7ECu1
 qFzlADW8OqKyuyhrhBwpNNUvWURNMWT6HwRwjNaafCQdwa7/aMcLbz6V9L4qTmIPxcCEPa1Yk
 p7LYtZ5qgEGm9OPJq1WPYXUAiw/fD2a+MMwkN0QZHp8uaOrIW8kjmN35BqQlrP6MzZyK8zndD
 Wxrj/mjbPIZzWpJV/9HyMiOwrfTo3BSvo86zWk9RoDEBIk93niMNHvwA5u2B/8zhYa87ZVbTC
 urE1nmtx6BR+88v97JPvv1S/mJtCOaouZBVV/Em28o7ht0NJPGQKhU5gaIFyFjIX4lTQW6gRJ
 RDElSo3GkuZHHktJKdRhV9GbfJYa+2HBjPsJQ+QyVHW8OeOKZIgdjQVQYgFOAUMNuMJLFhA1H
 Vyd3z8F+eCvYKIVjEK8tR9AmmYSGUzBvVqr8EaWmjXPssPUcp/fGVklTNhRzUjPO1wLXutdVo
 +jnMgINlIwLLcNgCf+tvIYL5JGAQ5Kx+hnTzM2YtoJaR5EJOlCWxgeCgDfhIU4UN373W3TRjx
 lkszspZgg7o5pf3elDP4PmOD/SaOLJWWMuAO0JKpK4pUaQ2Klx/LSKPk4z6rTyAup0BKVcsZF
 XOq8gtLUl1kWeOh87Z6VV0QUgu8a24Qdp4G09U1L1ZMz4MGh2FSBOjMsWa5Ee42Pd8HvMb89q
 S437jk7RbxRo8tRY7yTeXT58wzFdUffixwMxYSKbnwTmdbJqQnYVEYAaB4yF4nIFtLYYL0wGe
 r1vBzdusnz1yToj0nY7jyh8bDO16ey5DKGM7OuHTvsqUxJqfJfaQpLhRenQIg84mQPzUEUSQq
 sabqMQ5WIYH1QwnuCy5om6NCuCo7AZZHWZC+6CnxPXYhiIeNSVlwFntCaCq7HSVPybm4rIo8y
 4Ty1n6/FOtD+VLV9MxOvczUYWjwho4hABN+r+v6TVFJ7P6fQ/WW1bzgm8bwwee4osWXftIOnk
 JHLxr9jwmyqiirtyqwHu/wT99PjB9rCh8qF2ldx04UdOOoJePWlkJcalxeZhwquxuYAwm2WQC
 D8+jDQDEnJTR7p4cl/GeMm8rUHJCGarK0RKWnd3o1zzEWhyvP5YE4JV1QG1Irs5UHRD3Lokhq
 9Lp5vqjQfe0pkrURq0v3NDReTwkYs4pmmlYbQooIhx8U2te6aJt+RMC4ngREAY76wLonpe/XE
 9EoWEnAKW4HfHcmdwkrQk/qyfwoV40y8ACS+GVsUSBa4zFYDavYoQk34A7X59O3WNkAUCZ1Yx
 cTpQNWa/hL22ZgQkujW2Z5RNnvIO/dzXUJAmbbvZ1rjN9C2+dTwImkbbL/q5Ev4ibwV9RzUzA
 FnnUHvd3d8THbFiySuHr9y2x0khJAYxPZGbEZPpahSjGXaz4wm8o0JburH2FQAs+eKlXuJdMG
 LnovVqQcrMZhhj+1wveAPGAf3Tc4/sY3KVOQGVa8qjVlMb8NZ

>> You may occasionally put more than 60 characters into text lines
>> of such a change description.
>
> Are you sure the character limit for a single line is 60?

It seems that you interpreted my patch review for this issue
into other directions than intended.


> I find the description 'wrap at 75 columns':
I suggest to benefit from word wrapping adjustments accordingly.

Regards,
Markus

