Return-Path: <linux-media+bounces-30966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5FA9BC6D
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 03:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FFF468172
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 01:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4059B1537DA;
	Fri, 25 Apr 2025 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SPLlJN4K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8512EBE7;
	Fri, 25 Apr 2025 01:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745545084; cv=none; b=Q/y+aWm7hQwtXx1et1lCzWqEPXS01B5u3AuPvsfcZKNcjg9B2g9xtDlhBZ9xOl3kvbVDMxa3A4NohqkZ66KyZS3Gk6wjOEU+qJxQrcyFvWgYhMad6M1ACcQl+0BxIrlot09a1PycaPH08QxzlGAH2MQOnk09i5C8DXAub4kkvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745545084; c=relaxed/simple;
	bh=lj4/F/U3f7X3aAx/fAzeWcWcAOrau3CQvSstWIVxob0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBjjLC1r35prl+tpdBxrb7V3YL0Q4W+d5qvp1iGw8o3q9gNs2Sf0DSsNly5XYZbY98XmnUjRzNNmNjZ7hv+uCYY2acMH8gpay98npnKWGiWODx5QcNIvlJHI9J9pI9p6toO9wZHvHXOPS/Oc32ONVUTaYzJkpNmzlJOxaX3tb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SPLlJN4K; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wxtRcz/33uGdmZmU3FiyNrSabB4K+ePSyN7XL7Ah7Jw=;
	b=SPLlJN4KzWXlr871NdLyCV3uvHLRYDTx4+fL0KG+OoMyB92edVzMl0kLZVdjzR
	Bak/po+uO0ofuuAt6oXw/WfNk6XKFe8x1KqYFNb5XJ+DMRmK63sug5YeUHGy9sC3
	eZjDtuemsYmry0SYD8IrxC9/G9dFdP70BDOGtWgMT+9e8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHNko55wpokC_SAw--.37001S3;
	Fri, 25 Apr 2025 09:36:59 +0800 (CST)
Date: Fri, 25 Apr 2025 09:36:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: add exclude for dt-bindings to imx entry
Message-ID: <aArnOZapBlDgJ6sY@dragon>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
 <20250410-maintainer-mriesch-v1-1-cdc5c6c68238@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-maintainer-mriesch-v1-1-cdc5c6c68238@collabora.com>
X-CM-TRANSID:M88vCgCHNko55wpokC_SAw--.37001S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4rJF1xXF1fXrW7urWkXrb_yoWxCrb_ur
	W8t34kuw47G3ZFkasruFn8Gayfuw18Wr15A3s8trZIqayavFWDGr1DtrnIqr1DtwsxJasF
	kFZ3XF9Yk3y7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eyIUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQw6ZWgK0Y1WOAABsD

On Thu, Apr 10, 2025 at 09:41:30PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Since the IMX (as in i.MX, the NXP SoCs) MAINTAINERS entry claims
> everything that contains the name "imx", hanges to device tree
> bindings for any Sony IMX image sensor are likely to be sent to the
> maintainers listed therein. Add the missing exclude to fix that.
> 
> Fixes: da8b7f0fb02b ("MAINTAINERS: add all files matching "imx" and "mxs" to the IMX entry")
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Applied, thanks!


