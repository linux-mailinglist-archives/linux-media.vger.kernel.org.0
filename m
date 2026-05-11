Return-Path: <linux-media+bounces-61072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKqwOCWkAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:40:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3450B1AA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF370321C1E5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655813BED18;
	Mon, 11 May 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b+sb6Rz8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383493A8740;
	Mon, 11 May 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491393; cv=none; b=DDe2m6w0lrGgVLm4PM+2VcW0XdGNrOXukghFEaDfxM58k1zHyie6jg7EycjHy00sI8cm6uLVONwnY7BRvIc0+ogCbjUZ1JFKXTAjjFIDnOlE0JOC5pq5zCZhXm5/dFgCK4lichpMPjR/Uzvmq4YjZYDhyKhlgsQ7VOKX4farUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491393; c=relaxed/simple;
	bh=z53vm2qhXxvQAfXzZc2lskc12FPIJfghOzT0pM/FsXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qwGTulWkhOXq1iCqgyXAL1eZjVjOxaZkr9s3ylwTcHfpARGAhP8uKMR4cvm0qwUVSDe5jbvAFoBSQXx8G1kUA1CGi8NZK/UAtFO4elwYSI8C03Um4zjW2ndzyFTh83XeBNr8X/+iF99IEMGGXFmg6TJTC0tg+BPWix6tc4AibIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b+sb6Rz8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491384;
	bh=z53vm2qhXxvQAfXzZc2lskc12FPIJfghOzT0pM/FsXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b+sb6Rz8q5ernh10wlrWjcVxrJLoTmJjff0Me+riFzRlRcKE4mOqNAopZmXdd+IdQ
	 UkDdDVFNlCC022mlFV95pur9+/eJKEnspSTdWscj+6kn7oOqB6V7qnQ/Vh6+8IZaT0
	 SeQyJlHVHvf97wMw1LBLrHpR/+wf3+y0TjFAOIxlPkEIbUGFQ1WUEU9ObbxF+I1mSh
	 38taxprdieWSRekc4M2nI8nbfV422Re9vW+ycsmMj18/GYRkpG1yK9ubnihX1FjgK6
	 Zb0tgNpgFKCywxTNyDk8086qo+btK187Gmo06A+Gu7Vzy+7gCHE6OA9kS/o76g69dh
	 Irq0JLRmRlRfg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C58517E05FC;
	Mon, 11 May 2026 11:23:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xiandong Wang <xiandong.wang@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new
 CMDQ APIs (series 2/4)
Message-Id: <177849138397.112419.16661288513842004996.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 83A3450B1AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61072-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,ndufresne.ca,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,mediatek.com,chromium.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

On Wed, 25 Mar 2026 11:57:37 +0800, Jason-JH Lin wrote:
> This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
> CMDQ APIs introduced for MT8196.
> 
> Series application order:
>   1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this series)
>   2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
>   3. [Series V2 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v7.1-next/soc, thanks!

[1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
      commit: 004361f01625fda9f6d4009d0dc5a59e32b7be7d
[2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
      commit: a4656aef98dd6f163c55063c36297d45912737f4

Cheers,
Angelo



