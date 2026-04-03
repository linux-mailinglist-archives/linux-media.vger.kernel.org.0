Return-Path: <linux-media+bounces-58037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMPdGsSPz2kzxQYAu9opvQ
	(envelope-from <linux-media+bounces-58037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:00:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D839317C
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EB9930C1A27
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73A539F190;
	Fri,  3 Apr 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gO5Dh0Hx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF33976A1;
	Fri,  3 Apr 2026 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210042; cv=none; b=I1+0yOI5Dfqklt2kVCy6ZksOCTTF1ZfLGU4viCJT1e407PtqTFU1ZxyxG1LcI235gk1w2Z8EmbDnDFcre4IdPiwb2CG1otdCuJ1SB36N1FXMo/W7gQ9UdreDI4U6nl+SERx9T1scijWLuqyuqLcg3xBZY8yQAK/0jpejar0TYiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210042; c=relaxed/simple;
	bh=GBcDq6MRBH4htcoFVRvdauYSrCB8xFIEyUTV87RwPr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUsoqEkTVw4U814SQG55jEcNgKfdlos3Ax56SF2146TUAvfUzgHXQclgMkGMpUF9A0T+v/gDO6Qi+lBFOYUiEC/LR5Q2+ZJPwtm/PYB5+OUtA/pNwMDjiguGQD8NW/Gaee830VMD+8ga+Jka/vaSKDs7WMiSv1QiWpyZ+U91r3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gO5Dh0Hx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1DDC4CEF7;
	Fri,  3 Apr 2026 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775210042;
	bh=GBcDq6MRBH4htcoFVRvdauYSrCB8xFIEyUTV87RwPr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gO5Dh0HxLMNjBBGzLjVaGMbdKOgseqwUADar/JQlhd7sXbREWZB/05FEPlx2acUZS
	 MQMBDpRBf6q2lOk715ptYVjUkTCulDw+pQLTUe+hvx2wwodp2vjWEUd+ZHQSd7UIa8
	 JnWFrGFGoWdEoTOj8JGzchhX8NkQ9LpKPEYU9ZII=
Date: Fri, 3 Apr 2026 11:53:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: atomisp: remove redundant call to
 ia_css_output0_configure()
Message-ID: <2026040327-evacuee-bonfire-a922@gregkh>
References: <20260402183402.444630-1-azpijr@gmail.com>
 <20260402183402.444630-3-azpijr@gmail.com>
 <2026040336-humvee-throwback-72cf@gregkh>
 <ac9864qwMrHuU8Sy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac9864qwMrHuU8Sy@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-58037-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB0D839317C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 11:02:17AM +0200, Jose A. Perez de Azpillaga wrote:
> On Fri, Apr 03, 2026 at 08:42:11AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Apr 02, 2026 at 08:33:45PM +0200, Jose A. Perez de Azpillaga wrote:
> > > The function configure_isp_from_args() contained a duplicate call to
> > > ia_css_output0_configure() using the same output frame index. Remove the
> > > redundant call to simplify the configuration path.
> >
> > Are you sure the hardware doesn't actually need this called twice?  Lots
> > of devices need to be told multiple times what to do in order for it to
> > "stick", hardware is "fun" that way :(
> >
> 
> The concern is valid in general, but ia_css_output0_configure() does not
> write to a hardware register.
> 
> ia_css_configure_output0() writes into binary->mem_params.params[], a
> software-side DMEM parameter buffer in kernel memory. the ISP firmware
> receives these parameters later as a batch, not at the time of the call.
> calling a pure memory write twice with the same pointer and same value
> simply overwrites the same location with identical data, there is no
> hardware interaction that could require repetition.

Ok, great, perhaps put that in the changelog text?

> > Have you tested this?
> >
> 
> as noted in the cover letter, I don't have the hardware to test this.

That's going to make doing code logic changes a bit hard for this
driver, you might want to rethink this :)

thanks,

greg k-h

