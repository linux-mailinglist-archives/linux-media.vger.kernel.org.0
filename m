Return-Path: <linux-media+bounces-24272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F605A0241C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 12:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AFE67A33D6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AD71DD9D3;
	Mon,  6 Jan 2025 11:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="S40XdUmG"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6B1D9A56
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736162304; cv=none; b=NbOgUhGUW+hirFrtEmNEgDXVFJ4bWNxkhyAGfRuimkOeuwDptIMM3l4RvQFyQag4ApOk3O1cisEsltBiHeGGOpr3ZVEQ0sJFvKZOnjvpjFvFb/Xltz6nD3V9yusHUBnzqoFH0ouT9w4f0k/dseEX9DRKShumYkSsmwHG10g2qy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736162304; c=relaxed/simple;
	bh=+V87QVE/9Q/SxddDB6fFEQIN2f8aCvpSPh1nSb+K9aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVY1rOI72ccYEf4YctfqQdchttCQRXmjo+jX3MRd9MLLIf0JnlDQvSg1waOxtByPtTTclhxC+nU6Trk9oNW82qpOfgoWRJimsWDhDnNCAWVZW7W/z37aBJmRl1SsQGSNZUuz1Xqx1NHKH21N+qXaYmqJPPIQAkpNKBSDom/FL+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=S40XdUmG; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9Hc0LAPcmPUdR2H/CG2cGWy5FF/bFuYuNmoINpgNKig=; b=S40XdUmGSm3C9YUh/VQn6CrFIb
	lVdJWGeacYdkZgzuVyX3IdKEBG7CgdOi9/OFKoGl4PrKKnRuqx2dVSfiUY6fw4z6lOhzW6zltbOEa
	aPQasm81BUtJ266SYUd5/x7tXOGVWoIxe5QM4Fvz9s983rcpf97HC5O7/KQ8E0KJysmQ2f4zqVWak
	3xhaoCoF9qlMikL9nwI/hFuJ/I3daK4obmjMCuDcDpY55sVmjWOv/DQs4yjaoPHQL2L5SOaoYTkTg
	R1lznENcnE92EwQ0RxLM0sVqvvgI9s3iKs4VzvledNOnouvi+bmwuoiynLgqBbOq8H2wBaJ+I5Ssz
	mjIoaaCA==;
Received: from 179-125-71-254-dinamico.pombonet.net.br ([179.125.71.254] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tUkmB-00CETL-Hk; Mon, 06 Jan 2025 11:56:04 +0100
Date: Mon, 6 Jan 2025 07:55:56 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tomasz Sikora <sikora.tomus@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>

On Sun, Jan 05, 2025 at 07:31:09PM +0100, Tomasz Sikora wrote:
> Issue video camera
> ls -l /dev/video*zsh: no matches found: /dev/video*
> 
> 
> 01 15:43:24 Linux kernel: usb 3-2: Found multiple Units with ID 5

Can you attach complete dmesg output? And more importantly, attach the
output of lsusb -vv?

Thanks.
Cascardo.

