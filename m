Return-Path: <linux-media+bounces-65369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iaRQIFkyOWpYoQcAu9opvQ
	(envelope-from <linux-media+bounces-65369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:02:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4E6AFA07
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:02:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=pkH1eov6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65369-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65369-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CED03018D68
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762FD3AF670;
	Mon, 22 Jun 2026 13:01:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9793A6B71;
	Mon, 22 Jun 2026 13:01:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133315; cv=none; b=RFZTRm5y/h771RAEwxoo3UHljbNXogPSSPvRnRTAFKPEDu+fqCih0u7sz+8OMWvF+lwDFRvB7iRY4NBKOV1VqdI8DK9m6NE6XCPGzrplfO+BHn3tSQvAPrwNG0A/s/QM7i/PVjfRS0bedY7fVwd7wIrdRwclAJBDIlBRnifEc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133315; c=relaxed/simple;
	bh=N1ETn9Jj5pisDG1bq4JWbw7aNdqW9tjRev1AlON/zSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr4+XcIZ9oeFyyC4OC3FhgntSCZE3LlacMwPBdsHUMbKg4Ytc/J/5SsFcPoUrYpWa0M1c00+T0oeqEWb9No5McTUg3SufyrbSLAwyjx3Z3VQ6DqTXrQYHA0MZVscIRNNCIupggwuNTKAzs6026uNvOXE+eKHpwkdIl4Cekffhss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pkH1eov6; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7868227;
	Mon, 22 Jun 2026 15:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782133273;
	bh=N1ETn9Jj5pisDG1bq4JWbw7aNdqW9tjRev1AlON/zSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkH1eov6TunNPB/42dP+l4CcIVfCj0VfhTOtlWUFC495AwNZ/wTA8JXegYFwKSzeK
	 ztro35Mvx9mLkJtnKzEdv6cdcxFzzx9mljL16idQzi+AtSINWRDmQ7YFuH1BY+wMNR
	 l9muZ7J2YuFPTUw8073tBmt+rCj9ABAd0e1tgALE=
Date: Mon, 22 Jun 2026 16:01:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: biren pandya <birenpandya@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: modernize locks to use scoped_guard()
Message-ID: <20260622130150.GA3948118@killaraus.ideasonboard.com>
References: <20260616181956.61476-2-birenpandya@gmail.com>
 <20260622115544.GA3899302@killaraus.ideasonboard.com>
 <CAAeMi9LMootkxmRE0tjo0mwijAuA0u+49HhxWxRGU-pSz+Cggw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAeMi9LMootkxmRE0tjo0mwijAuA0u+49HhxWxRGU-pSz+Cggw@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65369-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BA4E6AFA07

On Mon, Jun 22, 2026 at 06:22:27PM +0530, biren pandya wrote:
> On Mon, Jun 22, 2026 at 5:25 PM Laurent Pinchart wrote:
> > On Tue, Jun 16, 2026 at 11:49:57PM +0530, Biren Pandya wrote:
> > > Several GEM core functions manually managed mutex_lock() and
> > > mutex_unlock() over single scopes or error paths. This adds boilerplate
> > > and carries the risk of lock leaks if error paths are refactored.
> > >
> > > Modernize these locks by deploying the <linux/cleanup.h> scoped_guard()
> > > macro. This ensures that the locks are reliably dropped when the block
> > > exits, cleanly removing goto out_unlock paths and tightening the
> > > lifecycle.
> >
> > What's the reason for doing so in in drm_gem and not other areas in DRM
> > ?
> 
> Hi Laurent,
> 
> Thanks for taking a look.
> No deeper reason than it being where I happened to start — I didn't
> mean to single it out, and I'd rather the treatment be consistent than
> piecemeal.
> 
> > > @@ -1021,37 +1018,34 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> > >               goto out;
> > >       }
> > >
> > > -     mutex_lock(&file_priv->prime.lock);
> > > +     scoped_guard(mutex, &file_priv->prime.lock) {
> > > +             spin_lock(&file_priv->table_lock);
> > > +             ret = idr_alloc(&file_priv->object_idr, obj, handle, handle + 1,
> > > +                             GFP_NOWAIT);
> > > +             spin_unlock(&file_priv->table_lock);
> >
> > And why don't you use guards for the spinlock as well ?
> 
> Fair point — the spinlocks here are equally good candidates; I only
> kept v1 to mutexes to keep it small.
> 
> That said, this is a pure cleanup with no functional change, so it's
> entirely your call whether it's worth carrying.
> If you'd like it, I'll send a v2 that converts both the mutexes and
> the spinlocks in drm_gem.c consistently. If you'd prefer not to take
> cleanup-only churn, I'm happy to drop it — no problem either way.

I'll let the maintainers of that code decide (I'm not one of them).

-- 
Regards,

Laurent Pinchart

