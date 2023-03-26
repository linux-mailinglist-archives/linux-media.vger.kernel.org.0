Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6115C6C9769
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 20:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCZSSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 14:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjCZSSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 14:18:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A786D525B
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:23 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t10so26967772edd.12
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679854702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU0s1R57rTB0Vap+wElHhfQVUeZd/w5vcVz6ovrbCNM=;
        b=mI3NkBfiVLCvMSEFH3x+0acKLJDwFQuNyE5e8gceM4ElaqfzXrMHIedboNhmRCFena
         F7La6I4Upg4jK2fzyRRx/oeadq2bBSSz8Y+UX/JTSP/cubhbGrDQBp2iG/WJ5wzGzdCh
         axaJ0K+0GP9v4wHOmMldOf2o4i+qC1D5paKLp24NpJxQ4XmVuqgDANN3FNu50nT4sd6d
         t1wZDY2+0f7KBLSogy17c29Z3iZ39XKWG962URdfxwuW3b+IAgGcEuXAqCVr1nuNSURp
         77ggzX3jSAtraBYFHyryxe+d6o5WQgGEHfYvvCZC1CDrHCEVII8NsZgSfTAy8acj1Up0
         8w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679854702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU0s1R57rTB0Vap+wElHhfQVUeZd/w5vcVz6ovrbCNM=;
        b=Tt6kGTJjZyb4AaZutWHMDmF6tNYuaqM+zSlT4ad+OyqkyfiIxxzt+BtQb02irjOR2j
         zeCw3fx9IFHcDQ0pjAdxVDsEmh8B07NifK+wlK/arQ42c37TVdcv6YYhLnFo6p5vnF4D
         5LNMBKeaBG1jD0ImWY/FzAqYRomaedy7QlTt5XRAfBeyORUvBkKPcRddAbeCcq/mFh5j
         Umtl2S+i/PSTal0RSdi0ZeNg3OB73ac+tD+dpMYnTs1TIJ4xiBLuoZC6ICmvnVySJ2Ep
         uYl3oZkeBU0pJhnUNi6+UubfcOdbrbbw8eIFu+KTPQ4wikzM6vtmbguZHVfjdX6udsW6
         lpKw==
X-Gm-Message-State: AAQBX9dHVLJtz4KjhGe6MgvU//Urdc4uPout39DvO6crlOiulAS+svJx
        6mS2NprX3iwkpUQkW7ACz5M=
X-Google-Smtp-Source: AKy350bv5fgl4/oHPvMb2JpZdR2ht/Z2OACnckD3D5kBTv0er3Etgz1URQcW8Vww4vzd0h5DPL7cKA==
X-Received: by 2002:a17:906:a117:b0:939:fb22:c4c7 with SMTP id t23-20020a170906a11700b00939fb22c4c7mr10652752ejy.43.1679854702289;
        Sun, 26 Mar 2023 11:18:22 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id ch19-20020a170906c2d300b00933d64cd447sm10545909ejb.121.2023.03.26.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 11:18:21 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 081/117] media: sun8i_a83t_mipi_csi2: Convert to platform remove
 callback returning void
Date:   Sun, 26 Mar 2023 20:18:20 +0200
Message-ID: <1753021.VLH7GnMWUR@kista>
In-Reply-To: <20230326143224.572654-84-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-84-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne nedelja, 26. marec 2023 ob 16:31:48 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


