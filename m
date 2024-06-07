Return-Path: <linux-media+bounces-12764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EF900A94
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 18:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB611C21F35
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2786919D06A;
	Fri,  7 Jun 2024 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUjZYsZN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800CC195804;
	Fri,  7 Jun 2024 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717778133; cv=none; b=GrC1pepWK4D6aGEiiQ1H5tdhInVHwcvTXsFoL9Fr+qKPp2irG93+vwG7joiv54xj5/QCN1FGFAOjjpKJ77CBTdUVQSSjj6AgWrueCbaSeRSl8FkYAfk4pAtxqmVShTKB35oZZenF4cojH19ccd/I5ysFSvWgLu4GjOApIicIPp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717778133; c=relaxed/simple;
	bh=zcmYl3RMG+9CalkrxbsEE5yzEf0SPPRbktmruT0o8D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQgNROPxxAY4xPHceQntwii7Dv3s4xAuXn05Mp3ACtimvTw6tcvOSaXQ9xxvlMQKeJ/LZZM3GgZYUl482aPBCgBtPzdjszS15v/WaFond9wfkHpHG1gyn77elOJQMgU0XGbQAHW8Eseyzm/Fkq0gTq606wo5FXXO0CPvgf+oif0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUjZYsZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D28C2BBFC;
	Fri,  7 Jun 2024 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717778133;
	bh=zcmYl3RMG+9CalkrxbsEE5yzEf0SPPRbktmruT0o8D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QUjZYsZNIlmdexktlGNJYhtVVJm6brOK3QTHdkQJKbRonLo2pdbBBQHiYJKA4j654
	 O+qYzSfgn6KWNdmbdeHd1vOImhTOoCGtHXnbSHim+xlxw2rzhOscUPkuvaqLHVTF3b
	 2YnWra1lchyoNzqGqoDBKGXAokPc6UPZ2x/79RcUGmodcP/KacCwAII3g1EN79kWFw
	 2SPY1yjvR27DrrGLtO4IHpv/xVfROriH4pxZqzX3fjNZt/yAZx4r3SX7z2coHBSudG
	 7MCU4HxTXsR+aDES/wyAMN+AhU4tWnZXWAk/uQOaSvs/LNHOPb1QT36uL3HDL7JsBp
	 TLfuwknCR65Fw==
Date: Fri, 7 Jun 2024 09:35:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: c8sectpfe: Add missing parameter names
Message-ID: <20240607163530.GC2483293@thelio-3990X>
References: <20240606-c8sectpfe-v1-1-c4b18f38295d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-c8sectpfe-v1-1-c4b18f38295d@chromium.org>

On Thu, Jun 06, 2024 at 01:01:07PM +0000, Ricardo Ribalda wrote:
> clang 19 complains about the missing parameter name. Let's add it.
> 
> drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h:19:62: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406050908.1kL1C69p-lkp@intel.com/
> Fixes: e22b4973ee20 ("media: c8sectpfe: Do not depend on DEBUG_FS")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
> index 8e1bfd860524..3fe177b59b16 100644
> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h
> @@ -16,8 +16,8 @@
>  void c8sectpfe_debugfs_init(struct c8sectpfei *);
>  void c8sectpfe_debugfs_exit(struct c8sectpfei *);
>  #else
> -static inline void c8sectpfe_debugfs_init(struct c8sectpfei *) {};
> -static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *) {};
> +static inline void c8sectpfe_debugfs_init(struct c8sectpfei *fei) {};
> +static inline void c8sectpfe_debugfs_exit(struct c8sectpfei *fei) {};
>  #endif
>  
>  #endif /* __C8SECTPFE_DEBUG_H */
> 
> ---
> base-commit: 1aea3d1d4a21e3e7895663b848ffae79ee82e065
> change-id: 20240606-c8sectpfe-5f00b9867f36
> 
> Best regards,
> -- 
> Ricardo Ribalda <ribalda@chromium.org>
> 

