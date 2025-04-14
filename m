Return-Path: <linux-media+bounces-30159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA28A88090
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E692318883A3
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 12:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C682BD5B5;
	Mon, 14 Apr 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4yQ+S8P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E52BD5AA
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634330; cv=none; b=H2oHrVbZ/ga/bfMYebefR3I0w1FeQ7cuWgTmD48b5x5qvZELtukex6cUU6xcwGF6FDcyqJuAAxt9aOy+9PXYWruWbjX+MgPkIXGmoB08pkz1eteojToN9sX0xRwYMiDuEqXsHFaHaeQs9NJ7Ejut2jpfIzHEDCW9ZtDTLoDoG8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634330; c=relaxed/simple;
	bh=S7TAqO1YHSQ7UaftKkBFtpl+e5y5kXTaoL6YxH5bAcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RA0xpMHSmwWJq/9C18evtYmrFIlvgi247PYgKLFk2tHEJjWNAqAT7EE1o34oEz9gefmcLdXFifEiG9R+wQRHwOJrakWz1glK0w2l5LxxjA77XnV5m5IMVBdV3aej7NCwF8r5+efZKhD2DmHAc9mHm84EJU73lciIZsIycH+l450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v4yQ+S8P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2F7B4CE;
	Mon, 14 Apr 2025 14:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744634205;
	bh=S7TAqO1YHSQ7UaftKkBFtpl+e5y5kXTaoL6YxH5bAcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v4yQ+S8PnPwLKBslRS19mw3GX9ONk4pMeLXFtZbXioOV4L+u4uBtCIbrKccjOQ3NR
	 TnrZIlQASGAkNbOnRXc61wc8iaOBJGymIPQmNLq8vze4PyiToaqmLGAArduGrdC6l9
	 A3F7fNoxKFqpRfJ1RXrMWKsseDHfi5mRzzlE5AMw=
Date: Mon, 14 Apr 2025 15:38:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrej Gardijan <andrej.gardijan@tuta.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Libcamera Devel <libcamera-devel@lists.libcamera.org>,
	Linux Media <linux-media@vger.kernel.org>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250414123845.GD26798@pendragon.ideasonboard.com>
References: <ONn_aOl--F-9@tuta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ONn_aOl--F-9@tuta.com>

Hi Andrej,

On Mon, Apr 14, 2025 at 11:16:57AM +0200, Andrej Gardijan wrote:
> 
> Hello,
> 
> I'd love to attend if there are free seats available!

There are still seats, I have added you to the attendees list.

I don't think we have interacted before, could you briefly introduce
your interest(s) in libcamera ?

-- 
Regards,

Laurent Pinchart

