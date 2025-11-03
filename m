Return-Path: <linux-media+bounces-46193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA38C2B0FE
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8795A3B8EE5
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9C32FE05C;
	Mon,  3 Nov 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udK4TPwN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE1E2FD665;
	Mon,  3 Nov 2025 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165755; cv=none; b=RwCxBqQeZ4mPEvrtxB46tWgK29aKFaxW+Nk0dJP00PMw6aNN8teOqHoBbdndRmfCTFIk8MtwFw6vrmO/FO+PK7KQePolN9fmKjoXN3lObvNpbBTXYgYkIO2Rzq8g3cgN2cQ3XmWobJ+oJ7bo577O4jgB3cxFsYm0t1X0z4IQQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165755; c=relaxed/simple;
	bh=Nbx4jNGtndYSzelN2f3hPMbPkOF9Gg5x+1ly90843YQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DzzYtmNoUb6/8h+vqYQTQ7pWv4vgsPSjpdDOGiiNA7DlrBMDfxKqvMPgyZkqdmPhuNN1GUQZl7Zlt1C5GrqjlUnVW+YzH8WCrlXm7EjKpN6dFo63PIBwS6Wc0fnn8rPTfWhkWlQG7d7XWS79R/fE6hhV2Cj/Afrt3VELG7u84Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udK4TPwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBADC4CEFD;
	Mon,  3 Nov 2025 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165754;
	bh=Nbx4jNGtndYSzelN2f3hPMbPkOF9Gg5x+1ly90843YQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=udK4TPwN/ksIoBwdrHsqjQELjlcpcINFzrOi5uYABT4QycI3hkBmkBKKDFldffJl/
	 p9dqOW/eLy2VJL19H9izAY1gnXPxW4UAq1tBuSTqt8oAT74ZByXDFi4BzoGiGrtVc4
	 Vk7MUuIIMhxDSbNRnBXi/n4U2jdZY1S4f+1HzyajJVK3ZD5ZEAwCOqtSflYfrw5yI0
	 4vt3AlOud83bPipijIU+DTPawq6NphAAhngvkMHO+9Owz3xiYf2wrXDi+i5Ln90uoI
	 4L0jj7U/dFePBBWSq22YdgAHZTHTfIIGcA/kjZIpFWYiLNmnL9BbnJipYVETO+3bwz
	 HTgcwGM9jwaCA==
Message-ID: <a9abc4c6-5b23-4165-9932-5e587a49e439@kernel.org>
Date: Mon, 3 Nov 2025 11:29:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: renesas: rcar_drif: fix device node reference leak
 in rcar_drif_bond_enabled
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Miaoqian Lin <linmq006@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903133729.2523130-1-linmq006@gmail.com>
 <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAMuHMdWBXv+vKqBXOWeFqsy0R8-3__oBFWnm4rUx1kqSq5ZUgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 17:09, Geert Uytterhoeven wrote:
> On Wed, 3 Sept 2025 at 15:37, Miaoqian Lin <linmq006@gmail.com> wrote:
>> The function calls of_parse_phandle() which returns
>> a device node with an incremented reference count. When the bonded device
>> is not available, the function
>> returns NULL without releasing the reference, causing a reference leak.
>>
>> Add of_node_put(np) to release the device node reference.
>> The of_node_put function handles NULL pointers.
>>
>> Found through static analysis by reviewing the doc of of_parse_phandle()
>> and cross-checking its usage patterns across the codebase.
>>
>> Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Note that this is a duplicate of "[PATCH] media: rcar_drif: Fix an OF
> node leak in rcar_drif_bond_enabled()", which was never applied.
> 
> [1] https://lore.kernel.org/20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp

Ah, that patch was never CC-ed to linux-media, so never ended up in our patchwork
instance. That's why that wasn't picked up.

I'll take this patch instead.

Regards,

	Hans

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


