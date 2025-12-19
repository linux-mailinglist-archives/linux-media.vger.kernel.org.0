Return-Path: <linux-media+bounces-49216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B26EECD1F82
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 22:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 048B330210FB
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 21:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC8422173A;
	Fri, 19 Dec 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BtA8NdLi"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFFB33B6F8
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179903; cv=none; b=Vk+chQKkXlUOpiwBzSIAYhzYyH+RmbpNZz9+qBcwexTZMjx3O4R9SyKSTPx0ft/08UHRXnyd95kqxHPWkIQFwBuRrs6Hx3ZF4iQO/ZcsGDGNwPupCNfCoZKH9XRQw9jBIRw9gFkB83Kh3pllfZF7Qul3szGsMKDXJYK5UY8uUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179903; c=relaxed/simple;
	bh=sBrjzcAqMOKalYCGbXZgAsoq65Ikf/CSfX5hL9NJOKI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ghApIAqXQ0fvbSLdzBXQ7vSng87Elnw3XQhKACxtMi/nNv1dkFk4RBBQTTmMlHV0JxUkKBv57ORWqOt7IAqq/b0fFxOvLFQoCj+i9akkKgBmZdM1GNRH6ZknxxLZcygFZIlscsTCX5EyB/2Yks6jNX8UbvUzdiwD2oCuqsJ7Z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BtA8NdLi; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766179892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tcTOE6hnyzeq7VbX86TIxHLja2zhL/qcRRbmDpTsts=;
	b=BtA8NdLiNE72zW1OEDNlohZarQkO821nrV4D0xvl0ZDOWktl/oZyTYeEbFRzOxVccBWbTE
	nG44VuYuD4QrghLU+So2vlky5ugmchJxdYZfskgjALooJBZWq49aF2rwawl1U1vIItjxKS
	2NAn/Ga8jqWDivby2vXMJnXtpxxqNLM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] media: imagination: Fix value clamping in
 calculate_qp_tables
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20251202124555.418319-2-thorsten.blum@linux.dev>
Date: Fri, 19 Dec 2025 22:30:02 +0100
Cc: stable@vger.kernel.org,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <9843F19D-38FE-4CAF-B05B-ABEDD9F36760@linux.dev>
References: <20251202124555.418319-2-thorsten.blum@linux.dev>
To: Devarsh Thakkar <devarsht@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 David Huang <d-huang@ti.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
X-Migadu-Flow: FLOW_OUT

On 2. Dec 2025, at 13:45, Thorsten Blum wrote:
> The local variable 'val' was never clamped to 1 or 255 because the
> return value of clamp() was not used. Fix this by assigning the clamped
> value back to 'val'.
> 
> Cc: stable@vger.kernel.org
> Fixes: a1e294045885 ("media: imagination: Add E5010 JPEG Encoder driver")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> [...]

Hello, the media CI robot complained to me privately (not to the list)
with the following error:

  ERROR: Commit a1e2940458853d00c178c842c889e4ae3ef5eaec NOT found in
  the stable tree, but stable@vger.kernel.org is in Cc:

However, the Fixes: tag references the commit hash in master, but the
commit has a different hash in the stable branches. This is my first
time running into such an issue and I'm not sure what to do about it?

Thanks,
Thorsten


