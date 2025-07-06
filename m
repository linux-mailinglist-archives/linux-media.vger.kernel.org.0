Return-Path: <linux-media+bounces-36905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E5BAFA65A
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 807CC3AF229
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 16:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7071C288C00;
	Sun,  6 Jul 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhfDL+LI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC41FCF41;
	Sun,  6 Jul 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818292; cv=none; b=LMsQdcPqVQ/L3C3fuTasTioO6lqpXEd+tzgZsVXOY8/kJwwKqX4lMJYM6NaaCwk59g+f7jhz4IwK5nGLNg0KqWWHr8ytJNHTQMQacH8Swdt1grhGy/rgPII7Ombv0rwMOtiNc5C3RIL50ZOE2Mbh8gI9svhsbq6rNdvEtQio8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818292; c=relaxed/simple;
	bh=Bqy+M1r7hDOA2HVYAa4Rb0N11aBHHTCWwI1Zq/lXBDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDYY7RVNSXupMZhVy8LjIL7Z++6rWlDDEtmv7N6/xCD2DJxutHxIqc+aSiXgZ2K/KuUjuCR5U8Og8JpAfx3LQNIIDEU8OebN+QhAyLwTsLj3L/YrC2gdGTfw5cvCRsHRjUkFTP2e+Nnsa7t7PzpA+1771xnWt4tkJ2QYALUgf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhfDL+LI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8565CC4CEED;
	Sun,  6 Jul 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751818292;
	bh=Bqy+M1r7hDOA2HVYAa4Rb0N11aBHHTCWwI1Zq/lXBDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uhfDL+LIrOgAUHqT9QKBUPJIpHC4YQ8K7PsvACtIZzQDefg7GmxHUd5s7C1btWtxX
	 sgKB7ngO9DzgwrQQmxBV6HIClXXOVVS4xYz/jA/TCc+SVSh+yIDJX//aXYW0zuUnZA
	 f9UD0LA3bGR7LXZx89KRorlqGCzxCRF+YI7RA5JRlm86nKewTDH1Fm1OcEylLyKhzx
	 qygmr+IaDdpiVuu5dusVbA9rh8RuBR68nQ46SedUmyPzuJqlRzK+8jw/TvbLgxp57W
	 FQEI1qNHrwgY2CssKEXQo2R0gQnhHizImfirNqjQKFng533Y90mduuiE8JkjQVGFL5
	 Q0A/E9UKosyHw==
Message-ID: <f7074f3f-cdd3-4476-8711-0e932357bbfc@kernel.org>
Date: Sun, 6 Jul 2025 18:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rft, PATCH v2 0/3] media: atomisp: replace math macros
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-May-25 5:46 PM, Andy Shevchenko wrote:
> Kill unused definitions that may use custom macros from math_support.h
> and reduce usage of the latter and even kill some of them at the end
> of the series.
> 
> Please, apply only after tests that confirm everything is working
> as expected.
> 
> Changelog v2:
> - added a cleanup patch 1
> - removed potential div-by-0 conversions

Thanks, patch looks good to me and this time things don't crash
during testing:

Reviewed-by: Hans de Goede <hansg@kernel.org>
Tested-by: Hans de Goede <hansg@kernel.org>

I have merged the series in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this series will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans





> v1:
> https://lore.kernel.org/linux-media/20240923085652.3457117-1-andriy.shevchenko@linux.intel.com/
> 
> Andy Shevchenko (3):
>   media: atomisp: Remove unused header
>   media: atomisp: Replace macros from math_support.h
>   media: atomisp: Remove no more used macros from math_support.h
> 
>  .../pci/hive_isp_css_include/math_support.h   |   5 -
>  .../kernels/anr/anr_1.0/ia_css_anr_types.h    |   4 +-
>  .../pci/isp/kernels/dpc2/ia_css_dpc2_param.h  |   6 +-
>  .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |   4 +-
>  .../isp/kernels/eed1_8/ia_css_eed1_8_param.h  |  22 +--
>  .../isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c |   6 +-
>  .../isp/kernels/sc/sc_1.0/ia_css_sc_param.h   |   2 +-
>  .../pci/isp/modes/interface/input_buf.isp.h   |   6 +-
>  .../pci/isp/modes/interface/isp_const.h       | 157 ------------------
>  .../pci/runtime/debug/src/ia_css_debug.c      |   1 -
>  .../atomisp/pci/runtime/frame/src/frame.c     |  29 ++--
>  .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |  11 +-
>  .../pci/runtime/isys/src/virtual_isys.c       |   2 +-
>  .../staging/media/atomisp/pci/sh_css_defs.h   |  12 +-
>  .../media/atomisp/pci/sh_css_internal.h       |   8 +-
>  .../media/atomisp/pci/sh_css_param_dvs.h      |  22 +--
>  .../staging/media/atomisp/pci/sh_css_params.c |  12 +-
>  17 files changed, 77 insertions(+), 232 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/isp/modes/interface/isp_const.h
> 


