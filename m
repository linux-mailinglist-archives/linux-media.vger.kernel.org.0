Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56F22C3BC9
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 10:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgKYJPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 04:15:33 -0500
Received: from mga03.intel.com ([134.134.136.65]:59294 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgKYJPc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 04:15:32 -0500
IronPort-SDR: XnFNi0i/xyODn+a7XqOOKYuwUuAy3071W845RceBUKUrKSWHs6f5HYMdtNcXudd/8xQlnXgfkZ
 BNK9ff2BEboQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172195143"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="172195143"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 01:15:31 -0800
IronPort-SDR: 5MYu/pURvITOj5Dh4rIV112NbNFfw0N2C17oY2LaBb0VDXruogSWu8lkOIg1Lb3KZ2GiiurtWg
 oXImFPxTR6Sg==
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="359101695"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 01:15:28 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4160B208C5; Wed, 25 Nov 2020 11:15:26 +0200 (EET)
Date:   Wed, 25 Nov 2020 11:15:26 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Message-ID: <20201125091526.GI3940@paasikivi.fi.intel.com>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119161956.756455-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119161956.756455-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cc Rob + DT list.

On Thu, Nov 19, 2020 at 05:19:27PM +0100, Jacopo Mondi wrote:
> Rename 'ov5647.yaml' as 'ovti,ov5647.yaml' and update the
> MAINTAINERS file entry accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml}        | 0
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69d55ed67e1cf..3f2acc3a78687 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12928,7 +12928,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
>  F:	drivers/media/i2c/ov5647.c
>  
>  OMNIVISION OV5670 SENSOR DRIVER
> -- 
> 2.29.1
> 

-- 
Sakari Ailus
