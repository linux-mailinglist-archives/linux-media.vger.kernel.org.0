Return-Path: <linux-media+bounces-42137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878BB50737
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 22:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A331BC83FC
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 20:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4ED3570C2;
	Tue,  9 Sep 2025 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WThbaB1j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC4199931;
	Tue,  9 Sep 2025 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757450438; cv=none; b=UCCmAxCwxyzVs3u3CrmqYmvJc5ZZTHF6VrsUsUG2KQKvEiUGbeyk0Z2wEGmtKVjK6r4aqfC6wV8ogM5Gz8093l7Vhullqj8S8HobcNRs9FkA+tPZFwSjsRcGwIqkp8dM9/w9OLeNQliESKjx0H/RJ+9obCxYz8Jq6W6zl93J2lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757450438; c=relaxed/simple;
	bh=KyRZ/xwBeA2oq/HklxIZ1S2NqmoCXvHqw7uY98Fl1CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilieqS3NlfCuW6IJAa11W8vi7mk03l3OlNZgJk5zXynkTnDGi2gkJlgkIw4sJ/Zq//SlgBXGVhECdJXilCoG0MBEI3Jk/FrzDzIIc3OCcuERlMkj7qrfAu3D0mFsyUxaE+abQYxgIPyi3TeWJe5s/bCGo0QKFNoX8G4sJ1p7Hl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WThbaB1j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA2CC4CEF4;
	Tue,  9 Sep 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757450438;
	bh=KyRZ/xwBeA2oq/HklxIZ1S2NqmoCXvHqw7uY98Fl1CQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WThbaB1jTOoD0vOgQfuxP+zMfVmcj4JSpKqQS/lGJa+ylxqhDtdA/83lSkAV6SDWh
	 sl/1Ba/MMVkAIKSJuMZPZBh34s9LR13jl4HeC1hY0CfoQ8C9zDoyiaI5qqyUMlgKKJ
	 pWJfRmD0ckCLAtk6qLJLqVI/q3fLNFBiRe44cLL983yGOnDKHRn4Nml28bs9s8k89t
	 t/MhqU6UkZZAHZK7uXTZCjklvEcykSQM/uEj1sEGe29GJBOa1ZWB2jri9QSQ/tFfac
	 yEoUaeWcll/C+sG0SsojTxeHyFy1ZWpvCM/MP165fNIW7TCUeAI0LXy23y5uYT0dgY
	 imqNT3qKaFwcw==
Message-ID: <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>
Date: Tue, 9 Sep 2025 22:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for the
 LED lookup
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Aleksandrs Vinarskis <alex@vinarskis.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250909144823.27540-1-hansg@kernel.org>
 <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
> On Tue, Sep 9, 2025 at 5:48 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> During DT-binding review for extending the V4L2 camera sensor privacy LED
>> support to systems using devicetree, it has come up that having a "-led"
>> suffix for the LED name / con_id is undesirable since it already is clear
>> that it is a LED:
>>
>> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com/
>>
>> There was discussion about making an exception for "privacy-led" since
>> that is already used on x86/ACPI platforms, but I'm afraid that will set
>> a bad example which ends up being copy and pasted, so lets just drop
>> the "-led" prefix from the x86/ACPI side, which we can do since there
>> this is only an in-kernel "API".
> 
> Since it's an in-kernel API, why can't these two be simply squashed?

Good question, this is only a runtime thing when running on actual
hw with a privacy LED. So having this separately will not break
the build in the middle.

As such it seems better to have this as 2 patches since it involves
2 different subsystems.

Regards,

Hans



