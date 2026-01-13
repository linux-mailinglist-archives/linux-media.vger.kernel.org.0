Return-Path: <linux-media+bounces-50552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E0D18954
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5620830194C8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452683446AD;
	Tue, 13 Jan 2026 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/zszqRj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBE38E112
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305135; cv=none; b=GdRjIfWPZMBD/QKegNyK1Mbsq/qdEhIspBc/p3Ffrgds2qeC5yo0u1oSox/Rf4/PvXXjKX2KvpelG6l1J8Mvz1RkPy2yXJ5FOIGGlIzB21uVSRNOP1ZMckztXq7z+2xOjVD2VN6Wpsz1EbCe5dUM18b8tkVGMGJSppZXDyMtQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305135; c=relaxed/simple;
	bh=zzQCJcQlku8pTvRJifIfGJruURb8pNkuNP7DddttNzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r33Z7u5eBQ+47LlEnXHOJG00nSKNV6ENc/30GHHuxDHUGzH+ggzY4NKLKiwjyRDVS0+EuRiGomsD52hMLr7C0T7DFeuKUnDTXiIi3q2sxc8lS1RoG1zvqUJU4yaCQPhv6YOPW/yjftgiOnxKKGO6F9teS1ExCXARN7J+S7CEmHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/zszqRj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EE3F6316;
	Tue, 13 Jan 2026 12:51:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768305106;
	bh=zzQCJcQlku8pTvRJifIfGJruURb8pNkuNP7DddttNzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/zszqRji0xufg4iqsvMUdHqpf5TlR50eqlsZEc+DRf29cobflEDGchGcrqLQtPGB
	 QzZyWAGvKcmqcrmYRhIiQGyfLk1v2cx+opzCoDirc/9s5kCVOMgYfqcLKFF7VCbH37
	 5QZ24YsD3nsbMSbnJqMfkH1mQdkMkZux6RKvM9jE=
Date: Tue, 13 Jan 2026 13:51:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Itay Chamiel <itay.chamiel@q.ai>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: uvc_alloc_urb_buffers() fails for small frame sizes
Message-ID: <20260113115151.GB6198@pendragon.ideasonboard.com>
References: <DU2PR10MB77866A2E27FA9670E867EC20E18EA@DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU2PR10MB77866A2E27FA9670E867EC20E18EA@DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM>

Hi Itay,

On Tue, Jan 13, 2026 at 10:06:03AM +0000, Itay Chamiel wrote:
> In drivers/media/usb/uvc/uvc_video.c the function
> uvc_alloc_urb_buffers allocates buffers for transferring frames from a
> video source to the host over USB. It gets a frame size ('size') and
> the USB packet size ('psize').
> 
> Typically the frame size is an order of magnitude larger than the
> packet size, and everything works normally. But I think I've found a
> bug: if the frame size happens to be small - smaller than or equal to
> the packet size - then npackets==1 and the allocator 'for' loop is
> never entered. The allocation fails and the stream fails to open.
> 
> This is because of line 1815 in the current git version:
>       for (; npackets > 1; npackets /= 2) {
> 
> Shouldn't the condition have been 'npackets >= 1' ? Is there some
> requirement for a minimum of 2 packets allocated? If so then it
> doesn't seem to be documented.

I don't see such a requirement, no. Switching to >= 1 seems to be a good
idea. Would you like to submit a patch ?

> In my case we are working on a custom camera, whose packet size is
> 21504 bytes but the desired small resolutions are 50x50 (=2500 bytes)
> or 160x120 (=19200 bytes) both of which fail because of this issue.

-- 
Regards,

Laurent Pinchart

