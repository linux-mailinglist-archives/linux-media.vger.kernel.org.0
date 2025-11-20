Return-Path: <linux-media+bounces-47494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66873C742AA
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4B2E4ED2A5
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFC340DA5;
	Thu, 20 Nov 2025 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQU99WBs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332AD33BBAC;
	Thu, 20 Nov 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644484; cv=none; b=EOwk2ycL3CXz2Gmi3O9H+36UGmsTvhWMUFmM2eF7cS1D1zcn1LzuTX1XnFLr3KwyXLeAG2IzrvjrNDogjo747Xh5pgCCO3qcMwrqillnPXnvuv/g30f7BC/mizAlytMjaBS8NpN3lnLzG6aRyPM3RTikCnVfTmdqsYWLi3Zz1hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644484; c=relaxed/simple;
	bh=690R1aIqXEsiV77CfJMMMfFWoAn24bRFYzdx8kvtixM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyX5aHGI5mlR7LcKqjEQJXhC46xy1yV4x8a9/DL+EhXpHEQMuFxGy2knm9UKTwRw/NPRi/uea4EI710zX0TUxwQFVou7ArWZoU/bKU0sLazygff6iYrCLPk8iloQVozGFLLZXv4SJ3vBp78UoE0A2NigY9qqfa+x4Pc6iLpPj4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQU99WBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8643C4CEF1;
	Thu, 20 Nov 2025 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763644483;
	bh=690R1aIqXEsiV77CfJMMMfFWoAn24bRFYzdx8kvtixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQU99WBs2qEKt6naghA1nCIHyeEQ8pr6t2TvmQ1rUMQvca0y8a34RlFqHlH0ijsLe
	 hKqPJvaWHza2aI6+rV6Yqw/59GMmhbY/5OmT9UhCrS1znroxyYwXMhujsi2MPFOqr+
	 DaukWIRw6WlW2gklO9cjrBEkzlBFNL97/IuDGZ4wV/L6gRrkir/9S5MrtIJUsXdBL3
	 0qFZcCwVfoCL9VHMs7fch7vC4gauFl3f4VDYYUIc5wXb8O6v5bLUQbK0McESRSMZRI
	 tmfVpOHfs1mPxENo8XIWci+ZtrVWJgL+MmD2SMW2IvnVo+cXxu7udsZZDQm8KORF62
	 jNMknfrlaktug==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vM4Um-000000003n1-05j9;
	Thu, 20 Nov 2025 14:14:44 +0100
Date: Thu, 20 Nov 2025 14:14:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
Message-ID: <aR8URPPYRBuVCdDk@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>

On Tue, Oct 28, 2025 at 11:04:52AM +0100, Johan Hovold wrote:
> This series fixes VPU device leaks during probe of the mdp driver.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.

> Changes in v2
>  - drop incorrect vcodec patch since that reference leak has already
>    been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
>    firmware interface") which added the codec release callback
> 
> 
> Johan Hovold (2):
>   media: mediatek: mdp: fix device leak on probe
>   media: mediatek: amend vpu_get_plat_device() documentation

Can these be picked up for 6.19?

Johan

