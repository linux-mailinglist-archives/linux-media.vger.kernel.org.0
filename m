Return-Path: <linux-media+bounces-35956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB1AE9DD1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E566D189056B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 12:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FA22E0B72;
	Thu, 26 Jun 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="oPLktx8I"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A091EB2F
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942223; cv=none; b=Ul1XsDq5VRH1m847MKjZRGBxJSdQT24q+lM+rQqrhydvZCZtdeaCrFEem0BG9eGUrtGU/hgwJcEUIfvhSgHadOaFFUZPoWurzObqbwTtOpanWU8TlhCO3njxDRB9JArvsgaNjNJkObu8KszL87ZXm11fJkpdZFsOxlyBq0o5Kw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942223; c=relaxed/simple;
	bh=N4Ns8fU5OHnExB4TCo3WLamqPuJdC6P+fna2b3SAWbA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OykHZj1ZNzpfSSNOFbDGMg+GWDViXbZswAgoAat49eRMUkDE8naEUTkupkfRgp1UZ48RphzKsoCwXrSgvXKN4jtTED5/ob+LYFaTta9sVLszyXQx1Vgf6ylyVuM2Co/LZiyQYGH2bWWl1ZUu6luouP6FNBJUZTbm3+iEgWm3hvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=oPLktx8I; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=qQzvCrFWDEFB1QjulIbcEQzH4y3bekAybaxC8BdV/y4=; b=oPLktx8IanHqSD9y
	VFmIUnksS+r6SATavGkOdl6bM+pwNDfnUStGoewqMvM+quDMV4GUwA/7Qwu4TK1vSpqYLpR56G8Ef
	V5ixwkE2yzat9XQAZw8vAfSITWVnFJ464Uex+WVp0hCOeAQBZ+kQNVMSorJebbtDOQVyCR4S9NcZB
	aCLWAKiU+2z8i1RyEHgfLxPKViAQegOlvlGHNYpSHur00WIPipY9f1VnL+ZFH+6KcU6uAQsnKC8cR
	hZxLEG+MDsZkhCmyDupyxBAE9ZlRNJh4+h/82xk54k47KgDj7CwdPy7Fux77pvaNFDVGXryRnrhfC
	2xLutG3j7gxCku/FBw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uUm3W-00CDrF-1K
	for linux-media@vger.kernel.org;
	Thu, 26 Jun 2025 12:50:18 +0000
Date: Thu, 26 Jun 2025 12:50:18 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <aF1CCjVmRruMORto@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <685c08d5.050a0220.350bff.01b0@mx.google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 12:49:05 up 59 days, 21:02,  1 user,  load average: 0.06, 0.03, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Patchwork Integration (patchwork@media-ci.org) wrote:
> Dear Dr. David Alan Gilbert:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #7: 
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #61: 
> deleted file mode 100644
> 
> total: 0 errors, 2 warnings, 0 checks, 30 lines checked

I did check that, couldn't find any appropriate MAINTAINERS entry anyway

> # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #7: 
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/

Yep, said that in my cover letter; suggestions on how to refer to that URL
in a better way are welcome.

Dave

> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #71: 
> deleted file mode 100644
> 
> total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> 
> # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #8: 
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #55: 
> deleted file mode 100644
> 
> total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> 
> # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> #7: 
>   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #35: 
> deleted file mode 100644
> 
> total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

