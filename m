Return-Path: <linux-media+bounces-52383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPptAgmbiWkv/gQAu9opvQ
	(envelope-from <linux-media+bounces-52383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:30:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6D10CF97
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 09:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E733E300442C
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 08:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FC130AABC;
	Mon,  9 Feb 2026 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YvojBuct"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6F73090FF;
	Mon,  9 Feb 2026 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625791; cv=none; b=Pp8A/UIvMxohZqS1J42jyYbjM9sMhsQ2pF6u5g2m28wPrgh6TBdSaqJAjpF0/xe2cs+w8bdCSZ0HD/Bi711sIwCFJBVgGSkmw/XDBdmr2SetRTv784aJi2rmCfRwBlCi40kdoot4IN3G2zQgjIoXzE6ymo29Xj1odonRbsiBYTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625791; c=relaxed/simple;
	bh=KEW9ZyawuEcJHHJSBcfkhRj9adAaSrMS+6kLvS5R2TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnTftV56KIZ0ImFLH65yBrizWSxmAQy+XoeDJINyefEHiUmTPOhYB7mnU7lRwcqXhz+qvTAfIYMkvgcS7E9GlqsqhHJ4p9DPChvv+XbwS6E9y7rOBXdZngrtbgzWwzAOVVKPuH5Bn/fItJXMgPxEMZOv9a7m/CZA54BHmL6opLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YvojBuct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906BDC19422;
	Mon,  9 Feb 2026 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770625791;
	bh=KEW9ZyawuEcJHHJSBcfkhRj9adAaSrMS+6kLvS5R2TM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvojBuctqiqvdBUnV/cScGdahaT5XG1ZMVSD+ekqxjrgNaEcu+IVZNArtcQrXPF2v
	 zubFBJzwb6cG9KxKaGjH1jAXZOOiozH+5NhKfLjVnQqG9gQL2tXhMVgygwdhZBvF3S
	 Rrky3dyOufzBcPxD2eyuIIMgTH0AikKytbo45d+s=
Date: Mon, 9 Feb 2026 09:29:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: toast1599 <swizzguy76@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata
 support
Message-ID: <2026020923-faucet-mannish-622b@gregkh>
References: <20260209081025.100080-1-swizzguy76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209081025.100080-1-swizzguy76@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52383-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26F6D10CF97
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 01:40:25PM +0530, toast1599 wrote:
> Clean up the IPU7 ISYS driver to meet mainline requirements:
> - Remove 'U' suffixes from register definitions and hex values.
> - Refactor CSI2 PHY to use a hardware variant structure.
> - Correct typos and standardize header guards in firmware ABI.
> - Enable V4L2_CAP_META_CAPTURE and update format loop to allow metadata.
> - Modernize logging by replacing pr_* with dev_* macros.
> 
> Signed-off-by: toast1599 <swizzguy76@gmail.com>


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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

