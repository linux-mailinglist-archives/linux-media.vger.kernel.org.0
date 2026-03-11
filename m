Return-Path: <linux-media+bounces-55312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LkqEpETsWkZqgIAu9opvQ
	(envelope-from <linux-media+bounces-55312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:02:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B425D255
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A1B23013478
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADE3377010;
	Wed, 11 Mar 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkJd6iSd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B9A371899;
	Wed, 11 Mar 2026 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212555; cv=none; b=Rgc2og23fAAfqISTTOv0CXOk17ZyOjii3Xsy7P6QB20jxr3tzyoA3A2L/mUuulrcgobCS+FPbDgCGt5TQtlUVRKDeQq9ri2BQlc0/jj1ITiGQUHYyL8Z+QGfV85TH7W13qb5ZKiSmtsaLAGf2Wgm6qRJSugXF7yTfSZJ1XHlMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212555; c=relaxed/simple;
	bh=jZWggdmwvDyXdEWVd5zNFp0LmvfBwhhwJzFjhQAqYMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuACwK1VqxBsb1E/g1byd//hz0IiCmfYn/3mUZqaki5sgEx1espJPC38YVITO+P38ctBY/1OPajhR3oOdzcgZMi/0GG8r12Cgk2dYfDkHZ45psSNrudW6ojEy5dPvMX2Y6KBowdSlDWuImEqzIgVfyt9N0r1rc3b0Lqn8Emm4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkJd6iSd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773212554; x=1804748554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZWggdmwvDyXdEWVd5zNFp0LmvfBwhhwJzFjhQAqYMo=;
  b=bkJd6iSdHumIG05N7YiCiIV5zdHlCxZs0I3vbaux3ytVKGGxsKaiOoO+
   2ahIHgtDN1OJFTIeewJ5SAoCJVqAEfUh/qi90LJosrxIqB94PMJUs51nX
   fV0pjAs9KVkw3Ka7JvHyngCs2HZ64/iAvy5xOwViSkjIefdV8v8WV2tnf
   1W/tIz1cIpM6bePzZsXWwuxzxhW83TBYWZBTBet5mijLVs68SZLM3/GKW
   jS8cRU1JXOrhnXgsITOVRju20I076uMKQxcEsHrDnZIj+ew8K3Kir+XMD
   /PwPbE1xnuU+H9UzCFlUY0tzHIMNuC/xCKr+F8VlJMeS6znSoauX20rBz
   g==;
X-CSE-ConnectionGUID: wdAO4mcvTyKNgVPOVDY6GQ==
X-CSE-MsgGUID: xfaE5xAhSwaeaeRVGhg6Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74391256"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74391256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:02:34 -0700
X-CSE-ConnectionGUID: Co5izIXqRom6dJxUT7KCOg==
X-CSE-MsgGUID: grvsrG7eThCfH1WC748Dvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216657779"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:02:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1A639120E92;
	Wed, 11 Mar 2026 09:04:28 +0200 (EET)
Date: Wed, 11 Mar 2026 09:04:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media:v4l2-async:add debugfs under CONFIG_DEBUG_FS
Message-ID: <abET_OcHYr5_wpdK@kekkonen.localdomain>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121031456.1125096-1-luo.liu.linux@163.com>
X-Rspamd-Queue-Id: DB0B425D255
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55312-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Luo,

Thanks for the patch.

On Wed, Jan 21, 2026 at 11:14:56AM +0800, luo.liu wrote:
> All debugfs-related code is guarded by CONFIG_DEBUG_FS to avoid
> bloating the kernel when debugfs is disabled.
> 
> Signed-off-by: luo.liu <luo.liu.linux@163.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 1c08bba9ecb9..f6a1a57149ba 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -947,6 +947,7 @@ v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
>  		return "nil";
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int pending_subdevs_show(struct seq_file *s, void *data)
>  {
>  	struct v4l2_async_notifier *notif;
> @@ -967,20 +968,25 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
>  DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
>  
>  static struct dentry *v4l2_async_debugfs_dir;
> +#endif

This part seems reasonable...

>  
>  static int __init v4l2_async_init(void)
>  {
> +#ifdef CONFIG_DEBUG_FS
>  	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
>  	debugfs_create_file("pending_async_subdevices", 0444,
>  			    v4l2_async_debugfs_dir, NULL,
>  			    &pending_subdevs_fops);
>  
> +#endif
>  	return 0;
>  }
>  
>  static void __exit v4l2_async_exit(void)
>  {
> +#ifdef CONFIG_DEBUG_FS
>  	debugfs_remove_recursive(v4l2_async_debugfs_dir);
> +#endif
>  }

But are the two latter #if's useful? Looks like the compiler should
optimise these out...

>  
>  subsys_initcall(v4l2_async_init);
> 
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab

-- 
Kind regards,

Sakari Ailus

