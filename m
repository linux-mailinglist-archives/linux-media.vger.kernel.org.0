Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC38F14BC95
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 16:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgA1PH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 10:07:59 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36746 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgA1PH7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 10:07:59 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00SF7oWR034095;
        Tue, 28 Jan 2020 09:07:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580224070;
        bh=jbYsyBATnWNLSVZAeRBkfyc/NJi7c27Wjd5pbcwonRY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Po/tjph2LFzrkh67QNSTb4Zl8k+0+x35YOglAw8MXAvWO4hbhV/rmjXe2APC9YsaY
         D9hjuhQnC9O5O6Wa1ufLmweB2rpeWhG/DyAgnCUe951B2Za07HLGz+63XXKId7iPga
         IbFPlYChy6Uu5XVSezZSxBIXESFrCPIIiMulV6CM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00SF7osj098670
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Jan 2020 09:07:50 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 28
 Jan 2020 09:07:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 28 Jan 2020 09:07:50 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00SF7oqN010472;
        Tue, 28 Jan 2020 09:07:50 -0600
Date:   Tue, 28 Jan 2020 09:11:56 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] MAINTAINERS: Sort entries in database for TI VPE/CAL
Message-ID: <20200128151156.jk4oxl3ts3sdeg23@ti.com>
References: <20200128145828.74161-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200128145828.74161-1-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote on Tue [2020-Jan-28 16:58:28 +0200]:
> Run parse-maintainers.pl and choose TI VPE/CAL record. Fix it accordingly.
> 
> Note, this is urgent fix, without which parse-maintainers.pl throws
> an exception:
> 
> Odd non-pattern line '  Documentation/devicetree/bindings/media/ti,cal.yaml
> ' for 'TI VPE/CAL DRIVERS' at scripts/parse-maintainers.pl line 147, <$file> line 16770.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Benoit Parrot <bparrot@ti.com>

> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9fbe2a19b8a3..f04b1c6508fe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16761,12 +16761,12 @@ F:	sound/soc/codecs/twl4030*
>  TI VPE/CAL DRIVERS
>  M:	Benoit Parrot <bparrot@ti.com>
>  L:	linux-media@vger.kernel.org
> +S:	Maintained
>  W:	http://linuxtv.org/
>  Q:	http://patchwork.linuxtv.org/project/linux-media/list/
> -S:	Maintained
> -F:	drivers/media/platform/ti-vpe/
> +F:	Documentation/devicetree/bindings/media/ti,cal.yaml
>  F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
> -	Documentation/devicetree/bindings/media/ti,cal.yaml
> +F:	drivers/media/platform/ti-vpe/
>  
>  TI WILINK WIRELESS DRIVERS
>  L:	linux-wireless@vger.kernel.org
> -- 
> 2.24.1
> 
