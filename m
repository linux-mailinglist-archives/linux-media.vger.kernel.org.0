Return-Path: <linux-media+bounces-59067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMb7Aw5F42loEAEAu9opvQ
	(envelope-from <linux-media+bounces-59067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:47:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E242072A
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E63FF300D4DB
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE2C37D105;
	Sat, 18 Apr 2026 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="gj5muBWC"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F634DCD7;
	Sat, 18 Apr 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776502015; cv=pass; b=g9zwxqxli9CgIB+tO0zAEr56r5SsVxeZGwL1fOzHuQqn5gMklITiapXFic8uITX9cSqyDmnKG8XAAPqAgihBiguQ5yWTm40RXFn+Rlkz1a3hq8fNoTxhmgL9+EXX/fvXZdpSRhbDZqvSZz/IsaelNi0CjsfHCtBx05K8TFCs9wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776502015; c=relaxed/simple;
	bh=FzwNMcEa7YGomofvHWOdesCMpvuIIDp1/UHYBE0/wVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE8KZmWVQjeDPtzs8hJPc3lDs7qwM8GCgIgTTX5+NzYkCz1YHhdYMJut/2Tc8YpMExR5d0NhRz2kxa/ePL68/AZc3CY8B9StjxDdO53eas4X4zyj4nQGEDiB+Hnsp1XNXNiDoZKrBBs/0LjimNXLPfG52+E9Ta+P/xCACSf95Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=gj5muBWC; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyQNC0d5fzyRd;
	Sat, 18 Apr 2026 11:46:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776502011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1V1Df/5jNGsjaouAMY3KwmP+Z1Kq5RdOcUmqkNHgGA=;
	b=gj5muBWCyi9x335Zb1VP9gzIFxYLqzMPjv69mJazuHK8HusVW6pg35FiAlMt2MSZSZBvw+
	3AnkTycADkpeK7SKYAWg9t7tDdCTWWtN9dPbTRqzQbkUP1vJc+a4MA3mX9gxeA4VN6Z8kR
	KDyXdU63h0TvGRDmhmljXaMf1vyR6RI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776502011;
	b=Zf8lN9CyAAxmupgX7IoY6sXcU/4aTlDzfnm0Uwfkb7jxU+I9GtRYe+efznC8PMQZVJuAxy
	qZf4mYPSSqhycIWi1PRuPr/2oly5sXdpjoTYpm64jDVlIlBIrvI1BxHCuBVrycwr5Rg3/I
	7U2S4x8Gp1JtURHFl3QTL9ieCizY/2c=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776502011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1V1Df/5jNGsjaouAMY3KwmP+Z1Kq5RdOcUmqkNHgGA=;
	b=JXgVbZ7yS0zrIQq7l0Y/02XJQoEk0e810/3UBsyiwbDeb5Ikl9oj1y+ESKwy2ZqJtUrgSM
	f488uyJB12Q2OJOtQx7CEsVjLY73n/BaScR4hEJcNHIw+MEI5WqFOEAEDs7tedYkyVhpvm
	+gFcxhViR+zLLGWnPuTBmR6slwPyYV4=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A921C634C4E;
	Sat, 18 Apr 2026 11:46:50 +0300 (EEST)
Date: Sat, 18 Apr 2026 11:46:50 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Qianfeng Rong <rongqianfeng@vivo.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] media: atomisp: use kmalloc_array() for array space
 allocation
Message-ID: <aeNE-lzVG_czEt-5@valkosipuli.retiisi.eu>
References: <20250821081746.528018-1-rongqianfeng@vivo.com>
 <aKbmTz3bd2dq_i3X@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKbmTz3bd2dq_i3X@smile.fi.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vivo.com,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59067-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,valkosipuli.retiisi.eu:mid,iki.fi:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F7E242072A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Aug 21, 2025 at 12:26:39PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 21, 2025 at 04:17:42PM +0800, Qianfeng Rong wrote:
> > Replace kmalloc(count * sizeof(type)) with kmalloc_array() for safer memory
> > allocation and overflow prevention. Additionally, replace sizeof(type) with
> > sizeof(*ptr) to improve code robustness.
> 
> LGTM, thanks.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I'm afraid this no longer applies to my atomisp branch.

-- 
Sakari Ailus

