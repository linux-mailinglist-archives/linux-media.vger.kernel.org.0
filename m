Return-Path: <linux-media+bounces-43446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0579BAF487
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 08:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A4307A6BBC
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 06:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD9D224245;
	Wed,  1 Oct 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQneraev"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F51E51D
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301250; cv=none; b=TBBImFdNr2jTJEH9qT4USV2DYWvSkp3kNnvesfhVi1lobmxnSVx2cDnZtYvM7nEM10kRlYGGYwmJNahB608fkfjuzWsCFkm0Nuzh6IJfAwGRWe5v9xPBvlxhCjxetXn1h+xg4cPZXshSfLus3PozCp/Qm85/2vlwzcayy6tZgQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301250; c=relaxed/simple;
	bh=SQGnCAcc3ilf8XbhTSehYUeS/nXfC3KuBPuG6OBfoAE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=S6+YQxMItyScoR85aWUzeE0j2Cc/NM8NhKVKfZnDWRX2rM33Y5Xx9NpgeVvbiyP6Enw3C71xMj+j+g5sxStSfm3C5Nb5Fm3XclL/zvo11BTCuEBtK5Hkl4Pp0nW2/0JsTz+hWe4kR5cKMYliU5ZYGzqJTgNSlkvHHVpik2D+8l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQneraev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65481C4CEF5;
	Wed,  1 Oct 2025 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759301250;
	bh=SQGnCAcc3ilf8XbhTSehYUeS/nXfC3KuBPuG6OBfoAE=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=JQneraevMjcbIzeDrCf3FfEQ6R+MrBSXppQA4sI1SZxW4FZXn1AXztZ59uA+invxW
	 +V7DjvfOkhwIiGUYz+QPVD2GdJ0VK/CNosYwBM8uui/a5VYM/JEhN632YBZmBITo8V
	 KRvOFSWRcro6KgPoZaqAvvHgI5zIQRaJfduDAxPZOYFY9rR1RKiwjNnp7ln+rEwXFH
	 cIkOYlXyrL2pX68quIFLNzvE6tQLsxu25ZWtabsOYAaXDtBBLLoGWy1xpEV/YLLS1f
	 CLB4bPP4E5Gf5IwuOLjVAX7LMFYL6/85zggXBx+evIft8yu+rFzFw0asqlbFprrShF
	 FfY53aN8hxX5w==
Message-ID: <7bc87325-6caa-4230-8dc0-77eac8636556@kernel.org>
Date: Wed, 1 Oct 2025 08:47:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: Time for a new v4l-utils release?
To: Gregor Jasny <gjasny@googlemail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>
References: <63e94c28-4013-41c9-8354-bd5a2b9393e9@googlemail.com>
Content-Language: en-US, nl
In-Reply-To: <63e94c28-4013-41c9-8354-bd5a2b9393e9@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2025 20:01, Gregor Jasny wrote:
> Hello,
> 
> do you have any objections or blockers for a new v4l-utils release on 
> the upcoming weekend?
> 
> Thanks,
> Gregor

No objection from me. Not a lot has happened since 1.30 was branched, so
it's fine to wait longer as well.

Regards,

	Hans

