Return-Path: <linux-media+bounces-66095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlgdC8y/Q2rsgQoAu9opvQ
	(envelope-from <linux-media+bounces-66095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:08:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79A6E4A16
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:08:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=RwHev5pC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66095-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66095-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3108030B0A26
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42491423160;
	Tue, 30 Jun 2026 12:57:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0F40FDAD
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:57:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824224; cv=none; b=XVcvpiHTK+s+nReUrA2k0bc0oITenhcGRqj8YWeqf09XvDYsXCJ5bcJEGnQ7lcwWkTjJdVzYn4wsBWOyAuzYRrH8JwoIb7JE/RimusR9shKqu0xIL4j5CEQ3Kbrl7nfQdBqlf/K3C85YGRNtmlZQnCGeagva3Z/VeUMdzwAi3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824224; c=relaxed/simple;
	bh=DurPfWfOrzcUnhai1J4LDljrBA3SVAHilhrswv0Daq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDq6xMZ1JRhqzuNu+nuVYbY1zZcYLqEPCFnCylW40qVtu+eeYvuR2aml3ewfcVzkhl1b1L8RYZoq6/AGccahrL9ynKfLtSyAScdokNjT71NlwF3cgXGhSafIINtLUe42RjMv44jU6fIFZ/265ShUPusjHlSboUwtl/DndfXzPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwHev5pC; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782824224; x=1814360224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DurPfWfOrzcUnhai1J4LDljrBA3SVAHilhrswv0Daq4=;
  b=RwHev5pCkuWdmRyhOlHpZ9lnHCYCGMvrGQWjoijgXBbKEXfQRvkRxr5s
   LGXX5/WhU9WRU1fJHQPOBDBlYE1pq+G8RNi5aZ4+/2+Gsgrq/csQiEKYN
   yeeLGAhETW3H8vxlk+VGy9U7EcI8xwAvst9oDpQZVob5b2EPWXspcfnEJ
   0DidM5v3bkM7AcYH5LrfvzlELwb3ze08Q6pwL6CBFqsxGt4P6k9jiUSza
   3NHexDUjI/nSWGbH/bghiEViNwfkt1iB9UEGvAz4mkR3J59GjqZG6Q6V8
   0Pfaawwl+r0iv3KJKM4ZxmGZ6ZPf63a1duFFfwmDFV766NtCmuxHVwHP/
   A==;
X-CSE-ConnectionGUID: KTm5r7l9QWSIwfu5Ob1XVg==
X-CSE-MsgGUID: K6ADVBnPQ2SpiXRidyPAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93892182"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="93892182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:57:03 -0700
X-CSE-ConnectionGUID: k2EYKzaFSFSYkNs7rqdSVg==
X-CSE-MsgGUID: AVyCGOp0QaunnwgWX6ZbYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="254166013"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.116])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:57:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 99D48121C13;
	Tue, 30 Jun 2026 15:57:02 +0300 (EEST)
Date: Tue, 30 Jun 2026 15:57:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: Re: [PATCHv3 5/6] media: em28xx: dev_info->pr_info since dev has
 been freed
Message-ID: <akO9Hoe-2nYjVY7c@kekkonen.localdomain>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <6a8b16c4ba53cf18f2f175313ccbcb2c3aad786f.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8b16c4ba53cf18f2f175313ccbcb2c3aad786f.1782716154.git.hverkuil+cisco@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66095-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F79A6E4A16

Hi Hans,

On Mon, Jun 29, 2026 at 08:55:53AM +0200, Hans Verkuil wrote:
> In em28xx_free_device() dev_info passed &dev->intf->dev,
> but that device can be freed already.
> 
> Just use pr_info instead.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index fbfb74eab475..4d1e48c86ce8 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -3758,7 +3758,7 @@ void em28xx_free_device(struct kref *ref)
>  {
>  	struct em28xx *dev = kref_to_dev(ref);
>  
> -	dev_info(&dev->intf->dev, "Freeing device\n");
> +	pr_info("%s: Freeing device\n", dev->name);

Is there a need to print anything at this point? I'd use pr_debug() here,
if not nothing at all.

>  
>  	if (!dev->disconnected)
>  		em28xx_release_resources(dev);

-- 
Kind regards,

Sakari Ailus

