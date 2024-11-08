Return-Path: <linux-media+bounces-21165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C2C9C1F91
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9351F21C43
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92BC1F1308;
	Fri,  8 Nov 2024 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="omu41Uax"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406F1803A;
	Fri,  8 Nov 2024 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077137; cv=none; b=orIVzTruHIjuCllXP/+MlH80mST3g8yqqM2d+lnKBcrBorb7+sZaMP46dsGeyO78HGcAnOA5Fqb3nGfJHT57KbA2OY1d/af4zMBw0czcGWcmup0/DZKb27LxvsZMC5K89pjsyVNIVRHTlhye8+neaLSI5S25rIZarbs7gnxjAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077137; c=relaxed/simple;
	bh=tIIQbhQUlbE30HHafhnF0uYqozpc/bIGR9GRN46szTk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G/24LZuZ5tAgR/sjJfUdFqCe3FcriIJauVnOP0fzdqIHTFP5NscThWzqL6AexImASJso8Rc7rUhaozcBzJyFkzzt9AZ9f38v0co2nxxHCOfjsZJtiu0/VFPJsYb2dDu+9sbUYodEq4e6o3g37E6LF3QvXCIPgJUvV091PdpWwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=omu41Uax; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7880042C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731077134; bh=YpgSjiK1hGER4rJOGI69k1cw9XtNWold06xtprBx7+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=omu41UaxRayKigrbHXLgZ0+avo6ASbsAViADXGb+DHiw6CsUSn8VLLwU9Jm5Z1jS/
	 Zc5E3K9oPVZE/PiTu8XQp/veR3bZEN2N/zXDxmYxntEBRHtqALoQ5TwPzhYXHAqIle
	 bD/+ZJG9kVjY2sOM1OGHET4cxldg0MBdgASlJM7EARuSmihs0lR5JhXbv7i4oVb0cT
	 1yl6qrQR8X67dSTe9iHarA6EyYgDH8U6dcoq6hv8SmYWt5qGvuGyNhLfxu4PDTxy+z
	 py0okf/R4c5b5KO4Yl4Nlect26dvNz92FGdzGm8Av1XgDNDCS6sIwyHy5YTQGjV03R
	 dCsB8kSAlRbUQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7880042C17;
	Fri,  8 Nov 2024 14:45:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
In-Reply-To: <20241108082416.u6vvdmmhadfqtiau@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <87ttcj0z8x.fsf@trenco.lwn.net>
 <20241108082416.u6vvdmmhadfqtiau@basti-XPS-13-9310>
Date: Fri, 08 Nov 2024 07:45:33 -0700
Message-ID: <875xoxzsvm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> Hmmm my Google-Fu is not strong enough, I can't find a docs-next
> anywhere neither in https://git.kernel.org/ nor in the Linux Kernel
> documentation, can you point me to the tree?

That's what the MAINTAINERS file is for:

> DOCUMENTATION
> M:	Jonathan Corbet <corbet@lwn.net>
> L:	linux-doc@vger.kernel.org
> S:	Maintained
> P:	Documentation/doc-guide/maintainer-profile.rst
> T:	git git://git.lwn.net/linux.git docs-next
> F:	Documentation/
> ...

Thanks,

jon

