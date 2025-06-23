Return-Path: <linux-media+bounces-35655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8194AE4637
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 548F67A8924
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B76253B73;
	Mon, 23 Jun 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5wTqJVw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694B2528FC;
	Mon, 23 Jun 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688056; cv=none; b=lquYm0H2XrCm+z1gfzeUGVzk8QyV5p0UVqGCcu+y27Ga/yv5Y1DezVC2dn6U5h6VTkINEyFOe/7DfSbEXAWAbU07U25iq8jDkx0mVR5OK5kWqSuRvtu9wwcR4U16w7HN49Y8BNwVyquvh0OXEx4wsZ2VFpKeERsaiqJNZEb63VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688056; c=relaxed/simple;
	bh=/yXiqZIdCiBtA8S24r9CIEjDcpwZBNch81kxQlpzKtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mj2EYrloNQNp5GFTNClXqcdjEtgfbnYIa5DF6vijYwz7cUyj7+BSd0GO8JBDSAX0f1xp3sBLumJJH1pu9meC7FbfamW/JKfkjLpAqxSKJCzIpnlGDL0Vt7G6P4qpsIEdmMwuJwivO8JNLswbnGt+TuzPgzSWZbOGtnel16HblS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5wTqJVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFB6C4CEF1;
	Mon, 23 Jun 2025 14:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688055;
	bh=/yXiqZIdCiBtA8S24r9CIEjDcpwZBNch81kxQlpzKtw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5wTqJVwNUq12KJP5C1zdl1V5223uRbSC9R5t3V4P0Uxi0UtUeMGDhSuOyqsKJQ7l
	 +7GAyDnGIagjGdkl7+tXPQdQjKaKhUje7cr6+XRaIQYhDilgZeO/lWmaaTwUU66DkE
	 7VzSp6C30S9yWOFKlLbAn5cCXUjeMSwd8rQ7BgVkMpIlu7UDrn6pvm1sp9flKOOBk9
	 V0eFIUZpZzerAwlCcXm/uwqG3GJDeAnRj1fgNF4crvA9kELB+d8ONjjkphUyYJegBL
	 8nknMgjVFerbOErTJhK1bWyaJzTQ2t4KiW5EaCr/bwNctfZxbKtdiUXvTwk0ipEux4
	 CgYiJQ0Bq5dVA==
Message-ID: <c5ec1707-5007-4417-bc54-303924598a1e@kernel.org>
Date: Mon, 23 Jun 2025 16:14:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: int3472: Add board data for Dell
 7212
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250520-djrscally-ov5670-v2-0-104ae895aecf@ideasonboard.com>
 <20250520-djrscally-ov5670-v2-2-104ae895aecf@ideasonboard.com>
 <aFlXSrZH1f4BbB3M@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aFlXSrZH1f4BbB3M@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Jun-25 15:31, Sakari Ailus wrote:
> On Tue, May 20, 2025 at 02:17:45PM +0100, Daniel Scally wrote:
>> The Dell 7212 Rugged Extreme Tablet pairs an OV5670 sensor with the
>> Intel IPU3 ISP. The sensor is powered by a TPS68470 PMIC, and so we
>> need some board data to describe how to configure the GPIOs and
>> regulators to run the sensor.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> 
> I earlier missed this wasn't for the media tree...
> 
> Hans: can I pick this (with your ack) or can you?

pdx86 is maintained by Ilpo now (with me as backup), so that is
more of a question for Ilpo. FWIW I'm fine with routing this
through either git tree.

> I the latter case, you can add:
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Regards,

Hans



