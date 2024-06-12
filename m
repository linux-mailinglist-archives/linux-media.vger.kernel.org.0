Return-Path: <linux-media+bounces-13060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC5D9056BE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A401C22726
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5F617E8F8;
	Wed, 12 Jun 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5fxdoXk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1014178CE2;
	Wed, 12 Jun 2024 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205846; cv=none; b=F0vcjfmBEfjp4wZ9VcJzX/INDIXbpYiEEGr5HZ0Ik+wBmMosqVHfvKOCURa8sBT2FvD3oJbSGHyVCrNk6ZpzY58CM31vusqtm+Du44SuMhg1TFsNgAikhQebpLBVqmCzA4srirpLrNy/HnJ0ewn/nrbG0dvkBECZarVHZ82kK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205846; c=relaxed/simple;
	bh=fUZ+mbaSNdcCsJSK/yWLJwUy2bPRSRlb6UhOxTORqE0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5h0hNE0AKpULB3OuBSIEYKBDNNcLqJBjdKnfg8h+e/y7MKUKMY/aO2NBkoco+BGP7e2eY1bjJPBUQggqK6WSQbb5/Oy4F/s7jIpeKasAL9M8qVn1UHJ4Gv+4i6/N8/bxJ0AekGofiZ9twKSy2f5IDuukdbzuf1kNKTCkvZyI+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5fxdoXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79703C116B1;
	Wed, 12 Jun 2024 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718205845;
	bh=fUZ+mbaSNdcCsJSK/yWLJwUy2bPRSRlb6UhOxTORqE0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e5fxdoXkLnhAyXr3At8tTK6JNXGcMLYj4TZElKo8O6bHPtdB46ztAIvKtqZGzm8MK
	 /Fy+PECw+KWsFQ8MOC65zLNKOktZIDNtDQTVlXZgnQfnnlP0lLQTd/42Ot85SQcE5i
	 HfTx/l3vxkxLm+xpNuRJD0/L5Acc7rTMJHYlZF2thN8mrqxvAhDSoqIxCvKGbuxOTH
	 Fiz1KxvFum6I0WTNydoSDdYCTgL3CctoOkxwFNHk355IjTjldwAaMWaM+fbsCtExvG
	 O2UVqGSEot75v2/Nb3PW15haxVw7QpAJ4lLD8Z/yeav6hdE1urR0x0dMh2RghqlAFK
	 yBzZWH96Pef7Q==
Date: Wed, 12 Jun 2024 17:24:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, Andy Shevchenko
 <andy@kernel.org>
Subject: Re: [PATCH v6 05/49 RESEND] media: atomisp: Switch to new Intel CPU
 model defines
Message-ID: <20240612172355.11c470a3@coco.lan>
In-Reply-To: <38336785-cb59-464f-b2a7-49812f4c2ce0@redhat.com>
References: <20240611173406.352874-1-tony.luck@intel.com>
	<38336785-cb59-464f-b2a7-49812f4c2ce0@redhat.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 12 Jun 2024 10:10:14 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi Tony,
> 
> On 6/11/24 7:34 PM, Tony Luck wrote:
> > New CPU #defines encode vendor and family as well as model.
> > 
> > Signed-off-by: Tony Luck <tony.luck@intel.com>
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> > Acked-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > 
> > Mauro, Hans, Greg: Which one of you owns this one. Can you take
> > a look please. Let me know if changes are needed.  
> 
> I'll pick this one up. But atomisp support is a side project,
> so I only work on this every few weeks.
> 
> My intent is to get this send to Mauro (media-next) in time
> for the 6.11 merge window.

Hans,

It seems that you already acked to this one, right?

If so, please add my acked-by, if this will end being merged
via some other tree.

Tony,

I don't object having this merged via your tree with Hans
ack.

We may also have it merged on media via Hans tree. He usually
send me one or two pull requests per Kernel cycle with lots
of atomisp patches on it.

Regards,
Mauro

Thanks,
Mauro

