Return-Path: <linux-media+bounces-3232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF71825086
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63891C22D7F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E2A24208;
	Fri,  5 Jan 2024 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dqM7e62P"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671224201
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704445456;
	bh=catFhC7QxRNUsfvTalqfYbmfWNtqfVz8smE35dp2IOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dqM7e62PExG/bmTIZERtK/x66aCbZvC1Xok3bcvX+8NAdUB/jl7VWYpqYC3MtpqJz
	 +FvFr1uGfsQyHbhF8T1NfzWbRmvFe10XBJ+OtKk5wBEbqCVGNEOYIif708jHRvZHin
	 gJPYt8HEKWUyxpnPoEgN0J/iJMNt0SOvROXC8l+JwnUdjKrdtQZMpk8JVfbom0NwB7
	 ANZ4IXpQa0MnAb43IGl6yTZf7gDHv/cqDw1NJ5LbL61xgRkOk2fcC3CKNr2ygDHXW4
	 HLbFBRlRRbnhQqwfW617mCxkUoJIiM/0m6e6vMw1VsTPGtVosXFcvEt4BOYFwBO0Sz
	 fpY5cyhL4bVkA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E52CB37801C1;
	Fri,  5 Jan 2024 09:04:15 +0000 (UTC)
Message-ID: <c56f5b1a-b5bb-4ae3-90c5-bce74daa76e7@collabora.com>
Date: Fri, 5 Jan 2024 10:04:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: cadence: csi2rx: use match fwnode for media
 link
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: j-luthra@ti.com, mchehab@kernel.org, mripard@kernel.org,
 kernel@collabora.com, linux-media@vger.kernel.org
References: <20231218095604.1950737-1-julien.massot@collabora.com>
 <20231218095604.1950737-2-julien.massot@collabora.com>
 <ZYAocHzVwMrLDFI2@kekkonen.localdomain>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <ZYAocHzVwMrLDFI2@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 12/18/23 12:09, Sakari Ailus wrote:
> Hi Julien,
> 
> Thanks for the patch.
> 
> On Mon, Dec 18, 2023 at 10:56:00AM +0100, Julien Massot wrote:
>> On some subdev the fwnode is the device node and not the endpoint node.
>> Using the subdev fwnode doesn't allow to fetch the subdev
>> pad we are connected to when the remote subdev has multiple
>> output pads.
> 
> I'd change the commit message, endpoint-to-endpoint matching used to be the
> preferred way to do things not long ago.
> 
>>
>> Fixes: 1fc3b37f34f69 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> 
> I think the driver was originally fine but I missed making the below change
> when changing async matching. Instead I think you should have here:
> 
> Fixes: 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching")
> 
> IOW applying your patch without 1029939b3782 will also break cdns-csi2rx
> driver.

I just replaced the fix tag, and the commit message as suggested in V3.

Thank you,
Julien

