Return-Path: <linux-media+bounces-24447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1232A06025
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 16:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF332166CE4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD08117E900;
	Wed,  8 Jan 2025 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Px0yOiv1"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AC259497
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736350343; cv=none; b=bM7CQ2bvraYzLZiOwopxY42uxBlOsiIf9My/7L46cHyR270t1BCxdndl9kSpAHOQeM95r2Q2rDUq5vcbxajIeClpCdA4i7lUPP4haTNdx2/beigtloQufWey37GxH9VcVxqsxL13cMSG6IRNAdeZWSGuYxj3ooyMG5kZmGAHsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736350343; c=relaxed/simple;
	bh=qgKs1u9kCuBFXRBvJmT6q1R1X8rRj1TygsuYmZts3ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLKvolq94BUBXtlKq2YtVq1o+UGogCUeYlrtXmJvep5IvVyo1buJ1H5rhMUfoSgoetVI/0j8JjhDOWBO0/d8/0jmnbbkpzBRW0AZo+hOiFUfx98Li/SNPKgvhyB5MSkeEKvT8zAJuU9x9Dz+kPnw9a+btKJLWT2H9JNPbqMCl2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Px0yOiv1; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0TEAjyQ7pKXgA5ZuBQDEfHcPjwU24qY3N1X1YYFcQQs=; b=Px0yOiv1OkeBWkvNKxZpKNqiTU
	eCHeQ8Kgpw1NySNcvd+oiAPnjFfFA53PlDEFeRgTMFt03DPPVyqscDMNDOTGuT3072IOxVyxetGWI
	mIRsUGCS5akemvTaFheDN3vXS1hLHpWmlbWrOGkpMAwlT6WTF9HXxfjDcsl6GHNX/u4//dwAxgo8e
	1Tu06I//tf3Gj9RXh0MlfVIprjUrTRnXklaAcn4QSfXAO5zSz1vOpvdfYX7BwKfEYHRNvvt6IVw0A
	BxBUxiJORhWKdgFVCBiqJrJrIhnAHbjdIQPCaaTrlMttuh7pvQfvkiFtfFJIV7sW4I2a3tWZGQXPZ
	z9FN1zfA==;
Received: from 179-125-71-237-dinamico.pombonet.net.br ([179.125.71.237] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tVY2X-00DBNs-BD; Wed, 08 Jan 2025 16:32:13 +0100
Date: Wed, 8 Jan 2025 12:32:07 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tomasz Sikora <sikora.tomus@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
 <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>

On Mon, Jan 06, 2025 at 02:15:24PM +0100, Tomasz Sikora wrote:
> Error in line 1034 dmesg.log
> You can see more here https://bbs.archlinux.org/viewtopic.php?id=301737
> 
> pon., 6 sty 2025 o 11:56 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> napisał(a):
> 
> > On Sun, Jan 05, 2025 at 07:31:09PM +0100, Tomasz Sikora wrote:
> > > Issue video camera
> > > ls -l /dev/video*zsh: no matches found: /dev/video*
> > >
> > >
> > > 01 15:43:24 Linux kernel: usb 3-2: Found multiple Units with ID 5
> >
> > Can you attach complete dmesg output? And more importantly, attach the
> > output of lsusb -vv?
> >
> > Thanks.
> > Cascardo.
> >

Thanks a lot, Tomasz.

Without this patch (it could be an older kernel), do you see a warning in
your dmesg? Or messages like:

[  395.090938] usb 1-1: Failed to create links for entity 5
[  395.091385] usb 1-1: Failed to register entities (-22).

Otherwise, it might just be that your kernel is not built with
CONFIG_MEDIA_CONTROLLER.

I reached that conclusion by emulating a similar uvc device. Yours has the
entity ID for both the output terminal and processing unit. Though that is
not valid according to the spec (even UVC 1.0 mentions the IDs should be
unique), we should keep supporting such devices.

I am currently working on a fix that will restore support for your device
but improve its support for configs with CONFIG_MEDIA_CONTROLLER.

I appreciate your help on testing such configurations and fixes.

Thanks.
Cascardo.

