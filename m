Return-Path: <linux-media+bounces-34162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F4ACF61F
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 20:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FC816538B
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE6627A131;
	Thu,  5 Jun 2025 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XA+to/w6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F8B27817C
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146402; cv=none; b=RJNSOQuhZO6Z+b/+pHbiGc843x23JVe3bMdHOi44DbcUpxvwuZPjxWB0cr6jxVr3/BhzLAY7wFkPBIGLh+o4SSBwNusMWFmqsw2VR+l9SnvVQCKryn8W1gEk/3G1rPAK3X7PEcdpEIz9wTcQHJZ74QS2TkwvswvCyUYggELMHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146402; c=relaxed/simple;
	bh=Ayyp99hWhchsJe9eqNiyyAXqOoh9EIo5Vmnk1jH9JM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR0Sy7EPM+uC+SZImvb/Suag0pl09/ksc7wprmyIhRnYTUUKgagjVfvCtCuVP8lz/tk8l8+LEBXUH6JEeJ9ZSsfe347UF8WpVKKc5O7dEY40S7qlxSwAuyUtR58eA0UYApozsqeHFKwrVkZ31arqnZHaYWXNuRP3D+Qo1p8B2zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XA+to/w6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFDEF4C9;
	Thu,  5 Jun 2025 19:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749146395;
	bh=Ayyp99hWhchsJe9eqNiyyAXqOoh9EIo5Vmnk1jH9JM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XA+to/w6/NVZgZT5LiFjiPea5aTNj4rRAyhLFR55Aix0vdknf1QQbbr2bk416VrMy
	 EI4CDyTHJzUBG5LKVAt3n6JlpMZlzimIwVZaFOx5xSUrMfb8uBQDiCcT0R6slgfHSt
	 /pXOIjfzxgNRTFQLyOO/wxIGRoa33TCluFe8oEBo=
Date: Thu, 5 Jun 2025 20:59:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v2] CONTRIBUTE: Add simple contribution
 instructions
Message-ID: <20250605175948.GC27282@pendragon.ideasonboard.com>
References: <20250605-prefix-v2-1-4d797e89e29f@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250605-prefix-v2-1-4d797e89e29f@chromium.org>

On Thu, Jun 05, 2025 at 05:54:53PM +0000, Ricardo Ribalda wrote:
> In the media summit we discussed the need of a special prefix for
> v4l-utils. This helps patchwork and media-ci.
> 
> Create a new file with a brief introductions on how to contribute and
> make the `v4l-utils` official.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> - Add git config example
> - Link to v1: https://lore.kernel.org/r/20250605-prefix-v1-1-450aff98308a@chromium.org
> ---
>  CONTRIBUTE.md | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> new file mode 100644
> index 0000000000000000000000000000000000000000..708939df88f471b085aafe2b79c9c6e1f044c52e
> --- /dev/null
> +++ b/CONTRIBUTE.md
> @@ -0,0 +1,23 @@
> +## Repository
> +
> +v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
> +
> +## Contributions
> +
> +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> +using the prefix `[PATCH v4l-utils]`. E.g:
> +
> +```
> +git config set format.subjectPrefix "PATCH v4l-utils"
> +```
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

