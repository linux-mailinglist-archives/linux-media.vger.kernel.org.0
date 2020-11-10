Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559642AD5CE
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 13:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730074AbgKJMBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 07:01:53 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39840 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgKJMBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 07:01:52 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AAC1maK031739;
        Tue, 10 Nov 2020 06:01:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605009708;
        bh=wCRTJJjnhbgI5KP8iM2EISON2IZQ8Ci3jNba4ttYH7U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hI/7kiTJ27/GEsOKXfXA/48MDnO53qTcyDIkn5FAIPk5uXXoTQ4yWj7BCFcMx1rqI
         fqBt7uA/mE/zZ9JSWU+27UMuIx2fr7XUUNEpZb0oY5uwcP2xM3LGdz4cVPgNt0qM83
         Vgu07tuymKFdexNxmyKU/p7dEGqZEnpWzOPfrwyo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AAC1m08086548
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Nov 2020 06:01:48 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:01:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:01:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AAC1jul051383;
        Tue, 10 Nov 2020 06:01:45 -0600
Subject: Re: [PATCH 08/19] drm/omapdrm/omap_gem: Fix misnamed and missing
 parameter descriptions
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Rob Clark <rob.clark@linaro.org>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-9-lee.jones@linaro.org>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <3d5dc164-d26a-5999-1e7f-9cabfdd84c36@ti.com>
Date:   Tue, 10 Nov 2020 14:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106214949.2042120-9-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/11/2020 23:49, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/omapdrm/omap_gem.c:593: warning: Function parameter or member 'file' not described in 'omap_gem_dumb_create'
>  drivers/gpu/drm/omapdrm/omap_gem.c:593: warning: Excess function parameter 'drm_file' description in 'omap_gem_dumb_create'
>  drivers/gpu/drm/omapdrm/omap_gem.c:619: warning: Function parameter or member 'offset' not described in 'omap_gem_dumb_map_offset'
> 
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/omapdrm/omap_gem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks! I'll pick this one and the next to drm-misc-next.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
