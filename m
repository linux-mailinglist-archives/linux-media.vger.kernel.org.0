Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EC17681B7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 22:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjG2UD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 16:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2UD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 16:03:27 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD621713;
        Sat, 29 Jul 2023 13:03:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RCwRW64R0zyTh;
        Sat, 29 Jul 2023 23:03:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1690661003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kogc4CLOox7Ks9ghdU80Z8otlWNzVI0Ojh0EJpSiW14=;
        b=j6I41TaesxkTowL7/CfMi6i1Vn+D3ayyMAwxrTmErB5awIjD2dsuKskGwYJCbkdEgH9UyB
        JQfo9O6mYUlsh/eF0RWwqGPvrHTJlA6ow11wmEtNFgCNspXQA3pH/YPDFmgCG6nEbC95P6
        GDpPVnt7ceE6aHES+fVljLddv87tLRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1690661003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kogc4CLOox7Ks9ghdU80Z8otlWNzVI0Ojh0EJpSiW14=;
        b=h5uowRSW0YCAdt+WBVG84K174hIaVRRz/2MtR7HkIIwYOS0Z5+CNru4U1CsTfy8MYmzSzV
        EBqcgV0TdtWnMNC2AE6KrLhw6jQQ65HXkZqEXLQMpl50WPSk83bsSoyKCQNJRsUUzuNGki
        S3qleNHSwmi+GjaF3LrLvIAAVGhuiBM=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1690661003; a=rsa-sha256; cv=none;
        b=wXLATVBW8HVQlA/iGVIjJqRqpYSbYUnUwAxSuI16rhI373AN136VUn+CRIDZLRJIGzaxgE
        9JoT8H4muh/FGO+wojqiUs/u16na2i7aH0XfwJLFGgyEO9lA632K52R1Dx0D+4qd/zdGE2
        4dQK7KazNWFucDHdEXv8+dNjL967tO4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 46524634C95;
        Sat, 29 Jul 2023 23:03:17 +0300 (EEST)
Date:   Sat, 29 Jul 2023 20:03:17 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
Message-ID: <ZMVwhYmXkubetq8p@valkosipuli.retiisi.eu>
References: <20230715201239.29014-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230715201239.29014-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan Niklas,

On Sat, Jul 15, 2023 at 10:12:39PM +0200, Niklas Söderlund wrote:
> Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
> and C-PHY this patch only adds support for the C-PHY mode due to lack of
> documentation and hardware to test on.
> 
> The V4H is the first Gen4 device that is enabled in the rcar-csi2
> driver. There is much overlap with the Gen3 driver, the primary
> difference is in how the receiver is started. The V4H have a much larger
> register space and some addresses overlap with Gen3.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I've made this change to the patch, it won't build otherwise (arm arch):

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 99d190a9e637..f6326df0b09b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -756,7 +756,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 
 	/* Adjust for C-PHY, divide by 2.8. */
 	if (priv->cphy)
-		mbps = (mbps * 5) / 14;
+		mbps = div_u64(mbps * 5, 14);
 
 	return mbps;
 }

-- 
Sakari Ailus
