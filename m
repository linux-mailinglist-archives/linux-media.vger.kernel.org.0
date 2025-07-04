Return-Path: <linux-media+bounces-36818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB70AF8ECC
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0854B3B5D00
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49042EA490;
	Fri,  4 Jul 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VK0tOdrP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324EA2E7F07;
	Fri,  4 Jul 2025 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621840; cv=none; b=LZcIzkKUcZkSZoB4G6459Uw0YDWktnYplB3wtWsDyR5D/a90I51jZQHF5IzoF4W0rxbCyIs2qSEl27wVdkL99PfWWfqoLhF6zEEPxEZGnCC0q43+nf1Pxctx2Rd0vr5EiZ8VJpOH+ENdcTfi3DDNFNN3N7GM6Iea6VHrC/99PNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621840; c=relaxed/simple;
	bh=XJJ17u7RNIx2BkuhnJX4GCAgM+F1j2LluA/6tqn93/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=na7U7LBe1uUHf4dlJe8Ngx3nxxpFCddSdD3k6GMvwyv0yfuJ0CoYeCD15fKH9Fgz67C7K2CTGCQ3HkjrF2VrePmX2Th+2P9PDVqP3ggHbiaNtP+yw0MawZhJVvUGWNe2+CDq2lxNC8Zh1yGwK6/JQNA/a8Y3HNiqxfpMLLOlpkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VK0tOdrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFB0C4CEF0;
	Fri,  4 Jul 2025 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751621839;
	bh=XJJ17u7RNIx2BkuhnJX4GCAgM+F1j2LluA/6tqn93/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VK0tOdrPCUE34Bsa9ON+Kb6k0HgCHCxZQy0leT92H9Ie64OzYimY/1+eTqt8aQ5py
	 e+P9cIyw7px8aLdLl88ibJ8CIUp6DrG63GyFTdAsSj8yNOlqoC8S3YbWOrgIgq1G7L
	 XT0mpvo3ThhVKrbuPNPbuapeycUHG7xiVmhxFWIQyJQNwCiqm5fl7E+ve/AYBXqQmj
	 0zurryXZET2Hn1+/pJrYFn7cfWwfoYAIk+D3ygfnsmi8KKrd/tRF57hGg0ErarNQWW
	 Xn4WW7ISIEgjF2m9FMwMw7h2FviNjTinOqks/bN8e8DNUviUvWl3fRmjY2L+4TpASH
	 q67WpY9HToG4Q==
Message-ID: <7fc311bb-772d-4d74-94b8-79c6fa31c013@kernel.org>
Date: Fri, 4 Jul 2025 11:37:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>> driver.
>>
>> Besides avoiding code duplication the int3472 version of the code also
>> supports more features, like mapping the powerdown GPIO to a regulator on
>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
> 
> ...
> 
> Don't you need the Kconfig(s) update to have proper dependencies all
> over these cases?

A good point, not sure what you mean with "all over these cases" since
this just affects the main atomisp module. But yes the Kconfig deps
of the main atomisp module needs to be updated, I've added the following
while merging this:

       depends on INTEL_SKL_INT3472

> Otherwise I am fully in favour of this change and the series as a whole, thanks!
> 
> ...
> 
>> +       /*
>> +        * On atomisp the _DSM to get the GPIO type must be made on the sensor
>> +        * adev, rather then on a separate INT3472 adev.
> 
> rather than

Thank you, I've also fixed this while merging this into
my media-atomisp branch:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



