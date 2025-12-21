Return-Path: <linux-media+bounces-49262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F5CD41AB
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 16:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDB733008F9E
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D86287517;
	Sun, 21 Dec 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko+q2jyS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01C1482E8
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 15:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766329287; cv=none; b=EXqAPfJJNGN4UuDIN6IoKCVtH2+Od+zOjdfnPqPU43WyfwdFEYn5AXIruVN1PprrKacFQdjaxkREcjZbKHMNdClywUb+E/1+SbuhDEx0zv8avXaebKEIMv3lI5mgKRAVxT8RI03B076PTjnKMbrR8do+ArCwFHr7sPSRp05Drrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766329287; c=relaxed/simple;
	bh=meUYDjVcmkFWVnJfrDCiSzQ/3Qek+VlSnCcGEATmuZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfkjoUWQNxgBAJqFA567bIdw3Cgi/HWqtcEnrT+ajeQvtfF1Va+zeiuyOShcMVtO86Zxj5uk260rQxc2U9FHv1hRHamNsdqzwyw/WkWTdWm95XVvQxr+vc7Mj5GecOpIi5RDLjZm6XTho0nWCACR5z3acQYcL/Am1gFW9Afc3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko+q2jyS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADF0C19421;
	Sun, 21 Dec 2025 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329286;
	bh=meUYDjVcmkFWVnJfrDCiSzQ/3Qek+VlSnCcGEATmuZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ko+q2jySE0dPGCEUcpAPgC6GtyITA5jk9aryQkSvB8kNPdrC4JItw07PZd4zgU/XD
	 Lnrn6Zx90y1qwvIJ5vjDkezD7I9WWCCYvtCueVmRtrJTiB4a3fM6fxPBKbEyu1sWwr
	 eQd7XVKiKdKslIlp9aIcDdRx0x6upf43z4UNCjxVdAgofB+zvECk7bFCfprvIuTHT+
	 ahTcTPVw0cosEg2NDVoEN2N0IZQVV+IA4+U5wEs9kdTZuffc9Q3wUOENHAamFPRYSw
	 8tv0lwi3GU6go+0wQr8EFrjkGUbqwFGdEmGTMkHF5C7M8rmKFEod1Rwi1CNLs7U8Ip
	 owbjFaXi9fuJg==
Date: Sun, 21 Dec 2025 16:01:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <20251221-courageous-subtle-sparrow-75fa52@quoll>
References: <cover.1766123192.git.alex.t.tran@gmail.com>
 <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
 <6d5b7422-e1b6-4bfa-8dbf-e95c3dd19f57@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d5b7422-e1b6-4bfa-8dbf-e95c3dd19f57@kernel.org>

On Sun, Dec 21, 2025 at 02:15:10PM +0100, Krzysztof Kozlowski wrote:
> On 20/12/2025 21:42, Alex Tran wrote:
> > Convert binding for toshiba,et8ek8 from TXT to YAML format.
> > Update MAINTAINERS file accordingly.
> > 
> > Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> > ---
> 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
> 
> Please kindly resend and include all necessary To/Cc entries.

Odd, I see this reached DT list, but was marked by one of my filters.

Everything seems fine, so apologies for the noise.

Best regards,
Krzysztof


