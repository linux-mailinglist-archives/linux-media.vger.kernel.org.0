Return-Path: <linux-media+bounces-21617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD09D3508
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 09:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA8FB1F2211F
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 08:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E525360DCF;
	Wed, 20 Nov 2024 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpcSQKQD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D1A1F94A;
	Wed, 20 Nov 2024 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732090004; cv=none; b=pK7GSCYzzFTi6hv5cQKOiQ89KMrotZHxTtEDtcmdWDw03/lK+jKnRTEI2lGGtryM0MRSx4eXha0Tp7GU5bYIdIgRNUjHqZUU61pVCcsTgFlmINP6B3F/jsYiTG3oH0ZctLUXz75Yk2CCBowAUeuIzNnyIyKkANGl9ha7PbacmfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732090004; c=relaxed/simple;
	bh=uAhfSWvZR9Xm6RqA4GyYmx9riTr6JGITFU8rqgdrkzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhNxqb0xcyGbV0e/x0f1hOqg8S28OiEZ96jChFG2XUZvjA2VsKKiyrejw9ptTwo5a36aeaKm91Jc6xuSv+JMMVSukKd2CsT7k+atsY4EIHnQtJf54mPw/JhouDsd6lVi5a0Mrokn/sNz51VYeHgju46RjUw3PFMwncoXs4E/giA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpcSQKQD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732090003; x=1763626003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uAhfSWvZR9Xm6RqA4GyYmx9riTr6JGITFU8rqgdrkzg=;
  b=cpcSQKQDmFsU1fpPr22TLmC+pbbHndQ8Zzs40C8ZcWRX6BteItHDee9c
   94fNYbgNI+6Vv7G5TNWwuAFsza+5HnCZcobjugKwQ1nxMjMrrtPbkzbeS
   dsfU30QSe7o4KjIe7Mvq5ne0kZj+jZAARw52GTPIo1BDsf6vxbY3UzlnW
   BJNjroo2TlpxnVNIAjmqnaqrr3oehx+iQv+G3EFsxLibgl38WQ29FWrhd
   RRRX/Qqe1ITjnYf8tdjEiGWqNVhgqmL/adBeTxJuNxcoebP+43BUC+ZSQ
   L9kVhqVhlylS9ILiwY6sk9bbX+v6gcK9BpDqk/26YRod+e/r+evN47/gN
   Q==;
X-CSE-ConnectionGUID: w89hAE5fST+rGrLDrrhoYA==
X-CSE-MsgGUID: I8pCPnk1RFy2TkiU6TWGAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32244785"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="32244785"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 00:06:42 -0800
X-CSE-ConnectionGUID: uW301IhrRiiobyxyYRk0SQ==
X-CSE-MsgGUID: sMSi2WYCSFetSsEcHrfo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="90648439"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 00:06:40 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D1A5E11F89A;
	Wed, 20 Nov 2024 10:06:36 +0200 (EET)
Date: Wed, 20 Nov 2024 08:06:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: dt-bindings: Add property to describe CSI-2
 C-PHY line orders
Message-ID: <Zz2YjNHk-ZTlXztw@kekkonen.localdomain>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>

Hejssan, Niklas!

Tack för de här lapparna!

On Tue, Nov 19, 2024 at 11:12:46PM +0100, Niklas Söderlund wrote:
> Each data lane on a CSI-2 C-PHY bus uses three phase encoding and is
> constructed from three physical wires. The wires are referred to as A, B
> and C and their default order is ABC. However to ease hardware design
> the specification allows for the wires to be switched in any order.
> 
> Add a vendor neutral property to describe the line order used. The
> property name 'line-orders', the possible values it can be assigned and
> there names are taken from the MIPI Discovery and Configuration (DisCo)
> Specification for Imaging.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../bindings/media/video-interfaces.yaml      | 20 +++++++++++++++++++
>  include/dt-bindings/media/video-interfaces.h  |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 26e3e7d7c67b..95491e5779ba 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -210,6 +210,26 @@ properties:
>        lane-polarities property is omitted, the value must be interpreted as 0
>        (normal). This property is valid for serial busses only.
>  
> +  line-orders:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 8
> +    enum:
> +      - 0 # ABC
> +      - 1 # ACB
> +      - 2 # BAC
> +      - 3 # BCA
> +      - 4 # CAB
> +      - 5 # CBA

Do you know hardware documentation using lettes for the lines? I do agree
it seems less confusing but I've seen only numbers being used.

> +    description:
> +      An array of line orders of the CSI-2 C-PHY data lanes. The order of the
> +      lanes are the same as in data-lanes property. Valid values are 0-5 as
> +      defined in the MIPI Discovery and Configuration (DisCo) Specification for
> +      Imaging. The length of the array should be the same length as the

s/should/must/

As this is a requirement for DTS authors in particular.

> +      data-lanes property. If the line-orders property is omitted, the value
> +      must be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY

I would:

s/must/shall/

> +      busses only.
> +
>    strobe:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [ 0, 1 ]
> diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
> index 68ac4e05e37f..88b9d05d8075 100644
> --- a/include/dt-bindings/media/video-interfaces.h
> +++ b/include/dt-bindings/media/video-interfaces.h
> @@ -13,4 +13,11 @@
>  #define MEDIA_BUS_TYPE_PARALLEL			5
>  #define MEDIA_BUS_TYPE_BT656			6
>  
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC	0
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ACB	1
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BAC	2
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA	3
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
> +#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
> +
>  #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
Med vänliga hälsningar,

Sakari Ailus

