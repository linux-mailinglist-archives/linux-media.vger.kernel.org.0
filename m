Return-Path: <linux-media+bounces-2273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2F80F32F
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 17:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5C01F2153F
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 16:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4271778E98;
	Tue, 12 Dec 2023 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="WsFtlMCD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426D91738;
	Tue, 12 Dec 2023 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1702399004; x=1702658204;
	bh=xQM8Ci95br6UpZv6S/P/yPue9VcluKR7oR4GJe65I2k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WsFtlMCDeErknnMmjq7MhuKXRdxIawCITzMkIK57U3gE2v39FzMn8u71o5f5OkEfP
	 BamfL6xfBjZHQM93MI4ViqRfDLuiA3YOk6oWMkYJ9/3GWX8RrRXH1Rs52gQuitseqZ
	 iT6q2AeS2MWMcfIOlQ6Pc0u5q47GRX4FUQeavG3+6C3E5sfi0sJF90EVA579039vhG
	 mg0LHb3jsUhwyqMrpkX9nxJq2xpviqfQ6wgxVell+MNGEN01K7UhrGwlB85L4DjzmY
	 FVpFmmfVSrSkQNYiYHSTTmGBYQT5PMmfYeKneXZkivzzxkQ8AHg2kJoVHSj4oLv4tQ
	 Rlj2PK7xD4Gzw==
Date: Tue, 12 Dec 2023 16:36:35 +0000
To: Yong Wu <yong.wu@mediatek.com>
From: Simon Ser <contact@emersion.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Is there a chance to pick a better name than "secure" here?

"Secure" is super overloaded, it's not clear at all what it means from
just the name. Something like "restricted" would be an improvement.

