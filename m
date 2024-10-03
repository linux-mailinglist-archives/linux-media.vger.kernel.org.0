Return-Path: <linux-media+bounces-19074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B798F869
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 23:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8A061C21D95
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 21:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB351B85D6;
	Thu,  3 Oct 2024 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=rtie@gmx.de header.b="h5pnUgNI"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59861AAE39
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727989346; cv=none; b=Urgvvsf8ZZrZq6fLUQatYDtimIfV+jmClm3GuO69ISPhX1IuzLo1Vo/S9AWVhfSFkfqwrJlYeu1AtH/0nsye/Hrs41zwIJPlsxsecGD7AKNH2eHshyqX98OhUlC1Oy6sb6ySk097UQToA2N06ZjoTM9h6zolQ78nMh0ziPLYr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727989346; c=relaxed/simple;
	bh=GbPPSRwe9RJ4VZP2H9C9Gf3gLpQhNBLzhN7pFLCZ81U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8OumRTKBascU1F3P78f43ZPeDQt3t1F1OW9CjtTw9lyFba307agYZHnbo/A0LU2nZZ8kmzodbhCBMHoCwifsr/Zvq1Swwm7NSkkgetfLxsqGi11g6726B1NwhKrf0BEf9mb63yrLPiXk4QfClz2WlfzWe5Vjnah8lJVf2e6bK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=rtie@gmx.de header.b=h5pnUgNI; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727989315; x=1728594115; i=rtie@gmx.de;
	bh=GbPPSRwe9RJ4VZP2H9C9Gf3gLpQhNBLzhN7pFLCZ81U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h5pnUgNIyY+YZc01kDldQ7AFASnN9ENRJT/vsq7K3vN/WzMYUaWhv/r0RfNEfSbH
	 QcJu+cjFqY2XFdDvhVQrhWSC6Fii0cvtPu+IEjgu8pVs0KImFI1LqkdOsK+PBONb6
	 4lLqsqV6TPSYiyRx2v9NE89suOFT+oIi3XKmlGZreuBM2XaYdEiwqcZbmIiDGy73L
	 HsUgJF/bVtd8ytjUcL2NUttacNG5PKFKqpX28bTxbwSAb0J/Sm2b02Mp7b154ODEk
	 lJdwjyHk7oJvmC/21j2N8FLzdFO/E6gHmiRan6GzTYdcu0sAsms5Dk4cbLAWjo4xd
	 tbjIbiVMw/FaBi2zgQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.69.6] ([79.231.128.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1su07O1LiL-007KOs; Thu, 03
 Oct 2024 23:01:55 +0200
Message-ID: <a351ed66-c7c2-4adb-b74a-83a1e4636556@gmx.de>
Date: Thu, 3 Oct 2024 23:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Si468x radio receiver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <ed03debb-163f-47df-99ec-9b62785172fc@gmx.de>
 <ed8c3d5f-2988-4aaf-a374-1d68805e87e5@xs4all.nl>
 <20241002115316.416f2324@foz.lan>
Content-Language: en-US, de-DE
From: Robert Tiemann <rtie@gmx.de>
In-Reply-To: <20241002115316.416f2324@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:gHmDMRo15UdQ+zxzPjyT+MNUH/7RH0YcYhkS9FvNzG7MgqVaCtA
 jMfjN5H+PGAjfrN9fBQybsl2MAx0VOlLM91917EXP4NIhcYfS7XaO41ZPjKgxtX1GmjRgk6
 Yj+/6yjul2v8NaZFLipBbChA3NxLmLpHppvXSE2rdfcINlvmLpRFYo31aEWHjxs2k9m5hSY
 ARYqoVJ4XxPjzBXMbf1Pg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vx5IRTj7AjI=;zeYaoqWiYrLMNJWreM9AX+UAJ0W
 w9128J7ktOb9zqBti6zAfIQV8maz988Zkt9wYOjC50irw/ybpNngAeVV1YCFL+4RJKlaT4Dae
 lAfHajVDldhXNM3qWRDsi4u4Q48eR5XL1bzky5HJ3iiJMqHRGHsXvZoQaD0bcw/510FrfWXb9
 f9OxIZVm8VYUlfK1Ib9aheBF1fKwAWh0MVQmb3FuqFG/A0Mf5IDqyrPrlBnDDTUj6hQXUJQnW
 w0CkeQ0TZAmpTjyIN+tortjLugMSFGWavUxM3m7sSpHdVIYVgiQWxUR+7vqt1uEUNk6p1EJDF
 seYVbtmB7cayNutdWQwRTTF278dLJFB8EOEA/AcAB80pd7I/VF3e7GH7JKB8qFVJKCoa4Ymr3
 03cswDtihtDIuoMaytOKGAgYgJEehZN/ZovmS69OsvYgjwMQiptprbgpQ+hXpRwU0qpI8cYbN
 gAJ2UTDCKApDHWScayci3+rCDKNzWhsqGIAjjEl9bBKinpF2LJ/QekoXyV+xrtf8T7d1ovrOA
 yu+8yd32Y4hYfgBJc3mcNmk7o0kF6VukUWTJLFAAjhT8hCByNLb/qWXyD+DnKKPNWbRT9dft/
 Kaz9m7pNCxkjvem9nW4tov3FZpQUr5xYfBjygxEr4HRb4N7ZVv+cC+8JX4kR+z1uqVmGGBppg
 MDzAzpZM+qHnrlGVjgCQTvfuQKqBenoEgOisrho87OJeLNIXffv2M6lPArfZvhTUJSLQzo82J
 LsPOjMrx0HvuWcGnUg8QS/aOPXWfsvSnkl6XxkEXjV4DWsqvUi+oecYDAlStWi/tWdEVnlvaS
 iJb0e0WsQ3oECp8SYdhWDOA3fbl+/QwJbOWlbQNC06gt4=

Hi!

On 10/2/24 11:53 AM, Mauro Carvalho Chehab wrote:

> Yeah, the best is to implement DAB support using DVB API. There are some
> media drivers that support both V4L2 and DVB API, but, as we don't have
> currently any driver using SYS_DAB, we'll probably need to add some
> properties to handle it at the DVB frontend API.

Seems like someone has to take the first step, I guess. I'll dive a bit
into the API to see how it works.

Many thanks to you both!

> Thanks,
> Mauro

Cheers,
Robert

