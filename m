Return-Path: <linux-media+bounces-65215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I3P6OnEGNGqiLQYAu9opvQ
	(envelope-from <linux-media+bounces-65215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:53:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8956A108C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:53:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RbweEWvR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65215-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65215-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64583301AA4C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9BA3BFAD0;
	Thu, 18 Jun 2026 14:53:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808ED2DE702;
	Thu, 18 Jun 2026 14:53:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794413; cv=none; b=rifiX0A0UQkOqWSzRbgp+qjebGJwqodWzK48wCU2vWtaNb1DMZBPXMx0IZ6Y6SR5sO6uVCocNVoNORa49oMHupdfYe52o807VTJTT8o5KKbzv+5AvcCYkSlXpWmZWzmojbAWrTRH0NPay/iCFd/78jr1a0a3vG2sQfS+GLLtAwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794413; c=relaxed/simple;
	bh=LQK1k5amiHum4k7v4qC2gC4HASrAHvCiHPCPe6WMhvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qLqZlBv2Uz5U0fxE8thDhM69nJvAWv/j+4v3YHcm7SlThzW4kwFynSMd+1FPPlQXwXxFBLiP+bGkpMfHd4+XcW6pxjtj5qVLHAql6NlAurX8sxTTOV7TuS444Wehe0YGNIcabtskXql47o46gbfV7uQr+ZhiN3TBUGJjE6KC/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbweEWvR; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781794412; x=1813330412;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=LQK1k5amiHum4k7v4qC2gC4HASrAHvCiHPCPe6WMhvw=;
  b=RbweEWvRVXW3Ud8F1wQKHSmBlYuQJH09IY+nOzxGwNxwe+FvX2bun3eH
   5VlgaP6UilWgXLg/fBdROQ2c7W6A/Ep8u9mXUp37/DIGgB/+ponoupf1S
   pq6Kvtlryt0p1W7cCzUqlSb1+l/r7tqOI/PfPB5EXyTurVpgJOtpCrhNL
   fiJFd0cgn4Opq9Lo7KpuiMqJTYCx6+2cz7yayHLMLWp5TEbLyfpuMECtH
   q0xyjafeuc2boofgYtB0OOxYyEQ/9xY6TdpVpr9AVO/AY60ecztc0Ifll
   4sS3brzDr7Tffz5ufMQLVlhNSuQvYb4jvrHTD1L07cxwNxGQqFNbLO0/E
   w==;
X-CSE-ConnectionGUID: kkiq/tAoQdqqxUor9F2Bnw==
X-CSE-MsgGUID: D1k4NEp+QlWJvmjwrXC7Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100043980"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="100043980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:53:31 -0700
X-CSE-ConnectionGUID: PZCw4ob6SS6eGvQzQ+Kg9A==
X-CSE-MsgGUID: YUYyLKqDRGSAcHM4J6hSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="244027388"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.2])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:53:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com, =?utf-8?Q?Andr?=
 =?utf-8?Q?=C3=A9?= Draszik
 <andre.draszik@linaro.org>
Subject: Re: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
In-Reply-To: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
Date: Thu, 18 Jun 2026 17:53:23 +0300
Message-ID: <03ea95355325fb0f8672005e10a8275304d93409@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65215-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andre.draszik@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linux.intel.com:from_mime,intel.com:dkim,intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A8956A108C

On Thu, 18 Jun 2026, Andr=C3=A9 Draszik <andre.draszik@linaro.org> wrote:
> Since commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> I'm seeing the BUG_ON() triggering in drm_crtc's fence_to_crtc() via
> drm_crtc_fence_get_driver_name() regularly:
>
>     Call trace:
>      panic+0x58/0x5c
>      die+0x160/0x178
>      bug_brk_handler+0x70/0xa4
>      call_el1_break_hook+0x3c/0x1a0
>      do_el1_brk64+0x24/0x74
>      el1_brk64+0x34/0x54
>      el1h_64_sync_handler+0x80/0xfc
>      el1h_64_sync+0x84/0x88
>      drm_crtc_fence_get_driver_name+0x60/0x68 (P)
>      sync_file_get_name+0x184/0x45c
>      sync_file_ioctl+0x404/0xf70
>      __arm64_sys_ioctl+0x124/0x1dc
>
> This looks to be caused by a code flow similar to the following:
>
> +++ snip +++
> thread A                             thread B
>
>                                      ioctl(SYNC_IOC_FILE_INFO)
>                                      sync_file_ioctl()
>                                      sync_file_get_name()
> dma_fence_signal_timestamp_locked()  dma_fence_driver_name()
>                                        ops =3D rcu_dereference(fence->ops)
>                                        if (!dma_fence_test_signaled_flag(=
))
>                                          ops->get_driver_name(fence) i.e.
>                                          drm_crtc_fence_get_driver_name()
> test_and_set_bit(SIGNALED)
> RCU_INIT_POINTER(fence->ops, NULL)
>                                      drm_crtc_fence_get_driver_name()
>                                        BUG_ON(rcu_access_pointer(fence->o=
ps)
>                                               !=3D &drm_crtc_fence_ops)
> +++ snap +++
>
> I see two ways to resolve this:
> a) simply drop the BUG_ON(). It can not work anymore since above
>    commit, as it is racy now.
> b) pass the original 'ops' pointer obtained in dma_fence_driver_name()
>    to all callees.
>
> This patch implements option a), as because:
> * I don't see much benefit in passing the extra pointer just for this
>   BUG_ON() to work.
> * Requiring the dma_fence_ops in those callbacks is an implementation
>   detail of the drm_crtc driver, and therefore upper layers shouldn't
>   have to care about that.
> * The existence of the BUG_ON() doesn't appear to be consistent with
>   implementations of ::get_driver_name() or ::get_timeline_name() in
>   the majority of other DRM drivers in the first place. Those that do
>   have a similar BUG_ON() (i915, xe) probably also need an update
>   similar to this patch here but I'm not in a position to test those.
>
> Note that the adjacent drm_crtc_fence_get_timeline_name() has the same
> problem and is fixed by this patch as well.
>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/gpu/drm/drm_crtc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 63ead8ba6756..31c8636e7467 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -73,6 +73,9 @@
>   * &drm_mode_config_funcs.atomic_check.
>   */
>=20=20
> +#define fence_to_crtc(f) container_of((f)->extern_lock, \
> +				      struct drm_crtc, fence_lock)
> +
>  /**
>   * drm_crtc_from_index - find the registered CRTC at an index
>   * @dev: DRM device
> @@ -154,14 +157,6 @@ static void drm_crtc_crc_fini(struct drm_crtc *crtc)
>  #endif
>  }
>=20=20
> -static const struct dma_fence_ops drm_crtc_fence_ops;
> -
> -static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
> -{
> -	BUG_ON(rcu_access_pointer(fence->ops) !=3D &drm_crtc_fence_ops);

Whether removing the BUG_ON() turns out to be the right choice or not, I
couldn't say, but please don't turn this function into a macro, at least
not without rationale. (I can't think of any.)

BR,
Jani.

> -	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
> -}
> -
>  static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fenc=
e)
>  {
>  	struct drm_crtc *crtc =3D fence_to_crtc(fence);
>
> ---
> base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
> change-id: 20260618-linux-drm_crtc_fix2-23a7c354a412
>
> Best regards,

--=20
Jani Nikula, Intel

