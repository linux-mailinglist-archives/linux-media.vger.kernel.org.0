Return-Path: <linux-media+bounces-60213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG6MJLHw92kOoQIAu9opvQ
	(envelope-from <linux-media+bounces-60213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:04:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC374B7D93
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BF90300FEE6
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023DF1A9F90;
	Mon,  4 May 2026 01:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hfMrg2KN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B446194C95
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 01:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856673; cv=none; b=QKaSXNCH5g0U97yKQKsPtS6NynwK5GnzWjUwX2c08u7+KhdGIZJqnN7N412HpwqqgBHmBknf4XFll9U73HBWkFzFitR37GuDCRJHRCqWNNuV33fasl1Nw/2tUUddvJmof1axIYV1SLqTUZeYE4+ko9721cbQgWlhd02aMzXkUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856673; c=relaxed/simple;
	bh=VOImGagwUv6VjbT83gC82BU3DmJGdg7wni+ROUxXYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c686jB029AYeJ9asrkHaiJObslSryjSaBjBGW7NJyjBw1wuhm34ittcaaRKKMi9RCFJ4ZO7x9xmGFHwJt1M4RLu45O+j1KVZNP/+elDY7eQUMXAoBe+z4c81vmXRC5UeZuNsg+U/+uy2ro+QrJvZaQ+apQDaUr95sXn1la3n/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hfMrg2KN; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b701756684so10523836d6.1
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777856671; x=1778461471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/sDH7zw22iV9/mg6xQgSxNHz0ndZ1t21cOLtIAurYw=;
        b=hfMrg2KNOjlVt+0mTgpjuxi4QpH10fwvxVux3eVAbxj9g/6dFAPnwC57yOtTh5Czea
         Q3K5Zuek9RVe3VP7ELK6nw5H4cGydY4IzL8a4xGVHgNOQsi1A/QmQauKEpi6j9mlMuov
         xkuOSrmKUmVVJ4C25Ef6377eILWk7bVJtAgCIXN5RFg5T1Cw0uSTgDaizPZua9pQ91YE
         M/+w9f17MJghnws2haHnqV0l1nA+AvqaikkAzc5SD+kbyVffOhnjERceZu4oFVhJeA6/
         HWU7eWsWBe7DaIHqRlp5y2lXHd9P1X3iCmOLvgk4xTGvzZ0yqlTbkgLHGDq2JQxYmHbv
         /bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777856671; x=1778461471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/sDH7zw22iV9/mg6xQgSxNHz0ndZ1t21cOLtIAurYw=;
        b=JPSoPpXdXnmfgum0yHB0GYMjhCTL5fL3rWy+uuPKCbaBwjROQnFFrv0W+IF7UilU0I
         HnlDaUz8WPJZT4yqPvttzUaQ6Yc2gcSU5Iva+CttC9js+ilz59SnRJo1vgt1ffpzbeLl
         znUDF6EJW/h7gRrvgjkUnWFWZk3GsZkLU0MSbxezMCg7dvckR2wp+Kvj/ILdOEDN+KhJ
         c6/kp1aJvGns3oM/0ymtR7ctom0Cn7AVAZPohlHDUi0StePQVkBmWIRW65QuEEd4rM84
         +rMSmtypsb7ps6mwArF44rxt/Hvxkp/0EMn552ZU42Z9E/suzWXTmnfr5HsWyuO/ZnEO
         blbA==
X-Forwarded-Encrypted: i=1; AFNElJ+wrKQXT256S1VhdXyRGhGlL/iOxipmIcmyjKX2J8A1mpR+30eDHKNzNbZcOOBnJ0GixnkRT7q7J7MkIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbVOZ0j+bogxeoYl4CG4iX865s1TVzIscsxBBOFmX14ydj8L0
	aQCqnMPe8a0lrL4APLP1633Q+JJikj+8R0p7ef9cNkX56wM1yg2x7KH42UmnxBSiK7KXzG+v+XU
	ALBw=
X-Gm-Gg: AeBDieual2JG+PbPJWhxg4fKfVKYMLwCpq9cPArebqss8JG+bCgji41gqZTiyqZiJDt
	4Lj0RU+906oO2QhkeMH1RILp4DO6r1DrYr3m2G+rRzBExi3DqV3xHxVnXQSo8j5/g/VLchcXm/B
	Ll3Dx2HN62GmY26fP9zlQudlYOsGAex91ZcaGXJLrs/FE7HAtroBWodcNHiKrnXGpl72FhG5FlE
	vIaYzdHtMumU4gOmShV80OQvZo2vXI3Ye76MYErXgFsBu1zUKy3QZfHdrZp/n8wCPSYn5N4jrZM
	elA8GtTHkuCEQaXxqAOSBwsUhMeymfiG2wFGGfjIZD5PwnVS4nrPnHIQlxvCFUCRHHx9La+LvNs
	vKoZbsGdINYZgnG3vOfeMj6GIYPV2m+Af9ofRb5+den/UoVT8jpaDBKHHhh8RR9bVfLTWhaVOzn
	KEe8WllcLspwPhXxvDQXsNpnKeme8zQq4JajRdLkpCrED1Cw==
X-Received: by 2002:a05:6214:f25:b0:89c:867b:a9bb with SMTP id 6a1803df08f44-8b4000806b4mr210752936d6.18.1777856670918;
        Sun, 03 May 2026 18:04:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d35787esm101254086d6.44.2026.05.03.18.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 18:04:30 -0700 (PDT)
Date: Sun, 3 May 2026 21:04:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hansg@kernel.org,
	mchehab@kernel.org, pavel@kernel.org, lenb@kernel.org,
	kernel@uniontech.com
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
Message-ID: <aac4e77f-bca4-41e8-a0d2-608d66a25c14@rowland.harvard.edu>
References: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
 <20260430021433.2083281-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430021433.2083281-1-tuhaowen@uniontech.com>
X-Rspamd-Queue-Id: DFC374B7D93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-60213-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Thu, Apr 30, 2026 at 10:14:33AM +0800, Haowen Tu wrote:
> So the real issue I wanted to ask about is closer to this:
> 
>   during hibernation image writeout, should PM resume all previously
>   frozen devices, or is there any room for a more minimal resume of only
>   the devices required for writeout and their dependencies?
> 
> If writeout succeeds, the system will power off afterward, which made me
> wonder whether every previously frozen device must be resumed at that
> stage in the same way it would be for ordinary recovery. If not,
> avoiding unnecessary resume work in that phase might also reduce the
> time spent before final poweroff, although I do not have measurements
> for that. On the other hand, if writeout fails, the system needs to
> continue running, so the remaining devices would still have to be
> recovered correctly. I agree that this failure path makes the problem
> much more subtle than I described in the RFC.
> 
> I also agree with Oliver's point that this cannot be expressed as
> "storage devices only". In practice, any such approach would need to
> account for dependencies and for other classes of devices that may still
> matter during the writeout phase.
> 
> So at this point I am no longer trying to argue for a USB-specific
> interface change. Instead, I am trying to understand whether this is a
> valid PM/hibernate design question at all, namely whether the writeout
> phase should conceptually be treated as:
> 
>   1. a full THAW of the suspended system, as it is today, or
>   2. potentially a narrower resume of only the devices needed for
>      writeout, followed by broader recovery only if writeout fails.
> 
> I do not have a concrete implementation in mind yet, and I am not sure
> whether such an approach would even fit well with the current PM core
> model. I first wanted to check whether this is considered a valid
> problem to discuss.
> 
> If the answer is that the current full-THAW behavior is simply the
> intended model, that is also useful for me. In that case, I should not
> treat the UVC behavior as evidence of a missing USB-side mechanism.

As I understand it, the system works the way it currently does because 
there was no good way to tell which devices needed to be powered up for 
storing the memory image.  It's not just the storage device itself, but 
all the other things it depends on, some of which might not be its 
ancestors in the device tree.

By far, the simplest and most reliable solution was to just power 
everything up.

Alan Stern

