Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF38D5776AA
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 16:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiGQOXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 10:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiGQOXV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 10:23:21 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0381D13F74;
        Sun, 17 Jul 2022 07:23:20 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 1E81E2006F;
        Sun, 17 Jul 2022 17:23:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1658067798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0TeQJHGFF0EA7jkHlIbG2RaPoSPhSSIL4cSEpXiCPSM=;
        b=GsEkQPsAqC9xsivOr8FMpz1erGxATHhSFLC9gdDToUFAk9ZNQi/ROASkzxJeHs72FO6jsL
        vysXrqlPrJjh7dkvrQ3JDwWguPsmzYoLqB2urXgnvloOwdGyrDJJawgp1YqIzs0cloG3Hx
        w6vFtnWsUTTSKLK3t41dFaX7Iryz9IM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C0A17634D5F;
        Sun, 17 Jul 2022 17:23:17 +0300 (EEST)
Date:   Sun, 17 Jul 2022 17:23:17 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] media: i2c: ov9282: Add ov9281 compatible
Message-ID: <YtQbVcpmtZjZC2go@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
 <20220715074858.875808-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715074858.875808-4-alexander.stein@ew.tq-group.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1658067798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0TeQJHGFF0EA7jkHlIbG2RaPoSPhSSIL4cSEpXiCPSM=;
        b=G8HiBPy7JcMrFmDRayaQR4QXa5j4hMmdFWNIL3rjMp4Qjh0a/3kakqd6kmwtG4yr7p3ac8
        L/PZsqJ/H0fcvx8JfaJggtoZuRtXMbtZIpvpEyAjzzz/3BDL/v7XrTQSnAclXsivI1NJR6
        OacLpXfJwwzG4LhHaSaAD8UoJwmhjfY=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1658067798; a=rsa-sha256; cv=none;
        b=hHr0cfm6dVvnMS9iCdzE2dqixkHmHoP/S22ws7zbbR20+fhuNKPJD/Hdihx92mlcgfT2/d
        DGgLESDTggjVJ5Np+k/LwXGcGFGYmmb8CPCu4mwCqQrPYv1/qg37Y4XCqDol9BEw153jfJ
        lD2SlVypbd0LpdR7zdnRVCjnKVEEcFs=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Fri, Jul 15, 2022 at 09:48:55AM +0200, Alexander Stein wrote:
> According to product brief they are identical from software point of view.
> Differences are a different chief ray angle (CRA) and the package.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  drivers/media/i2c/ov9282.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 3269c1983bd5..04fda8222e07 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1114,6 +1114,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
>  };
>  
>  static const struct of_device_id ov9282_of_match[] = {
> +	{ .compatible = "ovti,ov9281" },

This should also be reflected in the entity name --- the user space
deserves to know it's a different device.

>  	{ .compatible = "ovti,ov9282" },
>  	{ }
>  };

-- 
Sakari Ailus
