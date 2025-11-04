Return-Path: <linux-media+bounces-46272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A96DC306FF
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E913ADD88
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F80D313271;
	Tue,  4 Nov 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuNKL8Dg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313B3112D5;
	Tue,  4 Nov 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251182; cv=none; b=H5c1QnwTFq7nw0NOkmq5Bu/pgUIOpntgRkv4JwLp3Z/JyhnPNMkUKhr8f6Ae9YkAvyE8KFJdGzSHS5lMpJUGvNN6e7q1jgKaDLFNFIof+8+HmZYjDhA92JKjw4jM0r3owmbhm9OBJkv1Qc2hPyBTQxnzoKADuAPJoOTwVpR2esc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251182; c=relaxed/simple;
	bh=icqyozgXuJp3TFyBwx6Aw0nfD5vxd8pkStCNlIhPD0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlXCYxmAoo0o1lXqIjQ2ZpveH5hm9pyAGSj4tXdh/FyCz+8HFz6rUdPCH3J/TuC4nWaoY+KXHIyZt+uS5rI09UyWmENJSkgCjZMfBYh3jQYw8PV2sdNABeFC0Iex+MlOG73aQ1+pdByZlWdYtLG4YKDDFLSOVfqlEvgJj5bbrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuNKL8Dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DDAC4CEF7;
	Tue,  4 Nov 2025 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762251182;
	bh=icqyozgXuJp3TFyBwx6Aw0nfD5vxd8pkStCNlIhPD0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SuNKL8DgiuWqZRNbOeP0J8D6oiYE8NmQg6mxYwpn9jb1acj/P5hvg8b8HqNzTLoEb
	 OWYb874u2QM9b3GYVsCPiWArerXQ5Ts/9+6jw1l3xkx6VcjHrEyGWN48PFRaGm8UYA
	 +WyQg4m0J+XB6skEnw6SOAj5glof0emhU3w0B3XwmeuzHxtwpoe+8XBH4b3N+v1zfs
	 uZ/wEf5Wnvxv9vc4n1LK6SEDtge3Tkgl+3my8HidKuqNij8V+VhD3aoOiogdJ2OIOj
	 7OebDqwQwa7dBTuMXN+Qm/rGpcK4nerGjfmfX5gAJTrcvX2i5p4UacfgkFE1OB91uU
	 RgIEOnuUPxSfQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGE2D-000000006G3-1Ycg;
	Tue, 04 Nov 2025 11:13:05 +0100
Date: Tue, 4 Nov 2025 11:13:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: imx8-isi: Drop unused module alias
Message-ID: <aQnRsVPq1ndQrLr_@hovoldconsulting.com>
References: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102234438.8022-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Mon, Nov 03, 2025 at 01:44:38AM +0200, Laurent Pinchart wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.

The commit message needs some more work since this isn't a platform
module alias (i.e. has a "platform:" prefix), and judging from a quick
look it seems like the driver did support platform probing before commit
605b57c4e888 ("media: nxp: imx8-isi: Drop partial support for i.MX8QM
and i.MX8QXP"), at least in theory.

It's probably fine to remove the "ISI" alias, but it should not affect
module autoloading.
 
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Johan, I've got the idea from similar patches you submitted for other
> NXP media drivers, hence the Suggested-by tag. Please let me know if I
> can keep it.

Sure, please do.

> -MODULE_ALIAS("ISI");

Johan

