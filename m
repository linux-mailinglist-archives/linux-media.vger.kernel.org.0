Return-Path: <linux-media+bounces-49949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5DCF5B02
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 22:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7937307BF7F
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 21:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C336D310784;
	Mon,  5 Jan 2026 21:37:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CEA30DEC7;
	Mon,  5 Jan 2026 21:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767649051; cv=none; b=IPUPFB3QqSeE81IHu2vAwTxT58Q0Saj/jvcRq1jGwMIOInxGPChRkFlN06r8Z60vnPJpVY9WiF+r23Uy2J1HL2nwuWSzWnccmc0fVGAlYbKDSzzVQQ31aYl5q//tqLLV+E/Gne4SYhnwgTirhv6QFBEE0od9eIyhm25/00G0i6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767649051; c=relaxed/simple;
	bh=FyZO+9ibu4CKxEhQHU6i8IzzIGF0ZXUN545OY+SdEuI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bphm/cR7tr5Zt5OkNFS1LrPq/YpS9xQDuApW/Y3OSsYqXpXhfp3S9DkiLjBhPkLKZcrcIAN+oiwYLdyxUS6Ozyb1S3SiNfJiOO5kGT7vTnBJa+SmAlYuFxtIz6Kj4DTaTR4sYo1hfNLs+GNVtFyhKK0qsY0ELj/EuWWbG2mS4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id D33891A93E3;
	Mon,  5 Jan 2026 21:37:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 9E97520026;
	Mon,  5 Jan 2026 21:37:25 +0000 (UTC)
Date: Mon, 5 Jan 2026 16:37:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 4/4] media: dw100: Split interrupt handler to fix
 timeout error
Message-ID: <20260105163748.2488d506@gandalf.local.home>
In-Reply-To: <1c04d8cd1a6cf29f45d7ea9422dd3fe0a633a957.camel@ndufresne.ca>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-4-65af34d04fd8@ideasonboard.com>
	<1c04d8cd1a6cf29f45d7ea9422dd3fe0a633a957.camel@ndufresne.ca>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9E97520026
X-Stat-Signature: cik51y5k5ssgchwn8isgo54acwdhpad8
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19fub4PfZma5Tgy9eHC7w371AcU1/PYolU=
X-HE-Tag: 1767649045-606340
X-HE-Meta: U2FsdGVkX1+cqPXwC75nQ7mQOic4I/XPYNIOYvfEtn9E7kcfW69ryyx9TgOGDyPOrHsP/LEYqNIrmYA+LX1O8EbYu47os8d7laO48sXb0Dv8Sh1r37NIdxa0v12TS/TG/1Dp7swrbZf8snUrh/iWP4nMxYwOn21qeHs7aZ+cM807Qlub+IjzZnc/ouVQVPyvuqxL5TNB3oQR58vKS5997VboZ2oXU/3RNPck1aT6GdLm71cMCKaWzaFS+8VTtv4NZCiFkKvchMJoedD6WMmmjnu+kXdbACeQqvZl27vrMToawIoQr/g/bSEzafIFqA8n64z3AsemTRbSzVmMoel27oTfpTGTzcfsS0S3GTyQt1Tk2zRk22+gfdAyhCzbtaAyb4rOUos9ErIontJoF1xU1durvjhdxS58RSbCwn+m4a5jStmSIR+g7UFKMfmZkyW1

On Mon, 05 Jan 2026 14:03:58 -0500
Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=C2=
=A0:
> > In the previous commit, the interrupt handler was changed to threaded.
> > This sometimes leads to DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being
> > set after changing the vertex map. This can be seen by repeated error
> > outputs in dmesg:
> >=20
> > dw100 32e30000.dwe: Interrupt error: 0x1
> >=20
> > As there is no documentation available, it is unclear why that happens
> > and if this condition can simply be ignored. By splitting the interrupt
> > handling into two parts and only handling the dw100_job_finish() within
> > the threaded part, the error does not occur anymore.
> >=20
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com> =20
>=20
> Ok, but arguably, this could be squashed.

Agreed. Because it doesn't seem to make sense to have a oneshot threaded
irq handler that doesn't have the two parts (non-threaded to acknowledge the
irq, and the threaded to handle it and re-enable it).

-- Steve

