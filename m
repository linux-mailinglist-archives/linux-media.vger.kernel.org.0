Return-Path: <linux-media+bounces-53739-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ4ME4LJoWmqwQQAu9opvQ
	(envelope-from <linux-media+bounces-53739-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:42:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA31BAEF9
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08CA0312B15A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B4A34A795;
	Fri, 27 Feb 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaYFALf4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5B9346E5E;
	Fri, 27 Feb 2026 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210469; cv=none; b=A+71L1tYFrNlABoONSE8HOY1Iq8106hwzXaDKXtbOV+7BJ03wt45rlfrrbYr9WNG/7wTlKBNVI0M88nX9BuwYzvM1nwkeHOPU733kgk11ax045/qszBOUjHWl1PQzKCUVQSxd1zUrCToqQ7eUFeiKyX77512H/KPqhPEUL+4J+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210469; c=relaxed/simple;
	bh=Ra4gGeTukVvl+IUi3kpBx/h8Xrcr5tcq4BLIbbsXf6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHlze4E1QJRgwKf1fTjgP47QJPTVdB/DQcbGBgQRZV1NMS1EG3Bbx+rJcSzuWd2b756gPhdJM7zylyR2A9z1xVbWncYgB1vtF+lAkXLL5PF4ktT4oOL1ibKdZTAqNLr/WXmb/ylFGmuIHX14jINS8KDylLpSFEJOvqUHpcXtbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaYFALf4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A9DC116C6;
	Fri, 27 Feb 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210468;
	bh=Ra4gGeTukVvl+IUi3kpBx/h8Xrcr5tcq4BLIbbsXf6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaYFALf4xSZVQAbA312F7K02ns0zy5kcaOvWHFJNWY9AvATt7pUW+bvMJKbdtChtm
	 tH2uUwehXsL2Hj8fdwwpVCcWuHdDsb63uUFJP2cMF43xNCJTDSxZcHpwvTLSu1U7Sl
	 M2FUvnb6mDY3PWKJMno+e3SWOYvxG8KKG8vxw4MEn6hOq41EUPBH23+RINiw2vhX+e
	 FbHp3qUfZvbZuE+CnrnSZvs5NqaaWkofdWxMYqTtE/Z0RbEfnkD+zmDgc1t+2WJ5x1
	 9nBJrTX+Zzefz1LyUgn8uO+y6uQ40gkpU5G5jKsZVOMPxB3x2051Wg3WzGAPsaffSQ
	 nrMMZp0t1q53A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vw0tB-000000002TD-2FBk;
	Fri, 27 Feb 2026 17:40:29 +0100
Date: Fri, 27 Feb 2026 17:40:29 +0100
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
Message-ID: <aaHI_VavZugXjVoL@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53739-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E0EA31BAEF9
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 27, 2026 at 11:06 AM Johan Hovold <johan@kernel.org> wrote:

> > It seems all that is needed is to decouple the struct i2c_adapter from
> > the driver data and have core manage the lifetime of the former using
> > the reference count of the embedded struct device.

> This is a weird pattern you sometimes see where a driver allocates
> something and passes the ownership to the subsystem.

It's not weird at all, this is the standard way to handle this. We have
these things called reference counts for a reason.

> This often
> causes confusion among driver authors, who logically assume that if
> you allocate something, you are responsible for freeing it.Since this
> is C and not Rust (where such things are tracked by the compiler), I
> strongly believe we should strive to keep ownership consistent: the
> driver should free resources it allocated within the bounds of the
> lifetime of the device it controls. The subsystem should manage the
> data it allocated - in this case the i2c adapter struct device.

Drivers are responsible for dropping *their* reference, it doesn't mean
that the resource is necessarily freed immediately as someone else may
be holding a reference. Anyone surprised by this should not be doing
kernel development.

> I know there are a lot of places where this is done in the kernel but
> let's not introduce new ones. This is a bad pattern.

No, it's not. It's literally the standard way of doing this.

> But even if you decided this is the way to go, I fail to see how it
> would be easier than what I'm trying to do. You would have to modify
> *all* I2C bus drivers as opposed to only modifying those that access
> the underlying struct device. Or am I missing something?

Yes, you have to update the allocation and replace container_of() with
dev_get_drvdata() but it's a straight-forward transformation that brings
the i2c subsystem more in line with the driver model (unlike whatever it
is you're trying to do).

Johan

