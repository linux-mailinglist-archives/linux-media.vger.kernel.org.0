Return-Path: <linux-media+bounces-53090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPaEBef6lmmbtAIAu9opvQ
	(envelope-from <linux-media+bounces-53090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 12:58:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B617315E755
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 12:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9BAB30185E7
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8816233A70E;
	Thu, 19 Feb 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0vvmDVnY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BB27EFE9;
	Thu, 19 Feb 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771502296; cv=none; b=hALEsmY2AE72Xyz+EbnBiLN6GC+KpA9gfKhl6B9oeB/haDiZU81UeqvXTHyBqwROUMvPf+7slA3Zik9Hu3PnJ8u5Ieh0bKjjWds8VCPybChI0AO04/oB2uc+oYPKatmzwWcmkf6W9pi+8S2wNsW+5mioA2QlU/88p3AI1NdgrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771502296; c=relaxed/simple;
	bh=IiQuLfoGHRkM0JIlUCTvVWYJ5NioA6NvgyZT6wtXrCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvH0O+sE01srWc3pT4ydH3qZLrCOatw9xrMdlOhYsP+xc67tWnBjCdLNFcHcOse4o64ZmQRTWMnGDwx66aeBCr6mIMqSkTjvIcdnr1wxHJoeL2MX2tvv8qlYGPJ3tWMT4xU61cX0zNBlB6Sa+PHhjOq6ZcHW+Nm3iWnjKVb0M+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0vvmDVnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F60C4CEF7;
	Thu, 19 Feb 2026 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771502295;
	bh=IiQuLfoGHRkM0JIlUCTvVWYJ5NioA6NvgyZT6wtXrCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0vvmDVnYjPuuCCt7ily0OPA1OMl1f/opjhND+9PnVSNghoAUsNe26SMAFTyZN82GZ
	 4RM5pUfu7u6/xXbZkLEQ3lyHgnfir/+qHLFRXMxIeIvpFTbq5ABiW1lWIUrzCNfeRA
	 EyzVg+BxRrSIYgmSmdNMzJm3Oto1SRDSIaieXBGs=
Date: Thu, 19 Feb 2026 12:58:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: andy@kernel.org, dave.hansen@linux.intel.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, tony.luck@intel.com
Subject: Re: [PATCH v5] staging: media: atomisp: Fix typos and formatting in
 headers
Message-ID: <2026021900-tarantula-unturned-1ab2@gregkh>
References: <20260209162026.18907-1-hamdankhan212@gmail.com>
 <20260219114849.12675-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219114849.12675-1-hamdankhan212@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53090-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B617315E755
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 04:48:48PM +0500, Hamdan Khan wrote:
> Hi,
> 
> Gentle ping on this patch.
> Please let me know if any additional changes are required from my side.

Sorry, but I do not see any context here as to what patch you are
replying to.  Which one is it?

Also, remember that this is the middle of the merge window, no
maintainer can take new stuff like this until after -rc1 is out.  And
even then, stuff like this goes down the list compared to bugfixes and
new features.  There is no rush here, patches will be reviewed in time.

thanks,

greg k-h

