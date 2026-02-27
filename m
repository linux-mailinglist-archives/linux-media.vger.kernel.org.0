Return-Path: <linux-media+bounces-53732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIkwANC+oWnPwAQAu9opvQ
	(envelope-from <linux-media+bounces-53732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:57:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6B1BA66B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 789B5306777E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3774A43E493;
	Fri, 27 Feb 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBGFhqUB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2E43DA30
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206943; cv=none; b=h2FoGt2iCrKA9dTCMACJvUZAd1eOM5+jQ0edCeXx005UPEqLG2WWCDnkUWlPavNh/kWENJMSnUAbyJPt/dtKPMw4J2AS+Jvv8xtsiMPmyLbz5h77MQ2Gtw9i5q8X0qLSp4YRjnb3TPbSRATjcbuUqmguJuGxFCBiUEck99dnIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206943; c=relaxed/simple;
	bh=STzTxb6AkecD0Oj2uXWbAE7smRP8JD9AAxkR2Qux/Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDI4ybVvb8RNsLBywEfqojeqk9lem69wT1yXhCkatXdhRvHCM9XxIvejmmpZoJQ7MK4sBCBn610gDOdhzLo2YT1b75X2/lv5DAEzhNAjGNEZ/rtAl3GX8O9Wmw/rlJJFsUE6ZOPC323WdwcKGehrF0sM8HkwuABiNLV6jiV06hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBGFhqUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B412C2BCFB
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206943;
	bh=STzTxb6AkecD0Oj2uXWbAE7smRP8JD9AAxkR2Qux/Sc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LBGFhqUBtQI9BbpwK46VoHQn50/6CaY1vQ5PIc4y5spoYCP25Jf0LROem1fHBjUy4
	 yeI4JK9t+VAFfxsB/FRVdfK2qMAp7BaBH+/oWL+LnHZG992H0B/CcnUUAoiNPkt5su
	 u377zsPtAQxl/Qcm2oYsywZEuG0OqtFcTLP7OjoWey7QG/JHyvrV4iN6xZaOIqUa06
	 vfJFlrWT+r202v79WRMwFVhTxOamgJ/igAb5KSIJ4HqzNmfDIAyq7QGRarn4/4y6Qh
	 NxQCbSDcfMyB0gb6ik4hp18xL7FM5BoFy0P7SgHelPVuHedFnta+qYHiFlGS3xx2xF
	 pZng7DsL48SLg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389fac627c9so23471511fa.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 07:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWol4pLINtlb/X8xhLACWj2J6GRlN8pAiaWCM9iQJ7VxAopvQi+lFwFjS3wncrN9k70kCWbdwHay5Ncrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3BbkId+UJ8vlgHVsErEsTNhB1MywiLgbaSkd76KnWWEN5GLi
	cmEx9gJdQH+kVh0iA/QR0hHnKhyvUemLA/JulbgJ5tLRRl8MvHSZ1ec7jWaOl3NR/lZIBf91QQV
	lFi3m3BqFreziIbhXlGN55UjLdA/MJ4eQPwqNcTR+jw==
X-Received: by 2002:a05:651c:41d8:b0:384:9b92:c5b7 with SMTP id
 38308e7fff4ca-389ff143720mr18998801fa.15.1772206941514; Fri, 27 Feb 2026
 07:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro> <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
In-Reply-To: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 16:42:09 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
X-Gm-Features: AaiRm51scY9nN4P8ovfss040XTmsPoSnyMQYg9QuZyNCyHcgWecCdT1v9mdLWqo
Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-53732-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2FB6B1BA66B
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Feb 27, 2026 at 10:08:34AM +0100, Wolfram Sang wrote:
>
> > > Wolfram, I noticed you merged these last night. Please think again an=
d
> > > let's discuss the end result here. There's no question that there are
> > > lifetime issues in i2c, but this is not the way to solve it.
> >
> > I did think again and do not see a way how the life cycle problems can
> > be solved while drivers happily access the device struct of the adapter=
.
>
> There's nothing special about the struct device. What matters is that
> drivers don't free memory that's still in use by the core.
>
> > Whatever the solution to the core problem is (revocable, custom SRCU,
> > something else), I still think this step is needed in any case. If I am
> > wrong with this opinion, please enlighten me. Pointer to some existing
> > thread is OK, too. I didn't have the bandwidth to read the revocable
> > mail threads.
>
> It's not even about revocable or SRCU, that's just an implementation
> detail.
>
> It seems all that is needed is to decouple the struct i2c_adapter from
> the driver data and have core manage the lifetime of the former using
> the reference count of the embedded struct device.
>

I feel like we've discussed it already under v1 or elsewhere.

This is a weird pattern you sometimes see where a driver allocates
something and passes the ownership to the subsystem.  This often
causes confusion among driver authors, who logically assume that if
you allocate something, you are responsible for freeing it. Since this
is C and not Rust (where such things are tracked by the compiler), I
strongly believe we should strive to keep ownership consistent: the
driver should free resources it allocated within the bounds of the
lifetime of the device it controls. The subsystem should manage the
data it allocated - in this case the i2c adapter struct device.

I know there are a lot of places where this is done in the kernel but
let's not introduce new ones. This is a bad pattern.

But even if you decided this is the way to go, I fail to see how it
would be easier than what I'm trying to do. You would have to modify
*all* I2C bus drivers as opposed to only modifying those that access
the underlying struct device. Or am I missing something?

Bartosz

> Then you can use an rwsem, SRCU, revocable or something else to handle
> devices going away while they are in use.
>

