Return-Path: <linux-media+bounces-30165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4E1A88140
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52FEE1886292
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45872C3775;
	Mon, 14 Apr 2025 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b="v117AYc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CF268FDE
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636336; cv=none; b=Tgma+EXQYBuKEWfZyckEc200Zr3ruki9MV62C+uRe9oyvXVHTuSiLBhOKKm1uw1Q+Nfj6NM157dmbpazUpmKEI4jepdqrgRlxomewHuBLIT/JaNtddGBXw9ilE36eBlGxMWpbZoGrTcZ5veCWWwpovYuJb3o0GBM+wUcksJhTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636336; c=relaxed/simple;
	bh=e6KGmZzVC7t2PM+eoJ4dnBSPZIekZNzEw2vg+HodOGc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=OIPtguR7iMNj2lLkJo/dcI9seaWLC1tx9i4g7Fj/Jh+oVwfVHDZjomPMPuthyMHfB4jlXfnGTelWztD1h1DFB62BK8HuNmY3If92ZJFtwcf0b6GEEuhiemywz0UXnpwWxPuzzGm2M88pHiH8BZI+MW+8/4D4PbPac/lePZ0iaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com; spf=pass smtp.mailfrom=tuta.com; dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b=v117AYc6; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.com
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id C2AF97A2B8C5
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 15:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744636330;
	s=s1; d=tuta.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=shpezcXuOsHMGvT5DZ3M89FyPC7giy76uW/AsIB00UE=;
	b=v117AYc6F+SRkdGHgJNDl8URWNt1ar+ogkWviXWSkxkViHKAkILAegvK0v24eDcI
	h3PDs6/yqmxk0iUGPGlxDg0UiqRzYsr48gI2pjqTxLlSWjU/mE4p6m4GoLdBz5G74zL
	ZAjHqgBU1Sj7IdlFRzXuoNGz7UnFpu0iwv0xyOfiMXoODGiAzFa5k6jYRscK9GR2q6R
	RCqWcTQZSzRKubnEkSuwFsaAAxQ5/oVlgDrTVCa/PpFmLalmTVzcYCM/ttrCmZ9fCGk
	SafS4PpygRxfq4wAiS1b5e+/zFfpFQdEG6vIGM+yKbR17BUnqf8rqdSMP1TAsARxFtB
	TVP6kjEMQg==
Date: Mon, 14 Apr 2025 15:12:10 +0200 (CEST)
From: Andrej Gardijan <andrej.gardijan@tuta.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Libcamera Devel <libcamera-devel@lists.libcamera.org>,
	Linux Media <linux-media@vger.kernel.org>
Message-ID: <ONoQR3W--F-9@tuta.com>
In-Reply-To: <20250414123845.GD26798@pendragon.ideasonboard.com>
References: <ONn_aOl--F-9@tuta.com> <20250414123845.GD26798@pendragon.ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

thanks a lot!
I'm currently working with communication devices with audio and video capabilities as an embedded Linux platform engineer, so I'd like to learn more about libcamera through this workshop.
I'm pretty new to it, although I'm a fan of FOSS and Linux. :D

Kindly,
Andrej Gardijan

Apr 14, 2025, 14:38 by laurent.pinchart@ideasonboard.com:

> Hi Andrej,
>
> On Mon, Apr 14, 2025 at 11:16:57AM +0200, Andrej Gardijan wrote:
>
>>
>> Hello,
>>
>> I'd love to attend if there are free seats available!
>>
>
> There are still seats, I have added you to the attendees list.
>
> I don't think we have interacted before, could you briefly introduce
> your interest(s) in libcamera ?
>
> -- 
> Regards,
>
> Laurent Pinchart
>


