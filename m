Return-Path: <linux-media+bounces-22891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6A9E94C4
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB3531885B52
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED62227568;
	Mon,  9 Dec 2024 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="B2ScI27/"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B482221D88;
	Mon,  9 Dec 2024 12:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733748512; cv=none; b=ak/wZC8MNkCVyCLLEf4zOdTc+Osm9Vrb0e4tf1pVF9tJxpoeZz1KkzTdHlo5NwoqrdlVUgXwyQw5EHCxuYy1aVcSp1kw53OKIfNONyfjPNhbSu4HMbQTsFqi7wCh4/Yy4ssUT9cAjXmtp8wAz9awdUBsLVoFJO5PHK/sccRb/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733748512; c=relaxed/simple;
	bh=doGwGYhbXQvljz7pEyV8cg3NcfTkJse5GZPQ0eBEQ4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=coshXOhlHz4uF+/pjJ9ZAzE0uGezVrTFdmmSzhYn7LsOAtMoT72DvRbiSXJcs55QSnxlO6XAoe9wMLCm1wQPaVlAC6p/sQ2utTKs+TmeXmbOa/I4Qdut0how6nyZQnyHNlrjmo0rDojnYZBz2rWC/aGJ405HVCo+bV6/Y6Su5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=B2ScI27/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YALQ/5d5xwJu+LceFpjWJMU1LIe6WE2pCNsHkacRTcI=; b=B2ScI27/o23d0xltBjPie1Ue+t
	5XtAHemGGtwCU4r6Kw0aUPIQD/3gXCT7f1etTJxip3qhzWcqwfw4JXmXyLata74X+iJwHGqLwKa35
	Nsd1CRZa4iw5OSl1D/JJ2ykK/4Lhc6MWwuc3LANeJWXxROWIri8EAGM0W5W6wQBQ3EvnsHzYSD1mt
	0joyVgYhvrm/vdVBRbOVXBRMMOhfFEqjbGpFySbSEGgtfYppDM1xZwd4TSHOu8y61wQNkR15i7U5m
	H7+bIm3oEyj2kB3K5ikDYec5gCiDvo1hNBIHz4HbHxHJ2D2OX0emZVllTYnSxCB05IAnB9+Rf6M4W
	k43Bx9+g==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKdBK-00088z-7p; Mon, 09 Dec 2024 13:48:10 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [RESEND PATCH] media: dt-bindings: trivial white-space and example
 cleanup
Date: Mon, 09 Dec 2024 13:48:08 +0100
Message-ID: <9635159.2WqB4rESCP@diego>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 9. Dezember 2024, 12:34:05 CET schrieb Krzysztof Kozlowski:
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

(even looked at the whole patch and not only the Rockchip parts :-) )



