Return-Path: <linux-media+bounces-44134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC6BCA892
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 20:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D72318852D1
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A908986331;
	Thu,  9 Oct 2025 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7cLrXOS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBFF246BD7;
	Thu,  9 Oct 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033302; cv=none; b=q3rrtMjoWQsa7RR5dP5RmsOS/5S4gdos6F88m8ngtubWhACScvSAikABcFAqqnt6i0nbgIXeOgtkkdRMoaRz4AYeVksMPC8UtNtCmmja0F/DycIN9SpNwxnU/ohEoPUnMlqDuFz66M4E+/VE4TaOYcRuuaz1uGWM5b9+1FLWtU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033302; c=relaxed/simple;
	bh=gFSHtsrqHS0nB/eq5mW+h7jeWQpgprps5uurLkFEa9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O99sip1NhNptt4I1RV0seLzg2ifg0w6H2BXigU+0tBwC5zFGducbp0WE+ypKLCPZ+4yYJY4D8NTzSleRqDVqMvpweX9PDQcQxzWxDhgShT1tUprTXUVcBs4GASlQTdXEaBrjn+xCKCWeGSV1/SVI7/3PNTLS/8um34EKaI9jO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7cLrXOS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6953C4CEF8;
	Thu,  9 Oct 2025 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033302;
	bh=gFSHtsrqHS0nB/eq5mW+h7jeWQpgprps5uurLkFEa9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7cLrXOSSPv9MR5A/ylYV0/Z+zpdfDGiEkMnPvlAxx9Ss8U4TqvcmeCei37DqCZCN
	 sNXIjhS0l8rGmzuAegxsmG1gHFC0X5QNR1HstQwsCsFJzRONN2kIqIu7RiBnZbZ8MT
	 aW89CaU7aR60rmnELGIBk5rT07iD+S92PJtpGCrDEMXlfTqEUc6aCPf+rl34ouMI0Z
	 HAg8raaFtDAtTx9xRXg51u41Bf8/8Xgcd/U9mSuhDrduE9uUjip1Q/RN+PZj7Yypvw
	 jvlU3uNMgbnhT+TsQfuCd0Gft1ezc5fGn2L3W3KgqqRmJCOTZdmTm1ncaWLA1JLrxT
	 7giywDkL22yvQ==
Date: Thu, 9 Oct 2025 13:08:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com,
	minghsiu.tsai@mediatek.com, linux-arm-kernel@lists.infradead.org,
	conor+dt@kernel.org, kernel@collabora.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
Message-ID: <176003330002.2945848.1684483628516504811.robh@kernel.org>
References: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001183115.83111-1-ariel.dalessandro@collabora.com>


On Wed, 01 Oct 2025 15:31:15 -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
> Path to a DT schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
>  .../bindings/media/mediatek-mdp.txt           |  96 ----------
>  2 files changed, 169 insertions(+), 96 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


