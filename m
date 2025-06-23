Return-Path: <linux-media+bounces-35695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C44AE4B25
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CAE1676FA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3162566;
	Mon, 23 Jun 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bBQkVN4V"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297029B797
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696785; cv=pass; b=C3Bte7j/Koqi9dt+3z+gZi+S7QQmlCC7zRR9rEzc7hUn7K6ML4OOLS4BzYiGg50Ew5vGXoHS+TDzrjjcUkZkhmvjpxOC+NrYzJ6DisqaLsyHLq7wqLaEK2ulC13hOHuRjOO7qJeg3oeMh/+LMfKM7eVoOevmWF2KzR7Nlt+k9BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696785; c=relaxed/simple;
	bh=NkgVdBBLLUvb3NnmQRLtGjeIJKZ2vg+cqr2xMDIU118=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=id3Yhtjx5uDIYu8xAdx0q1zREX1H6nVCc9qTLPXTFmk5oOaSd+50j+DiClqsjPZx2MLDcCZHmBB6W/y5HGD23m/d963nhobhQiPCtE9Bvm+LuBte4cGRbku/TksJUp4vOXpMtvR42FLBrhFxiEEVrg131eS94Ecr8df5iSuKJ1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=bBQkVN4V; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1750696780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JldLcd/wOe0lmPDlqT/EgE7KiV1vapNRsDJnf8QyaG2MM+G2ckpMjuC0X/0up1Nh9bdF/5iLlsU66+rKz+rJ86coUd+9HMXAYApL7P2f0VCHBz7s+TvW3Iig4IFQK+vT3dYa+mEAM+dwg1L5NP9cpzMB67PDKw+hE5d3Ed5a/yY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750696780; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=VwUTiDS4ULMmb1cN5PW3eBPtTQ3cwt10uM2TXww8Cq0=; 
	b=MZ0HsZE03Dsm5dO1jFb9WNpQb+deKhPKaUET4kuXxPZdk7WboN3BiO+rbW7XYlI/YI6zGt/OEnRzDZXI6DIU5VbzktWNwj2Vucgk+t2jIuvUn6obAlmI53IGk87BkFNvw75R5SAXm1RxKXh36/RW0l3ypjLnD8PauTob56wUoYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750696780;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To:Cc;
	bh=VwUTiDS4ULMmb1cN5PW3eBPtTQ3cwt10uM2TXww8Cq0=;
	b=bBQkVN4VP2JBF+qACj+5CPTJdy+K50Tugf8BIKDhAxnQKJk8+/WzG5R/IEzCVzPA
	9Ktqr6qTSWg+CAEMs9xhh2llozmRD+s+ctfN3mME+PP0PFFMlSSKoDjeJjm6cxfLx+I
	VqmlktP57aSAIAsLb+RAyHmgyd5Ek0KoDd8F5cS4=
Received: by mx.zohomail.com with SMTPS id 1750696778561899.9974685643025;
	Mon, 23 Jun 2025 09:39:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-media@vger.kernel.org
Subject: Re: [v2,00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE macros
Date: Mon, 23 Jun 2025 18:39:35 +0200
Message-ID: <5915490.DvuYhMxLoT@workhorse>
In-Reply-To: <6859822a.050a0220.3c48ee.1f2c@mx.google.com>
References:
 <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <6859822a.050a0220.3c48ee.1f2c@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 23 June 2025 18:34:50 Central European Summer Time Patchwork Integration wrote:
> Dear Nicolas Frattaroli:
> 
> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
> 
> Make sure that the whole series 20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".
> 
> You can try something like this:
>     git fetch https://gitlab.freedesktop.org/linux-media/media-committers.git next
>     git checkout FETCH_HEAD
>     b4 shazam 20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com
> 
> Error message:
> Trying branch next c0b1da281d84d33281fc49289f0c7f8aada450ff...
> Running in OFFLINE mode
> Analyzing 21 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v2 1/20] bitmap: introduce hardware-specific bitfield operations
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com
>   [PATCH v2 2/20] mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-2-cf1fc08a2e1f@collabora.com
>   [PATCH v2 3/20] soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-3-cf1fc08a2e1f@collabora.com
>   [PATCH v2 4/20] media: synopsys: hdmirx: replace macros with bitfield variants
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-4-cf1fc08a2e1f@collabora.com
>   [PATCH v2 5/20] drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-5-cf1fc08a2e1f@collabora.com
>   [PATCH v2 6/20] phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-6-cf1fc08a2e1f@collabora.com
>   [PATCH v2 7/20] drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-7-cf1fc08a2e1f@collabora.com
>   [PATCH v2 8/20] drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-8-cf1fc08a2e1f@collabora.com
>   [PATCH v2 9/20] phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-9-cf1fc08a2e1f@collabora.com
>   [PATCH v2 10/20] drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-10-cf1fc08a2e1f@collabora.com
>   [PATCH v2 11/20] drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-11-cf1fc08a2e1f@collabora.com
>   [PATCH v2 12/20] phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-12-cf1fc08a2e1f@collabora.com
>   [PATCH v2 13/20] drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-13-cf1fc08a2e1f@collabora.com
>   [PATCH v2 14/20] ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-14-cf1fc08a2e1f@collabora.com
>   [PATCH v2 15/20] net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-15-cf1fc08a2e1f@collabora.com
>   [PATCH v2 16/20] PCI: rockchip: Switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-16-cf1fc08a2e1f@collabora.com
>   [PATCH v2 17/20] PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-17-cf1fc08a2e1f@collabora.com
>   [PATCH v2 18/20] PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-18-cf1fc08a2e1f@collabora.com
>   [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com
>   [PATCH v2 20/20] phy: rockchip-pcie: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-20-cf1fc08a2e1f@collabora.com
> ---
> Total patches: 20
> ---
>  Base: base-commit 0491b8f4897c1ed267446959628592fd1cf8107d not known, ignoring
> Applying: bitmap: introduce hardware-specific bitfield operations
> Applying: mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
> Applying: soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
> Applying: media: synopsys: hdmirx: replace macros with bitfield variants
> Applying: drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
> Applying: drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
> Applying: ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
> Applying: net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> Patch failed at 0015 net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:150
> error: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> Trying branch fixes 19272b37aa4f83ca52bdf9c16d5d81bdd1354494...
> Running in OFFLINE mode
> Analyzing 21 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v2 1/20] bitmap: introduce hardware-specific bitfield operations
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com
>   [PATCH v2 2/20] mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-2-cf1fc08a2e1f@collabora.com
>   [PATCH v2 3/20] soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-3-cf1fc08a2e1f@collabora.com
>   [PATCH v2 4/20] media: synopsys: hdmirx: replace macros with bitfield variants
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-4-cf1fc08a2e1f@collabora.com
>   [PATCH v2 5/20] drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-5-cf1fc08a2e1f@collabora.com
>   [PATCH v2 6/20] phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-6-cf1fc08a2e1f@collabora.com
>   [PATCH v2 7/20] drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-7-cf1fc08a2e1f@collabora.com
>   [PATCH v2 8/20] drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-8-cf1fc08a2e1f@collabora.com
>   [PATCH v2 9/20] phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-9-cf1fc08a2e1f@collabora.com
>   [PATCH v2 10/20] drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-10-cf1fc08a2e1f@collabora.com
>   [PATCH v2 11/20] drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-11-cf1fc08a2e1f@collabora.com
>   [PATCH v2 12/20] phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-12-cf1fc08a2e1f@collabora.com
>   [PATCH v2 13/20] drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-13-cf1fc08a2e1f@collabora.com
>   [PATCH v2 14/20] ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-14-cf1fc08a2e1f@collabora.com
>   [PATCH v2 15/20] net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-15-cf1fc08a2e1f@collabora.com
>   [PATCH v2 16/20] PCI: rockchip: Switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-16-cf1fc08a2e1f@collabora.com
>   [PATCH v2 17/20] PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-17-cf1fc08a2e1f@collabora.com
>   [PATCH v2 18/20] PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-18-cf1fc08a2e1f@collabora.com
>   [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com
>   [PATCH v2 20/20] phy: rockchip-pcie: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-20-cf1fc08a2e1f@collabora.com
> ---
> Total patches: 20
> ---
>  Base: base-commit 0491b8f4897c1ed267446959628592fd1cf8107d not known, ignoring
> Applying: bitmap: introduce hardware-specific bitfield operations
> Applying: mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
> Applying: soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
> Applying: media: synopsys: hdmirx: replace macros with bitfield variants
> Applying: drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
> Applying: drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
> Applying: ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
> Applying: net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> Patch failed at 0015 net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:150
> error: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> Trying branch None ad10b82c2bcac7f87ac6eaecfca33378b43425ee...
> Running in OFFLINE mode
> Analyzing 21 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v2 1/20] bitmap: introduce hardware-specific bitfield operations
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-1-cf1fc08a2e1f@collabora.com
>   [PATCH v2 2/20] mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-2-cf1fc08a2e1f@collabora.com
>   [PATCH v2 3/20] soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-3-cf1fc08a2e1f@collabora.com
>   [PATCH v2 4/20] media: synopsys: hdmirx: replace macros with bitfield variants
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-4-cf1fc08a2e1f@collabora.com
>   [PATCH v2 5/20] drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-5-cf1fc08a2e1f@collabora.com
>   [PATCH v2 6/20] phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-6-cf1fc08a2e1f@collabora.com
>   [PATCH v2 7/20] drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-7-cf1fc08a2e1f@collabora.com
>   [PATCH v2 8/20] drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-8-cf1fc08a2e1f@collabora.com
>   [PATCH v2 9/20] phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-9-cf1fc08a2e1f@collabora.com
>   [PATCH v2 10/20] drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-10-cf1fc08a2e1f@collabora.com
>   [PATCH v2 11/20] drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-11-cf1fc08a2e1f@collabora.com
>   [PATCH v2 12/20] phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-12-cf1fc08a2e1f@collabora.com
>   [PATCH v2 13/20] drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-13-cf1fc08a2e1f@collabora.com
>   [PATCH v2 14/20] ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-14-cf1fc08a2e1f@collabora.com
>   [PATCH v2 15/20] net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-15-cf1fc08a2e1f@collabora.com
>   [PATCH v2 16/20] PCI: rockchip: Switch to FIELD_PREP_WM16* macros
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-16-cf1fc08a2e1f@collabora.com
>   [PATCH v2 17/20] PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-17-cf1fc08a2e1f@collabora.com
>   [PATCH v2 18/20] PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-18-cf1fc08a2e1f@collabora.com
>   [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com
>   [PATCH v2 20/20] phy: rockchip-pcie: switch to FIELD_PREP_WM16 macro
>     + Link: https://lore.kernel.org/r/20250623-byeword-update-v2-20-cf1fc08a2e1f@collabora.com
> ---
> Total patches: 20
> ---
>  Base: base-commit 0491b8f4897c1ed267446959628592fd1cf8107d not known, ignoring

I think this robot should do a git fetch on linux-next before
running, this is kind of useless otherwise because I'm not going to
base the series on a random subsystem integration tree that other
subsystems that this series touches don't use.

> Applying: bitmap: introduce hardware-specific bitfield operations
> Applying: mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
> Applying: soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
> Applying: media: synopsys: hdmirx: replace macros with bitfield variants
> Applying: drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
> Applying: drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
> Applying: phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
> Applying: drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
> Applying: ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
> Applying: net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> Patch failed at 0015 net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:150
> error: drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 
> 





