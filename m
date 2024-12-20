Return-Path: <linux-media+bounces-23957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197399F991E
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 19:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B33907A4309
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D0122258B;
	Fri, 20 Dec 2024 18:02:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2.tds.syn-alias.com (mail2.tds.syn-alias.com [129.159.94.43])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E71E10F1
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.94.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717739; cv=none; b=dz8aQbQjh1HgZbzaZZZLHC+4f2QF1HdOlJxdlo3zTaYzLmdV6SH9GGdu/hDbovjJMONOGe57BrOs5kMb3i39K2Z/Yve6KYCAj1oyi2xguAFzo0nCHbVuKbUiE4kB6IaXTJgyWMI9kq43RjxH3SsLq+wvA2bqDn1udHO+f0ecSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717739; c=relaxed/simple;
	bh=B9samYUmss30UwtDRx5xJpOrBNvLcRoIIypyicUl5w0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=QYgeHoudUlIAhXlXvAkYyCy8e7+tnMKhhRW0JNZkgDrYsEdeEXv7ekwDHwAVF+4bj3wddWqzRDv3/XFKlBJVKKLO04YQhV/oze9Sr/0AXlLWwOmXMQyp0GVbYJkwGYvjbXASjWvccYP4OTuZK60hJWbHbCQZQ7K0k0DHg7H8r8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net; spf=pass smtp.mailfrom=chorus.net; arc=none smtp.client-ip=129.159.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chorus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chorus.net
X-Authed-Username: ZHVhbmVrQGNob3J1cy5uZXQ=
Received: from [10.219.153.32] ([10.219.153.32:63050] helo=md15.tds.email-ash1.sync.lan)
	by mail.tds.net (envelope-from <duanek@chorus.net>)
	(ecelerity 4.4.1.20033 r(msys-ecelerity:tags/4.4.1.0^0)) with ESMTP
	id A3/A5-06351-821B5676; Fri, 20 Dec 2024 13:02:16 -0500
Date: Fri, 20 Dec 2024 13:02:16 -0500 (EST)
From: "duanek@chorus.net" <duanek@chorus.net>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media <linux-media@vger.kernel.org>
Message-ID: <759031849.104848728.1734717736340.JavaMail.zimbra@chorus.net>
In-Reply-To: <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org>
References: <20241220144130.66765-1-hdegoede@redhat.com> <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org> <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com> <21fb2807-3886-4559-a7a0-dca3031a5388@linaro.org>
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 9.0.0_GA_4653 (ZimbraWebClient - GC131 (Linux)/9.0.0_GA_4653)
Thread-Topic: media: ov08x40: Various improvements
Thread-Index: b6ckv+cUA/RMm7I7G2GWUhL7xUoOiA==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddguddthecutefuodetggdotefrodftvfcurfhr
X-Vade-Analysis-2: ohhfihhlvgemucfujgfpteevqfftpdfvfffupdfgpfggqdfvfffupdfqfgfvnecuuegrihhlohhuthem
X-Vade-Analysis-3: uceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefkjghfufgg
X-Vade-Analysis-4: tgfgihfothesthejtgdtiidtjeenucfhrhhomhepfdguuhgrnhgvkhestghhohhruhhsrdhnvghtfdcu
X-Vade-Analysis-5: oeguuhgrnhgvkhestghhohhruhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuheejteefkefgveel
X-Vade-Analysis-6: tdelkeevueehgfelfeeltdelhfelgeefhfdvteevtdevhfenucffohhmrghinheptghouggvlhhinhgr
X-Vade-Analysis-7: rhhordhorhhgnecukfhppedutddrvdduledrudehfedrfedvpddvtdejrddvtddtrddvvdejrdeggeen
X-Vade-Analysis-8: ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutddrvdduledrudehfedrfedv
X-Vade-Analysis-9: pdhhvghlohepmhguudehrdhtughsrdgvmhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhmrghilhhf
X-Vade-Analysis-10: rhhomhepughurghnvghksegthhhorhhushdrnhgvthdprhgtphhtthhopegsrhihrghnrdhoughonhho
X-Vade-Analysis-11: ghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgt
X-Vade-Analysis-12: ohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
X-Vade-Analysis-13: tghpthhtohepjhgrshhonhdriidrtghhvghnsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgv
X-Vade-Analysis-14: hhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhk
X-Vade-Analysis-15: vghrnhgvlhdrohhrghdpmhhtrghhohhsthepshhmthhptddurdhtughsrdgvmhgrihhlqdgrshhhuddr
X-Vade-Analysis-16: shihnhgtrdhlrghnpdhnsggprhgtphhtthhopeeipdhishgpnhgrpehfrghlshgv
X-Vade-Client: TDS

Dear Bryan,

I appreciate your patience. I'm a total newbie when it comes to fetching patches and applying them.
Is there a patch file I need to download and apply?

Sincerely,
Duane

----- On Dec 20, 2024, at 11:03 AM, Bryan O'Donoghue bryan.odonoghue@linaro.org wrote:

> On 20/12/2024 16:03, Hans de Goede wrote:
>>> If this commit goes first, then it can go to -stable:
>>>
>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc
>> I'm fine with merging this one before this series, AFAICT it should not cause
>> any
>> conflicts. Note Patch 1/10 of this series also has a Fixes tag.
>> 
>> Note last work email from me before the Christmas break, see you all January
>> 6th.
>> 
>> Regard,
> 
> OK, I did a tiny amount of gitting to prepend that patch to your series.
> 
> ---
> bod

