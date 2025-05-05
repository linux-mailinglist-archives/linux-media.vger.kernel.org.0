Return-Path: <linux-media+bounces-31713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33974AA95FB
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 16:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB07188C778
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 14:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8A8258CDD;
	Mon,  5 May 2025 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHyBwv9P"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D6877111
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 14:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455800; cv=none; b=jO+E8zpQFVTkIP1X9SFE45xshAJC6UEug9dGMmKOjKVoRF+kQGJS2+wOi5ae1zPmltZqHpHhlJf8oEl3d3MbzyUx7htR8of29JS7UcRtiyuELrvWV3EMmWADLZim52EO240BI9wkzaTR2pO3RHh015qtOIi8OjC5aIhrG5JBe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455800; c=relaxed/simple;
	bh=eDRYEh+WV+/ZXeuKG2LRV9TOqspHF7IcE/6cae7akpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZDjoWgCe/N5sH0bnuecbC693QQCms+U7WMTMo0vObi90FKjR5b1c45daMU7X7Np6zMH6BFkWMSqpcEBNLLli/1J9I0IhowNhS9DGrQSMsjFdYOM65LrrtPe9Tw3Jql5H8FybnfEI0C02YLSqjGGxIEIpUWZ+uMhaf2rkN8gaAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHyBwv9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56708C4CEE4;
	Mon,  5 May 2025 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746455799;
	bh=eDRYEh+WV+/ZXeuKG2LRV9TOqspHF7IcE/6cae7akpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jHyBwv9PoVUX7PArb6cCD3Kf2CW/ZZq//DZrf28qdGNw7+uwZks8tJYrDzuYCZWuY
	 hcFytbEaDWjhKTugtJJO7wHiYDIY2mh41o2I2VPfLwolEldhambhkYRxy9dvwQShLD
	 pAvcgNjBaBAp3mBK/dPzH+80/meDAHZtxCm+HUDnsQTqkhsVwFF/hkGmzUITAN3Z1J
	 KKgDwT4LklWa/rfUWsZkzB4A2u+DY3rpDG52TFqK8bb0I60htm2qNeVdIVzSL3Snj3
	 oS5LB3qOUNcAMaOEFU2p9kNurtIbr9Q7dtOG7Wq5PZSmqH0ZbtaqeHs77m1dgIu9GH
	 z1n068/BFdgcA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Date: Mon, 05 May 2025 16:36:37 +0200
Message-ID: <87selj5dl6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

On mar., mars 25, 2025 at 12:27, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hello everybody,
>
> Another year, another libcamera workshop. After the previous editions in
> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> ([1]) as part of their workshops day ([2]).
>
> This year, our workshop will be colocated with the Pipewire workshop on
> the same day and at the same venue (but a different room), to facilitate
> discussions about topics that span libcamera and Pipewire. The Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 13th ([3]).
>
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> in the next few weeks after receiving topic proposals. If registrations
> exceed our capacity, priority will be given based on topic submissions.

I don't know if there is any room left, but if there is a spot left, I'd
like to attend the libcamera workshop.

I'm sorry to be this late, my travel plans have been a bit difficult.

Thanks,
Mattijs

>
> The event will be free of charge for attendees.
>
> [1] https://embedded-recipes.org/2025/
> [2] https://embedded-recipes.org/2025/workshops/
> [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl
>
> -- 
> Regards,
>
> Laurent Pinchart

