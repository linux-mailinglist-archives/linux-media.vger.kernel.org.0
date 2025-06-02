Return-Path: <linux-media+bounces-33905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254BACAE6C
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B6A1BA096D
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F35121B9E3;
	Mon,  2 Jun 2025 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T9HGC4tt"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99AC8CE;
	Mon,  2 Jun 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869249; cv=none; b=XDWbAvFS2Q7BTwl+qYF1uzj+6bwY54pIrID/gyVY3ZUwrD2ffDZW+gyJm8CmhJjPy++S14AhW7U/WVDx6bFs4sjdWCsPNhV4NB0p6cuo2Kt25+RI+eoSKiew8cR+Q5NOOK2phCosUcuo63FE525B6cHzDiEpSSu8UuHh/BUUal4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869249; c=relaxed/simple;
	bh=ujsjFmfmKNY3XZSEPL45VVklZB5mdxfIdwBl8x+CdSw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YC9T+PgHLX5B0ParW88Iv2CI1cqrj+Se2OSPG350xEiORbxRxgMt8Gw3ua9IcDSGkaARO3D75l8gPv4SOGqvRMMVPEE1jGFoQuvXeLWRCPEnkFpeXMGigungvfdkAF81V9iL8SOufIE7iQTyhOnPGyLK1xAVseQPz98v0xPpHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T9HGC4tt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748869240;
	bh=ujsjFmfmKNY3XZSEPL45VVklZB5mdxfIdwBl8x+CdSw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T9HGC4ttEOut4U5T98eg8qP2EaOlhNuuiQkfOgbQNPK6+DQapTUSxzlb5OK3ATb0M
	 OaTzO64G77yCGN/dk+E6bxaArLjh1pPQXrV5zTf4t2+Di+Fk1yb8WLWSi2JRnA85zv
	 6MmAOq/zEDfHYoe3M1Xv2/oGT1j43UJNdrmX7/X2xl+/VaoTG/sZ5O6HpEssEvvn28
	 NYwhMFAFSFletYthThItKCxaoAImwRAsn4vDmBnFKrVp+s9Bqh2kIhOdnGJJ09aoyA
	 jMXXlvIhQc8Cw2u1bY0z/WiXBFtp1+V/X8Zadvy86eL0aEb2HKP+dGiHEhQs/anCPQ
	 obYtdpp99cWuw==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CCD017E01FD;
	Mon,  2 Jun 2025 15:00:39 +0200 (CEST)
Message-ID: <4d34103cf31df1cf10dd95f33a285c54249d6e3b.camel@collabora.com>
Subject: Re: [PATCH AUTOSEL 6.15 054/110] media: rkvdec: Initialize the m2m
 context before the controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev, 
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, ezequiel@vanguardiasur.com.ar, 
	mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Mon, 02 Jun 2025 09:00:37 -0400
In-Reply-To: <20250601232435.3507697-54-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
	 <20250601232435.3507697-54-sashal@kernel.org>
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

Le dimanche 01 juin 2025 à 19:23 -0400, Sasha Levin a écrit :
> From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> [ Upstream commit d43d7db3c8a1868dcbc6cb8de90a3cdf309d6cbb ]
> 
> Setting up the control handler calls into .s_ctrl ops. While validating
> the controls the ops may need to access some of the context state, which
> could lead to a crash if not properly initialized.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> 
> Now let me analyze the specific changes proposed in the commit: ##
> Analysis **YES** This commit should be backported to stable kernel
> trees. Here's my extensive analysis: ### Core Issue Analysis The commit
> addresses a critical initialization order bug that can lead to crashes.

"While validating the controls the ops **may** need"

It wasn't the case yet, so its not as critical as this analyses made
it sound like. The changes that came next, removes superfluous branches
that was only there for the purpose of avoiding the crash.

It is harmless otherwise, the change is good practice and at best may
help people backportin more patches. But not worth "Fixes:" and
"CC: Stable" in my opinion. You are free to proceed.

> The problem occurs in the `rkvdec_open()` function at lines 822-830 in
> the current code: 1. **Current problematic order:** - Line 822:
> `rkvdec_init_ctrls(ctx)` is called first - Line 826-830:
> `v4l2_m2m_ctx_init()` is called second 2. **The problem:** According to
> the commit message and my analysis of the kernel documentation,
> `v4l2_ctrl_handler_setup()` (called inside `rkvdec_init_ctrls()`) calls
> `.s_ctrl` for all controls unconditionally to initialize hardware to
> default values. The `.s_ctrl` handlers may need to access the m2m
> context state, but if the m2m context (`ctx->fh.m2m_ctx`) isn't
> initialized yet, this can cause a crash or undefined behavior. ### Code
> Changes Analysis The fix is minimal and surgical: - **Lines moved:** The
> initialization order is swapped - m2m context initialization moves
> before control handler setup - **Error handling updated:** The error
> handling paths are correctly updated to match the new initialization
> order - **No functional changes:** The fix doesn't change driver
> functionality, only initialization sequence ### Why This Should Be
> Backported 1. **Fixes a real crash bug:** This addresses a potential
> crash scenario that affects users 2. **Small and contained:** The change
> is minimal - just reordering initialization and updating error paths 3.
> **Low regression risk:** Moving m2m init before control init is safer
> since m2m context doesn't depend on controls, but controls may depend on
> m2m context 4. **Follows established patterns:** Similar commit #2 in
> the historical examples shows a "YES" backport for proper initialization
> order in V4L2 drivers 5. **Critical subsystem:** Media drivers crashing
> can affect user applications ### Comparison with Historical Commits -
> **Similar to commit #2 (YES):** Also fixes initialization order in V4L2
> media driver to prevent crashes - **Similar to commit #4 (YES):** Media
> driver fix that's low-risk and contained - **Unlike commits #1, #3, #5
> (NO):** This actually fixes a bug rather than just cleanup/code style
> improvements ### Stable Tree Criteria Met ✅ **Important bugfix:**
> Prevents crashes ✅ **Minimal risk:** Simple reordering with no side
> effects ✅ **Small change:** Only affects initialization sequence ✅ **No
> architectural changes:** Pure bug fix ✅ **Confined to subsystem:** Only
> affects rkvdec driver The fix follows the stable tree rules perfectly -
> it's an important crash prevention fix with minimal regression risk,
> making it an ideal backport candidate.

Suggestion for improving the report, perhaps adding line breaks for
each items ?

best regards,
Nicolas

> 
>  drivers/staging/media/rkvdec/rkvdec.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index f9bef5173bf25..4702df5b095b7 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -819,24 +819,24 @@ static int rkvdec_open(struct file *filp)
>  	rkvdec_reset_decoded_fmt(ctx);
>  	v4l2_fh_init(&ctx->fh, video_devdata(filp));
>  
> -	ret = rkvdec_init_ctrls(ctx);
> -	if (ret)
> -		goto err_free_ctx;
> -
>  	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(rkvdec->m2m_dev, ctx,
>  					    rkvdec_queue_init);
>  	if (IS_ERR(ctx->fh.m2m_ctx)) {
>  		ret = PTR_ERR(ctx->fh.m2m_ctx);
> -		goto err_cleanup_ctrls;
> +		goto err_free_ctx;
>  	}
>  
> +	ret = rkvdec_init_ctrls(ctx);
> +	if (ret)
> +		goto err_cleanup_m2m_ctx;
> +
>  	filp->private_data = &ctx->fh;
>  	v4l2_fh_add(&ctx->fh);
>  
>  	return 0;
>  
> -err_cleanup_ctrls:
> -	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +err_cleanup_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  
>  err_free_ctx:
>  	kfree(ctx);

