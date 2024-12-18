Return-Path: <linux-media+bounces-23722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B0F9F6CEF
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 19:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7E6916A1CE
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 18:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98401FBEB8;
	Wed, 18 Dec 2024 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh8F4QY/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295141FBE92;
	Wed, 18 Dec 2024 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545515; cv=none; b=WTnYwuTQrXbfbbNKVx73+m+MdSG68ecMIN+UuY43lN29B2GEXjawXbRgYoRuYZkyIcIujPSMN6kw4UG/3LlnNj6IYGZFIaB7F67A7K3Bz4YA3AcQRU+NTGNmvewg05Je/yK5kjZdUekrtX4+cSfUk1jN5Q/zAurk84FB0y1Ds4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545515; c=relaxed/simple;
	bh=ew1JHjhqkWJmDSXVbI/FKPuwdWHyw6y2n4tHfV3qKKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMZeTQJcuN4vQhiATcDcp1012DTJlrJJP3jBfXewIbZiWDtYbX8ExLOe3E+z4ftTYl4Z4TXQbKSQWm60MYYtvanm3/qqo4GnP7oKwZaIUtCvTbQrkxvW1a6vljhTyqsr5Esc1UjQiiV1pE3Co5+5QYJoaTc0Ygdr+PEDnantxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh8F4QY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA4AC4CED0;
	Wed, 18 Dec 2024 18:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734545514;
	bh=ew1JHjhqkWJmDSXVbI/FKPuwdWHyw6y2n4tHfV3qKKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bh8F4QY/XZJIzgRGMofeHwHQ67y/72nMQxtcMFh9TkMJQUrzY3mW5YhoT39yRBipg
	 mWxP86dxBQSu0Od693xazF2e1NZ5DJHTLRypK9K7+DJL5EecOJhBhbzLZWnYZYjcUE
	 DCT9IDfLJMviQhEjzXW6K7HFHQe1gCQubk+HjviIHdfzQxeN6VkDTfy3dn1JfVCKYy
	 NAPMtF/nXqltuTTBk5Y0B9HUpCSMFvSag/Bq+jVzIWCmfFcKLF6upYBasRIJmkmwDo
	 oucJOZ3zKR8UAJCA4sMgVX616a5zepJoVl0XULMj8ZJkXrrJblHzl+v2YitcJfz/JT
	 5LlWEc9i3FyOw==
Date: Wed, 18 Dec 2024 11:11:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241218181148.GA2948182@ax162>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
 <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
 <20241217174628.GA2654633@ax162>
 <20241218124505.xwgsnpi2rvbngqvs@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218124505.xwgsnpi2rvbngqvs@basti-XPS-13-9310>

On Wed, Dec 18, 2024 at 01:45:05PM +0100, Sebastian Fricke wrote:
> I have sent out the PR and it has been applied to the -fixes branch in
> the media tree, due to the holiday period there might be some delays but
> I expect the change to soon land in Linux-next.

Ah, thanks a lot! I was looking at the main media tree's fixes branch
but I see it is only in the media-pending tree right now:

https://git.linuxtv.org/media-ci/media-pending.git/commit/?id=8b55f8818900c99dd4f55a59a103f5b29e41eb2c

As long as it is on its way, that's all that matters to me. Appreciate
you getting that process moving!

Cheers,
Nathan

