Return-Path: <linux-media+bounces-58878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE8zHS/I4GnjlwAAu9opvQ
	(envelope-from <linux-media+bounces-58878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:29:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C624240D6D0
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AD853074CC9
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95F73A6EFA;
	Thu, 16 Apr 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="v2gXf9ef"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AC3A7F70;
	Thu, 16 Apr 2026 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338982; cv=pass; b=ltHIMKFMZFoGsb98wQCX7LP9UDSH5pdP3OMvbXi83tQjZ1LaJ4ja+Ixs4QYCOEXE4kAd+L6MjnRhQhm77QCioglTcmiOOhF83KopKJ+UU40/vLxdnmXa9Rr/YNiZYgfpDzPVYHZVK4VAVBd2NnfRRgj4G9FcKlTB6Kp4ep4tpOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338982; c=relaxed/simple;
	bh=m7BhGgKxP1Qfk5FEdVk7vp4teL8ssgsPPVCZ/A4TVsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCPKV94D8E6CRdaMv+3eVQ7Ud7FRz0+i7jVGALaY9ODXW66pCvG30/dtxwOgBKkjr3D9Rsbp4KS/0CHE4+UHEOHOwShXsNNNirZ3vQSVVRnihmi4ZOPdbrDgKlbFC/tX2+1suGeffMyF7YtpSIpXpDfLCKNFrZP8SwfEGgTSfuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=v2gXf9ef; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fxG4w19QpzyQw;
	Thu, 16 Apr 2026 14:29:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776338976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qo2RUEsEnIYZUwCn69pB4Vhx8drBztzYCjDgMV/Qq0w=;
	b=v2gXf9efxOnP8XM0ja7ZtVva9FyfIhjZRGtJWGfP7ZS4E2ETlYRuCkmGJHaLniVi4moFkB
	+o9wp9Zs9MB/F0/WMqTlcAzh3+tiQHkJrVxFPKhj1imy/0UwOh4TNNj/nzkUjV9IkQhV4l
	KVYowA7KA8imL3CcOoZrKCJKD0r93Ag=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776338976;
	b=g1eAnj03wdJ1RWzroO7w8ii/e///s71CoCK0hp7lRIsY9QOFjshfZri08w1/H7tAIV7gb3
	M0mmC1RQ7Mnfeslk3z37exki9PSGA7FgsO9kq6KX2nT0yYNXuprepqOUJNA2N0KSlPpsJn
	WpqUv7/62y1Lc7zU2JgGNpo7nRxWhB8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776338976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qo2RUEsEnIYZUwCn69pB4Vhx8drBztzYCjDgMV/Qq0w=;
	b=OvRpAv/8f6m+ngpi1oaZnUUwR+SkHB30KU46hnx97Wrd5Hkd4iX192nMaZO/N44jsBGLD7
	X1UewbD9SDAep9D9o0wBnFGTyTBCq+E5fvTiHQ/7bNzZgdqAU0nRW8Bxn1o/KbFkJCP4f3
	z8CjSrEw0K4RthCIg703aO+hbuL5W6A=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id BFC7D634C4E;
	Thu, 16 Apr 2026 14:29:35 +0300 (EEST)
Date: Thu, 16 Apr 2026 14:29:35 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix block comment style in
 circbuf.c
Message-ID: <aeDIH_8wm7UKE5e6@valkosipuli.retiisi.eu>
References: <20260310151620.905-1-rayfraytech@gmail.com>
 <20260310191502.1354-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310191502.1354-1-rayfraytech@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58878-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C624240D6D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oskar,

Thanks for the patch.

On Tue, Mar 10, 2026 at 08:15:02PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Move text from opening '/*' line to a separate continuation line
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  .../media/atomisp/pci/base/circbuf/src/circbuf.c     | 12 ++++++++----

This no longer applies to my atomisp branch
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp>. :-(

-- 
Kind regards,

Sakari Ailus

