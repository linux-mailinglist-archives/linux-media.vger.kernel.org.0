Return-Path: <linux-media+bounces-33688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B722AC91B8
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 16:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2181BA0314
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 14:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A6423497B;
	Fri, 30 May 2025 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d4TOFwsG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783D15E97;
	Fri, 30 May 2025 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616061; cv=none; b=NG+HGxWX7DFgm9QAVBGkF+/k/iJooXuSQmm58CeXJLTLBJiEB3spToqyPhdiMrM0CxTJAfknu2LFsHuU8mZTvkK0HznC0WcLTH9NMT5HxVjb0/JAXzAZb82lg5nShbb9qIHg4gRzHaT+IS0iNr7qj/vkzQlwwRLMciaP3sye1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616061; c=relaxed/simple;
	bh=YuEWTcZ3+7dJ6CPGfVqw5uB5EKngIixvUdcQNCJDJUk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lonkiUWr0RfW59TIMuZsTZWm1W2NUZvYbu/+wA9SNkaSVO4b/fvpxLtcixUlHO7kz6LnwqHnH/6ywgrKDNPvU2j3bH/E+PcKmbrYkYDiDeQgNhAlOkxfyaATz0M2pwvi3fzaY8T2bfSBftK/NBPCzqZkN2zCn9E5sGZdjm/IRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d4TOFwsG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748616057;
	bh=YuEWTcZ3+7dJ6CPGfVqw5uB5EKngIixvUdcQNCJDJUk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d4TOFwsGMh/NAP5WONQXEaz+z/IkO7TpXa9X0Z39nSgp9R8C8lBcRLZD9KwrWvQMv
	 P+oZKUNZoQelaZXC0oeC2pngBQusHVctcm2nc1Lu8Wd+ANaPnmYKxwH6GQaPNqu/ib
	 uWfKdBS/x22mVh6AIMwsXWebYoa629xwJjnwjrjHhFc+dYc1qVIi1mkaq9x0wOZHoM
	 P33WJYoGqiIi3Dg/Y5sN0+MeLjxYx+r+S42Ouu7sP06otHecvEOR/6mQqpp67bd68u
	 /MAacM+SWSTT4fpOR0h8ssgL7qNj7aXITAchZfNiAhSH+n1id+HUr40xjFsk22Jn1A
	 CzLi3CW/YF0yw==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB37617E0C37;
	Fri, 30 May 2025 16:40:55 +0200 (CEST)
Message-ID: <7a372c544c370d64b916a7092aabac555710d7c5.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] Add support for MT8196 video encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	angelogioacchino.delregno@collabora.com, wenst@chromium.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Yunfei Dong <yunfei.dong@mediatek.com>,
  Longfei Wang <longfei.wang@mediatek.com>
Date: Fri, 30 May 2025 10:40:54 -0400
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
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

Hi,

Le mercredi 28 mai 2025 à 14:36 +0800, Irui Wang a écrit :
> This patch series add support for MT8196 video encoder.
> patch 1~3: Add a new encoder driver interface for new VCP firmware.
> patch 4~6: Add MT8196 encoder driver platform data.
> 
> About adding new driver support, the v4l2-compliance report shows:
> "Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
> The 1 Failed case is not caused by current patch set.

We really want to see the full report, simply reply to this cover letter with
the entire report to fix it.

Nicolas

> 
> This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=15232
> 
> Change in v2:
>  - Add support for VCP encode process.
>  - Add MT8196 encoder driver platform data.
>  - Rebase encoder patch onto decoder's patch set.
>  - Fix some review comments in v1.
> 
> Irui Wang (6):
>   media: mediatek: encoder: Add a new encoder driver interface
>   media: mediatek: encoder: Add support for common firmware interface
>   media: mediatek: encoder: Add support for VCP encode process
>   media: mediatek: encoder: Add a new platform data member
>   dt-bindings: media: mediatek: encoder: Add encoder dt-bindings for
>     MT8196
>   media: mediatek: encoder: Add MT8196 encoder compatible data
> 
>  .../media/mediatek,vcodec-encoder.yaml        |  12 +
>  .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  19 +
>  .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
>  .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
>  .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
>  .../platform/mediatek/vcodec/encoder/Makefile |   1 +
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  37 +-
>  .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  28 +
>  .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
>  .../vcodec/encoder/venc/venc_common_if.c      | 678 ++++++++++++++++++
>  .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
>  .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
>  .../mediatek/vcodec/encoder/venc_vpu_if.c     |  51 +-
>  15 files changed, 843 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

