Return-Path: <linux-media+bounces-39091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F3B1E4A2
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 10:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF3921AA1737
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 08:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E462259C85;
	Fri,  8 Aug 2025 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zco8KcxZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5614885D
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642877; cv=none; b=RqaMQoEIkwPJhM2wcYz+1XcS9BtW2/wtQVamS+epj+Y6J/+XXYy1uwLuW6xrRSwJ/ZBKqajBKr6E3+m7woTnfSuCYw/mIj1uxs1OoBghYTQCf6iben9sVaxwB9d9S9jUHxkFMyDARBoHaYxPpcrYhAEv30LMyynIv4h/lNwC51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642877; c=relaxed/simple;
	bh=LVbYC6vvUHPbMMT0TZusGHjXIk+9f7FNqHD/RIAFAuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om9zN5luCb5n6rkNOFHqtIHyM/5nKt5yZcXM+SfE4FL5m2ONtPNDJdzSrj+fq8pfPayA2AklFSfvCAO900AJu1b2W9zgdqkynfHn50p0OVHfWU8twhyzKltYHKpVV3V+EjPGMZCEr6Xyqz9nyw406OqbVticoXWU7YQGKP1ACmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zco8KcxZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 260DC1920;
	Fri,  8 Aug 2025 10:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754642824;
	bh=LVbYC6vvUHPbMMT0TZusGHjXIk+9f7FNqHD/RIAFAuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zco8KcxZz4eTqS7d13MYuRkI6k/sizmF65k2DPRs0Yp9GJLpaMhaj7CThrIJ4XG2F
	 ersTqZcCFiNj22c4SAyDpQM4RpomH9S0vAu7DVlgaxnJluLhkDMToZJrlxEl1nfeXV
	 F17H88Rk1RD+kWqwviqk7AjnAGPoXE0HJu+LXd6Q=
Date: Fri, 8 Aug 2025 11:47:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
Message-ID: <20250808084738.GA7299@pendragon.ideasonboard.com>
References: <20250808083021.2113627-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250808083021.2113627-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Aug 08, 2025 at 11:30:21AM +0300, Sakari Ailus wrote:
> Mikhail's e-mail is bouncing:
> 
> ===========8<-----------
> The following message to <mikhail.ulyanov@cogentembedded.com> was undeliverable.
> The reason for the problem:
> 5.1.0 - Unknown address error 550-"5.1.1 The email account that you tried to
> reach does not exist. Please try\n5.1.1 double-checking the recipient's email
> address for typos or\n5.1.1 unnecessary spaces. For more information, go
> to\n5.1.1  https://support.google.com/mail/?p=NoSuchUser
> d75a77b69052e-4b07f8ba752si46048731cf.823 - gsmtp"
> ===========8<-----------
> 
> Assign the driver to Laurent with "Odd Fixes" status.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I'm fine maintaining the driver (for odd fixes at least, as I don't
think I could even test the code), but Cogent Embedded should be
contacted to see if there's an issue with Mikhail's e-mail address, if
he moved somewhere else and would like to keep being the driver's
maintainer, or if someone else from Cogent would step up.

> ---
>  MAINTAINERS                               | 4 ++--
>  drivers/media/platform/renesas/rcar_jpu.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fad6cb025a19..674f00159011 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12944,10 +12944,10 @@ F:	fs/jbd2/
>  F:	include/linux/jbd2.h
>  
>  JPU V4L2 MEM2MEM DRIVER FOR RENESAS
> -M:	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> +M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
> -S:	Maintained
> +S:	Odd Fixes
>  F:	drivers/media/platform/renesas/rcar_jpu.c
>  
>  JSM Neo PCI based serial card
> diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
> index 81038df71bb5..6cf1fef42617 100644
> --- a/drivers/media/platform/renesas/rcar_jpu.c
> +++ b/drivers/media/platform/renesas/rcar_jpu.c
> @@ -1745,6 +1745,6 @@ static struct platform_driver jpu_driver = {
>  module_platform_driver(jpu_driver);
>  
>  MODULE_ALIAS("platform:" DRV_NAME);
> -MODULE_AUTHOR("Mikhail Ulianov <mikhail.ulyanov@cogentembedded.com>");
> +MODULE_AUTHOR("Mikhail Ulianov");
>  MODULE_DESCRIPTION("Renesas R-Car JPEG processing unit driver");
>  MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart

