Return-Path: <linux-media+bounces-4325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A98400BA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 09:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30D1281D68
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D9A54BEB;
	Mon, 29 Jan 2024 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="epUzpIVV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8B54BCC
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706518708; cv=none; b=O1gkEm5U0T3Jekfx3dtvggkpsnRILxerLT/qelQQD8kkOMIrrtPOu0eWYAMRsciwRygfnRft7MVaH9vPeJLk3YGg5KfqCTmaTDnouBGSQRUe58I6OVzxswib52P2gSdqG1ahfSCZZN/v6RxELB2vTAu5nI/obmina2IBk41Wz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706518708; c=relaxed/simple;
	bh=RT2ytjEgBSlbDe9NTXofj6T/LcCAnRedINbttWTN51k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=menIMjrR8p07Jup41l1ifXq40fHaIDw4+5p2n4RNzVeHS/v2BH0g6xeO1t/SNZCV4/xw1/VehG1JvK0ME5Z4Ty3IOcs+suM6QPFr5Bo39sTvHiYzXcc8v4qibcPCsYwZtbdhDWGFSVZy1m7QsICRSEo/ByiRqltUPGPRhwnXqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=epUzpIVV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 778A86015;
	Mon, 29 Jan 2024 09:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706518625;
	bh=RT2ytjEgBSlbDe9NTXofj6T/LcCAnRedINbttWTN51k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epUzpIVVBN9j0VgddJGYKz1++4+M+zg0NAzloBhcM5444nUU9U9L4R8gG4+wWqpoe
	 DRCU+anDv8dx00vOtKAIamoXjZKBk/ha4D1uQBmtd6QRJ0q6sLWqRNrJGDE/T2oK+7
	 J0DhkTxvgV98zcTxjwRJFG7SBKAyk+C2KX6PZC/s=
Date: Mon, 29 Jan 2024 09:58:20 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Weird default vblank value in ov5693
Message-ID: <xpzavj24xdbeixfc7lw7rccx3zyhodqhcsceovru7bgcfvdp5s@w4jbols3o2wv>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>

Hi Hans

On Sun, Jan 28, 2024 at 09:58:41PM +0100, Hans de Goede wrote:
> Hi All,
>
> While adding vblank ctrl support to the ov2680 driver I was looking
> at the vblank ctrl code in the ov5693 and I noticed something
> which I believe is weird / undesirable.
>
> When setting a new mode the ov5693 driver does not keep the current
> vts value (adjusting vblank to keep vts and thus the framerare and
> exposure unchanged).
>
> Instead it calculates a new vts value, resetting the framerate
> to 30 fps; or 60 fps for smaller resolutions and then sets
> vblank to the new (vts - new_mode->height) and adjusts
> the exposure control-range to fit within the new vts, potentially
> also changing the exposure value.
>
> This behavior of the ov5693 code means that switching resolution
> also changes the framerate and the exposure value which seems
> undesirable.
>
> The vblank and hblank control values changes on setting a mode
> is unavoidable but the framerate and exposure value changing
> at the same time seems undesirable.
>
> Note that this also halves the max supported exposure value
> when going to a lower-res mode even when userspace never
> touches the vblank control.
>

Would you be interested in reviewing
https://patchwork.kernel.org/project/linux-media/list/?series=697777&state=%2A&archive=both

and discuss there what the desired behaviour should be ?


> Regards,
>
> Hans
>
>
>
>
>

