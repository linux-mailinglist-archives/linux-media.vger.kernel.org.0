Return-Path: <linux-media+bounces-55191-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLPRBew3sGkKhQIAu9opvQ
	(envelope-from <linux-media+bounces-55191-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:25:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF936253557
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD40329C2F8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C9624886E;
	Tue, 10 Mar 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy9fQPB5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE091E2606
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153012; cv=none; b=EyI2DbpF0PyWizHwcuo7/roreAGi2vr1yTtzHDH6Hq8oRa3a6T0x3aqZm3jO9zsYbz6ZSI+obP5QEFIohK8gkXDzH/pHnWd8Zh8ktqZAsBsoQECEPXA2pYMrNkDZfsMpfL8HvzX6Q92bz49l8tp+l17kdXK/5QQSkbTZ8vcrAJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153012; c=relaxed/simple;
	bh=2hF1/TJQ0EMpfcgsfRfJqcwXOTlDyJUIGvjZodxORSY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ezxJSbSJAGS95Q4cSbjtGmhvUG112DsVeHT5fq5cxdSNBeca0hyGUZrWkBsF+MXE9vastkqxc/cw/Qj3iOvwsFPloFzAbXY5r0h5sTgW0kDSLP2kW1f0OBknbDe1BzCJMOOjE8Yc0paJpx78E0VYYF+03p445IkTjGtluxaXEJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy9fQPB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0803AC19423;
	Tue, 10 Mar 2026 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773153012;
	bh=2hF1/TJQ0EMpfcgsfRfJqcwXOTlDyJUIGvjZodxORSY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Sy9fQPB5UfGEbBoHee20IU0sAFBdQVwV5ZyBR5U4X19lu2i3AMLQ4R9HFLhMYlCdg
	 OxISyeNZvIM9FmkGcUdrsLW2GuxmRORGXdsRUZn6y/3it5ggQNyV51bj+rqCxzRGrR
	 4Zxl/X4fSpcaKF1u/wWjpGua86H44kgoDy2RZ7tmElJaZq4w7U5PvfWVNhJLTOl4UI
	 7tFdHPm4yt9q/TPQNNOwPhUtOmuo752Ne2EJyM/WZ3jxmyAzdX00uTydi8TDrqmIaE
	 jNC5dNtZEWUkeniWWf99rjSqdOnUWaFOpdi079Q0bAksZRq1ifMElhXUG02j8NAHxj
	 qAZi2sx9sNpsA==
Message-ID: <7a255d2193d15191c18a67a70df3e42f@kernel.org>
Date: Tue, 10 Mar 2026 14:30:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use page clearing helpers
In-Reply-To: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, "Brian Starkey" <Brian.Starkey@arm.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "John
 Stultz" <jstultz@google.com>, "Maxime Ripard" <mripard@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "T.J. Mercier" <tjmercier@google.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: AF936253557
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-55191-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 09:53:10 +0100, Linus Walleij wrote:
> Use clear_pages() and clear_highpage() properly in the
> DMA heap allocator.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

