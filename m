Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE425776A8
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 16:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbiGQOWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 10:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiGQOWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 10:22:08 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A84113F3E;
        Sun, 17 Jul 2022 07:22:06 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id EFA1E202B7;
        Sun, 17 Jul 2022 17:22:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1658067723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o1ZeWnnTfcnfFOIuxe2eOd17G9zxDAM1hNIebsZsZNI=;
        b=zCidX2vq9d9E/gcYTKMYet7vJ8E/4nFrYJcV0t5MBdGPG4tCmyj8Ur9VyOwvWA/7rSzVw9
        FxmhzKRfXKzVoB4YjHj95QPeDALQoKuzaYBHuT05wruAfxKsxj8JR3GNSpFGRrvpPA2gtL
        CmJoJdXQ97dGeccR7VB6dYN1T5vgd1A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9B6D9634D5F;
        Sun, 17 Jul 2022 17:22:01 +0300 (EEST)
Date:   Sun, 17 Jul 2022 17:22:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: i2c: ov9282: Fix device detection
Message-ID: <YtQbCYCdUHcpnTs5@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
 <20220715074858.875808-7-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220715074858.875808-7-alexander.stein@ew.tq-group.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1658067723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o1ZeWnnTfcnfFOIuxe2eOd17G9zxDAM1hNIebsZsZNI=;
        b=H9Vc1uQUJcm0SFCNug42YgeFmDF/4bLmA/EhR1J6UElEffh28zO0NKwP/MKKGALPY288nL
        RXTtkzDSJUF52YA2m5+lonaSC7IPjHoVN0L1kdfG/5RJstF5CpHb4Z7UV9ChtLzawr9suI
        uSDlCa4rQZcPXXVxn4Kzh/w8eXhuZ5w=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1658067723; a=rsa-sha256; cv=none;
        b=H25o3LBYPJhAMaWXUBuxFS6CHH2qgxsP+YkORRGAmIXOOgryX5SNQ/PNWGmqJszpg7BPAV
        x0AbSBKMkawIAtEQBjxcpph84PWqdaEVnTL15GhHvCY5GZSDeZUAIhKJBNeRyPiikSz5Yx
        4gE7NGomn5psJeGnyJtmQvCT/z2A7to=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Fri, Jul 15, 2022 at 09:48:58AM +0200, Alexander Stein wrote:
> Apparently the Vision Components model (VC MIPI OV9281) does not support
> address auto-increment, so probe fails with:
> ov9282 2-0060: chip id mismatch: 9281!=92ff
> Instead do two 1 byte reads and combine the result.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Fix commit message
> * Add comment about prevented auto-increment
> * Return early if reading ID register failed
> * Reorder ID registers, smaller register number first
> 
>  drivers/media/i2c/ov9282.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 263cdffc558f..532791304c3d 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -761,11 +761,24 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>  static int ov9282_detect(struct ov9282 *ov9282)
>  {
>  	int ret;
> +	u32 id[2];
>  	u32 val;
>  
> -	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
> +	/*
> +	 * Some vendors prevent auto-increment, so each register has to
> +	 * be read separately
> +	 */

I suppose it still works for writes I guess? Would be nice to have this in
the comment.

> +	ret = ov9282_read_reg(ov9282, OV9282_REG_ID,
> +			      1, &id[0]);

Fits on one line. Same below.

>  	if (ret)
>  		return ret;
> +	ret = ov9282_read_reg(ov9282, OV9282_REG_ID + 1,
> +			      1, &id[1]);
> +	if (ret)
> +		return ret;
> +
> +	val = id[1];
> +	val |= (id[0] << 8);
>  
>  	if (val != OV9282_ID) {
>  		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",

-- 
Sakari Ailus
