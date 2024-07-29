Return-Path: <linux-media+bounces-15467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8793F86B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F212811EA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D64155335;
	Mon, 29 Jul 2024 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FYLbRiFb"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDB823A9
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722264050; cv=none; b=KL9o8x6EF5LzCE/0quC4SORIc1+apU86zqR1yRBxlARgNYwijGci+d9UxtnZNuo+MLcyr3cMjylJjbtOslStReO38N9cjPwCWE6ffT2meCjZTmDRxSMeAxU7VZircLarJoqck366UL7GTH3O35DecXBGMLh1BOwKKnT3/XsKZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722264050; c=relaxed/simple;
	bh=B86YC1nAhYvS7kh58Lnpa4ninp/bNDzToN0xeGoIz7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNE/9Am0XsAiGgVhH61VGqStAzwkUI/Kt82bQV8lr4KFyQZj1pf5AReDYVKBPCx5uZy4Znbab6ybIOmt3bWM6O/jE9qE80KlLgYdD2rAqZyyBTQnm6QJmXc3O06dxeihf6Xp0V6VmC9jNd+COhEQ3fG4zLnBfdmKdGcgtNVCOk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FYLbRiFb; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722264047;
	bh=B86YC1nAhYvS7kh58Lnpa4ninp/bNDzToN0xeGoIz7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYLbRiFbq00FIzxsMH0i5jKOCkXcdR0wVJdqjIpKM/1vXM2B/9DUi19AGhrS3Z+rS
	 pElOtlrlbWTlrFS8crbXxfYbu0EevjtyqCnkXyXBSQlWbD4+hecKSWCuzGbU+OR+Z5
	 CTrWFKZ3xZwJbyc/V8p23VF48rNdZwtTzo6skhyFkqlL3oCgfvGj4EJ/+tRaiwK/8Y
	 NSt5kEpIfnw42EqfEreNU0udWCVZKa75x2suS941ezM+fAxV0cbpeDZIeuPplTCTzt
	 H0rFGO9OdLFhS9O4J88HN8ZNc+aUxvhnyh2I2u1BU+Ql9nTpqYkFvcMeGU79ihkKe/
	 UxVdstv6VX9xA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E5E273780480;
	Mon, 29 Jul 2024 14:40:46 +0000 (UTC)
Date: Mon, 29 Jul 2024 16:40:45 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240729144045.ajh55hxhqzcclm2z@basti-XPS-13-9310>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>

Hey Laurent,

On 29.07.2024 12:00, Laurent Pinchart wrote:
>Hello everybody,
>
>Following the success of our workshop in Brussels in February, we would
>like to host another event in September.
>
>We have evaluated different options, and opted for week 38 in Vienna.
>The city will host during that week the Linux Media Summit (Monday the
>16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
>the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
>[3]), and we expect that co-locating with those events will ease travel
>for attendees of the libcamera workshop.
>
>The week is already busy with camera-related events on Monday with the
>Linux Media Summit, and on Thursday afternoon with the Complex Camera
>micro-conference at LPC ([4]). We have therefore selected Tuesday the
>17th for libcamera.
>
>To help us plan the venue, could you please register your interest by
>replying to this e-mail, either publicly, or in private to Kieran and me
>? The event will be free of charge for attendees.

I'd like to attend as well, thank you for the effort!

Regards,
Sebastian

>
>Please also let us know if you have any preferred discussion topics you
>would like to include. We will draft and circulate an agenda in the next
>few weeks.
>
>[1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
>[2] https://events.linuxfoundation.org/open-source-summit-europe/
>[3] https://lpc.events/
>[4] https://lpc.events/event/18/sessions/193/
>
>-- 
>Regards,
>
>Laurent Pinchart
>

