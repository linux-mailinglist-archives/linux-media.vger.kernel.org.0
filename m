Return-Path: <linux-media+bounces-58876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPRQKJnG4GmjlwAAu9opvQ
	(envelope-from <linux-media+bounces-58876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:23:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79C40D50F
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 331E23011694
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA6439656D;
	Thu, 16 Apr 2026 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="nkis52Sd"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A575C3A6F0F;
	Thu, 16 Apr 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338558; cv=pass; b=AlQS2y3HgnjjSle9lwGbwI77IT1XQDjnxIHb1+Yh5/HvrjjoM140z12OTyq1FJeyhxBI6WiMYNlKh3X7eRwN7WiOLFhidJSD5U+LLekqW4hDO6lhAa9rlfJCEW+VAZUo/pAvuJdxDEhP55JQW7h4Ct9MM+Jvez6mAhN2UbKfIf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338558; c=relaxed/simple;
	bh=ZysG+T2gYUNGnDUwt2iM01kDW3KfB/fBMoHnxzYYJt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxShEPjzQFmoaMuS7k5BQ3SmfptSw5ZuV0B+0oqTDEoDrC17lv2S5egY6OSyIc1Z0CjulXNrMcwmgd/xoJVKVqeLNuTVNPdxd0c5NV3/QTkF7U+TzWMbldMu8fVRZaqVT933OsJOLicE7YAVWqaiBNa1JhGt1Rxo1fgpZYLn30s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=nkis52Sd; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fxFwj60bszySY;
	Thu, 16 Apr 2026 14:22:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776338550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=evIaAmwzwHqlI+MpK9nClbz4R3+nUguOsjFjz9PUBsE=;
	b=nkis52SdLtFB7uxaxGNn0NDhobyUSmdyUKS0FAsrBLx3VUc9X5AYGL1vMHKuXIVinla8/+
	LPCtv0Bn5BswESld90YZl5VNHQYSzqdUIiM0+Nc1A5y0FA4+OKclT5rRyuwAWRw9VMNHZT
	3hOJX1I62d7K7ubzxjpXX9+vK8YQy1g=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776338550;
	b=JTT/8ILl438IkY8NVrS/hTAaawiEIOMQmkwa6sqRrB5UQrqUiCiiaH+IoHc8NCqH8eVxZ3
	ie9n6VgqyhN+BY3Labh4o0xL/O89PrsyKBqObSQmzMrO0ec1UP3zekhKP2GHneoED2Slkn
	gi/GI5irwtD7whgu00QBWL72dXzBeKo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776338550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=evIaAmwzwHqlI+MpK9nClbz4R3+nUguOsjFjz9PUBsE=;
	b=UVJzI/GvP65amDom6IfMyog/kv2KxyM+/JX9EqxptddJzS9UK+lcRaDJ14aOvKXUvu3aBw
	yL7Usqq3dp1rkKlgZo/qi0FTvjWW9Pjz5MsoKl//9SxeierVqVxUyxZpu44cAZhSpcXTUV
	J6erZdY5B59x5DHFKads3nsXFm41Th0=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5CC3D634C51;
	Thu, 16 Apr 2026 14:22:29 +0300 (EEST)
Date: Thu, 16 Apr 2026 14:22:29 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Anushka B <anushkabadhe@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	andriy.shevchenko@intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dhruva gole <goledhruva@gmail.com>, m-chawdhry@ti.com,
	Simona Toaca <simona.toaca@nxp.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <aeDGdRKoE_7FNSJw@valkosipuli.retiisi.eu>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZo5LUXH70-UKUi@kekkonen.localdomain>
 <CAAfE=nNNxCKv0JoRcib7YVQfQ9MxqE34WyYu2GHNYaroxzpw1w@mail.gmail.com>
 <aczBS_KJQa_j97RP@kekkonen.localdomain>
 <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfE=nOs9YfpnFGY+bPg1WPxuCHOzkR9oHD9DizNxxse25A0hw@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58876-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,nxp.com,gmail.com,ti.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[iki.fi];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iki.fi:dkim]
X-Rspamd-Queue-Id: AE79C40D50F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Anushka,

On Wed, Apr 01, 2026 at 09:32:29PM +0530, Anushka B wrote:
> > > Would it be okay to proceed with the simpler in-place fix for
> > > GP_TIMER_BASE declaration instead?
> >
> > I'm fine with v4.
> 
> Should I send a v7 similar to v4, where I merged the split declaration
> of GP_TIMER_BASE, and a separate patch for the comment fixes?

Yes, please.

You can find the currently applied patches in my atomisp branch here:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp>.

-- 
Regards,

Sakari Ailus

