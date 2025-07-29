Return-Path: <linux-media+bounces-38604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12CB1456E
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 02:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85B657ACF78
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 00:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836831624E1;
	Tue, 29 Jul 2025 00:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0eNBzxh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408E2E36F1;
	Tue, 29 Jul 2025 00:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753750009; cv=none; b=acFqCXMGVuVFlTRNNYQ+T8nbBMFEaMjfKQXliiUSYDrjPUg5K5Ex0BNNUg9C1T929XMGuMeLDBWpgeokKXzIh7nN1E53Wg8tiTiou/lFexGuWVa4kebZhwCOkcgmI1hzTukhkMDq5lKjq6c0assqA1rWNCZJx25+i6qtie2QlHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753750009; c=relaxed/simple;
	bh=bf2RqIM7mDDlK0HjMycdmFAJchzK94V9wrFA7aCHun4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMDc5svjEE4SX06IFCTdUBUi8NLFiHTGs/akM65NJA1ZAzJpwQ8ADC2SrYKFRM0qgGyMXPo8BB1TkFTbNurURzkluMKGMk2LfzzAlvjN7Sp8ca33BzTN6nNKexEBL6mXyb/NZguXJi3bRGdgXWd3aDNJD4wU9q+oc8jkORSb1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0eNBzxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C767C4CEE7;
	Tue, 29 Jul 2025 00:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753750008;
	bh=bf2RqIM7mDDlK0HjMycdmFAJchzK94V9wrFA7aCHun4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0eNBzxhf6u+q2DiutlhwrYKjQQsYsH2s+8rqUsYxrcsthzG+tEf4HVgYKnnGNLaE
	 V6AWlSauqKBBpSVY7BapmpAsWqQvvp7DpRuaMU+09fe9Z6sLgA3Ag/hFujnFAS+K+0
	 suz4gWnxUrZdbsIkEQFkwyEmTHjGNQUncPWDREsVzdgTF9LAoNsadEN+DCxmQPhwEp
	 1ETX9k63El46k8kGOZw1JYYPNwvkOCnKW25zhmhMFxanIThPYyT2EyCcCJGxHYvr4c
	 9gjedV9h6iSB1E+9vaBujYIWNVv85ahgG3RY86/rkNVUDsQgEBnEYzOinB67J83hq+
	 kobiV9AUIo/mQ==
Date: Mon, 28 Jul 2025 17:46:47 -0700
From: Kees Cook <kees@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	zepta <z3ptaa@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Fix stack buffer overflow in
 gmin_get_var_int()
Message-ID: <202507281745.0D675898@keescook>
References: <20250724080756.work.741-kees@kernel.org>
 <0b284755-1ae7-4f5f-8338-836dfcb1db59@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b284755-1ae7-4f5f-8338-836dfcb1db59@kernel.org>

On Sat, Jul 26, 2025 at 02:24:51PM +0200, Hans de Goede wrote:
> Hi Kees,
> 
> On 24-Jul-25 10:08 AM, Kees Cook wrote:
> > When gmin_get_config_var() calls efi.get_variable() and the EFI variable
> > is larger than the expected buffer size, two behaviors combine to create
> > a stack buffer overflow:
> > 
> > 1. gmin_get_config_var() does not return the proper error code when
> >    efi.get_variable() fails. It returns the stale 'ret' value from
> >    earlier operations instead of indicating the EFI failure.
> > 
> > 2. When efi.get_variable() returns EFI_BUFFER_TOO_SMALL, it updates
> >    *out_len to the required buffer size but writes no data to the output
> >    buffer. However, due to bug #1, gmin_get_var_int() believes the call
> >    succeeded.
> > 
> > The caller gmin_get_var_int() then performs:
> > - Allocates val[CFG_VAR_NAME_MAX + 1] (65 bytes) on stack
> > - Calls gmin_get_config_var(dev, is_gmin, var, val, &len) with len=64
> > - If EFI variable is >64 bytes, efi.get_variable() sets len=required_size
> > - Due to bug #1, thinks call succeeded with len=required_size
> > - Executes val[len] = 0, writing past end of 65-byte stack buffer
> > 
> > This creates a stack buffer overflow when EFI variables are larger than
> > 64 bytes. Since EFI variables can be controlled by firmware or system
> > configuration, this could potentially be exploited for code execution.
> > 
> > Fix the bug by returning proper error codes from gmin_get_config_var()
> > based on EFI status instead of stale 'ret' value.
> > 
> > The gmin_get_var_int() function is called during device initialization
> > for camera sensor configuration on Intel Bay Trail and Cherry Trail
> > platforms using the atomisp camera stack.
> > 
> > Reported-by: zepta <z3ptaa@gmail.com>
> > Closes: https://lore.kernel.org/all/CAPBS6KoQyM7FMdPwOuXteXsOe44X4H3F8Fw+y_qWq6E+OdmxQA@mail.gmail.com
> > Fixes: 38d4f74bc148 ("media: atomisp_gmin_platform: stop abusing efivar API")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> I've already send an atomisp pull-request for 6.17 out
> and this is already in media-committers/next now and
> the media subsystem is typically not good in merging
> fixes just before the merge window.
> 
> Kees, the file touched here is unchanged in
> media-committers/next vs Linus' latest master, can you
> send this fix to Linus yourself ?

I apologize; this slipped through the cracks. Shall I take it for -rc2,
or do you want to snag it?

-Kees

-- 
Kees Cook

