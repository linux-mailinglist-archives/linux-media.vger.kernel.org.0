Return-Path: <linux-media+bounces-44942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C2BEB715
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 22:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2411D4E94F8
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 20:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9115626463A;
	Fri, 17 Oct 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IOhdQb09"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5333F8DB;
	Fri, 17 Oct 2025 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731723; cv=none; b=N4MSwcbUwpnJN1R99uvQFLG3BCk1VakO1Jt8mWgQkLnb+An0C8FoyQSg2cv62vnCVXSmwuXSaxE0oS+/CC4PqJsiimQqqZIFOR6wE2aft8Hm067CLy7dIPiCD1mtisu/JfVnRR3WaFekUhlfXhAkfNgl+En1jZMTO3Jg/Q87xdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731723; c=relaxed/simple;
	bh=mqgzHYNbed1bkvPNFELxeM/6jxkFoNeu/evIeYHFfEQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p3aJJJNnQz1mb2Rbyv83AYW3O9enXnxgC8+L6c/ommGk8n2n4ITe/pRADcIY+imIXUi3egzEVK8euMbrMYWOzQFOmIG0J20vtjEwA6cNoUJIm0dvR7fve1rcGcjUrY5CoEEHTkDJCHHLhshO0KjBZNy6PkucCNKB5nwwj6yDtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IOhdQb09; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1110540B1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760731720; bh=Eu7Efolufq4MnZu/dPzVcX1UsuGoN4glZCYwWOMEPq4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IOhdQb09ZMx5KbybaUxCQ2hP7BAEGCwCDQs4Nlf7Z/TeHcdHwOJ28utrF9t54R5om
	 ieg64H+PosVgN9OboSecRbnM31lS+Eot3uCUtlIN3iCDuJ3RsD4ZZybM03hj/JlQv7
	 ujc3PXisIY79RXe54ZKdWsfyL0XF5qTOmee/eOWzS1e+ny5DO1lYwPbzdrTwpPJpXx
	 m3os40pZSUqtWTWIA49En59TgBlTLSTuFDaySC+fLmheNjAVcjoNEezB56Vp7ChaT1
	 Xq0gZRc24AEsWltCwzjS292+W38vCFBWAs9LGq3rcTbtQnhPxM67E3SjQ0iCzaadE1
	 2eGDPXgJ9obbA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1110540B1D;
	Fri, 17 Oct 2025 20:08:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH 00/23] Fix media uAPI cross references
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Date: Fri, 17 Oct 2025 14:08:39 -0600
Message-ID: <87h5vx1ebc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> In the past, media used Docbook to generate documentation, together
> with some logic to ensure that cross-references would match the
> actual defined uAPI.
>
> The rationale is that we wanted to automatically check for uAPI
> documentation gaps.
>
> The same logic was migrated to Sphinx. Back then, broken links
> were reported. However, recent versions of it and/or changes at
> conf.py disabled such checks.
>
> The result is that several symbols are now not cross-referenced,
> and we don't get warnings anymore when something breaks.
>
> This series consist on 2 parts:
>
> Part 1: extra patches to parse_data_structs.py and kernel_include.py;
> Part 2: media documentation fixes.
>
> I'm not sure what's the best strategy to merge it, as some patches
> belong to doc while others are media. So, they can be merged on
> either one of the tree, or split on two series and merged in
> separate or even being merged via a PR applied on both trees.
>
> IMO, the latter is the better strategy.

OK, this series has been applied to -rc1 and is available in my
media-uapi branch.  I've also merged it into docs-next.

Thanks,

jon

