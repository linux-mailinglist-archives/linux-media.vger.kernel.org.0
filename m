Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 963D81AD742
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgDQHSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:18:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57975 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728808AbgDQHSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:18:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PLGLjhe6v7xncPLGOj9cXk; Fri, 17 Apr 2020 09:18:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587107893; bh=HSLs2JiZcy4OA1k/VMJ4MaHDQtFq2ylnKTJGakTcPR8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D0shEtuyA6wOYrboGofBaD6Hcvyue0LHWkhqvWKl4cAbtlR+789ibtP1go8+npAdS
         D0GJUT2xnk5cC3X13WO8g/7Fa6+BWe0BnzvxtPX5sgfGvl1PBgDfCCXMTipyw0iy21
         miXGRXji8uREA4AP3zoHfQGgMK23lJVpbmtJHMud3KbXoTDg7k/iJ1Vzi4FYKaGhOB
         9RvGs9lDNxWItdMUUytQXVk1iZ8gYrv1+i8XHXUZcyHdh7+wVoayGIwBUZtwzcTgaN
         M8JHq2lwj72RCeNFDeBABlrTxp8HjSoTKN6BrYVUtB8IXEcr3ZbO/UtFhRxYrhCZZX
         RvVEV+D9R0kPA==
Subject: Re: [PATCH v2 7/9] media: MAINTAINERS: rkisp1: add path to
 dt-bindings
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, kernel@collabora.com,
        dafna.hirschfeld@collabora.com, ezequiel@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com, jbx6244@gmail.com,
        kishon@ti.com
References: <20200403161538.1375908-1-helen.koike@collabora.com>
 <20200403161538.1375908-8-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9a95d227-9592-2c5c-fe6d-dff9b84f4292@xs4all.nl>
Date:   Fri, 17 Apr 2020 09:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403161538.1375908-8-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN/6IaxCKZYDRmsDs68Ac7Ohz+Yi31l+n/3qIvjgojpcfRUtSJSc05kGL2CfXDapr3Rq4gYZgR4YeLxd10TX4h+NBJFBcEU+jLCtDcwIuTse6A59qRpJ
 WiwqnAonGsAFeOerDoqNy1YmLjtUYSNLSY5LUmmSmKy0rm6DvctTMLL3W9KqFzXOfreLQuav06dYKKGgABldV/sXbi1MEA0/2ohTpssCluapKmoWm6umTG9e
 HExIcM3ACV3iIWTi/FPC5szOfNda35Gg/qXqYmby1qh1kIs/HV8CftXHnN5/2d3NpCApcrT7MMY3/uVm+19nTEM/4gEtPEqIY9tyPN5whm6zo7Xe0SjvlqW3
 IJCQMlQnO9vto6abRNvXyk95hQWSImEWy6sW2HSs/de9ytBnO5oQzOgIivkyTXpZwi/Fee2YnCZMiYP02i8q6QHktUWTEguBtgWDT5+tp9IJhrbyHhdZeUCv
 0f6v/H02P6xJWXY334V3m0VQ6GSTi8p3rJKXE/tJ4EuFT8fucFUXQTyG9nlsMApBPgbXguFq1nGWiDYo8XxIfY/JZOPhaeD78ELP20IXX39a21oQUFlNYEW8
 Sv4OmjRKJehtX+CPvRbDgzx2v1cMFI1OQs1KvqsqqQdffVXGX/uoVqqqp+n2fnvsBb4D0CIuZgI89l2iB/T3/PoWTioEn1NwCWNUNnBSHspRLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/04/2020 18:15, Helen Koike wrote:
> The Rockchip ISP bindings was moved out of staging.
> Update MAINTAINERS file with the new path.

Shouldn't there be a reference to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
as well in MAINTAINERS?

Regards,

	Hans

> 
> Suggested-by: Johan Jonker <jbx6244@gmail.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> V2:
> - This is a new patch in the series
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d66ac41ef5872..726044b84cf23 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14303,6 +14303,7 @@ M:	Helen Koike <helen.koike@collabora.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/media/rkisp1/
> +F:	Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>  
>  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>  M:	Jacob Chen <jacob-chen@iotwrt.com>
> 

