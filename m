Return-Path: <linux-media+bounces-49967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A3CF7050
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 08:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B70753013BF4
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 07:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18668309F1F;
	Tue,  6 Jan 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUu547Pe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747253093B6
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684031; cv=none; b=CDaF4oQ6/vtV20nH9qjqn305u30zeepCM95jwm6/pWZbQhHjQ5aLwsK0RSyeZovjsq6e9KxG+7O5plEHoYDj/TXpiIgJTQ8E6UMfPCYP59pgtXvZ0TZjHTxt2SThfJsfsfkfV1HBQsOkIHXhVxMvyRXXSvbyvYYLTXlIyqBG4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684031; c=relaxed/simple;
	bh=/zEBAlZBiYqagAPa8sWBswU7epl23YZNGOBcV8Nyubk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rfzox/a5A0hmAsRzjYB9EeUTuNkqUDcR7jNT71eBx3uhR3ToezvYAT/1qhEi8yrjHqLCQK2xueBXSLwWsxodvnOuqTMRsgITzBZ+2nT7GilzN9F7V734OIK/xpsYOW21dnwCAQ+orcSkMasue9PJg0JYM+Z5xYujROXRHt8oFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUu547Pe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C6AC19423;
	Tue,  6 Jan 2026 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767684030;
	bh=/zEBAlZBiYqagAPa8sWBswU7epl23YZNGOBcV8Nyubk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gUu547PeIgr/MqjqRuZ6v/oSyKoXeje/z7zd/fIle5yrwP899vrGm7kfD1mz1otad
	 t8CZFKGOO6a7IoCwp/YXw9K3PCsF7PWSpytb4N0ai16mM/bXvNTVmhSXB4Ep24sEG9
	 gRmGatTI8q5Xg4neBfbDRD4DPQNschz0qkFEL56fKi4YTALuMhTBYEMUGmGUWZTL1O
	 yBBRm1DnR9wgB0wzgj13DF+3r76iC7IY13RDoiXH1r6Tp0EQtEzgyA5FU1iJwsaknY
	 bBE8MWgaibBBZWX6MmQdH42xes+LRa7dBEOuc0ZQw4rQPMbXkhcu8h5AGdVH7ok98P
	 lP72bzzR7397Q==
Message-ID: <63f21eb4-e789-4e77-b362-9ff94e1fdfcb@kernel.org>
Date: Tue, 6 Jan 2026 08:20:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv3 00/12] media: omap3isp: v4l2-compliance fixes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
 <aUVGY_zKzbyDKJMU@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aUVGY_zKzbyDKJMU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 13:34, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Dec 02, 2025 at 08:51:08AM +0100, Hans Verkuil wrote:
>> When I worked on the patch series to remove the vb2 wait_prepare/finish
>> callbacks, I had to test that series on my Beagle xM board with a
>> Leopard Imaging li5m03 camera.
>>
>> Since I wanted to use v4l2-compliance to test the vb2 change, I first had
>> to fix a bunch of other compliance problems in this driver so it would
>> actually be able to run the streaming tests.
>>
>> This series contains the fixes I made to get to that point.
>>
>> It depends on one sensor driver fix (posted separately):
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/554fb9d7-374b-4868-b91b-959b8fd69b4d@kernel.org/
>>
>> This series doesn't fix all compliance problems, but at least it is
>> a lot better now.
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Also let me know if you'd wish me to pick these.
> 

I can take this series and add your Ack.

Thank you for looking at this!

Regards,

	Hans

