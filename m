Return-Path: <linux-media+bounces-12930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3CB9035D5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DD0FB27727
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FBA175571;
	Tue, 11 Jun 2024 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqAJrxqW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8035A173321;
	Tue, 11 Jun 2024 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094074; cv=none; b=kqUXJbjzQUKhUGS1lONBT1OAIfVknDo6u5jlfbJPWGEx5NGZoyO1L1fSVsgY7XIfipUC1w6sdzGWQz+wumgbKaP5onw24VZfuS1ljmzeObyg/CXTy1REZArjqNCV7rgzEVo/9iUNjRrqAa/h6ag1RFZYw8oLE15Y5xtOuJldSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094074; c=relaxed/simple;
	bh=o9R63W2h+PXHJFvU1TUtUAN5DVlFkM8X+Kj+TFyexv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN6aPUkBjpYgMlfTQZY6IWBPBMa3h7872ffKuiR7eow1ZRZGcpGWiGn018EspcbhP0RlxvYESAXxeX7cUwinplN47Z5WyqOAC3ur00HJVTCse7/Q/srkr9ZX/NvYTsEoxGmRpleCq4LjD75XXpQtV6QrwY+XTMWSXAH+D9jwyoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqAJrxqW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718094072; x=1749630072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9R63W2h+PXHJFvU1TUtUAN5DVlFkM8X+Kj+TFyexv8=;
  b=BqAJrxqWoCY9gYA3/dRpGAhXmnLm6Dhg/KIP6OI1CryqrjQ0EucPWL4A
   VJsydrqZrJcf3BrQhCYO++4zEZcmhprFPgdOdzJQqeDABMHyweqwUKUAa
   K6U+fH4Gap/w4NrEzsiEZqhCkA9PwcviBr8KcEaK+ntgjLn1ka8pl9HkL
   iFOVmwT9pP1Pno5Tvh2eOSWOfo7kULyz0NkOcbl0I9OaGWNEQORsVVt48
   70vHgK2b6fBclW5Ou0wnwIoxtX01g63KT6S4/EVwi7ZQHEp+gQkRiwkKZ
   yV2bBcwycUa2PqbITggYMaio2MewNuMDKKpKuYfdjCcfTmwAVJQG1Uuvr
   w==;
X-CSE-ConnectionGUID: PhAadFqxRViDHIRPWMif8A==
X-CSE-MsgGUID: WmaUPN6fRtex9iwCf1uNjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14940359"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14940359"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:21:12 -0700
X-CSE-ConnectionGUID: AZKl3105TiaPL+FtfswRXA==
X-CSE-MsgGUID: bzNw9UUfQDCfTzhwKg3M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39299831"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:21:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 00D5D11F9C0;
	Tue, 11 Jun 2024 11:21:07 +0300 (EEST)
Date: Tue, 11 Jun 2024 08:21:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: vgxy61: Add MODULE_ALIAS()
Message-ID: <ZmgI8nET4sdhdwQx@kekkonen.localdomain>
References: <20240610150815.228790-1-benjamin.mugnier@foss.st.com>
 <20240610150815.228790-4-benjamin.mugnier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610150815.228790-4-benjamin.mugnier@foss.st.com>

Hi Benjamin,

On Mon, Jun 10, 2024 at 05:08:15PM +0200, Benjamin Mugnier wrote:
> Preserve user space retro compatibility after the device rename.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vgxy61.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> index ca3b43608dad..c85f356946ca 100644
> --- a/drivers/media/i2c/vgxy61.c
> +++ b/drivers/media/i2c/vgxy61.c
> @@ -1898,3 +1898,4 @@ MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
>  MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
>  MODULE_DESCRIPTION("VGXY61 camera subdev driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:st-vgxy61");

Perhaps just "st-vgxy61" so that the module still loads if someone loads it
explicitly? That's what you'd want, right, as the old compatible string
will remain?

-- 
Kind regards,

Sakari Ailus

