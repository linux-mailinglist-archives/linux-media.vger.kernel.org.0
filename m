Return-Path: <linux-media+bounces-16938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249696110A
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 17:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E41C528360C
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06CB1A072D;
	Tue, 27 Aug 2024 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gkXvRKFQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139C17C96;
	Tue, 27 Aug 2024 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771731; cv=none; b=NUdP4+FxwJ2VX5rYcK67yJKIMR9x9fuM236Tb8ayN3V0d8R6KfirtHesyvB1ttyHlljFO/GxzowzrvZrUHVs3jMJKnWMH/OLSMtAljP84PAa75ckGTYXg8cJgSq8XArdJUajWq40FvMRfDieNr6thDyQp/lVImDVaG9YGcUEhcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771731; c=relaxed/simple;
	bh=eyfy9J3T0WHgU7kikTI/SpXyyUG3bjCdeOivWinCWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J/07rNOXJJLe0HWk3q/SdIHZHVOma9kmqgS05hAiYwoBQhBmy3bRoB0uE8YfWeMhzAnpSgx6z8O086cTSxf36d1brEeDfQsdxjWKunZ2nNGHaa8/384AmbK6R+Us/a7PjDIWmhISu5SPogHLtRYTOMZN/E6WVYtlGJ29JnlJX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gkXvRKFQ; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RFF75n007419;
	Tue, 27 Aug 2024 10:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724771707;
	bh=dpBlpljeW3Y3mBXmJhPRn7Sl83tQu+SC0sfnHVgX/Vs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=gkXvRKFQ+2Y4aYNgOUXLsr5i9rUzU46qCZywZQCDhY2x+YnwjrMd7qkn0ftv2GQMe
	 oqdu59aWlhH5E3xiFVlZCZKRWAdSyHCjPs8+Hp0QEpqNpuMrX0jn0sqqyj+vHk3LJ3
	 d5lGJfF7pbN8RG5H2sI7y+skzoAEbQRKRgRSG/EY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RFF7QY090568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 10:15:07 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 10:15:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 10:15:06 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RFExfs085052;
	Tue, 27 Aug 2024 10:14:59 -0500
Message-ID: <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com>
Date: Tue, 27 Aug 2024 20:44:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <jirislaby@kernel.org>, <davidgow@google.com>,
        <dlatypov@google.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <rdunlap@infradead.org>, <nik.borisov@suse.com>, <Dave.Martin@arm.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com> <87frqqyw9r.fsf@intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <87frqqyw9r.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Nikula,

Thanks for the review.

On 27/08/24 18:10, Jani Nikula wrote:
> On Tue, 27 Aug 2024, Devarsh Thakkar <devarsht@ti.com> wrote:

[..]

>> The equivalency between roundclosest w.r.t round_closest is same as
>> equivalency between existing macros rounddown w.r.t round_down. Functionally
>> both are same but the former is recommended to be used only for the scenario
>> where multiple is not power of 2 and latter is faster but is strictly for the
>> scenario where multiple is power of 2. I think the same is already summarized
>> well in commit message and further elaborated in the patch itself as part of
>> header file comments [1] so I personally don't think any update is required
>> w.r.t this.
> 
> I still don't think rounddown vs. round_down naming is a good example to
> model anything after.
> 
> I have yet to hear a single compelling argument in favor of having a
> single underscore in the middle of a name having implications about the
> inputs of a macro/function.
> 
> The macros being added here are at 2 or 3 in Rusty's scale [1]. We could
> aim for 6 (The name tells you how to use it), but also do opportunistic
> 8 (The compiler will warn if you get it wrong) for compile-time
> constants.
> 

The macros use existing round_up/round_down underneath, so need to check if
they have compile-time checks but either-way this should not block the current
series as the series does not aim to enhance the existing round_up/round_down
macros.

> As-is, these, and round_up/round_down, are just setting a trap for an
> unsuspecting kernel developer to fall into.
> 

I understand what you are saying but I believe this was already discussed in
original patch series [1] where you had raised the same issue and it was even
discussed if we want to go with a new naming convention (like
round_closest_up_pow_2) [2] or not and the final consensus reached on naming
was to align with the existing round*() macros [3]. Moreover, I didn't hear
back any further arguments on this in further 8 revisions carrying this patch,
so thought this was aligned per wider consensus.

Anyways, to re-iterate the discussion do we want to change to below naming scheme?

round_closest_up_pow_2
round_closest_down_pow_2
roundclosest

or any other suggestions for naming ?

If there is a wider consensus on the suggested name (and ok to deviate from
existing naming convention), then we can go ahead with that.

[1]: https://lore.kernel.org/all/ZkIG0-01pz632l4R@smile.fi.intel.com/
[2]: https://lore.kernel.org/all/5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com/
[3]:
https://lore.kernel.org/all/ZkIG0-01pz632l4R@smile.fi.intel.com/#:~:text=series%20is%20that%3A%0A%2D-,align,-naming%20(with%20the

Regards
Devarsh
> 
> BR,
> Jani.
> 
> 
> [1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
> 
> 
>>
>> [1]: https://lore.kernel.org/all/20240826150822.4057164-2-devarsht@ti.com
>>
>> Regards
>> Devarsh
> 

