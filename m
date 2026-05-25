Return-Path: <linux-media+bounces-62705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGXlD0sKFGrVJAcAu9opvQ
	(envelope-from <linux-media+bounces-62705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:37:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A85C7DD4
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 10:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48715300A32D
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 08:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BEC3E3C4F;
	Mon, 25 May 2026 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIv1bPbE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9C3E3C6B
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698212; cv=none; b=QtjW4tLzf/TFoSHkMV1g/BqZfGT/8e2At1XTWq1OjR+NC/AK499ZZmKVTD1udRvdhXeXnr1h8UxDwOBe/1Hg5l7OguZ57wlrvujifsbUsLp1fOY5WvTRqy1cTTaT5a+E9Q7hXBp3RgMHTaC45QoOpri1+FxwM7ITcvLjC5aEVjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698212; c=relaxed/simple;
	bh=RQV63Zb/zBJ3Y0orK8I3qLhUtgNBs7COvCkW25OGnhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qea6ZeMZTQDSu+GydOAMBXxP09bYXhDEeVx3jwHlIJ4wUAV8MKxzT5LtFiONLyQbJZcnkYhjQWdxvjy7jWk/BfLQmekObwyTT0AA85X2xJhU8vKaZMsMI/ldGR+XFf4/VvkQnwLdtpAMLUROEKOAxZOPWvhiFbxPBVhBEKHg0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIv1bPbE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779698209; x=1811234209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQV63Zb/zBJ3Y0orK8I3qLhUtgNBs7COvCkW25OGnhw=;
  b=RIv1bPbEdX6eXsxl+CgjQJq+nhNuGAGDbq/CwkcSZgThAmKWD3EUq5lY
   YNzoncP0GOFFlDXQnSgtLmdQvP9mH8ykfT66J+N6Z3i+UOEOkcS0sZtO8
   ZfcEUmbzD+ocl9jxeJnBL9DjxJ0ULuIqvK23U0HLDpaAqOeU2757ZhWOM
   Z6h3TNG2B+t5yxjbMGoOZfscFj9YGJKNMF2VJ2mJ5kBw1b8GcNyCgq2PR
   uFlIXIWqQLgKaD6CIIu1NnOGmqGO/ioK4HqDltcWYpmMchrz6e1SSGlC8
   oxa/e8B0LcolWw3GL1/inLlmk/h1Mr5UaK2CjKqOPD9R08HGshxs9J7cD
   A==;
X-CSE-ConnectionGUID: gIftWpblTsWvXLK6uo+mRw==
X-CSE-MsgGUID: Ftd91LPnTNqrEyRkpZ6dUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91989658"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="91989658"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 01:36:47 -0700
X-CSE-ConnectionGUID: AHNK2iIzQ4S9631x4mCFLw==
X-CSE-MsgGUID: 5f+EURcjT8y4wzUTDfG5kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237123929"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.207])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 01:36:45 -0700
Date: Mon, 25 May 2026 10:36:38 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: "Vadillo, Miguel" <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
Message-ID: <ahQIk6QV9HRwxyyJ@mdjait-mobl>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
 <20260521222359.16716-2-miguel.vadillo@intel.com>
 <ahAVpZUnNhI34BAv@mdjait-mobl>
 <173d3eec-de57-43eb-ba46-d08c8c1dc8b2@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173d3eec-de57-43eb-ba46-d08c8c1dc8b2@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62705-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A97A85C7DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

On Sat, May 23, 2026 at 04:37:41PM -0700, Vadillo, Miguel wrote:
> Hi Mehdi,
> 
> On 5/22/26 1:39 AM, Mehdi Djait wrote:
> > Hi Miguel,
> > 
> > Thank you for the patch.
> > 
> > On Thu, May 21, 2026 at 03:23:57PM -0700, Miguel Vadillo wrote:
> > > Add driver for Intel Computer Vision Sensing (CVS) devices found on
> > 
> > [..]
> > 
> > > +fail_i2c:
> > > +	ret = cvs_csi_init(ctx, dev, i2c);
> > > +	if (ret) {
> > > +		dev_err_probe(dev, ret, "CSI init failed\n");
> > > +		goto err_put_ipu;
> > > +	}
> > > +
> > > +	dev_set_drvdata(dev, ctx);
> > > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > +	pm_runtime_use_autosuspend(dev);
> > > +	pm_runtime_enable(dev);
> > > +	pm_runtime_idle(dev);
> > > +
> > > +	/*
> > > +	 * Create a PM runtime device link with IPU as consumer and CVS as
> > > +	 * supplier. When the IPU runtime-resumes to start streaming, the PM
> > > +	 * framework automatically resumes CVS first, triggering
> > > +	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
> > > +	 */
> > > +	ctx->ipu_link = device_link_add(&ipu->dev, dev,
> > > +					DL_FLAG_PM_RUNTIME |
> > > +					DL_FLAG_RPM_ACTIVE |
> > > +					DL_FLAG_STATELESS);
> > > +	put_device(&ipu->dev);
> > > +	if (!ctx->ipu_link) {
> > > +		dev_err(dev, "IPU device link failed\n");
> > > +		ret = -ENODEV;
> > > +		goto err_csi_remove;
> > > +	}
> > > +
> > > +	if (has_acpi_companion(dev))
> > > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > > +
> > > +	return 0;
> > > +
> > > +err_csi_remove:
> > > +	if (ctx->ipu_link)
> > > +		device_link_del(ctx->ipu_link);
> > > +	cvs_csi_remove(ctx);
> > > +	pm_runtime_dont_use_autosuspend(dev);
> > > +	pm_runtime_disable(dev);
> > > +	pm_runtime_set_suspended(dev);
> > > +	return ret;
> > 
> > this return ret seems wrong here.
> 
> Are you referring to just the space before return?
> @@ -1318,10 +1318,12 @@ static int cvs_core_probe(struct device *dev, struct
> i2c_client *i2c)
>         pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_disable(dev);
>         pm_runtime_set_suspended(dev);
> +
>         return ret;
> 
>  err_put_ipu:
>         put_device(&ipu->dev);
> +
>         return ret;
>  }
> 
> put_device(ipu) was already done after the ipu_link so no need to waterfall
> all the way down. Please clarify if I am misunderstanding your comment.

that's the expected code flow with goto err_x, goto err_y; -> That you do the
error handling in reverse order of allocation/init and then finish by return ret.

So in this case how about you hold on the the ipu-dev a bit longer,
remove the return ret of err_csi_remove and put_device() at the end if everything goes without error:

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index 9db56eb77645..b8d270c001b3 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -815,7 +815,6 @@ static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
                                        DL_FLAG_PM_RUNTIME |
                                        DL_FLAG_RPM_ACTIVE |
                                        DL_FLAG_STATELESS);
-       put_device(&ipu->dev);
        if (!ctx->ipu_link) {
                dev_err(dev, "IPU device link failed\n");
                ret = -ENODEV;
@@ -825,6 +824,8 @@ static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
        if (has_acpi_companion(dev))
                acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
 
+       put_device(&ipu->dev);
+
        return 0;
 
 err_csi_remove:
@@ -834,7 +835,6 @@ static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
        pm_runtime_dont_use_autosuspend(dev);
        pm_runtime_disable(dev);
        pm_runtime_set_suspended(dev);
-       return ret;
 
 err_put_ipu:
        put_device(&ipu->dev);


(Actually if you want to go just a tiny bit the extra mile and see if we
can solve this without holding a reference to the dev for the whole
probe function will actually simplify the error handling a lot, this is
of course not a priority at all and I am ok with whatever you choose to
do)

--
Kind Regards
Mehdi Djait

