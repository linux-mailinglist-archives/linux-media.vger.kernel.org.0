Return-Path: <linux-media+bounces-38101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F4FB0A81C
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 18:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FDE61C4810E
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 16:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20922E5B3A;
	Fri, 18 Jul 2025 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xKGxqeDc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7B2E5B18
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854776; cv=none; b=XOuA190kH5bL0b3LkOWrQXzfEtGmeAQ4d8g3E7DhYkbFKJ1QiKnz2LKFmyra2J7c9YhaOn0cfx66XBrY6bzhwH68S42w7WizMti0ebEttBevtyJ0Km2ARRQ4GzZKpj5zNi4OxZKjE6IMfZIOGN094jrwA9DxLue60gt9CFYYaco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854776; c=relaxed/simple;
	bh=ST8lcJ+2yDbKpXgUqoVEvCsnKZ/+vATfwEWuT1/oEC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHZn5OUSVaVS8EZia0GYB3OiIx1EdrDIyErDOty+7pwYjRMRcYjtbJY6htIKPbojjjrb/HHMQtw/EKXV1zVsW65WoXrX5ZTWq5rsePTxXoqsSWpJ5UnueAt+p9T44W1s1PVB/Ko+4YyfkVvYcWmklco+F/auEV7/J2sX2ALQSAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xKGxqeDc; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2ea34731c5dso1578950fac.0
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752854773; x=1753459573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Q1Nu3K5LZZ1ceVlLq9+6xcxFVBX4qH4aUvmo3kZ28=;
        b=xKGxqeDcnBAvtDtPmvid5WykC5mC1K8JTlADGnqnGVwcEIGpmNVrqwwEWWBFekq6Or
         wJO28NV1uyBoXQeg/VUemHI0hfjdGrxo7YORl6iRBBT8dORydOfrZ11zSPmSCJS7m7US
         D21GmL3IZB+naYS7FrEbDWIUmh7gvr6+yvp7EkgYkh91jOZZxko1Gbbpx6I1Jz3Jz6vq
         tPv86GFzUu4ivijpMRo6ANsQC3FaVgm7mlnjMFtcXOXZGFmq+/01+rJI4lBhVgwP/Wej
         I3UJ4L97q45pTSj7WpbxinRkL+0jZ1cGJ2ilAEet9fJW/y2yF0+4zRVcc+1DU4KbWcn1
         ODVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854773; x=1753459573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Q1Nu3K5LZZ1ceVlLq9+6xcxFVBX4qH4aUvmo3kZ28=;
        b=VBSoJ5BlXWJblT3xaSrRqG80sSzoq1U/sTKKiYjO+yLb00aVoz2XkQeVFgFy9/eWcU
         jVjKQc8Chmm+KS9RLpAoSX64mBhe7JKX7bDV6H6kHBpR4SKHHUvvTNxestyjEI4F+Vpm
         AkEFXwUOpLnmUg9Pf+PfD7XjcVv5kVLI8aMUXDA1R7gxZQ4O0b8f1YvNFScaaeXXr2+6
         oRvGbME1de/Lew9ucQDldIkeQh5QT32Xbphpr7sT7Ww89BT2u6Y6v3IwPKwB7xo9ycUK
         FPB0x2Qvsc3tolbn4HndpyF4UhQOfwePdNYaw70umbq/bHGtlYCFO1QNTEppnYRIdjfG
         TaaA==
X-Forwarded-Encrypted: i=1; AJvYcCXYJXA79tt5VpYbYLyZgwvxmlJc8JLTL1ulDbo3oPSi9SZRQPFa2QAv8SwlCtTEhsraSdzTj4ttb+wt5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxoNDizxpZmIQybgBuHhE5ZtrLRKTxWq7Y0XRR0iTSSCDFIa/
	1WbrACS+HETE9bs8nOqN8Vu0mOF8ZyxMp6xE23ynA9lOu/G6fTG8ww/PnL97MEn1wAY=
X-Gm-Gg: ASbGnctUwtv72BAO/hcQFIl0KWLnUVracglBgen5i45Gs56vOec38XUS7Xrx0O4+2Za
	DVznV8mNVxxzJGkZhwveAbgkdSgVUJIXUZ//ItMDXLklnEqERXw4oGZBhJc4uaU+mPDpTao2ZWu
	LBO23NixAPipfqrE2DQt041AWSUx2RFWppOwpQrYGhSbu9VU1fdqUaEp4w1oTP7ib4lhnoNsoDw
	tXrTuVgQNIWu3V4521t8prS3BzOUjcH4nT9/aLTedLTVxCjHs0MEj7xOixzjw9hT/4BtIuHDv3p
	Gz6SS+JqEFsj0uILWvVSsUhX11TeFF65lPHUfAQuSEQdwyHomKM11SAiPhrRjY9p3UQZbZU8sYG
	SH2kgwkoy8PJZ4Cg5ke1ny+n4wJnhRw==
X-Google-Smtp-Source: AGHT+IGeuPdqUEt/1o9qCSn3JuCLxLBD7G98jAwQVyZLgiGe8We//F5qCqqXh6NWoKStNnOYX7sQDw==
X-Received: by 2002:a05:6870:f603:b0:2ff:94d7:b006 with SMTP id 586e51a60fabf-2ffb2251036mr8483664fac.13.1752854773078;
        Fri, 18 Jul 2025 09:06:13 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e5d3:a824:1a57:fcaf])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-301b01d2df8sm228752fac.31.2025.07.18.09.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:06:12 -0700 (PDT)
Date: Fri, 18 Jul 2025 19:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10] staging: media: atomisp: fix indentation in aa, anr,
 and bh modules
Message-ID: <8f7db034-6b38-44c3-b841-ef4bc1db3973@suswa.mountain>
References: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>

On Fri, Jul 18, 2025 at 11:02:14PM +0800, LiangCheng Wang wrote:
> Fix tab/space indentation and move a standalone kernel-doc
> comment of the 'strength' field of the struct ia_css_aa_config
> to the whole-structure one.
> Align with kernel coding style guidelines.

There are too many changes all at once and some of the changes are not
described in the commit message.

> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..488807a161b9a6ba9ebc4a557221cd21bd1df108 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
> @@ -16,25 +16,21 @@ const struct ia_css_anr_config default_anr_config = {
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
>  		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
> +		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,

No need to add a comma to this line.  The comma at the end of the line
is useful when we might add another element to an array.  But here the
length is fixed.

If someone were to add a comma here and it was new code, then that's
fine.  But I don't want to have to review a separate patch which only
adds a unnecessary comma.

>  	},
> -	{10, 20, 30}
> +	{ 10, 20, 30 },

Same here.  This comma serves no purpose.  We can't actually add
anything to this struct.  What would be actually helpful would be to
use designated initializers.

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9..3de7ebea3d6e 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -11,14 +11,14 @@
 #include "ia_css_anr.host.h"
 
 const struct ia_css_anr_config default_anr_config = {
-	10,
-	{
+	.threshold = 10,
+	.thresholds = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	.factors = {10, 20, 30},
 };
 
 void

I added a comma to the end of .factors because there is a 1% change we
will add a new member to the struct and it's the right thing to do.  I
was already changing that line, so I'm allowed to make tiny white space
changes like this.

But notice how I left off the comma after the numbers.  That array is a
fixed size and nothing can be added.  Leaving off the comma communicates
that.  Also there was no need to change that line.  It's unrelated to
using desgnated initializers.  If you added a comma, you would need to
send a separate patch for that with a commit message to describe and
justify it.  As a reviewer, I would need to go through the line
carefully and verify that none of the other numbers had been changed.

The commit message for the above patch would say, "Use a designated
initializer for default_anr_config.  It helps readability."  There would
be no need to mention that "I added a comma" to the end of the .factors
line because it's a minor thing that we're not really stressed about.

regards,
dan carpenter

