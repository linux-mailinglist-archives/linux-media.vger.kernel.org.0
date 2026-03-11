Return-Path: <linux-media+bounces-55357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OsrMcI0sWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:24:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDDD2604B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D08B30574B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BB73CAE67;
	Wed, 11 Mar 2026 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g0xQ952Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6EB3C457D;
	Wed, 11 Mar 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220730; cv=none; b=IHeWnkXML6VoVEmDABTgquGyasI2QCw4wsXLUf5mKYwyRe3cgI8JV9/L2pgYeZg3n3rR9e4WHBNTGAtAEd+8bp+saT7+nA10EG6lD5ePSwrMSh5gAoSumf5rZQ7WuOH1m93lOSUxfDU9M7QmHND26mRRAbHTAnaqsP380GzSMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220730; c=relaxed/simple;
	bh=Rqzwz+cwt5kmThwxqLMAGRvCs4mGbmH7xx3ELJIsTQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8sNnct9Hi75zJJ+jH6hLU+1nKR/GN/zMrOXswUdjZoZJdUUc8rwK4cO9o2Q8CsGeYK+3WV2oF6iKpMk8ihz2MiPhDUy5pwtj3UCg9JW0NgH+Ucvzresft1gw2ZZD4Njjq3Jz+cTeINK/ZGxnJzHBrPADEnJ/QCQht5H7HRBjHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g0xQ952Z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220728; x=1804756728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rqzwz+cwt5kmThwxqLMAGRvCs4mGbmH7xx3ELJIsTQ8=;
  b=g0xQ952ZzOkAsfGIcV1+g7wRsa6WuHsyz3FhIJR9KtAntnZ65EZKAEur
   m472E+Ri/2CGeJ2O5y2JxPpkOOC7ekKHv2ePDbSU3vEUSIyyS6Iqu1LwA
   oa8pyUKO+CGVlZTzc1DeSO/ZOH8r6mXEGzw3mhX6iYlV4dfp3wOO5zZ7A
   tTgpTiNVD6h4kM5VYeqsKa/OLDBZDdy4qjKRxTkH+x76ohlzy5r8qqHhg
   nteZcg224tDVMKvYv6jQYbVVd6nv9PSp/oX1LmRb72/zqXCKyR3ONL4Sq
   hFM2ahSQh8N9SOefVTUQbDDDnFqzFIjLBFlbTQM9West1LabaiYjW1W7N
   w==;
X-CSE-ConnectionGUID: xJ6d2WLWS9yUfe82MIKqAQ==
X-CSE-MsgGUID: MUgJFXmkSxODM/kUrsAMWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74254679"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74254679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:18:48 -0700
X-CSE-ConnectionGUID: YI1j3GJfRziu3AeTyBmJvQ==
X-CSE-MsgGUID: AUC3eNRvRJq2sssYYwBJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225358778"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:18:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 194C2121D1C;
	Wed, 11 Mar 2026 11:20:41 +0200 (EET)
Date: Wed, 11 Mar 2026 11:20:41 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "luo.liu.linux" <luo.liu.linux@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media:v4l2-async:add debugfs under CONFIG_DEBUG_FS
Message-ID: <abEz6U82C994zgw7@kekkonen.localdomain>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
 <500865d6.8b0f.19cc285d65e.Coremail.luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <500865d6.8b0f.19cc285d65e.Coremail.luo.liu.linux@163.com>
X-Rspamd-Queue-Id: 6CDDD2604B7
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
	TAGGED_FROM(0.00)[bounces-55357-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:41:17PM +0800, luo.liu.linux wrote:
>  
>  Hello Sakari and Mauro，
>   
>      Gentle ping ....
> 
> 
> At 2026-01-21 11:14:56, "luo.liu" <luo.liu.linux@163.com> wrote:
> >All debugfs-related code is guarded by CONFIG_DEBUG_FS to avoid
> >bloating the kernel when debugfs is disabled.
> >
> >Signed-off-by: luo.liu <luo.liu.linux@163.com>
> >---
> > drivers/media/v4l2-core/v4l2-async.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> >diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >index 1c08bba9ecb9..f6a1a57149ba 100644
> >--- a/drivers/media/v4l2-core/v4l2-async.c
> >+++ b/drivers/media/v4l2-core/v4l2-async.c
> >@@ -947,6 +947,7 @@ v4l2_async_nf_name(struct v4l2_async_notifier *notifier)
> > 		return "nil";
> > }
> > 
> >+#ifdef CONFIG_DEBUG_FS
> > static int pending_subdevs_show(struct seq_file *s, void *data)
> > {
> > 	struct v4l2_async_notifier *notif;
> >@@ -967,20 +968,25 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
> > DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
> > 
> > static struct dentry *v4l2_async_debugfs_dir;
> >+#endif
> > 
> > static int __init v4l2_async_init(void)
> > {
> >+#ifdef CONFIG_DEBUG_FS
> > 	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
> > 	debugfs_create_file("pending_async_subdevices", 0444,
> > 			    v4l2_async_debugfs_dir, NULL,
> > 			    &pending_subdevs_fops);
> > 
> >+#endif
> > 	return 0;
> > }
> > 
> > static void __exit v4l2_async_exit(void)
> > {
> >+#ifdef CONFIG_DEBUG_FS
> > 	debugfs_remove_recursive(v4l2_async_debugfs_dir);
> >+#endif
> > }

If debugfs is disabled, the init functions won't do anything. You can put
these behind a single #ifdef .. #endif.

-- 
Sakari Ailus

