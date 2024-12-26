Return-Path: <linux-media+bounces-24101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF149FCBC8
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 17:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D5B188327C
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 16:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB042126C02;
	Thu, 26 Dec 2024 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vNuTWzpO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D64C74;
	Thu, 26 Dec 2024 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735229761; cv=none; b=j+5tIrbKP0EcG3obdL4EyDtP8b4+ZjLdhGHh0PNZzfdhCKEnJuwNIdWB9D8xqP9GxSy+xzTJGxJSOofSg2gJ0ePDee3IaB8lyXL9vp/2II/VHZcTinYiBd0lxGd9FWGjzDrtSv8sOw1g9o6AE7nYhudb1o7uyopMQyiD3BzMtec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735229761; c=relaxed/simple;
	bh=06nc+tg/4UKFLfBYN5nBlZntSO6n2nOqTRR922L+9gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXfCvlzNB+B26vNzpGAxSbB+eU0Jpp73oa1exz9q537IgsZqCdw8b5a1rsaUNEmUXqOR+SQ57dCeqWjD3G3ab4/+u552uRSGf/BG+Jsm6yNDeGDUn7/2X/Wn4MxczDEGI0bTJNtWLZ+vx5ZZIV83Gxf3hLCenIgITBBXvDZivVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vNuTWzpO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-136-220-nat.elisa-mobile.fi [85.76.136.220])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 889ECC62;
	Thu, 26 Dec 2024 17:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735229707;
	bh=06nc+tg/4UKFLfBYN5nBlZntSO6n2nOqTRR922L+9gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vNuTWzpO+NV6jThFUEyFTevR8A7JtDlja0Gx5dRVeTlETjo07XJu3yGTZWW5HKq9w
	 6NJ2VHN6AIoGBBH+QqPxDlKa+JrwSHVmYaKIxfQckW9EURh5bJo018KShjyNXnMK0j
	 wnbE/uvP83eDqTeARSttnsfurIwNQ/WsLc4awxMw=
Date: Thu, 26 Dec 2024 18:15:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yuji2.ishikawa@toshiba.co.jp, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Message-ID: <20241226161547.GB554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
 <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>

On Tue, Dec 17, 2024 at 06:44:58AM +0100, Krzysztof Kozlowski wrote:
> On 17/12/2024 00:57, yuji2.ishikawa@toshiba.co.jp wrote:
> >> On 25/11/2024 10:21, Yuji Ishikawa wrote:
> >>> Adds the Device Tree binding documentation that allows to describe the
> >>> MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
> >>>
> >>> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> >>> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>
> >> How newly added patch can have already Rb tag? Was this review really, really
> >> performed internally or you just satisfy some internal managers requirements
> >> and fake the stats?
> >>
> > 
> > I added this Reviewed-by tag because the patch was reviewed internally.
> 
> What issues were identified by internal review, especially in the
> context of bindings?
> 
> >>> ---
> >>>
> >>> Changelog v12:
> >>> - Newly add bindings for CSI2RX driver
> >>>
> >>>  .../media/toshiba,visconti5-csi2rx.yaml       | 104
> >> ++++++++++++++++++
> >>>  1 file changed, 104 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
> >>> l
> >>> b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yam
> >>> l
> >>> new file mode 100644
> >>> index 000000000000..5488072bc82a
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx
> >>> +++ .yaml
> >>> @@ -0,0 +1,104 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >>> +---
> >>> +$id:
> >>> +http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> >>> +
> >>> +maintainers:
> >>> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> >>> +
> >>> +description: |-
> >>
> >> Drop |-
> >>
> > 
> > I'll drop "|-"
> > 
> >>> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI
> >>> + CSI-2 video  stream. Use with VIIF device. T.B.D
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: toshiba,visconti5-csi2rx
> >>
> >> Why this is called "RX"? Can you have a TX? I had impression that one cannot.
> >>
> > 
> > VIIF has only MIPI CSI2 receiver (CSI2RX). There's no TX for it.
> 
> So this device cannot be anything else? Then drop rx.

It's a compatible string, it identifies the IP core. As the SoC also has
a CSI-2 transmitter (as mentioned by Ishikawa-san), it makes sense to
name the CSI-2 receiver csi2rx.

> > Visconti also has VOIF (Video Output Interface) hardware which has
> > MIPI CSI2 (not DSI) transmitter (CSI2TX).
> 
> Or this can be something else? Confusing.

In a camera capture pipeline the CSI-2 interface of the SoC is a CSI-2
receiver, but SoCs commonly have CSI-2 transmitters as well (even if
that's less common than receivers).

-- 
Regards,

Laurent Pinchart

