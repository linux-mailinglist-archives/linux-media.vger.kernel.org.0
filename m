Return-Path: <linux-media+bounces-45216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F34BFB3D7
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FCB3BCADB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F555315D42;
	Wed, 22 Oct 2025 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KScFxbjO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699F17332C;
	Wed, 22 Oct 2025 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761126931; cv=none; b=Vmp/G754KLBfQU7PoKESD2PHlV3CamJeHz3JO2vg/akJVlciCckcFS7BfWJ3wvQXh0QIO3ZQcxWjgdF6nHfLoYCw25qhXbknH71Ii6z1arHbpm++/txJrDCTa+GmYaRJaova2T5DKLO8JedtASpsbKRG4bx7qa9l5KaPzFQ7Fbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761126931; c=relaxed/simple;
	bh=UrosYr8zMMuUHRl4so5j+EHN/Api83L+MyYPZFVHKI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrxFaQn+jqO9E69MH68ogEe9ELxQD2Y6s+yYd5AHLYOhdesnQ0EFCiomDqJs5cdzkrI3oCgtUviBJMkwPrI4oRtfiHHS3IGBptnNGbsEjE7vzp/6RHESdUkN//yAWjrmiHdLdKfE/nBsuZsEuOdT3NhKbnctp9GhkmidjS8oJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KScFxbjO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761126930; x=1792662930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UrosYr8zMMuUHRl4so5j+EHN/Api83L+MyYPZFVHKI4=;
  b=KScFxbjOtdJVCEGsm2AKJZm4BfCc2iXPBSoZUErhG+YRqME3OnYlhUpG
   4O5nyxvY8V51c+IDk8lmPWPHnYp5UsaEwqmbM+acon8Ilu8Ji/uPjkdtB
   FPfFQi5JdonPvvvgRM2/giXxw9x/yY9S3i81JVK6B8ynNc3tGP8UZyXZT
   2/LMa85uXr5LTXAWePbXG+NmdnbiRI+0URhTxxU4V/P0pfaeZzf+m5C0C
   Q9tPW6zQVDf3/66fE+jSbH3kxyAq/sTj9agBnX0VYfliCtahcH2kfY4Im
   eI/Vco6v9aKCTGIPrQ39VOxkOYnGhypGaU0bc9RQ+pbDGrZnquy0ymQVZ
   A==;
X-CSE-ConnectionGUID: /BNXH174SQ6y2OcDyTXAjw==
X-CSE-MsgGUID: PhteSJ1jTZ2Q8GEMDj91Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85892443"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="85892443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:55:29 -0700
X-CSE-ConnectionGUID: BIipuDuxRiWsEv1H2M+Eww==
X-CSE-MsgGUID: UTJeAewqR7+tjzPzR0PmGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="189110069"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:55:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 05AD8121E5B;
	Wed, 22 Oct 2025 12:55:25 +0300 (EEST)
Date: Wed, 22 Oct 2025 12:55:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: bingbu.cao@intel.com, lixu.zhang@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH v6 RESEND] media: pci: intel: ivsc: improve device
 reference counting in mei_ace driver
Message-ID: <aPiqDLFcnOm4qu1Y@kekkonen.localdomain>
References: <20251022092545.4640-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022092545.4640-1-make24@iscas.ac.cn>

Hi Ma,

On Wed, Oct 22, 2025 at 05:25:45PM +0800, Ma Ke wrote:
> Put the reference to csi_dev acquired during driver probe in
> mei_ace_setup_dev_link() inside the same function, instead of during
> driver unbind in mei_ace_remove(). This can be done as
> device_link_add() already takes a reference to csi_dev.
> 
> Found by code review.
> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v6:
> - modified the commit message as suggestions;
> Changes in v5:
> - jumped to err instead of err_put to avoid calling put_device() again in err_put as reviewer's instructions;
> Changes in v4:
> - updated the subject as suggestions;
> Changes in v3:
> - deleted the tag of Fixes and CC, and moved put_device() to immediately after device_link_add() as suggestions;
> Changes in v2:
> - modified the put_device() operations and the patch title as suggestions.

v5 of this patch has been already merged with a modified commit message;
there's no need to resend this anymore.

-- 
Kind regards,

Sakari Ailus

