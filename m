Return-Path: <linux-media+bounces-54936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIKUIoChrmkLHAIAu9opvQ
	(envelope-from <linux-media+bounces-54936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 11:31:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B060D2371DC
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 11:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D5CA300C362
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 10:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D1739020F;
	Mon,  9 Mar 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6j5855B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A615F355F49;
	Mon,  9 Mar 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052276; cv=none; b=H8ptGMb8X9EKD/OtnvhRFHYRVdJVyvcs1akpv2KWKd4jnlkAhy/wpYocjZmr/R2f8MEYyVVd/GvF/YiO4wcNIfM7eI4kR/EJW4KnLmmAN0YeX7QzppcqhfTNH98qffI86bg+pHRIcMr1WfeECl7+YGOUjdBsf86qHxGZdcieB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052276; c=relaxed/simple;
	bh=1dv+XhP5OwvToCXeXxaL6H6crc5uBccvLhwiXF5Big4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNim2o9bX0/pd2/5863OmoaNSW16uYNmj7gpxElNmkDQTOVy52USDBzywdGYZDAWYZj5foukyskdmjpQVzu7rrt1gtNXRu5oSfVssMbJnMcPw8QlRn+aCag0CwH1K7qeicODI2UgKCu2EgG1rlbdR6Mnt8kYYGssWEfLVe+buN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6j5855B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FDCC4CEF7;
	Mon,  9 Mar 2026 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052276;
	bh=1dv+XhP5OwvToCXeXxaL6H6crc5uBccvLhwiXF5Big4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6j5855B86hH8+1MUUbQdzfRXXIEh36roQzDmNtZdLVlt+VtMSp7FWhuEC7HxLg+4
	 3ASrEfhKmLdpAm/VP1gGb5GQPHRZyzlA9Wv0XEN1P9t9gflLXWiWM6s0bOGH7yvuC+
	 bzFzU3sZ14p5clqbm5EJMcExCvTp6B+pn4mlEtyJ/vArl5P4gUHyApQeDYt0UIVnjD
	 fa5DgkOvoLJmWeP1nzIlE2PZbnVc5lUB/zjgDz6l71LVoy9/1JqpjV41i5czOq4RpO
	 WHnzI5JOAaJobCwW4FNmaOORDUiIpodIFsZfZXzTtQ7X18XgT4XUH6FBc26i7cEHtL
	 xVdATdgxh1BHQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vzXtJ-000000006A5-3p2H;
	Mon, 09 Mar 2026 11:31:13 +0100
Date: Mon, 9 Mar 2026 11:31:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aa6hcT7MROZqxF1j@hovoldconsulting.com>
References: <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
 <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
X-Rspamd-Queue-Id: B060D2371DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54936-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 06:34:43PM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 6, 2026 at 4:39 PM Johan Hovold <johan@kernel.org> wrote:

> > You have posted changes that will prevent driver from accessing the
> > struct device of core i2c structures. This is unexpected, non-idiomatic
> > and subsystem specific and therefore a bad idea.
> 
> That's not true, the changes provide a helper to that end.

That was supposed to say "prevent drivers from accessing the struct
device *directly*".

> > Again, this is a core feature of the driver model. You can't just ignore
> > it and come up with random ways to work around just because you disagree
> > with design decisions that were made 25 years ago.
> 
> It absolutely *can* be done differently. There's nothing that imposes
> a certain API design on susbsystems. If you design the subsystem code
> well, provider drivers don't need more than one reference (taken in
> probe(), released in remove(), for instance via the
> register()/unregister() pair) so the counting can be hidden within the
> subsystems that control them.

Yes, there is nothing preventing you from diverting from the idiomatic
way of doing things. But my point is that that's not a good idea.

Johan

