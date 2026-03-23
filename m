Return-Path: <linux-media+bounces-56700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CZGLLAgwWmTQwQAu9opvQ
	(envelope-from <linux-media+bounces-56700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:14:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B039E2F1030
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C39B73009F08
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B99395D9F;
	Mon, 23 Mar 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M987mFSL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D003191BB
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264467; cv=none; b=NcttphXXZ7NYVI2l68mP+xTbHzNFEIsUqJPeHTRLlc+RvGE/1C0PIZ5ib7TsqBfOnE75qjuoxqPXRYIxdH2RR9u/4K0HnT0vJKN2YhkCjXM3hAcN+9NgwEAq4VmurFb9kmk6ZMJbfRoKVIkvXF5XWUgKHtfOgT7xjrHz5kbLkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264467; c=relaxed/simple;
	bh=bbtHlJKi3GGlgVvOuCuUrq00FrdU/djbOH0nqqsn4Ig=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Kmi8xzFZSEzcz6GAuIcqFJI7nsYixq6oFS7NnYZFj6E+BSUrMY7K1mI6gttd+tLPUQxk7qIoMtyl0KN2XZT7g9LDHwmeYKFezNr4QQqUcwAgSUV2QR/lSu1/KBMmLY20LnD2RVVBo4mKtuOnds+C2VxDcB4fhvVFxdIGYpey1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M987mFSL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71CDE591;
	Mon, 23 Mar 2026 12:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774264385;
	bh=bbtHlJKi3GGlgVvOuCuUrq00FrdU/djbOH0nqqsn4Ig=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M987mFSLB+l84kLN4h6VjKcpMcdVMpY3CumAozVy7wupT+MwL+yxDsAUTuCmjIih0
	 64DQYBCQm477JfNbYvBgAPN4GaBn26GxBtD8yYR4q0+br684f8N3GVAeZ9WW4BEqYq
	 gFggNGKsLyHI4yWRPZZ1+0awfJbvGU50QH0bZ518=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AMBP190MB2678DA83087A5C045C0A9FF1ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References: <AMBP190MB2678E7DC048409068260DCE8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM> <177425975200.3376561.11999798013858190771@ping.linuxembedded.co.uk> <AMBP190MB2678DA83087A5C045C0A9FF1ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f854772bd5b breaks camera functionality on Surface Go 2
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Michael Anthony <manthony.nw@outlook.com>
Date: Mon, 23 Mar 2026 11:14:18 +0000
Message-ID: <177426445884.3376561.13148826876054332090@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-56700-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fedoraproject.org:url,ping.linuxembedded.co.uk:mid]
X-Rspamd-Queue-Id: B039E2F1030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael

Quoting Michael Anthony (2026-03-23 10:38:22)
> Hi Kieran
>=20
> Sorry about that.  The commit that I suspect caused this regression is:-
>=20
> 5d505becf75a9696937815ab147e1f2d81165ad8
>=20
> media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dv6.19.9&id=3D5d505becf75a9696937815ab147e1f2d81165ad8
>=20
> I am new to this so am not absolutely sure that this is the culprit, but =
it seems to be the only relevant change between 6.18 (working) and 6.19 (no=
t working).
>=20

If that's the only change and it compiles, then it's not that I'm
afraid.

That change declares it removes an unused variable, and the compiler
should fail if it was actually used.

> NB: I'm not sure if this is relevant but on kernel 6.17 both front and ba=
ck cameras produced an image after booting, but on kernel 6.18 only the fro=
nt camera produced an image and the back camera just showed a green screen =
until I entered systemctl --user restart pipewire in a terminal.  After thi=
s the camera produced a image.  After upgrading to kernel 6.19 in fedora, n=
either camera is detected.
>=20


You may need to bisect the kernels more preciesly building your own
kernels to use 'git-bisect'.

As  you're on a surface, are you using the linux-surface kernels? They
might have out of tree patches which you've now dropped.

Also - yes, please add a full dmesg and media graphs.

We should try to identify what the actual fault is before we jump
through random kernel configurations.


If the kernels are provided by Fedora - there might be a way to report
to Fedora too.

 - https://docs.fedoraproject.org/en-US/quick-docs/bugzilla-file-a-bug/

suggests=20
 - https://bugzilla.redhat.com/

--
Kieran


> If you need any more information, please let me know.
>=20
> Michael
>=20
>=20
>=20
> ________________________________________
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Sent: Monday, March 23, 2026 09:55
> To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>; Michael An=
thony <manthony.nw@outlook.com>
> Cc: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>; mchehab@=
kernel.org <mchehab@kernel.org>; hverkuil-cisco@xs4all.nl <hverkuil-cisco@x=
s4all.nl>
> Subject: Re: REGRESSION: ipu3-imgu: commit a66191c590b3b58eaff05d2277971f=
854772bd5b breaks camera functionality on Surface Go 2
>=20
>=20
> Hi Michael,
>=20
>=20
>=20
> Quoting Michael Anthony (2026-03-22 15:40:37)
>=20
> > Hello,
>=20
> >
>=20
> > I am reporting a regression in the IPU3-IMGU driver introduced in the 6=
.19 kernel cycle.
>=20
> >
>=20
> > Regression Description:
>=20
> > Following the upgrade from kernel 6.18 to 6.19 on Fedora Linux, the IPU=
3 camera on my [Device Model, e.g., Surface Go 2] has stopped functioning. =
While the modules (ipu3_cio2, ipu3_imgu) load, user-space tools like libcam=
era can no longer initialize the device.
>=20
> >
>=20
> > Suspected Commit:
>=20
> > "media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field"
>=20
> > Commit: a66191c590b3b58eaff05d2277971f854772bd5b
>=20
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da66191c590b3b58eaff05d2277971f854772bd5b
>=20
> >
>=20
>=20
>=20
> I tried following this link - but it's apparently not the commit you
>=20
> expect. Can you identify which commit you actually bisected to please?
>=20
>=20
>=20
> --
>=20
> Kieran
>=20
>=20
>=20
>=20
>=20
> > Impact:
>=20
> > This change seems to have removed a field that libcamera or the V4L2 su=
b-device internal routing relies upon for this specific hardware. Reverting=
 to the 6.18 kernel restores full functionality.
>=20
> >
>=20
> > System Information:
>=20
> >
>=20
> > Distribution: Fedora 43
>=20
> >
>=20
> > Kernel version: 6.19.x (Broken) / 6.18.x (Working)
>=20
> >
>=20
> > I can provide dmesg logs if required. Please let me know if you need a =
full media-ctl topology output from the working vs. non-working kernels.
>=20
> >
>=20
> > Best regards,
>=20
> >
>=20
> > Michael Anthony
>=20
> >
>

