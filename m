Return-Path: <linux-media+bounces-34126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8261ACEF64
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97623177324
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5921A444;
	Thu,  5 Jun 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RkHfuRJG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735461D8A0A;
	Thu,  5 Jun 2025 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127312; cv=none; b=ZlQjEq3JxUMKrNl1tusbWw+7wODZVlzfVFB2Ttz+LWPlomJ8HcbVwRsNvyFRNMRbv17ySRyoI3NfWI4s+I71nxE87FEk5u5HL+wMTyESLqjAHDjC0rodTNoDCATJ4RXlpjC6AyF8TaC+xlmfcX5ys8QM8C/wLOXuoPp3Cje1dFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127312; c=relaxed/simple;
	bh=TXksFdyyDEdsxI0qhkErvaqcJ1KZyhdNTbg4RY/u2X0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIecjlmo110FpYUoPazHONJPqPgHA8p9Fy8mNOMYkLrcPtvmq8pevhFD3tPBsxTu3H8FWIyCLJ4HL5Qjy62GoWpoWdvKxU1q+Vu9xu36/UBf8EBFdcPRhad+Jk7/X/mpBDquWjieRJSkSmdmysLWckbfnycx/+XMQritG7VWqpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RkHfuRJG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749127308;
	bh=TXksFdyyDEdsxI0qhkErvaqcJ1KZyhdNTbg4RY/u2X0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RkHfuRJGvu2PRqbK//2suBckGm9ffe1l5JEIk9rFWHq8Ho4RRz2CbZfNpDkefa7IR
	 7ivclm4GTtO/WAsZS2HTJaY74TjVDfwKebm2ARvuJdd3vAIKVtrVPG2h/vR2FNq2kE
	 zcRAQq0rtvj6PfRxp429qLrhkyC+OTVg3VG9rZuqjkyFmGNrRajnyb6kDcH3MhUCOD
	 19KpyEZX03/f2wvXeGT4zUpQ6fGHHYS8V9wMRD7R4XQZgLYTudIzmboyGJcY3Vsr+c
	 J09sj68/2iTt3a/zW0eVeUkJdp6bI7h+7XJ/YkNamWFhO9c4BbuBvM9z8XwNluKEEx
	 ezCImSkIrcdcA==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BE4A17E02B0;
	Thu,  5 Jun 2025 14:41:46 +0200 (CEST)
Message-ID: <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	 <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
	 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, linux-media@vger.kernel.org, Sebastian Fricke	
 <sebastian.fricke@collabora.com>
Date: Thu, 05 Jun 2025 08:41:45 -0400
In-Reply-To: <aEFoCvPe4zE48UG7@kekkonen.localdomain>
References: 
	<20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
	 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
	 <aEC05991kEIIifDB@kekkonen.localdomain>
	 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
	 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
	 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
	 <aEFoCvPe4zE48UG7@kekkonen.localdomain>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Sakari,

Le jeudi 05 juin 2025 à 09:48 +0000, Sakari Ailus a écrit :
> > It's not user-triggerable, if this happens, then it is a driver bug.
> 
> If there is a driver bug, it could well be user-triggerable, wouldn't it?
> Testing may not uncover all such cases.

You are both right, if the driver is not used, the warning will never
trigger. I was worried of the hit of a thread safe ONCE implementation,
but WARN_ONCE is simply not, it can warn few time before it stops if
called from multiple CPUs at the same time. In that specific function,
I can move all the checks inside the lock to make it truly once.

Now its up to you, I don't have strong preference. These are driver errors,
and usually quite critical. They are not bug_on simply because we have a
crash free resolution, but its probably not functional anymore.

Nicolas

