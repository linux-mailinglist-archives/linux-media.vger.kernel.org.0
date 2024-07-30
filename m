Return-Path: <linux-media+bounces-15587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA899420B7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 21:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC1C1C2294A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 19:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F5418C93B;
	Tue, 30 Jul 2024 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5SNfnZW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7A8E573;
	Tue, 30 Jul 2024 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722368294; cv=none; b=Txq1AzmqHnQRzl+4bivP6CgwzZ2vM+KRuNNIhKaCJ/ahK1S6wjkblDlk95CMnegnYUzzdKkpF3mu3C0kvD+eb8HHgW9sxKSs/hN2NnrMNFPoOhV05QuQ7BinO0C43FFIo0aQ9BM5liBgtiMCNR26FF6sRpKWxZSTzE6UjpSHkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722368294; c=relaxed/simple;
	bh=1Q3oYDiFwiET51QQHldopTOPb7rykWbwFZNGKpQ8i2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1sSJE9HO3+stAqqNL8Mo31hwxzPGyurCneHbMHmOsJ8hmhUmHsMCnLQK6D+TlP3gAymucF045+qAViuArBytOiDYTLgAFlyhg1rBfbCLHGu/qBqd2cxRO4o79FKO8X3QsRDeianod1yZbQuSYe+t1rgjAH9y8ntuEv7l4OFhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5SNfnZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FADC4AF0A;
	Tue, 30 Jul 2024 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722368293;
	bh=1Q3oYDiFwiET51QQHldopTOPb7rykWbwFZNGKpQ8i2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5SNfnZWVKNhTbqkDx8vzpcjMhB1J8B0pmubW1Ic5UpwesI+PoYUgdb6lHpjZ3ovN
	 8G4sbzmEGw6Fa9pDq3kEk5ykliyFEgJhdzoUBp3N8cbxUmwBGcL237rdlZ+iON7U7d
	 go9TrVciOn6kRgo+MNe/t1BAhpD8YI72Beyl8toTfQ0475Rea3PRxXxi4Uc+msrn9D
	 qOjJM+06Fn7BOkE3EFuQ+MBXdr963OkncsOU61vh99Np3ucn+hTmvQt35e4w4nskUt
	 fm0e560NO6rtQ+/Dr0IPH5B/Oj+YW3cNAqBFXiS83UkP2WbhD5NEg+j44S56ix13V+
	 mhidA5T1hWglA==
Date: Tue, 30 Jul 2024 13:38:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Hsieh <andy.hsieh@mediatek.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <172236829078.2026749.11343043764808466079.robh@kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-1-c374c9e0c672@baylibre.com>


On Mon, 29 Jul 2024 16:48:00 +0200, Julien Stephan wrote:
> From: Louis Kuo <louis.kuo@mediatek.com>
> 
> This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-seninf.yaml     | 259 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 266 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


