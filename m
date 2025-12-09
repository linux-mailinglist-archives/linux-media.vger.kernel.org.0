Return-Path: <linux-media+bounces-48449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE4CAE734
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 01:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCD97300A723
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 00:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC50B1E5205;
	Tue,  9 Dec 2025 00:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMDn4+SH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EA31ACED5;
	Tue,  9 Dec 2025 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765239104; cv=none; b=nYq0gFr/gV1OCgwTN01YIQ1xiCprqCePeX9DlG/BrySE9qMYN0LSWqSKQ1bxSjpgsjxwblY9NAs1TRr/8KlcVcawD/5bOLrXDmVbxGr57JS+/XR6bdbm9Tr4pG7TP9J2C45FQdn8shjzrlLEdAE43OpLlZXFnBLlbqI3V25Mm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765239104; c=relaxed/simple;
	bh=tIdjQWWp0kMsurD3XuOmTIYkOLyY83NVaYp6+3RiaO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pjcgfrqu/rW4dokV8ZCiFO6ldbuYVeMAIEN/xtXo3Mmz9NhaEGRi0EGibaBXSs/ToRs/wktm6n7DIn4NKcwCKDnmrDOJxN3NZYdF9dfoCwfsnjomtPOEL/ZVmvmeCmsswVvrJShA8uLYLWUUup95xXvdr4Ma669HjBnFrmFGvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMDn4+SH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901AFC4CEF1;
	Tue,  9 Dec 2025 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239103;
	bh=tIdjQWWp0kMsurD3XuOmTIYkOLyY83NVaYp6+3RiaO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMDn4+SHSIbZ+JHBuGHcEk/NLqml7en6m8lxWrS3zyGW9WgZlMG3aYB32KojzMHcl
	 5pSuGW8q8HEiTPaPzT5y0drdol1dEJbroLj2ZbniSo5bQNBBSI295wLeMPVFR/ANqn
	 ABJMBQF89MxffVvMOmcrpVVXL31xVf4yqnIsuih4JKzgWuG8mmlHJvhFfghbsPLIC+
	 6481l5gxRywPt8rsOCoHkMdo7VvdtnrcOVlwMmH1u+S8GJ8Hi+kiOtPvWV/rKX2b6w
	 w3CAacUUj4eZE7peVsZiLx5TAjPR3CD/M1g0ddPX5v9+yxNDVrEXCLXC7am19pvl1T
	 lOVuoqLw+kTHg==
Date: Mon, 8 Dec 2025 16:11:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <20251209001139.GA7982@quark>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTc9s210am0YqMV4@agluck-desk3>

On Mon, Dec 08, 2025 at 01:05:55PM -0800, Luck, Tony wrote:
> On Tue, Oct 07, 2025 at 08:59:35PM -0700, Kees Cook wrote:
> > Long ago, the kernel module license checks were bypassed by embedding a
> > NUL character in the MODULE_LICENSE() string[1]. By using a string like
> > "GPL\0proprietary text", the kernel would only read "GPL" due to C string
> > termination at the NUL byte, allowing proprietary modules to avoid kernel
> > tainting and access GPL-only symbols.
> > 
> > The MODULE_INFO() macro stores these strings in the .modinfo ELF
> > section, and get_next_modinfo() uses strcmp()-family functions
> > which stop at the first NUL. This split the embedded string into two
> > separate .modinfo entries, with only the first part being processed by
> > license_is_gpl_compatible().
> > 
> > Add a compile-time check using _Static_assert that compares the full
> > string length (sizeof - 1) against __builtin_strlen(), which stops at
> > the first NUL. If they differ, compilation fails with a clear error
> > message.
> > 
> > While this check can still be circumvented by modifying the ELF binary
> > post-compilation, it prevents accidental embedded NULs and forces
> > intentional abuse to require deliberate binary manipulation rather than
> > simple source-level tricks.
> > 
> > Build tested with test modules containing both valid and invalid license
> > strings. The check correctly rejects:
> > 
> >     MODULE_LICENSE("GPL\0proprietary")
> > 
> > while accepting normal declarations:
> > 
> >     MODULE_LICENSE("GPL")
> 
>  
> I did a "make W=1 C=1" and found that sparse is now unhappy with all MODULE_LICENSE(),
> MODULE_PARM_DESC(), MODULE_DESCRIPTION(), MODULE_AUTHOR() defintions (with no NUL byte).
> 
> I see:
> 
> error: bad integer constant expression
> error: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
> 
> for every use.

Likewise, I just got the following kernel test robot report sent to me,
where it's warning about MODULE_LICENSE("GPL"):
https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/

- Eric

