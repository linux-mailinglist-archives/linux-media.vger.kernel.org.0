Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FC135DC88
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245735AbhDMKha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 06:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245730AbhDMKh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:37:26 -0400
X-Greylist: delayed 441 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 13 Apr 2021 03:37:06 PDT
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2E6C061756
        for <linux-media@vger.kernel.org>; Tue, 13 Apr 2021 03:37:06 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f444:fb00:f814:8791:6dad:f550])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C1AB52004E;
        Tue, 13 Apr 2021 13:29:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1618309779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AJnAQTOzJ94G+5YjQeB99oUU+/Ys6+aosNTuhGE51aE=;
        b=fKneOndYpUqBeB7MeEQ5RiU3RrWRcoiInJ6iSsvB0DbBZ+gsWwIT9Fy9EEMUIyNN9ydFi9
        Q0AmiWRcbCYHCVPPyUvfevcZ+5XRiN87ykQ25Fr6r8Bc+0faFgcTtr9mXmyo9peeiao4gi
        xgnMJgxlqwTW/mDdovXA5JDHkm0MZJ4=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7DC33634C87;
        Tue, 13 Apr 2021 13:28:48 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lWGId-0002BA-Id; Tue, 13 Apr 2021 13:29:39 +0300
Date:   Tue, 13 Apr 2021 13:29:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bernhard Wimmer <be.wimm@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ccs: Fix the op_pll_multiplier address
Message-ID: <20210413102939.GM3@valkosipuli.retiisi.eu>
References: <20210412164943.1849-1-be.wimm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412164943.1849-1-be.wimm@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1618309779; a=rsa-sha256; cv=none;
        b=Av4j5HRFEn44eUXoIoTX0UFXmXXVtRfRMwjTXaq7vMP/XXaJA4CDQ1NHFQGFZOyW17Lq8e
        xsQj9OqiFSHaLN6V68V50+GApWd7YGt1/FdoNkPmYRkyAZsqXEEjf+0dseJU/dxpgA2YLL
        SVPLavrIvo+nwV9Pk5HfTIFhClcrBuI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1618309779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AJnAQTOzJ94G+5YjQeB99oUU+/Ys6+aosNTuhGE51aE=;
        b=BCRki8TT3ctKA4B1CAY+qnXhV/NnYMCTXxwAy+Jj69kRs21ZsGg/7MrNWQqnGufTGZBchy
        3JSqyjObIo2A/yMrWsDfbRZswgJOFd9glmU3Wy0dJcALtaidHKBno8nLFsVCAHiDv9D0iw
        X/bEAoeshPBqO3IRNrUgzHujUf53l+c=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bernhard,

Thanks for the patch.

On Mon, Apr 12, 2021 at 06:49:43PM +0200, Bernhard Wimmer wrote:
> According to the CCS spec the op_pll_multiplier address is 0x030e, not 0x031e.

Please wrap commit messages no later than at 75th column.

> 
> Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>
> ---
>  Documentation/driver-api/media/drivers/ccs/ccs-regs.asc | 2 +-
>  Documentation/driver-api/media/drivers/ccs/mk-ccs-regs  | 5 +++--
>  drivers/media/i2c/ccs/ccs-limits.c                      | 1 +
>  drivers/media/i2c/ccs/ccs-limits.h                      | 1 +
>  drivers/media/i2c/ccs/ccs-regs.h                        | 3 ++-
>  5 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
> index f2042acc8a45..bbf9213c3388 100644
> --- a/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
> +++ b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
> @@ -210,7 +210,7 @@ pll_multiplier				0x0306	16
>  op_pix_clk_div				0x0308	16
>  op_sys_clk_div				0x030a	16
>  op_pre_pll_clk_div			0x030c	16
> -op_pll_multiplier			0x031e	16
> +op_pll_multiplier			0x030e	16

Good find!

>  pll_mode				0x0310	8
>  - f					0	0
>  - e	single				0
> diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> index 6668deaf2f19..807c0c14ec29 100755
> --- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> +++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> @@ -72,13 +72,14 @@ $uc_header =~ s/[^A-Z0-9]/_/g;
>  
>  my $copyright = "/* Copyright (C) 2019--2020 Intel Corporation */\n";
>  my $license = "SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause";
> +my $note = "/* Generated by $0; do not modify. */\n";

Could you make this a multi-line comment (wrap after ;) so this will stay
under 80 characters per line? The path to the file is long. I.e.

/*
 * Generated by ...;
 * do not modify.
 */

>  
>  for my $fh ($A, $LC) {
> -	print $fh "// $license\n$copyright\n" if defined $fh;
> +	print $fh "// $license\n$copyright$note\n" if defined $fh;
>  }
>  
>  for my $fh ($H, $LH) {
> -	print $fh "/* $license */\n$copyright\n";
> +	print $fh "/* $license */\n$copyright$note\n";
>  }
>  
>  sub bit_def($) {
> diff --git a/drivers/media/i2c/ccs/ccs-limits.c b/drivers/media/i2c/ccs/ccs-limits.c
> index f5511789ac83..e4b7127b88a1 100644
> --- a/drivers/media/i2c/ccs/ccs-limits.c
> +++ b/drivers/media/i2c/ccs/ccs-limits.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause
>  /* Copyright (C) 2019--2020 Intel Corporation */
> +/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
>  
>  #include "ccs-limits.h"
>  #include "ccs-regs.h"
> diff --git a/drivers/media/i2c/ccs/ccs-limits.h b/drivers/media/i2c/ccs/ccs-limits.h
> index 1efa43c23a2e..40b067fc9a70 100644
> --- a/drivers/media/i2c/ccs/ccs-limits.h
> +++ b/drivers/media/i2c/ccs/ccs-limits.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
>  /* Copyright (C) 2019--2020 Intel Corporation */
> +/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
>  
>  #ifndef __CCS_LIMITS_H__
>  #define __CCS_LIMITS_H__
> diff --git a/drivers/media/i2c/ccs/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
> index 4b3e5df2121f..5de330bf8a89 100644
> --- a/drivers/media/i2c/ccs/ccs-regs.h
> +++ b/drivers/media/i2c/ccs/ccs-regs.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
>  /* Copyright (C) 2019--2020 Intel Corporation */
> +/* Generated by Documentation/driver-api/media/drivers/ccs/mk-ccs-regs; do not modify. */
>  
>  #ifndef __CCS_REGS_H__
>  #define __CCS_REGS_H__
> @@ -202,7 +203,7 @@
>  #define CCS_R_OP_PIX_CLK_DIV					(0x0308 | CCS_FL_16BIT)
>  #define CCS_R_OP_SYS_CLK_DIV					(0x030a | CCS_FL_16BIT)
>  #define CCS_R_OP_PRE_PLL_CLK_DIV				(0x030c | CCS_FL_16BIT)
> -#define CCS_R_OP_PLL_MULTIPLIER					(0x031e | CCS_FL_16BIT)
> +#define CCS_R_OP_PLL_MULTIPLIER					(0x030e | CCS_FL_16BIT)
>  #define CCS_R_PLL_MODE						0x0310
>  #define CCS_PLL_MODE_SHIFT					0U
>  #define CCS_PLL_MODE_MASK					0x1
> -- 
> 2.17.1
> 

-- 
Sakari Ailus
