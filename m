Return-Path: <linux-media+bounces-13819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB121910771
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9CF28450D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273721AD499;
	Thu, 20 Jun 2024 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4vVGhp9a"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE141DFE8;
	Thu, 20 Jun 2024 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718892326; cv=none; b=CXuipTozxua/KmvaRK2WpSeDEbc5bWuubbzBT4puVRzvCzgEsjfEuNgapIq54kwQyd3KT/io5XsfimnP0PaMZ+MfONorXY/aXxj7gKGnMUImCgdzYgKSl88hkAh8jBgPVjqYN1DY9MTNwoTk8iHLQZfm/IukiY+3EKcNteFopKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718892326; c=relaxed/simple;
	bh=OoXfGaWkhDj/PfM8zobnCd3uhBuc4ysc1vSHDDRSRWE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE0uhrOqF99sVO/nLAMYIhdwj6eDBnTl5nsl7YTUZhLmV2Ov2tyBBiy+JpNX/GsCxHVHX4zhHKZKL6PG4fpob6eMfmXkopLaq7Rp0rtFEUqq51uFJV6xprebc7z3ICJOZ3/d1/YsObgVQRYKhQh7Cu1Dz1qpbbIN2s9FLobYY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4vVGhp9a; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718892323;
	bh=OoXfGaWkhDj/PfM8zobnCd3uhBuc4ysc1vSHDDRSRWE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=4vVGhp9a2oNFy7fmpMTTu/k33zi8F84kKFY3HJV27PQRq9NJHNW5YYykuVIRw8DaB
	 MzXl2462a3Bd9C4YMrmj70hoYzXGYXtXMWfntkeWBY3CiUZjy1N1gJU0rebGp/EzxV
	 smJm7fRp4EGkKjAdemAwQofPwBcPsAaYwBolf9hOL4eUsWtQfga4U5eJ0zNS4Lqfvi
	 iQ6fmIWl953g5jCUK+1dBDm/7y2rtOBbC840EBOMPO1mRaN0AXJ5id+97OVvokKJyf
	 NnIj3N61U8JyyA0k6Q7VG9q7MPaO1xFvaVrXjoKyzs6F0TLs1BWWU8XE4bYWjBz7Wz
	 SXixM31jAdt3Q==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3D3F637821B9;
	Thu, 20 Jun 2024 14:05:21 +0000 (UTC)
Message-ID: <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support
 runtime suspend/resume
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Devarsh Thakkar <devarsht@ti.com>, "jackson.lee"
	 <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"
	 <sebastian.fricke@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,  Nas Chung
 <nas.chung@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>,
 "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
 Vibhore <vibhore@ti.com>,  Dhruva Gole <d-gole@ti.com>, Aradhya
 <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
Date: Thu, 20 Jun 2024 10:05:18 -0400
In-Reply-To: <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Devarsh,

Le jeudi 20 juin 2024 =C3=A0 15:05 +0530, Devarsh Thakkar a =C3=A9crit=C2=
=A0:
> In my view the delayed suspend functionality is generally helpful for dev=
ices
> where resume latencies are higher for e.g. this light sensor driver [2] u=
ses
> it because it takes 250ms to stabilize after resumption and I don't see t=
his
> being used in codec drivers generally since there is no such large resume
> latency. Please let me know if I am missing something or there is a stron=
g
> reason to have delayed suspend for wave5.

It sounds like you did proper scientific testing of the suspend results cal=
ls,
mind sharing the actual data ?

Nicolas

