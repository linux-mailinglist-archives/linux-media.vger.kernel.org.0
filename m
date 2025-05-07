Return-Path: <linux-media+bounces-31936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC61AADA2D
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51E0163D3B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747CA221DB5;
	Wed,  7 May 2025 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8qNHegt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E2182D2
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606539; cv=none; b=Q3aIndKN+vxwr6G14xi6kg7i6ihlXUG1mg7Cgl8BQnYfqqzCcpRaz4gw+5iEbcC5c5h6Hk2X+S6+yRsaIlbGosCglTRp7zCJZfTI6EpMEwrv0yC+7sGrTQ2s1/wBxRojKxN7kxEcMyVb0MM3/AK2KS5QWRdO0Xieri2N1kATZ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606539; c=relaxed/simple;
	bh=R1vZ1ZB7N2djXCO/RLStgHIq43nqNm1vEewCdDznRtU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o2rHO+FTqL5LLCRkMoYY9ux36Vc7lLZQ4f06VChdqwkbfn+25aOP4zLXneNqIf7s1B2qMlKL4proTW9bVFmtDFcqq34Cn30p/zAtm2CLQVvK2Qef4V8OMX/VlAZIb0dmb1DUcSe5+WrFyaAT41sHkEFIO5YjJ1+8Asg82s8IBPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8qNHegt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABC6C4CEE7;
	Wed,  7 May 2025 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606539;
	bh=R1vZ1ZB7N2djXCO/RLStgHIq43nqNm1vEewCdDznRtU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U8qNHegttB3UqYY+vkssS2c9i6HUQUK2gxX8wemTMqOxo+MdErRfsVzHZe6iiW7/p
	 p87yjXppmEsWu7OiAkJrQT/3MlVH3MGhjXohEch1/zocMGfc2/uN/t75sIVRBWcIrn
	 Mj/jKzlw9g1+YBWdcR73Io0jR41BPuyz2+6XHCwpn/dKiTNVKg9M+WHChu83X5ETe3
	 fbcFqpxXFHr0hUJ9Px07jfC450jlvS+kWA+OAiXlNJwRWapZPCRQDzgimLZCg1aw5a
	 O/XY1E74s293gtKkblSSxtSXsscEvKE1ivgqkcvN9xo3UBmdaMJog5toV1x9lz4omr
	 Qu+reAxAZ5x3w==
Date: Wed, 7 May 2025 10:28:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, Kieran
 Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250507102844.0fa7f798@foz.lan>
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 25 Mar 2025 12:27:50 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

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

Hi Laurent,

I'm also interested on attending it.

Regards,
Mauro


Thanks,
Mauro

