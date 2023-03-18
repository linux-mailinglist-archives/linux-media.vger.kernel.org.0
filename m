Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33996BFD70
	for <lists+linux-media@lfdr.de>; Sun, 19 Mar 2023 00:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjCRXX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Mar 2023 19:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjCRXX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Mar 2023 19:23:29 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13B41205F
        for <linux-media@vger.kernel.org>; Sat, 18 Mar 2023 16:23:27 -0700 (PDT)
Received: from [IPv6:2804:14d:72b4:8284:32a8:8167:f815:2895] (unknown [IPv6:2804:14d:72b4:8284:32a8:8167:f815:2895])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E49636602FCA;
        Sat, 18 Mar 2023 23:23:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679181805;
        bh=VwHxqnhyWqaflg+RDOb+rYLrVsfzP0nYKo4q6gwx1pw=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=OgzjSt14BFDmjoEnIZSqPA0bevArtFYqvDbyaRUOgjT5iq0SA/udJSqNlhAe9amRn
         Igds+7c3vMbvrkS4xe4ZMUtMnUJQxDSgkqaXUuFJ+0AkwSUTqcuuQeUtQ3J70LpegN
         RefwEiW17JkZN3wimTWfXLOmEUJ2g4NJJgD0avVJ+JmBUvTa1JLtkUBSiVl0Q4kO+N
         xB3EZSAw0i13sTdLay+EoNrmlITbFxSGE7NcOLpE3y6/E41QuZ8H0gVBrfB/yH72L8
         yMtbOHUkjCM8isOFDA1Nt0b7E/kb3u6uehngCviS6vrZ944X5ZfHbXx3WrBvJI/hdT
         CLf1z7n6S3LCg==
Message-ID: <a142c30ab49a8ff65c59bdc9bc0e4552c48bac68.camel@collabora.com>
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
From:   Daniel Almeida <daniel.almeida@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
Date:   Sat, 18 Mar 2023 20:23:10 -0300
In-Reply-To: <20230309125651.23911-3-andrzej.p@collabora.com>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
         <20230309125651.23911-3-andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrzej, one thing I noticed while looking at this:

> +struct hantro_vp8_entropy {
> +	/* TODO: int32_t? */
> +	int32_t coeff_prob[4][8][3][11];
> +	int32_t coeff_prob_old[4][8][3][11];
> +	int32_t mv_prob[2][19];
> +	int32_t mv_prob_old[2][19];
> +	int32_t y_mode_prob[4];
> +	int32_t uv_mode_prob[3];
> +};
>=20


In VP9, probabilities are coded in the 0..255 range, so if you want to
save space here, you can go with uint8_t.

-- Daniel
