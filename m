Return-Path: <linux-media+bounces-47269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B57C8C6904B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id BD2F42AE89
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06976350A17;
	Tue, 18 Nov 2025 11:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o3YmxcLn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A6D350287;
	Tue, 18 Nov 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464458; cv=none; b=IspAEkt+4iKPOatYH/DLHi+qULH3NpsMpCA3rBPtaqDNzynRjCmxdPsF+Cw29d/3BHsZLey25Zvj4OjDn9wm30/nq749y9jcH6lmWWV7K4f7U2UwSWDlsngiKowlXiUlvaW5T/PH6SGw22YuY/yPizdDsdV1y8I7PkfGX6qQVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464458; c=relaxed/simple;
	bh=BjmmA7UqTIQGTwWDDaUR+QOkbZ+Unrz4m/L2ZamZJ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaiM0HsnEPUnp/2vtjWIBT9xJIAknXsJDijBPKH4XKcxSr8WJg+cH6i3Dyiud+sFyHLNzZHwLioMex08RrOr1Pt4d70u6Ujw5CtxzHPhyrN6JeoiZ9hI4IT3wMa+hpCURxha5SGshgW5QSm6hqZQTGlDadQWzFBP+jcUllPOLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o3YmxcLn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8BEC2BCB9;
	Tue, 18 Nov 2025 11:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763464457;
	bh=BjmmA7UqTIQGTwWDDaUR+QOkbZ+Unrz4m/L2ZamZJ9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3YmxcLnfRgAt+iuQyqr960nUtL3QMx2X6na2hSp10wNAyV6BpD+ClNR7FLBewlw/
	 Vw+58XoB3PKFZmVMyppEM2fHtT4tdideOfap/iPxnU9XREy+iyGIhulEkTyPj01KNr
	 vRaKtynIkHDaNkECEor9BqrRhDUzfWKVikZX9vFg=
Date: Tue, 18 Nov 2025 06:14:09 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Message-ID: <2025111817-wages-anyone-e39a@gregkh>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>

On Mon, Nov 17, 2025 at 08:14:19PM +0000, Ricardo Ribalda wrote:
> Some camera modules have XU controls that can configure the behaviour of
> the privacy LED.
> 
> Block mapping of those controls, unless the module is configured with
> a new parameter: allow_privacy_override.

This is not the 1990's, please do not add new module parameters, they do
not scale, nor work properly at all for modern hardware where you can
have multiple devices in the same system.

This isn't an agreement that we should do this feature at all, just that
if you do, it should NOT be a module parameter.

thanks,

greg k-h

