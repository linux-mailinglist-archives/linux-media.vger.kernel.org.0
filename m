Return-Path: <linux-media+bounces-34127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09FACEF77
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B327618977BE
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE9C2144A3;
	Thu,  5 Jun 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F5N8cGwe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59382AD0C
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127610; cv=none; b=nOAUWUcbWuiTY4nK901pSDdLyNFTMuR7bIRoim2L8dQdU3QA4oaugMXBe6UCshWUAUVhbvC0QesVqENqFzNRm5GQ/n1E3Qu2Xz9Os25zB7SU2ygxfCRe/IRTGxVsoFIcJWRR4b4nnGeZl2NssfL1+5LDa6KplUHuWX8UsfsA8UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127610; c=relaxed/simple;
	bh=gPZQVlpX4uDBpDsTtWtZaKm9SuKCFiHm8VYjjL2EPYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYXR58sCWUDegNgY5cRTVVTYqlDzDlQ98XdHlt2/gD9wHsmDtL024901mABhErrvxCm8nd8TLLbV6zaylazLQmkhH1MVha/2z7KuVr3DChzg0J91FEXeb7wuwcueDkmFI9B5jAPSvp6mKJbGgBlebY9guEI+m2LP0qEw2XwVySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F5N8cGwe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DD4593;
	Thu,  5 Jun 2025 14:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749127603;
	bh=gPZQVlpX4uDBpDsTtWtZaKm9SuKCFiHm8VYjjL2EPYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5N8cGwem9gg10BwLv7jp1/OUHlS3JssvMh6yUb0sKbLTqPkN0FM7zGJa5pn1rn+g
	 YtLvF3sSPB6bNOUZ8g/nMCEhKyvjk+dt/oyHK7ouznwxOHjhgJvnOIZXcfT1MMDKWu
	 h+nYInZ/QjteOIQ/psfm8VWnQ7bDDoPFFgWSnb6c=
Date: Thu, 5 Jun 2025 15:46:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] CONTRIBUTE: Add simple contribution
 instructions
Message-ID: <20250605124635.GC29935@pendragon.ideasonboard.com>
References: <20250605-prefix-v1-1-450aff98308a@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250605-prefix-v1-1-450aff98308a@chromium.org>

On Thu, Jun 05, 2025 at 12:09:57PM +0000, Ricardo Ribalda wrote:
> In the media summit we discussed the need of a special prefix for
> v4l-utils. This helps patchwork and media-ci.
> 
> Create a new file with a brief introductions on how to contribute and
> make the `v4l-utils` official.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I think this is a good idea. I don't know how we'll get users to
actually use the prefix, but documenting it is a necessary first step.

> ---
>  CONTRIBUTE.md | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> new file mode 100644
> index 0000000000000000000000000000000000000000..19a2c5814b45462f3cfeea921e277f8da00ccbd1
> --- /dev/null
> +++ b/CONTRIBUTE.md
> @@ -0,0 +1,19 @@
> +## Repository
> +
> +v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
> +
> +## Contributions
> +
> +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> +using the prefix `[PATCH v4l-utils]`.

Nitpicking, I was thinking of '[v4l-utils] [PATCH]' as that's what I
used previously. Looking at the list archives, both (and more) have been
used. I don't object to using '[PATCH v4l-utils]' if that's easier for
tools.

I have this in my .git/config for v4l-utils:

[format]
        subjectPrefix = "v4l-utils] [PATCH"

With your proposal, this would be

[format]
        subjectPrefix = "PATCH v4l-utils"

In either case, let's document this in addition to the b4 configuration.

> +
> +## b4 config
> +
> +If you use b4[1] for your contributor workflow you can use these options:
> +
> +```
> +git config set b4.send-series-cc linux-media@vger.kernel.org
> +git config set b4.send-prefixes v4l-utils
> +```
> +
> +[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html
> 
> ---
> base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
> change-id: 20250605-prefix-a1a47dbdaa75

-- 
Regards,

Laurent Pinchart

