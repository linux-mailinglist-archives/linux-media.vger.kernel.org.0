Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551B957E31D
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 16:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiGVOh6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 10:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGVOh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 10:37:57 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3D28C3CC
        for <linux-media@vger.kernel.org>; Fri, 22 Jul 2022 07:37:55 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 637DE1B0004B;
        Fri, 22 Jul 2022 17:37:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1658500674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sGQWU/hhQLhvVvRKPEO47A1fCtVqsikZqImP5vhL368=;
        b=riS3+se1UFj1SbepnkYxQ9k4y+TVSFQyTtdFuyfoIzqsiTn5ywdgqXKz66Ni9qQbpRSV5o
        CRlB8puYnXBrxuo1nxWJ7CjeSiKn2PelkeXOB2plz6Khj7eIgyoyoydAkbQbLP5kqBReAu
        z5TpFbPr8r8zvGqs2h5dE3zuM7mRdnpHr+HEE7iKNRhSZsgoPDhKKyrrGm536tFVDCXCXr
        USe8EyVO6iQQ7C+CQasmKkeSTk1zWN04fNW4JJjffzK3vgvAKpVX/UkZVcB903jswzsR0P
        U/XMzobqhLQwRaApIANMknYb+RS9yaLsaq8l3j4Y+Gx4vYtpmOnCiu5n5ZP3hg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0B762634C95;
        Fri, 22 Jul 2022 17:37:54 +0300 (EEST)
Date:   Fri, 22 Jul 2022 17:37:53 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: Re: Re: [PATCH 07/19] media: i2c: imx290: Support variable-sized
 registers
Message-ID: <Ytq2Qb04baTNy+I4@valkosipuli.retiisi.eu>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <6038880.cEBGB3zze1@steina-w>
 <Ytk3nfwQ7eEQSTcV@pendragon.ideasonboard.com>
 <8007753.G0QQBjFxQf@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8007753.G0QQBjFxQf@steina-w>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1658500674; a=rsa-sha256;
        cv=none;
        b=t977s7FWurDu5lxfn6rbc+j0pZSfGbXe0RwiSphMcNWEWiuFM0N3hTCd5cAeNp6dgShYq/
        gUaXJVrle4gyAff+e0MIQ2PDlb0EZDTFvJM21VdsAhi8Hx+GVNMes6umKxR1XYNP69A0IS
        PK7E5hemuK+mtIYsKMGnm8MO2LtnA1rk56j/PxPnfvr+/f8cBgXxwct8jWaP8JpwTSagcy
        mAm/Hd/4olQRyMR/mVC/vnQJguKHsxNPWp6pD937MH8mzuKZ1fg1Y+QWTTmyrO6Ocu2UnZ
        Y/Fmz0COvJtzZIlr9kaXbm5vBMX18R9R5Tgmvekw+u93tMedf37WX9F0inV9sg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1658500674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sGQWU/hhQLhvVvRKPEO47A1fCtVqsikZqImP5vhL368=;
        b=v560Nstf6YgoCr/l4Fhswxqvpf4XmEhCzJUZ3NTbx39/IYlhSwu8whAdDwnTPgf9YzUuu0
        vZXFL80/kmCOFH3K5leYhCpPaVyVwJM0F8PVI8XCZDFzUwz8MhLEnT94aSxt1y6s/nbxE3
        VKcAxIXh69DXVdHw8HZP31sGeDqsNDgEwYjuGliebVjd73UXIqEBxKnF64l7eDbotEoGRA
        swE19X/v1XbhUpzA1vAumVc+dRZpTekptdpoInrnNuOwyigNj4/oriTz3nhFmwlYz9TrfB
        pZ1l9SprkTqGYIu2vLxpzYNPClwrKeSG3BDxBkIpEOVodUNrnFk15jjOjDt91Q==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Thu, Jul 21, 2022 at 01:43:54PM +0200, Alexander Stein wrote:
...
> Nice the following snippet does the trick already:
> ---8<---
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -221,6 +221,7 @@ static const struct imx290_pixfmt imx290_formats[] = {
>  static const struct regmap_config imx290_regmap_config = {
>         .reg_bits = 16,
>         .val_bits = 8,
> +       .use_single_read = true,
>  };
>  
>  static const char * const imx290_test_pattern_menu[] = {
> ---8<---
> 
> As this affects the VC OV9281 as well, any suggestions for a common property?

If there's a 1:1 I²C mux in there between the host and the sensor, should
it be in DT as well? I'm not entirely certain it's necessary.

The property could be called e.g. "single-octet-read". I think this should
probably be documented in I²C bindings (or even regmap).

-- 
Regards,

Sakari Ailus
