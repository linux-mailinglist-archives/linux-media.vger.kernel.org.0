Return-Path: <linux-media+bounces-59978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMMcJTYV8mljnwEAu9opvQ
	(envelope-from <linux-media+bounces-59978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:27:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782A495B35
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 364C730F134A
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB932ED3A;
	Wed, 29 Apr 2026 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AMLKS52z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B33148D2
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472485; cv=none; b=Y9XoyF+4lyjKzYhmepSvMXdq0ieFe6r9ZWYEKrVNK+r91YuoM4qURlezQCNzZc4c0q77qtQdVjuxVisjj5xuPmhau84A3R+m1AsSmPX9LRjvjMRYZOqCE8ph40krNyagH9DtsE/PBjHRYuJW8fDpMEQbffN34XCaZ+Qmc9mwLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472485; c=relaxed/simple;
	bh=kbxhMNJkZZbu7nKlsOnBfvstA5xuGbuqHRD/L7OXM7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrmeQMiBAOarnQED7Qr3OZ+n5lSGoUCbt6y0+R8Dhib61SMnAJliRREF/17EWwjj2mKJhdj8wg8+UV59EofULA3trtjMcmhD7UCxUSAxyc081ZiLTHc27NGUe+satovGJHLjvfI6kjkDY8gpLmy71JAlLffPAirj+vY8DZCpObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AMLKS52z; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a58057d7baso145324956d6.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777472482; x=1778077282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XiEzXlfXmI/3llZ2UFTHL2tqoNvlwiBItsKsnE3usGs=;
        b=AMLKS52z0zT8Z1Sb8ZsaffrmG7QXGVOKkH4iY40UlxemSku0Irp1I8mfw+aUm+d1up
         ZGHtN3Iayl48drccemcRFgEmQJGU/74OGqR5be6ARKqq98cxT0qerQ2qm+tC0Ay+TQli
         mOgI+MC4mZyUCA+4u0hyK+SfEBY+ogsDQH3ffPQyKT+21gIdoKjh0umibJLHwFiqwfnT
         je4V7+K+Xzm1AIwOCwLxs2aEC5KOc2YXVNGCVEDzOxBJKKW+SKyajlUEYeUliwhqszMq
         3F/u0NX07NDNLQd5CLzkkGHTKCvPs6Fb4p0okXvVvv7TDxTmbaOnOwP1TtzCe1sPERNA
         aX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472482; x=1778077282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiEzXlfXmI/3llZ2UFTHL2tqoNvlwiBItsKsnE3usGs=;
        b=gJSC72qod0QbwBGyQbRqT8xixAfPmqoZxPvjJRO+/819qHZM5wjcgzTASN8NnMlE4i
         101aaE74fECpvj2eJnUYR3ku9rx57lxMfZRDlg27kbW7mklHEBlqUGjIUfgObRIUPI93
         ZwF2OrrZKC3Opxf0xbG3oSpOCKwHZX3u6nzqBrpWKhBhGBuCOr9EghDNdlPyuwlKRM6q
         Ka1Fz2RkA0MMaaU5sLSBJaFAavI4ehpgje0DfbZLcxytNBJn4EN3m3XExJZylft3xLAV
         oOB0G1oqOzL5fHiN0qMRYGs9PO575PitdJD0A7wSaORRFX9eRTCKKWemFHROT/JJmBTz
         nBww==
X-Forwarded-Encrypted: i=1; AFNElJ+4iN6eHPIyWXX3pE3LPqocmiLxauNIxaeJ5OZq46NyaXB93KsVCMKs0+Kr+3Fh2puCWhrzgxLltOiA8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1RmkgJVtKHTzU24ji9wW7WcHllf0P2jBtdX9jpS2G9ORxKvD
	SUMLU466KMUfmqbKUd4N/lPYtPTsoyZ1zgQvJ2pjT4v8iKKb+LgQamHm6CAEVGnPsA==
X-Gm-Gg: AeBDietLrdN+F33jFRjIYz95cKDubpQliRslwWs0XpsSlY64v1pu2JQ3x2XcjkZWeCK
	8X8+oYXEl34pCQsBKdx161+6by105T7Q89KNFztxFGuTNrMJ+QOZiLowEUluQ90N2MD3i89t6H6
	RBD/g9tI96uQo9fxABcDPGU0Zz5DqVhNrXHhM98mHSjohzhdPu+ALZ8tADI8vtV7JukdB9sQgSV
	U1FtAF/4ojl/WBKhnAZh84u/3kefQmzGwuOzcH4rh/q55oqyufvLN5+ZPE6w3+nVpSEXkNKDJk2
	gwIeSycZ7kxE68jQ0rl5Yv/JMhhOQg01vV+rWVbFLqIR9+aPooDlxydj2asrAFyn7EI5QcKn2R9
	rS3dU81PPpZL6sN2Bf/JtcKBCsC/P4c9CBpA8vdzhrimLih1w0KUGjDR6NOda/+Ln9eWDmJbwr0
	Ih4qQ/OXFoTffwd/rlxOe1OUUFBVJ3aLQcvqS1IbLiyM9heaxkdvC5
X-Received: by 2002:a05:6214:252c:b0:8ac:74f5:fbaf with SMTP id 6a1803df08f44-8b3e31b8f6emr123930466d6.51.1777472481789;
        Wed, 29 Apr 2026 07:21:21 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ea763sm19052026d6.24.2026.04.29.07.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:21:21 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:21:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hansg@kernel.org,
	mchehab@kernel.org, pavel@kernel.org, lenb@kernel.org,
	oneukum@suse.com, kernel@uniontech.com
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
Message-ID: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
References: <20260429033617.1954257-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429033617.1954257-1-tuhaowen@uniontech.com>
X-Rspamd-Queue-Id: 2782A495B35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59978-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

On Wed, Apr 29, 2026 at 11:36:17AM +0800, Haowen Tu wrote:
> Hi,
> 
> I'm looking for feedback on a USB/PM design question that came up while
> investigating a UVC hibernation issue.
> 
> In the hibernation flow, after the memory snapshot has been created, the
> kernel briefly resumes devices in order to write the image to storage.
> On the successful hibernation path, the system is then powered off. For
> a USB camera that was actively streaming before hibernation, this means
> the USB resume path runs during that intermediate THAW phase, even
> though the final RESTORE path has not happened yet.
> 
> From the driver's point of view, that THAW phase is not semantically the
> same as the later RESTORE path after booting from the image.
> 
> The difficulty is that USB interface drivers currently get
> 
>     int (*suspend)(struct usb_interface *intf, pm_message_t message);
> 
> but resume-side callbacks are only
> 
>     int (*resume)(struct usb_interface *intf);
>     int (*reset_resume)(struct usb_interface *intf);
> 
> so by the time a USB interface driver's resume path runs, it has no
> direct way to distinguish a hibernation image-write THAW from the later
> RESTORE path.
> 
> The immediate trigger here is UVC, where resuming the streaming path
> during that THAW phase can turn the camera LED back on and cause other
> visible device activity even though the system is about to power off.

You don't know that.  As Oliver pointed out, if writing out the system's 
hibernation image fails, the system will not power off.

And anyway, what's wrong with turning the camera LED back on and 
performing other visible device activity during the THAW phase of 
hibernation?  If it helps, don't think of this as momentarily resuming 
activity during a shutdown -- instead think of the preceding FREEZE 
phase as momentarily pausing all activity while the system is still 
running.

Note that during the FREEZE phase, devices are not required to go to 
low power, just to stop transferring data.  It would be okay to leave 
the LED on during the FREEZE.

> More generally, review feedback on that patch was that solving this in
> individual leaf drivers would not scale well if other USB interface
> drivers ever need similar behavior.

It's not clear to me that anything needs to be solved.

> So the question is whether USB interface drivers should be able to
> distinguish these two phases, and if so, what the right interface would
> be.
> 
> Possible directions could include:
> 
>   1. Exposing the phase distinction to USB interface drivers
>   2. Handling it inside usbcore
>   3. Adding a USB-specific callback or other mechanism for this
>      transition
> 
> I'm intentionally not proposing a concrete API in this RFC yet. I'd
> first like to understand whether this should be considered a real USB PM
> interface issue, and if so, which direction would be the least
> intrusive and most maintainable.

Before anything gets changed, you should provide a good justification 
for changing it.

Alan Stern

