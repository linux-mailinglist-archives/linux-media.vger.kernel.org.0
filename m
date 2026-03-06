Return-Path: <linux-media+bounces-54808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mERcIan6qmmcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:02:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 867242247AE
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB20A309EF7F
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A503E51F9;
	Fri,  6 Mar 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWpu2YpT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F68286A4;
	Fri,  6 Mar 2026 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812209; cv=none; b=M5bZ+X045z3Z4+D5fJ760eR05IAFQkNlPHh1oXbNh4nI2AOhR8xttPNXGqs1roOpsqWOcPUD67L0d+9J52AaBd7v3/GFPsGACA6glqniD6z4eLwYkUB6ucmT4XILuHOiVjrUjWfqrN2PsM6gx+RhH/13hNISSyHUz6eqEKLbccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812209; c=relaxed/simple;
	bh=KUIQRc9tgbyHTJUuThQoWuAHIhnO8IJXlH/NpCUfX/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMn78/uibX7QVvM0cgcPFlhPiSDaWaaUCOCl2eUPDnJhz3Fljdaf1cdKabFt6m28XBfH8UQhhCd6mnLbfxmMwyZ0gTb1PnYhr0Oojlf/DhuNym726uc5VUy9xQhA+oM+4O8u6HBvHI7iTBd90sw9RX9rxeLs/iD8E8sJ6iSPBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWpu2YpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8FDC4CEF7;
	Fri,  6 Mar 2026 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772812209;
	bh=KUIQRc9tgbyHTJUuThQoWuAHIhnO8IJXlH/NpCUfX/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWpu2YpTj8vcXxPE930Lbh7K3HPPHOPYU4057N5XlkcAU350B4eGrfGCFrH1Vakc3
	 ELmUXCxbtLHv3EvBrSE1u87VVpzhryqmtdFMjXEqDW9rStLlq/GLEwJu+CJbGxU+V8
	 VNpqETQCQiZAMUvjLQ7a+BpKgi7hbYKlwp4pynFQXrOQ74xkwEF36so+k82sfXhRWE
	 /1YYlYC2n4Y9Jx84iCEJF5UcCWutF2SXumszmChG5D/U8ICzmBK4k3BiPJSC9M/zjv
	 WZ1R2Lxv7kjqHd51Qu1Cngb7AnBHl7r+NdzDTbN1ZI0vtC2kLb8mnKzGzwUK4fioGJ
	 UObE+mDWikQ4Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyXRG-000000003rl-2Tvg;
	Fri, 06 Mar 2026 16:50:06 +0100
Date: Fri, 6 Mar 2026 16:50:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
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
Message-ID: <aar3rj7Db6NmTVS_@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aagSewpM88KAZDcJ@shikoro>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aagSewpM88KAZDcJ@shikoro>
X-Rspamd-Queue-Id: 867242247AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54808-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
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
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 12:07:39PM +0100, Wolfram Sang wrote:
> Hi Bart, hi Johan,
> 
> > And I agree: doing the above would be even better but you'd need - for every
> > driver - to move the i2c_adapter struct out of driver data and make it a
> > pointer. That's in addition to providing new APIs and using them. I2C drivers
> > are spread treewide. There's a reason why nobody attempted it for decades. I'm
> > proposing something a bit less complex: allow drivers to free i2c_adapter at
> > unbind but make i2c core keep a private, reference-counted structure for as
> > long as it's needed.
> 
> I am still with Bart, the above paragraph sums it up extremly well IMO.
> I also recall that the outcome of the Plumbers session 2024 was "go for
> it!". Nobody said the approach would be "fighting" the driver model.
> There were a lot of experienced developers in the room.

I don't know what was said a conference some years ago or whether there
was any misunderstanding on either side. What matters is what was
posted.

> > I'm frustrated because I'm spending time working on an actual solution. I've
> > explained what I'm doing and what the end result will look like based on what
> > works for GPIO (struct gpio_chip's lifetime is bound to device's "bound" state,
> > struct gpio_device is refcounted, I want to mirror it with i2c_adapter and
> > whatever we eventually call its refcounted counterpart - let's say:
> > i2c_bus_device).
> 
> I am super-happy and thankful that Bart volunteers to spend all this
> time on fixing this decade old problem. I know this alone is not a
> reason to accept a technically bad solution. But I think it isn't. I
> think it is a viable approach to keep the churn and potential
> regressions lower than a theoretically ideal solution which is nobody to
> do anyways because you'd need to refactor drivers from the 90s in a
> quite intrusive way.

We've done bigger refactoring than this, and after a looking a this a
bit further today, I don't think it's going to be that intrusive at all.

Bartosz seems to agree that my suggestion to decouple the driver data
from the i2c_adapter would be better, and I'm willing to do the job.

Johan

