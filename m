Return-Path: <linux-media+bounces-62571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGz+E0YWEGqsTQYAu9opvQ
	(envelope-from <linux-media+bounces-62571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:39:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD105B0AF3
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A865D301BC1B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EE439D6E8;
	Fri, 22 May 2026 08:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNHILIdC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5730E821
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439167; cv=none; b=PKyZ0yoGxQNV2bKHYP+a1Kvk/vX2Rfwn2mYX7DUP3qFTFjCmKWBA2mULq5VMLqInpgROix1W+Nc/+21JiY9CRiMhlpbHMvcwLiql0STX2eY1TtznoE4tgrhtoS4flXOGZJ7ty0ut86XKIrB4V37JBL9YD6+PawsI7aCIG54YqEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439167; c=relaxed/simple;
	bh=6zai8wbmldP+rvXVhsC/9/Ci/h/cEi7B5jolsDjYSFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlhIZ+Lu/Mzc0EfWe/B12P3YgoAp/e9R9IP0eh41U6r76LdD2GP4cRK/CKqcsKO0JjNJQsJxGcwqyT6lG+BdQ5TMGyjwYxmMids0WE0RDOcMSU9SgR+8b4fkI/U3kFWSJgVX83OtpOMZj6thxvUrJAy8eO7uRxcuojfvxzMay/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNHILIdC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779439166; x=1810975166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6zai8wbmldP+rvXVhsC/9/Ci/h/cEi7B5jolsDjYSFI=;
  b=BNHILIdCYEFDaizq5cMHFjgUjvmQwAZstea8Hr7OSJciGHbZ9iPaqv5L
   w0rLwUezBkXQ3p5DNbBxncqul6t04LI2xMPgg9YubAC0XqHUS9VI573hN
   91pkLLsNuqZlnWkPQkwdF/CgQl9N0bxxbQfIxQBU8QD+jduC/jtQrpCHz
   svQluVqzBWVzFNYbgGHqgoMykrSlQJ4yy7yyzDqPpb/q+6H7HGrmxu1ex
   VJ7VnJPiAyAGhO+GstIv2h/GIlFozmzTgOIVNUIFVs3xOej/fKgBqhhDo
   NbHqxF7SW8r+tTR+FhFjd2f8r6Vf12ZeOeGMcPVf16ClNTkVhIbosDAYT
   A==;
X-CSE-ConnectionGUID: rfNYP45ASUa22lrS51EXPQ==
X-CSE-MsgGUID: oPnoM+95Rx+GkJDulk3cCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79516934"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="79516934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:39:25 -0700
X-CSE-ConnectionGUID: zqMRmE/nSZeaeRiAOjayLw==
X-CSE-MsgGUID: 6MYr5AFQRfqiQwJQGOHc9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="237816398"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.3])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 01:39:23 -0700
Date: Fri, 22 May 2026 10:39:14 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
Message-ID: <ahAVpZUnNhI34BAv@mdjait-mobl>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
 <20260521222359.16716-2-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521222359.16716-2-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62571-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: ACD105B0AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch.

On Thu, May 21, 2026 at 03:23:57PM -0700, Miguel Vadillo wrote:
> Add driver for Intel Computer Vision Sensing (CVS) devices found on

[..]

> +fail_i2c:
> +	ret = cvs_csi_init(ctx, dev, i2c);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "CSI init failed\n");
> +		goto err_put_ipu;
> +	}
> +
> +	dev_set_drvdata(dev, ctx);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	/*
> +	 * Create a PM runtime device link with IPU as consumer and CVS as
> +	 * supplier. When the IPU runtime-resumes to start streaming, the PM
> +	 * framework automatically resumes CVS first, triggering
> +	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
> +	 */
> +	ctx->ipu_link = device_link_add(&ipu->dev, dev,
> +					DL_FLAG_PM_RUNTIME |
> +					DL_FLAG_RPM_ACTIVE |
> +					DL_FLAG_STATELESS);
> +	put_device(&ipu->dev);
> +	if (!ctx->ipu_link) {
> +		dev_err(dev, "IPU device link failed\n");
> +		ret = -ENODEV;
> +		goto err_csi_remove;
> +	}
> +
> +	if (has_acpi_companion(dev))
> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> +
> +	return 0;
> +
> +err_csi_remove:
> +	if (ctx->ipu_link)
> +		device_link_del(ctx->ipu_link);
> +	cvs_csi_remove(ctx);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	return ret;

this return ret seems wrong here.

> +
> +err_put_ipu:
> +	put_device(&ipu->dev);
> +	return ret;
> +}

