Return-Path: <linux-media+bounces-16952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD849619CD
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 00:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB9CB1F24B47
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 22:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2EF1D461C;
	Tue, 27 Aug 2024 22:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jEKMWMul"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF83C08A;
	Tue, 27 Aug 2024 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796079; cv=none; b=kIz36n7ajzaqGWBztCn+3tsi5hIgufCD3HTET4JA9v9XoYu9vhNfLpnkv3ZBMxzzpi1YWRmOiFeDk0e7PF6YbL9qkgRsI9V2lWZxiehKV0sCe4JNkH+5uLPN5vtH6j0gsDA2hMhlI47U6j5VJ91BbWjwprrcdHgn3YC/3XXD3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796079; c=relaxed/simple;
	bh=7SvVEpchS9TpKa91upXBta5GQqxlKOF4XGPJuPjKTRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF6nVdHvPEjghQkAKM2p2e4SIpyer3jILlM2S31BJ362YKOctXQ7IsrXv+LoBRTJgJUQcDBj2bQCUS8+8nvZfPeKglK1KVb+RYdzgftiGKfm/sxycankkLo17vfcew1hx0Ep4Zhfc6cSsJoRFpJhk2rGSfGb9/uMJIHisEdk4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jEKMWMul; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15AB4108D;
	Wed, 28 Aug 2024 00:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724796009;
	bh=7SvVEpchS9TpKa91upXBta5GQqxlKOF4XGPJuPjKTRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEKMWMulDjOe9nLKLMQ12UpPTr0c0+Vu/NzG0zdkNkyzYV6EeiksX4bTzdMvQtkPF
	 h0JWKfqc/PeR5Zmzw8Jfqa2NV9XRX/wyBUECLRnslMCDfABj3e9eEsEGg2yeWyDpmq
	 Hu6M/tRo/aQaBi02ceD78nVdcBFlAlnaN+WufaYE=
Date: Wed, 28 Aug 2024 01:01:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: media: renesas,isp: Add binding for
 V4M
Message-ID: <20240827220112.GE30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826144352.3026980-6-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:43:51PM +0200, Niklas Söderlund wrote:
> Document support for the ISP module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the CSISP module on the other Gen4 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - Add to commit message that V4M is compatible with other Gen4 SoCs.
> ---
>  Documentation/devicetree/bindings/media/renesas,isp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> index 730c86f2d7b1..c4de4555b753 100644
> --- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
> @@ -22,6 +22,7 @@ properties:
>        - enum:
>            - renesas,r8a779a0-isp # V3U
>            - renesas,r8a779g0-isp # V4H
> +          - renesas,r8a779h0-isp # V4M
>        - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart

