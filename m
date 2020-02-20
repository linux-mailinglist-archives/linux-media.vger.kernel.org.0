Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF96165FC2
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 15:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgBTOeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 09:34:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49958 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBTOeq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 09:34:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KEYdM1115028;
        Thu, 20 Feb 2020 08:34:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582209279;
        bh=8+7MreYs2ejy3RW3YZFzbeczSA4/cT2gYoH0Rjw2LeQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=n6UTuKFu1BNns8PouAW5cvFqd4HRW3OAfN1deVsLthyEPvrgbHjHhKwoIWuWhey++
         upOaOdwHxGuf1wV1GIZCpWxlDVieYB8jqoX4pCY8Pvsw7lny2IDafVfmFpqyY80KEi
         YKlVQzpgvFGZRfN7d8X4ga3mFVTM5Ms+QSMjsiOc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KEYdgv043683
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 08:34:39 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 08:34:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 08:34:38 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 01KEYN9V011266;
        Thu, 20 Feb 2020 08:34:23 -0600
Date:   Thu, 20 Feb 2020 08:38:48 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] MAINTAINERS: Sort entries in database for TI VPE/CAL
Message-ID: <20200220143848.rejb3q5l7v4y56uf@ti.com>
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

Mauro,

Can you pick up this patch?
There is already been at least 3 other similar patches posted in the last
month.

Thanks,
Benoit

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
