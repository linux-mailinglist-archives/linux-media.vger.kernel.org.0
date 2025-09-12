Return-Path: <linux-media+bounces-42412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F9B54977
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 12:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40E41AA614F
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 10:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B6A2E88BB;
	Fri, 12 Sep 2025 10:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAXky462"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EB2E8B7A
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672241; cv=none; b=Nd6w0UWkWUZVK5uiAUjZBpzLpQqGiqEEY7fBqYLXp3mQCn+Ujsq45FEyrktG8zKYZVuhPN2/S9fr/HvbAxjddAjfUKR2sDnSk0V4AWrQZLT+Y78EnN1wegRQc+6QfO2nftvQKPrFlWnOrCxndh6+b9pD2/PjHEuUMtkkXO05+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672241; c=relaxed/simple;
	bh=jB/wtZl7UN5hnJdp2qbmmyVS9gHQul0I0ky83V0IYDg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iGQDcIF2R73pM8ZZuecL34HBMLd9DSKjLFo0fcOGTyiJgitckJIlrQ7oTgOMUEf7BZ4I4O2vvjMvKkPYtBEcvx16/ttBqOsyT6CjnFgA9B9XjO5f6Csj/tXGctibQ8T+NKC8qp8+8HPzjPqbaIqltlFsi6k47oPEoYQombL0x0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAXky462; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E218C4CEF7;
	Fri, 12 Sep 2025 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757672240;
	bh=jB/wtZl7UN5hnJdp2qbmmyVS9gHQul0I0ky83V0IYDg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=PAXky462f4xEQ8QqJWPVSaBwOcXkKZt0ie5gwWQxVQhXJ3l8FepUiUuqOHteG7ijq
	 rX2UQTNsig7aIi6Y3QWW+82UiRAS2Cq9lycr4VWZoswKawGsMPZ7g5TvVRz83DJSgi
	 26mD02XwqTkFNsww1WH4bt3b0oEaFegNbrg9pzd2XswS0tRom5B+Qf0Obl8mLf767p
	 TcI6E95+ih45b7zOfRpxpl6Ez4949rUSwhn6BtJ03AU4XywzEBKUGNHoWQgguUouEu
	 JSExuC+6ztn2esC4sXOzCg5GHHb+ykDXnX9TEauQUIsQm4qi3JcJoLB+0Klb0yo/kV
	 u4CVfIDifVYzQ==
Message-ID: <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
Date: Fri, 12 Sep 2025 12:17:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
To: Jai Luthra <jai.luthra@linux.dev>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>
References: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
Content-Language: en-US, nl
In-Reply-To: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jai,

On 12/09/2025 11:55, Jai Luthra wrote:
> Hi Hans, Mauro,
> 
> The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:
> 
>   media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for-6.18-ti-j721e-csi2rx-signed
> 
> for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:
> 
>   media: ti: j721e-csi2rx: Support system suspend using pm_notifier (2025-09-12 14:37:56 +0530)
> 
> ----------------------------------------------------------------
> TI and Cadence CSI2RX driver changes:
> 
> - Multistream support for Cadence and TI CSI2RX
> - Runtime PM support for Cadence and TI CSI2RX
> - System suspend and resume support for TI CSI2RX
> - Misc cleanups

This should go through Sakari most likely, possibly Laurent, seeing that this is CSI
related. Several patches do not even have a Reviewed-by from Sakari or Laurent.

I can't take this, I'm afraid.

I'm not sure why we get a PR from you, was there some misunderstanding?

Regards,

	Hans

> 
> ----------------------------------------------------------------
> Changhuang Liang (1):
>       media: cadence: csi2rx: Support runtime PM
> 
> Jai Luthra (9):
>       dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>       media: ti: j721e-csi2rx: separate out device and context
>       media: ti: j721e-csi2rx: add a subdev for the core device
>       media: ti: j721e-csi2rx: add support for processing virtual channels
>       media: cadence: csi2rx: add multistream support
>       media: ti: j721e-csi2rx: add multistream support
>       media: ti: j721e-csi2rx: Submit all available buffers
>       media: ti: j721e-csi2rx: Support runtime suspend
>       media: ti: j721e-csi2rx: Support system suspend using pm_notifier
> 
> Pratyush Yadav (4):
>       media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>       media: ti: j721e-csi2rx: allocate DMA channel based on context index
>       media: ti: j721e-csi2rx: get number of contexts from device tree
>       media: cadence: csi2rx: add get_frame_desc wrapper
> 
> Rishikesh Donadkar (2):
>       media: ti: j721e-csi2rx: Remove word size alignment on frame width
>       media: ti: j721e-csi2rx: Change the drain architecture for multistream
> 
>  Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   39 ++++++-
>  drivers/media/platform/cadence/Kconfig                            |    1 +
>  drivers/media/platform/cadence/cdns-csi2rx.c                      |  491 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
>  drivers/media/platform/ti/Kconfig                                 |    1 +
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 1167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
>  5 files changed, 1300 insertions(+), 399 deletions(-)
> 
> --
> Thanks,
> 
> Jai
> 


