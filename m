Return-Path: <linux-media+bounces-1654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBB805171
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5918281332
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 11:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F3954BD0;
	Tue,  5 Dec 2023 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vmtn2+Dy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4F3122;
	Tue,  5 Dec 2023 03:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701774107; x=1733310107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EOoOeUhGO49Qx8BIhAdC+BnBXEPnvyFtMtH3ybC1/vY=;
  b=Vmtn2+DyiUAZMj/pddALKtvndjcvg2r2a+6aUDLYpoHC7LwM5pkTPe4u
   3G2128XhwBBlJ31r047SBBCwcWmymadA0mSL4haPwowFJKb2C0qvYcvZO
   dN9mQfqm+znLojQTMEQ2fG3RW/tbQGm6kMLgC1oIfeUIk0KMgeZ9RwLEw
   ySq87KLi56yhNGkEZ68OKAN0GIOl0ofjBGUL345RFBJkHLX6d+Ghow5h1
   qdsMStjqQ+iA8dV1ZC58Tj2savRw5480tGT69zPy1OI0hvZRZ2jqalbU+
   QWrC4zUBJ5JMcGErHHgtZtxK/6IQB7DcQDREQMw1j9aDl27C2WYYliMYB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="392743828"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="392743828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861707932"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="861707932"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:01:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C095E120622;
	Tue,  5 Dec 2023 13:01:41 +0200 (EET)
Date: Tue, 5 Dec 2023 11:01:41 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: ov8856: add missing second link
 frequency in example
Message-ID: <ZW8DFbz3DqthC6fU@kekkonen.localdomain>
References: <20231205084835.15871-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205084835.15871-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thanks for the patch.

On Tue, Dec 05, 2023 at 09:48:35AM +0100, Krzysztof Kozlowski wrote:
> Bindings and Linux driver require two link frequencies, so correct the
> example:
> 
>   ov8856.example.dtb: camera@10: port:endpoint:link-frequencies:0: [360000000] is too short
> 
> Fixes: 066a94e28a23 ("media: dt-bindings: media: Use graph and video-interfaces schemas")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 57f5e48fd8e0..bd1a55d767e7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -126,7 +126,7 @@ examples:
>                  wcam_out: endpoint {
>                      remote-endpoint = <&mipi_in_wcam>;
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <360000000>;
> +                    link-frequencies = /bits/ 64 <360000000 180000000>;

There indeed seems to be a problem with the example as far as the bindings
are concerned but the primary issue seems to be in the bindings. Both of
these frequencies have significance from driver point of view only while
the device itself supports a (wider) range.

How about removing maxItems and items from the bindings instead?

>                  };
>              };
>          };

-- 
Kind regards,

Sakari Ailus

