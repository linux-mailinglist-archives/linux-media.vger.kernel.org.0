Return-Path: <linux-media+bounces-60054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENuTIVcX82llxAEAu9opvQ
	(envelope-from <linux-media+bounces-60054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:48:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76449F664
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 10:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BEDC306998F
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9153FE655;
	Thu, 30 Apr 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbIqxkkO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009CA2F90E0;
	Thu, 30 Apr 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538592; cv=none; b=GablecFgmk9H1BWt3CftpaUknTGNP3CkHkZpczuA2ccw61SFVBOyT//tSy6RtAV5cXkmv6NKvj8bbnLgrG1vO/SpicaCJIo3X866AQYTjXfcZGECFwAPYnLVPCz5Zt6JQJadVY3Pj5AGtayq6m9q/lr1J7MLIadbFOY6V1A0xTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538592; c=relaxed/simple;
	bh=52HsSiGsNpe2LP7wLMQWE+XflP5jXm7StwSJB5aTTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFaBHvkTI9LZ3wHq8NIUGCdG3YYS/Bm6LE/RQf9/f1qaOwwCnlG4RJCoFJSBhiQ2ChzKxoCDkzORa5K8qiSxpkm/Hb/Of/Jw0EMI/lI7BiLQ9RuHOtv/T7/qXgrKUjpgoT/5yDbmIzkZURHNCLPFncy4C9nD8XYbNBYjwfiVsfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbIqxkkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D20FC2BCB3;
	Thu, 30 Apr 2026 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538591;
	bh=52HsSiGsNpe2LP7wLMQWE+XflP5jXm7StwSJB5aTTfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbIqxkkORtkMKsmMT5q0baGSu/6MHtJCcBtC8TZgpAyfIwMzS+1a3cHBLLps4YLfJ
	 JtwV7ZFLOiFbDvvzkvYKbnbXiD2YuKMuJMoq7pwWj4sPD+oZAdXpZe1+8DJNX0fBhQ
	 20NndY/teOL8+JT0vbxicvXk9Yv7wbTfTHORIeMu/knvXjJ6AE6/oza9v3+aoZXFmd
	 D9ddKH+pHGzMDHYsGyoIkOmsRCV2wtWt0oV2zSaCtF9752OVKpAMRCepTUes2TWHTU
	 JV85vJGVczhb4YoR5Zl+kKMod7JjbCkq4bmhjpgChNJ0S/9sgD8o2lDDZiPe7pdQBm
	 M/hElfoxlo9mg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMzF-00000000vT9-1AJT;
	Thu, 30 Apr 2026 10:43:09 +0200
Date: Thu, 30 Apr 2026 10:43:09 +0200
From: Johan Hovold <johan@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] media: vpif_capture: fix OF node reference imbalance
Message-ID: <afMWHXQfqrppkdOa@hovoldconsulting.com>
References: <20260407100831.2635227-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407100831.2635227-1-johan@kernel.org>
X-Rspamd-Queue-Id: 1E76449F664
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60054-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 07, 2026 at 12:08:31PM +0200, Johan Hovold wrote:
> The driver reuses the OF node of the parent device but fails to take
> another reference to balance the one dropped by the platform bus code
> when unbinding the parent and releasing the child devices.
> 
> Fix this by using the intended helper for reusing OF nodes.
> 
> Fixes: 4a5f8ae50b66 ("[media] davinci: vpif_capture: get subdevs from DT when available")
> Cc: stable@vger.kernel.org	# 4.13
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Can this one be picked up now?

Also here there was some invalid complaint from the media CI bot so just
want to make sure it has not been silently rejected.

Johan

