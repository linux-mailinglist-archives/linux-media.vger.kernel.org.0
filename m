Return-Path: <linux-media+bounces-38183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E812B0C7CC
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7003ADB56
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B69A2DECB2;
	Mon, 21 Jul 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyUvwv4W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092EF2D6639
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112335; cv=none; b=r9mL5EX4dAiaKnjXn7cJsZLyK2xKm9ujFGkhn9HLCiQ74vTq5UKvPen0cMbZRbnLwfLWJ7Gf3HZ6l1XQQDQ41AISgsfrupTH4QKqvvKsEkTWG5n4p8mo6jyqKkjEwVGTFr4ARAtXSM+3zIMBIwnszxQXHsnaTiHEPxUmSWsa4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112335; c=relaxed/simple;
	bh=hHQZBeBf3EBARwr7PEypn3LS11Brl87EQCvCG6v+AsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogTO0TXyaP2huLlK7ZDEseoJibZMTr6hSOuE6HEzA9J+nLIYYp7m7qL0+oK3mBKBMH1GiaZbaP9me1VAaOlruS/vq5RTKRSLfbnxn+10pYecP+SpNDYjlvk8OPRYJLOCjKL9FJ4LgGZJgFEtIj4uJ3VsS3A2kMbBakBC1NTi9Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyUvwv4W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D813CC4CEED;
	Mon, 21 Jul 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753112334;
	bh=hHQZBeBf3EBARwr7PEypn3LS11Brl87EQCvCG6v+AsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CyUvwv4WqxsZ8CKdqniMRs/kpWLtoCHYd9AvAAhe20b80/EKG1d7r1zAATlKE2kgq
	 H6U6kc+o0oYKf9FuD1RiTwJZPn7843jqIfKr6OnnkeNwT/ie6y2z6jTT/5+3cWqI4x
	 OXqVAt62cIkJ5up0Ni+ElcE5v9rTfB9JQqtEeGM7arwQ2CkqPlfH4tsbs/xWqV03I4
	 DpfaSd2iJU835bAXhi5fHqzn5MsyNd0nsYCLFkEvgnQyjNyI0x6sk9GgPkhEseN1fD
	 ehL9SZqEqQ1OOQIIF6YzNxZuB8a8Vq1jQdMiS+BkrFmpzG1gMM9aWjvgzQqCHVJdS3
	 FTyy+X0w3pnxw==
Message-ID: <8117e5d7-2e30-44ee-b51d-9111db6f18dc@kernel.org>
Date: Mon, 21 Jul 2025 17:38:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: uvcvideo: Misc fixes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jul-25 8:52 PM, Laurent Pinchart wrote:
> Hello,
> 
> A small series of assorted fixes resulting from recent reviews. Nothing
> much to mention here, please see individual patches for details.
> 
> Laurent Pinchart (3):
>   media: uvcvideo: Drop unneeded memset() in meta device ioctl handlers
>   media: uvcvideo: Add missing curly braces
>   media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header
> 
>  drivers/media/usb/uvc/uvc_metadata.c | 23 ++++++++---------------
>  include/linux/usb/uvc.h              | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+), 15 deletions(-)

Thank you for your patch-series.

I have merged this series into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

now.

Regards,

Hans

