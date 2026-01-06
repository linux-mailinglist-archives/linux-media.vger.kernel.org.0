Return-Path: <linux-media+bounces-49959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569CCF621D
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 01:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF462303021B
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 00:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3B220C00A;
	Tue,  6 Jan 2026 00:57:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76057260D;
	Tue,  6 Jan 2026 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661028; cv=none; b=QIR0M/9ZINFkN6uw1zhfP+FgZ1aMObyUiskNR+xPEBfLApy0QNj/nNH7QnM5//ZcIo7BEULO6LbRgL8u1bHlQXPw/XQbbQoSsXQLFsH/+/oYIOfYlNO0TunPqs5O0NoEuemTyZaVFY1OeKH+txNaV/Y/iv1K8geLgXCLW71nNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661028; c=relaxed/simple;
	bh=wRpkTHh1jTr/o59OlKWtqDUCmmxKkOs69l3X4pCbQDg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6tcnfQ5UakyeavRkNe98bToARsv4RXZcNvbrQddySHgdMOls7r3vM8kgzDf+lEKoJcKwsmKtXZ/bYuZT2HQ8W/jax/3Gvpc59TWuMdQz7yOyqTqdITyGcOuESWLNHV16cACFKAMgeN7A3IowqXeNTqFXZ+CMsSYdrZ/et4ZRC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 55A38160330;
	Tue,  6 Jan 2026 00:56:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 147A920026;
	Tue,  6 Jan 2026 00:56:56 +0000 (UTC)
Date: Mon, 5 Jan 2026 19:57:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Stefan Klug
 <stefan.klug@ideasonboard.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 4/4] media: dw100: Split interrupt handler to fix
 timeout error
Message-ID: <20260105195717.48b8ad78@gandalf.local.home>
In-Reply-To: <20260106005135.GM10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-4-65af34d04fd8@ideasonboard.com>
	<1c04d8cd1a6cf29f45d7ea9422dd3fe0a633a957.camel@ndufresne.ca>
	<20260105163748.2488d506@gandalf.local.home>
	<20260105234452.GH10026@pendragon.ideasonboard.com>
	<20260105194350.5a4c9138@gandalf.local.home>
	<20260106005135.GM10026@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1o4d8qz4wcbjs4kzh3k5r8tux6psuzor
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 147A920026
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/JVaao9PBLZ8c14WAF2S5e53fByNw6ftk=
X-HE-Tag: 1767661016-841309
X-HE-Meta: U2FsdGVkX1/AAuJy64oiT7nFyxtJsivFAo5pV1NRxDqAnewRJjH0tyAc+AUGOuGfwZ5gAHzwh2KhkMMtB3GSj1C97gNFLE6vTZsSpmYqXLYR/KlcGkq6wmRJM8u1MZKj43tF50QU4aCykGYHJcwIXFhMhBrLgj2bMY8Gm+YTCwQnto8s66cP3G0yFxtWrAUp32lP9l9YF8phyJB/0uRVntt7IYYNN4kxMinuj9+GKHPruTBjIzPmBYxLyoUbEA3j1LRrubfdwgnreBGTciEzptBILT3DxRL4rwrh1MfIdycC0LihNYb9zD/gjuIjE6uvmzM8CdBK2y4/tiE/YCbvFZzKx0TOfKQFPhz8MKWwY0RUe6WT/qG/4gq5STZYid4q

On Tue, 6 Jan 2026 02:51:35 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> My point is that we (neither I nor Stefan) don't know why it's "timing
> out" and what it means. There's no documentation publicly available.
> I'd like to get to the bottom of this.

OK, that's beyond my knowledge as it's independent from PREEMPT_RT ;-)

-- Steve

