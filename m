Return-Path: <linux-media+bounces-56038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGcXK2wyuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:52:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6380A2A84B6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA17C307A650
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7D4371D10;
	Tue, 17 Mar 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jeMR7T/H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A9B279DB3
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744640; cv=none; b=s0xU+osfsROmN1kAr1pjoDGpJvv6m8PXlbwygAafnTNqValMTnxwWWT4pS0HAF3cvMBAdAj3QrSAHyeuMBBCLW02VIQ6iSXogo/LM7mwdWEX4s6bH8Zg3lLAk9YhZ0QPHu0+GZEbu3PakOQS5zxOlK8TF+91cJGYPgui8H6nreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744640; c=relaxed/simple;
	bh=bSpg2XUADlsl67U6YbFfJ/l12GSMyDYnRT2Kq9s9nTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtEGDYvimyuEalFuvXf0YsNJ1RV3w5WzTICFlg4OyeT1Y4/1XoPt1z48c3457vvFKw1uvFe7vDL9t8AT7tb8jAc44i0AF4+t+98OdpG+ZAlNO+qT4LM+6a9qEg+KD3fSNxDEuZrTKhxIC6sACZWoJG1QmvNFqXEKW7gfFWPlG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jeMR7T/H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 56BB3593;
	Tue, 17 Mar 2026 11:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744565;
	bh=bSpg2XUADlsl67U6YbFfJ/l12GSMyDYnRT2Kq9s9nTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeMR7T/HCmOvXUIg9d8kW/EcC10gNOlCEF0LUR2vmbOMDdWFlL43TQPp/0tm2KiJy
	 qorjFvVOmp76zksMBo7VoVgEE44H4fjsSzrp0LvbeNS6eqh/bfBMq9yZYfI0GynSF7
	 OelNY2URRdqgZREznzZ9+lVDWx7AiiJNZb/LEFfY=
Date: Tue, 17 Mar 2026 12:50:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 1/7] Reorder headers alphabetically
Message-ID: <20260317105036.GB302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-2-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56038-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 6380A2A84B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:57:56AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 24a88feddf00..121f0e0272e4 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -26,8 +26,8 @@
>  #include <ctype.h>
>  #include <getopt.h>
>  #include <limits.h>
> -#include <stdio.h>
>  #include <stdint.h>
> +#include <stdio.h>
>  #include <stdlib.h>
>  #include <unistd.h>
>  #include <string.h>

How about you select the whole block and use the sort function of your
favourite text editor ?

-- 
Regards,

Laurent Pinchart

