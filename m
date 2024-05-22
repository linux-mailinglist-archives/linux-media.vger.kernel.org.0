Return-Path: <linux-media+bounces-11716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CCC8CC02E
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1A771F219B3
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 11:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B19824BF;
	Wed, 22 May 2024 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hro65EgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43218824AF
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377057; cv=none; b=EycO0a01ZH6vNudMF/s0dmspZd0FBEzXvAg53C7bX2H2RMTe3MM0umrpmtm/XOoC0JEIr62kr4DQT3Ola7f170LSxFPYMr6YAhX3MZeh7HvfaxtX3CbYyUr8cBd4lkHw0JCuzvTzU0q3cjtKMBsNtV3s5vFFH4MPRA2BoCcmtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377057; c=relaxed/simple;
	bh=CD8rCWu20B9y/mSC9WCDWFP2hk3RddKXI4OOnI1wydQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NH3vHSAOj3vWiTnXEBT9WHjt3lViKNa5QGp5TdNqQf0OSyBqo78QdxsMHI0R6P0aQTvire7mgZMOsoQCDLuH+PQISwpEt3fmIKzeCEpKx1703A95H4YttakyPXBj0zXW/9FhJNnMoQoMZLHmCA4vfz8RIVj+HL57qYvoynHRrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hro65EgF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716377057; x=1747913057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CD8rCWu20B9y/mSC9WCDWFP2hk3RddKXI4OOnI1wydQ=;
  b=hro65EgFieDfbNgGxxjhse4Th6SoxbH5uhFWZ7658TAE44EODS3HZYE/
   Uq4/nYl9WJjgIfXDjcKguCqx519qG3p0UkF6PTjBiJh40YXix+wcSG0Ee
   bXB32tph7JIQFHm7DhO++U3wSFkmw0jdFKgl+Jfjrg6sl92TP87AyDwSw
   C0gCmqPQMy7qVZIoBHanFEh9lji9Cw5b5lAb3nZCMO114kf+B6thQI09D
   2/DuOJKFO/FaFxzXOzmQr8LOc99rE35ZapP9cOeRRoakOcqz18tTxNLVU
   hz6RRWHbh2PI7zMuSjE4ZGpD57AC5Yl48wohGpTSzqP58Xzg4t8vNo4nT
   w==;
X-CSE-ConnectionGUID: hmZXArDGQ+qLT7YjU2YU6g==
X-CSE-MsgGUID: wrJ9ArJESaGsa+UooZoXSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23194886"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="23194886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 04:24:16 -0700
X-CSE-ConnectionGUID: LdKsxmfIQPqx+GlaxKJMDA==
X-CSE-MsgGUID: TnsLCbH1SLq1SbhefbFCCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="37735802"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 04:24:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F44011F82A;
	Wed, 22 May 2024 14:24:12 +0300 (EEST)
Date: Wed, 22 May 2024 11:24:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Samuel Wein <sam@samwein.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] Fix flags in X1 Yoga example. MEDIA_LNK_FL_DYNAMIC (0x4
 in the link flag)  was removed in V4 Intel IPU6 and IPU6 input system
 drivers. Added -V flag to media-ctl commands for X1 Yoga, lower-case v only
 makes it verbose upper-case V sets the format.
Message-ID: <Zk3V3B5-mX23VjJa@kekkonen.localdomain>
References: <20240522080710.16922-1-sam@samwein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522080710.16922-1-sam@samwein.com>

Hi Samuel,

Thanks for the patch.

Please try to keep the subject within 75 characters. I think most of the
subject line should be part of the commit message which currently is
missing. See the commit log for examples as well as
Documentation/process/submitting-patches.rst .

On Wed, May 22, 2024 at 08:07:51AM +0000, Samuel Wein wrote:
> Signed-off-by: Samuel Wein <sam@samwein.com>
> ---
>  Documentation/admin-guide/media/ipu6-isys.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/ipu6-isys.rst b/Documentation/admin-guide/media/ipu6-isys.rst
> index 0721e920b5e6..c8704ff63b45 100644
> --- a/Documentation/admin-guide/media/ipu6-isys.rst
> +++ b/Documentation/admin-guide/media/ipu6-isys.rst
> @@ -135,16 +135,16 @@ sensor ov2740 on Lenovo X1 Yoga laptop.
>  .. code-block:: none
>  
>      media-ctl -l "\"ov2740 14-0036\":0 -> \"Intel IPU6 CSI2 1\":0[1]"
> -    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[5]"
> -    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[5]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":1 -> \"Intel IPU6 ISYS Capture 0\":0[1]"
> +    media-ctl -l "\"Intel IPU6 CSI2 1\":2 -> \"Intel IPU6 ISYS Capture 1\":0[1]"
>  
>      # set routing
>      media-ctl -v -R "\"Intel IPU6 CSI2 1\" [0/0->1/0[1],0/1->2/1[1]]"
>  
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
> -    media-ctl -v "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"
> +    media-ctl -Vv "\"Intel IPU6 CSI2 1\":0/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -Vv "\"Intel IPU6 CSI2 1\":0/1 [fmt:GENERIC_8/97x1]"
> +    media-ctl -Vv "\"Intel IPU6 CSI2 1\":1/0 [fmt:SGRBG10/1932x1092]"
> +    media-ctl -Vv "\"Intel IPU6 CSI2 1\":2/1 [fmt:GENERIC_8/97x1]"

I'd drop the v option altoghether, -v was probably intended to be -V
originally.

>  
>      CAPTURE_DEV=$(media-ctl -e "Intel IPU6 ISYS Capture 0")
>      ./yavta --data-prefix -c100 -n5 -I -s1932x1092 --file=/tmp/frame-#.bin \

-- 
Kind regards,

Sakari Ailus

