Return-Path: <linux-media+bounces-58860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNTiOo+b4GnokAAAu9opvQ
	(envelope-from <linux-media+bounces-58860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:19:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947740B717
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 10:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862C431EAB25
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 08:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D96390222;
	Thu, 16 Apr 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="I0MA2fWg"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757463603E9;
	Thu, 16 Apr 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327240; cv=pass; b=TckNsxLZpIJDz8rtrEWfFzeC4bjUksIADfce16/9PA2VO/vHEwp7Takru0CxJce2ytJB1iVBSDUYwBBsL3uuXiB0pW/xsF87Xmmt6zNn93C/+EIYQcCkl0y5EiJU5qm2qWnOB74TWUf/uGk+0qbkxdtmK1+rOOZITrTN2IhPuzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327240; c=relaxed/simple;
	bh=Kbs4cctNnJiY1NH1WFUvdq16RCRPvBHjAPKm9RETvu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3FuJE9pWHf0iXqxjq0b3oP9tTbLeQ5wXgFi5+PKvK5kqQnypOPYfMaY9qEMFl4XQZCDQhL0dv5ZxxkKz7YuDHvdN2GLrQgBt+vr6h6B/G8Ukhf8YCRri57lSBg1TtcvxBtNcexyFke5XazckzVIUfyAK9rrmm0Hz+DdC6JRw9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=I0MA2fWg; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fx9l11fYZzySY;
	Thu, 16 Apr 2026 11:13:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776327230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXZBiavgYukJbdw192nXkh14gYevuADt0n/I/UwWC6c=;
	b=I0MA2fWgX6zlLrCjuI2TkRIK00iMwSNUQNkE6HcHry209YX/Dyz/kBjA+6ZOiRAphcW3Ox
	BFrqch+5R1oMFiwGmurAdrYNkLJ/5shXzYjDWsaRvTv8qMfxpaew/5pFc2UAv/iWUo76Uv
	5ZIGmWlifTMxw8TvV2Bd0xuYqGvqf5s=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776327230;
	b=xmHZ+fI/lh9vcMtzji7BN0/rtodO8Gcx00ru3cwGVD4SXwtWy2fbQKzVQ3xpE/Bl6bj93M
	gjXHAC5PQf8es/RtmTQOkYrnindtC56KrEhOE3l8yV9XXQT7QolVPylbjm61iXQaTS4URK
	K8k3rb1u9C+Hzd7ud5x/hxzPvJiyn+E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776327230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nXZBiavgYukJbdw192nXkh14gYevuADt0n/I/UwWC6c=;
	b=bh4qFGC08oYYvWRLTklyhoasHe/fgKDWYPzruC2vQrnGdIlxiIk+x0FH9Pnj39eLdZEsAW
	ygLQe2+eBt1odhoVbSNQeWbNA0trVin2qtmjJgQucbodXYKFCNlVO3PkkcC5JWva1wYd30
	xY8M8N2Y32kHb0ydg8e9bOtqDUz67M8=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B7435634C4E;
	Thu, 16 Apr 2026 11:13:48 +0300 (EEST)
Date: Thu, 16 Apr 2026 11:13:48 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix memory leak of
 raw_black_frame
Message-ID: <aeCaPExt-sUiY-B9@valkosipuli.retiisi.eu>
References: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416063058.2479566-1-hhhuang@smu.edu.sg>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-58860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,seu.edu.cn:email,valkosipuli.retiisi.eu:mid,iki.fi:dkim]
X-Rspamd-Queue-Id: 9947740B717
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Huihui,

On Thu, Apr 16, 2026 at 02:30:58PM +0800, Huihui Huang wrote:
> Our code analyzer reported a memory leak in
> drivers/staging/media/atomisp/pci/atomisp_cmd.c.
> 
> In atomisp_fixed_pattern_table(), raw_black_frame is allocated by
> atomisp_v4l2_framebuffer_to_css_frame(). If sh_css_set_black_frame()
> fails, the function returns -ENOMEM directly without freeing
> raw_black_frame. The allocated memory is only freed on the success
> path.
> 
> My patch adds the missing ia_css_frame_free() call before the error
> return, to free raw_black_frame when sh_css_set_black_frame() fails.
> 
> Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>

Thanks for the patch.

I believe the problem has been already addressed by
<20260203163134.3901110-1-zilin@seu.edu.cn>. It's in my atomisp branch.

-- 
Kind regards,

Sakari Ailus

