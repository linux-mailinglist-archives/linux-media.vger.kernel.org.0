Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549113BFAD1
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhGHNCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:02:49 -0400
Received: from meesny.iki.fi ([195.140.195.201]:38366 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230388AbhGHNCt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Jul 2021 09:02:49 -0400
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 01AEC205CB;
        Thu,  8 Jul 2021 16:00:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1625749205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x1DNkkZtencJ3hEhxOhBRHx+UOdiPMiP17BFn+qzJzY=;
        b=FEIOb7w9DCIKYAec/wKPnOUoyxJuU62o3Z4RllSROl6mF42KbqyncNhb1rXM0jDHAZFUpS
        O9fymfg6J5c2321ixWIi0Qg4EupswLQMc9BejEh6vIc9N/eFIVGi3CEjmExiaGMSN3ibvW
        buFf3Jb35dLc7zyU2/Sqxd6eT+KplPw=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C14EF634C87;
        Thu,  8 Jul 2021 15:59:25 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1m1TdM-000206-2k; Thu, 08 Jul 2021 16:00:04 +0300
Date:   Thu, 8 Jul 2021 16:00:04 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     krzysztof.kozlowski@canonical.com,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, pavel@ucw.cz,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v6 5/5] arm64: defconfig: enable VIDEO_HI846
Message-ID: <20210708130003.GA3@valkosipuli.retiisi.eu>
References: <20210628101054.828579-1-martin.kepplinger@puri.sm>
 <20210628101054.828579-6-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628101054.828579-6-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1625749205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x1DNkkZtencJ3hEhxOhBRHx+UOdiPMiP17BFn+qzJzY=;
        b=W4UBM4Se1NdlaYePN3RCbUw5C58oVUZVrdkqQv2Pw5TairBfyf+O09bBg+QPeQbpP4s4Hm
        8eFdVCJ4sAc38tOYQUewRDS8msiLiXTTyMw+loJqkjcFiNAeg9NzpXkCKPe1gIAZADsq1I
        y9Bx6VLF7eWLjhcTcJV8+QpdYR3rEHY=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1625749205; a=rsa-sha256; cv=none;
        b=KGZ+WoMm4S/8YKFVLcyWJMwe+KHeEU6h7G0XhLeIUFsw0T3uscmfsqtH+sWvEnGG+kjZRc
        Xu9yWi/ofoeVuZxDz2UESlISOEoR+dpcASqWbua4evh6sPMpqw95rbc+VC8MVNmhs350me
        Or2SzAzAQUaW2I5U8wzsdx/OdBKO32Q=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Mon, Jun 28, 2021 at 12:10:54PM +0200, Martin Kepplinger wrote:
> Build the driver for the Hi-846 camera by default on arm64 where it's
> going to be used on at least the imx8mq-librem5 board.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f423d08b9a71..bf27d9cfbdd5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -666,6 +666,7 @@ CONFIG_VIDEO_RENESAS_VSP1=m
>  CONFIG_VIDEO_QCOM_VENUS=m
>  CONFIG_SDR_PLATFORM_DRIVERS=y
>  CONFIG_VIDEO_RCAR_DRIF=m
> +CONFIG_VIDEO_HI846=m
>  CONFIG_VIDEO_IMX219=m
>  CONFIG_VIDEO_OV5645=m
>  CONFIG_VIDEO_QCOM_CAMSS=m

The same sensor may be or may not used on a given board (and certainly it's
not specific to arm64). Is it desirable all arm64 systems compile this in
by default?

There appear to be a other sensor drivers though.

Is there a defconfig for the librem5 board?

I wonder what others think.

-- 
Kind regards,

Sakari Ailus
