Return-Path: <linux-media+bounces-47723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88FC8774B
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 00:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CF13135150D
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 23:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6CF2F0C68;
	Tue, 25 Nov 2025 23:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7nFf9MQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90EE232785;
	Tue, 25 Nov 2025 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764113082; cv=none; b=S9TxM+hlsYHJOD3JvDsadSckn9FDUpvrZa1bGmp7CKKm+VemeF4OhEbUOp5+OmEILL6xKLB3sGf8W9fRzxMLbxVNi6ixAujrpY8Edu/cSQ93eHCvaYgtU1RZQVy86Zrs4F+PnT9rgaKA5OU7/KvhlUQ+ar3O1b03BP2Qb0QXA3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764113082; c=relaxed/simple;
	bh=U/erlr2rlFOjCA245qufrp4kvf5z/BfajqGnUCclX1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVzddIG+W7YZeKDL7gwgtXCUAomt73H1JCOBNW/+1+vyvFmu4v9NailaYx4Pzns3FNyt8Xq7UENB0h7zjyh7DkcCzuKtJpn1P3vzuk86rym8QpvRCv0AlqYS17/UeAGbhfI1E8br5h4ew35EfP+cqPLjHcUSvp5j5EeAr2c3F1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7nFf9MQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353E0C4CEF1;
	Tue, 25 Nov 2025 23:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764113082;
	bh=U/erlr2rlFOjCA245qufrp4kvf5z/BfajqGnUCclX1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7nFf9MQYUody1di+VBbmSA7wphjmsemPUJ1gc5WeAgS+KzHslnYNtxFFC0YWjU81
	 4Dibb6IVzBNIHXNCRsHVeGjSDxitbXqmDzCwn7L2s/38RdCtGPQU5/+kT4xjlFCWUn
	 DzpjfQn/IgOrIrQ7CIf2uA5p/BImr/dXBNFB5jFg/2cre7CpK7SVDiJGisq+sPsM6+
	 UAKPz+hRJDSl2hsko9BdtUYuRXg2S3AFPOH6NLmWOJpHD+TETptB1wM40nVpCHd81e
	 W94n8a77zhTTReBB5OlLXUWNQxGUvClHjxmuXdKQwtY89+VqoBK1fnEz9VSLCQxPiP
	 GxBmcdAoT0zwg==
Date: Tue, 25 Nov 2025 16:24:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] media: ccs: Avoid possible division by zero
Message-ID: <20251125232438.GA193422@ax162>
References: <20251124184441.GB1084995@ax162>
 <20251124230045.3188417-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124230045.3188417-1-sakari.ailus@linux.intel.com>

On Tue, Nov 25, 2025 at 01:00:45AM +0200, Sakari Ailus wrote:
> Calculating maximum M for scaler configuration involves dividing by
> MIN_X_OUTPUT_SIZE limit register's value. Albeit the value is presumably
> non-zero, the driver was missing the check it in fact was. Fix this.
> 
> Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Closes: https://lore.kernel.org/all/ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b/
> Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
> Cc: stable@vger.kernel.org # for 5.15 and later
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

This clears up the objtool warning for me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build

>  drivers/media/i2c/ccs/ccs-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index f8523140784c..dadff8c50679 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
>  	max_m = crops[CCS_PAD_SINK]->width
>  		* CCS_LIM(sensor, SCALER_N_MIN)
> -		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
> +		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ?: 1);
>  
>  	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
>  		  CCS_LIM(sensor, SCALER_M_MAX));
> -- 
> 2.47.3
> 

