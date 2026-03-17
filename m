Return-Path: <linux-media+bounces-56044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBt1NMEzuWnpugEAu9opvQ
	(envelope-from <linux-media+bounces-56044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:58:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 133022A85E5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722403035240
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78D43A1E8C;
	Tue, 17 Mar 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nnEa+te3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFA37C0F9
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745074; cv=none; b=tzcL7bpjB4qaIa0x5WqI6D18r/OPmeC6a0WsdWMxTjUDNVVLic8/TM/1d/nkPFfLf8frOEBfsbQUeE58isRnfsP+yZPZ3gtpK4JP+FH+4UEClmarLLtdQiX9bbiXqr6Eo6zKUulN3ux4/ItE06JJPeiaHguiGof+n/JwwbJLePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745074; c=relaxed/simple;
	bh=1bMJuMBJJhL47u2lyL1Z6DcjHIi14k3lmMlT6iLCpzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3ERoIR4tKbVil899FG1XMJA4u8YNMhyzpHw6NjfVBvttVud3f+lGmPjTCD+UZNJ2XZMV5iWJ5iZnsySUQ4WWY8ih9EklQhAMZgL2gt7aecn7UAiaQB8WhGPDGYA1ek8js9maO5AUQ8M2mtO4cJA/jkL7GxC97Z0ri9dYHna8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nnEa+te3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA3EC308;
	Tue, 17 Mar 2026 11:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744999;
	bh=1bMJuMBJJhL47u2lyL1Z6DcjHIi14k3lmMlT6iLCpzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnEa+te3+XiO0aYaOz2unt+S5grLgAhHA3VW/LAF9eeN0AKd0g1dPzrQHKYwEwLj8
	 8BAhblRJubPGWDjt9768oHiw4VKXGDquzE+o9YiLbb6O1drS56JrswSH2VPbofMPKl
	 OxAaotHFl+1Xk0g/2cM0I55z5f72pRRzX5W7/ypc=
Date: Tue, 17 Mar 2026 12:57:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 7/7] Fix file size check
Message-ID: <20260317105750.GH302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-8-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56044-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 133022A85E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:58:02AM +0200, Sakari Ailus wrote:
> The file size was unintentionally multiplied by 8 and that's not right
> anymore due to changes elsewhere.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: 578f7012a851 ("Improve input validation")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 3b92c6ba519b..49b8071b299e 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -187,7 +187,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
>  	if (file_size % *height == 0) {
>  		padding = file_size / *height - line_length;
>  		printf("%u padding bytes detected at end of line\n", padding);
> -	} else if ((file_size * 8) % (line_length * *height) != 0) {
> +	} else if (file_size % (line_length * *height) != 0) {
>  		printf("warning: input size not multiple of frame size\n");
>  	}
>  

-- 
Regards,

Laurent Pinchart

