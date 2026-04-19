Return-Path: <linux-media+bounces-59089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F2PBhhq5GmdVAEAu9opvQ
	(envelope-from <linux-media+bounces-59089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 07:37:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265F4232E3
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 07:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E47AE301B933
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 05:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B808A3783C1;
	Sun, 19 Apr 2026 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f1KG8Xct"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6F1474CC;
	Sun, 19 Apr 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776577037; cv=none; b=VMnV5pbPHiy1ae2QERgi3GCodQmYmLapFGmTeav4l40mRG1m1WHEBrOHLfUBpKcse1TDQ230iXCASshNNRwMXXL3OtJNPNHWRGHplHTnJ18KDDGWCBEEMMB6w+vrnh2z4vdqiDQTCRR9+pHNzW3sMs6J/s9v8+JGVQYGDOjptDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776577037; c=relaxed/simple;
	bh=YzsUAxmLeaA7FMi3VIhTRq538h8AOOJ03Hw/sBu2uco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEmmuNM5yazHB3RDtCgSDj7S2yXbOFHJETACH8liY643igd/KFUvGH2qE95M+qV2y7+iqGoj4LbjSmIe3zSEwpWddFttXvOrMTgBlbsSNze7XPAfHr0QgImNvpSMO5rFtLpOnO3+M1QYgutwfpZTdtk4lc29KBcwVl1hUNdyQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f1KG8Xct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFEAC2BCAF;
	Sun, 19 Apr 2026 05:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776577036;
	bh=YzsUAxmLeaA7FMi3VIhTRq538h8AOOJ03Hw/sBu2uco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1KG8XctP57+RZjIHQfIT1h5tfr6WwRnh4lrlcxSOR114C32BngiahN446Qnm6b6Z
	 RpIm+5s4VTo5UfSqHAdEOrB6/WPmYp9eEBaWRvd2NSIk1XSflkNFrk+KOidjWQTFGe
	 XZVKu6lcIk6JT5fysr3e5eY1filVvG9GmS0m25xM=
Date: Sun, 19 Apr 2026 07:37:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Mast <rn.mast@zonnet.nl>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	andy@kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/1] media: atomisp: mt9m114: Graceful teardown
 atomisp and mt9m114
Message-ID: <2026041943-country-hummus-8321@gregkh>
References: <20260418103136.6911-1-rn.mast@zonnet.nl>
 <20260418103136.6911-2-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418103136.6911-2-rn.mast@zonnet.nl>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59089-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[zonnet.nl];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6265F4232E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 12:31:09PM +0200, Robert Mast wrote:
> Signed-off-by: Robert Mast <rn.mast@zonnet.nl>
> ---
>  drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
>  3 files changed, 110 insertions(+), 12 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

