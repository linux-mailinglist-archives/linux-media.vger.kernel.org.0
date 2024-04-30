Return-Path: <linux-media+bounces-10508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 165118B8214
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 23:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454961C227B3
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 21:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386D61BED74;
	Tue, 30 Apr 2024 21:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FF8Hu1hj"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F51A38F0
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714513649; cv=none; b=BvAVN1aJwb0dF3EmWZlPMZ5Ya2L9tPH+tvpUVi9QBHBLs1nWczLvqhNRIChekSDXz6i/zDVP8822AdZBlqG2CrxioSa0wxH17dRkfO+Tb9K7V/h6PAkqiDGUMM3DLNAeAaO24w14ytwN0cqN8G7GW/CDIoWoPuLWT7oFuql0FVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714513649; c=relaxed/simple;
	bh=5Zw4jQPO4dgWIRp7ccu5fUK2c/y27wsIZg85s66lXrA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kwOPKoILInvN0RhllThHi1p8RVoad/uU47Uj4zdJeZHDTapSqUlDrS6NMhY29P+BCbmQV9nN/A/NLNWW+6J6Hv3jObV5HKQX+pBFka07Rq/BgfJo3hpVHa2fB3+2oAK/ubTjO87k/7fmiOIatyl5lYw0AVv8FxfB+rj+ursdvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FF8Hu1hj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714513646;
	bh=5Zw4jQPO4dgWIRp7ccu5fUK2c/y27wsIZg85s66lXrA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=FF8Hu1hjtB5mQLOU0X3TNCmum3ZyknXAF+fzewvOQDwJyF85UZ4EL7Cnf5bENgdRp
	 F/CBw/xuNevgqgce02RwkR8QoB6uPAwkWioDtvU4Mu/CZvJenKfUWQHvBmxGA2AmwT
	 /ePwjwFht/MRcVuCWohUks+1lzS57bXDCAjfaY7V3ynePqmw9Knro6RVxB4R7DYhtO
	 EfyngyjuaKD2tBRukpdWSPn84goqsUookWTQ/VSWEt9uXY8AX7aA0eL3BkErQcTrZa
	 8gpx544lZZ08KCciEaDAq6bSbAZ826zkg44lpEj7/TQyGTqC65pmXvgB/ywOrjY5U0
	 /chhA6Q/9HoSw==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B4D1378201A;
	Tue, 30 Apr 2024 21:47:25 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: Discuss the multi-core media scheduler
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <3321FDF4-15F9-45AF-A7BF-36C5CFA863B2@collabora.com>
Date: Tue, 30 Apr 2024 18:47:13 -0300
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A036D35-FFC0-46F5-B49A-E8051F3FF8E6@collabora.com>
References: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
 <77872a349e77e61e69f160629e1b53a97bc472e4.camel@ndufresne.ca>
 <3321FDF4-15F9-45AF-A7BF-36C5CFA863B2@collabora.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Ah, forgot to comment on this:

> Also,
> I believe you can mix entropy decoding from one stream, while decoding =
a frame
> from another stream (another video session / m2m ctx).

I don=E2=80=99t see how this is a problem. The current framework can =
already serve multiple
sessions as you pointed out.=

