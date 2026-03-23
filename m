Return-Path: <linux-media+bounces-56682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOElLHAOwWk7QQQAu9opvQ
	(envelope-from <linux-media+bounces-56682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:57:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 413382EF7E5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9B1D3028F51
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB2D3876A3;
	Mon, 23 Mar 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKKINU+k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C105387357
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259758; cv=none; b=JeN6fDfzrZCYcgVA3lT0NC002Tpu6bw/9g0uujmcfzHabJGPT17ZuCOZf6+suMpEeGP9VKQzuLMLsgLuREkTh1SJKWoMlMToYdn6npmPauLFNkDaeaT3pTm4jdX2NAtoqDXv2uzUgIOcgSJv2oqolTw8ljt+gvD1ydsjNp2pkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259758; c=relaxed/simple;
	bh=wRHBaUZmtCdvCMwDSslO0TmvYIoFeraV2jmLg4lMg1o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cK07M9xydU+tbQbNQ4zfPjPV5KNER2mF0LQPQWRdgB0NadTeNt3muHfsZHRcA9g48/LO9SCN1U5oNLyQqBEon+LyR04lZ1ny6jeTqa1lJffwN0r1kT0Fk+kW687SqSvuMlkXBdIBYcjYPpD29vzk1GH8RHSYPleNKLnyVlFFqnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKKINU+k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B589874;
	Mon, 23 Mar 2026 10:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774259679;
	bh=wRHBaUZmtCdvCMwDSslO0TmvYIoFeraV2jmLg4lMg1o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BKKINU+km/1v8vzi5UbSb3xBwAOzGaToDIBEdIuprVWPr32WZz7C1PFuriWjqS2lc
	 VZ1irG3y71v8fBBofzQMOIL3Taf5X2c5gyoIxQFqbAGfblBXPnB8DpiccUb5vXcF1V
	 pdvUeku/h3iDMZ+KuO61Z+AeHi2kJD/BX7NuaeZY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References: <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on Surface Go 2
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Michael Anthony <manthony.nw@outlook.com>
Date: Mon, 23 Mar 2026 09:55:52 +0000
Message-ID: <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-56682-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ping.linuxembedded.co.uk:mid]
X-Rspamd-Queue-Id: 413382EF7E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael,

Quoting Michael Anthony (2026-03-22 15:40:37)
> Hello,
>=20
> I am reporting a regression in the IPU3-IMGU driver introduced in the 6.1=
9 kernel cycle.
>=20
> Regression Description:
> Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU3 =
camera on my [Device Model, e.g., Surface Go 2] has stopped functioning. Wh=
ile the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcamer=
a can no longer initialize the device.
>=20
> Suspected Commit:
> "media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"
> Commit: a66191c590b3b58eaff05d2277971f854772bd5b
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b
>=20

I tried following this link - but it's apparently not the commit you
expect. Can you identify which commit you actually bisected to please?

--
Kieran


> Impact:
> This change seems to have removed a field that libcamera or the V4L2 sub-=
device internal routing relies upon for this specific hardware. Reverting t=
o the 6.18 kernel restores full functionality.
>=20
> System Information:
>=20
> Distribution: Fedora 43
>=20
> Kernel version: 6.19.x (Broken) / 6.18.x (Working)
>=20
> I can provide dmesg logs if required. Please let me know if you need a fu=
ll media-ctl topology output from the working vs. non-working kernels.
>=20
> Best regards,
>=20
> Michael Anthony
>

