Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6FB265F632
	for <lists+linux-media@lfdr.de>; Thu,  5 Jan 2023 22:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235700AbjAEVuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Jan 2023 16:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbjAEVuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Jan 2023 16:50:06 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567A56B1BE
        for <linux-media@vger.kernel.org>; Thu,  5 Jan 2023 13:48:53 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso2377226wmq.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jan 2023 13:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=alrY4BFFROjvxIkAB5o41BnjtZA88VOgDUEcSd8IWn0=;
        b=a6esB51ehQlh+xCJznXrQI/Ax+apU6QhIYab6sEuKROtA+SrMN9Lnatm/7PgA8stYI
         I/5YdZWLIdsaA5OQlm3PqZofZVNh348X1cSilu9+3PztaBu7gNnonVJwWoGFZoTk0otq
         o7ELuEebXczh/6DK4q92P6PvTFEZTLhSImOeWFLk/SjeUW2XzxwJ+p2BQw0Z8rYcLuCM
         RLjSJFNbWgo4j8CXAyhHF+ekOWm89XM6bwSZFWEIR8Y9RfwGXIJ7Gp2DBViOwaXGVtiH
         xM3YTf+Ad0620EOobWDmnaNo4ixcTuKk+f9cZHQI2sZ+exRSIg9BOyImN03Mh1rg4aQs
         YluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alrY4BFFROjvxIkAB5o41BnjtZA88VOgDUEcSd8IWn0=;
        b=uq1UDd9CmDDmtuhb9vLHcB/mgoAHmp5lNBxTKcERkuFuxXoBqo1wFbNUXORFcusOp9
         ZUKAoREci1FqydtNiGyy2RrDzgDkyhjR2V6NgzzXeeSa9Y1qTT7BkhV2BJ0uxb2B3l6B
         dFZoUJAnVAIsd/cnQiGAGdnhGmiYODfhXEiJ751+5ICT/EayOlBcFFiKThbfth6y+P66
         sRV7Yx0w7AFIcqIdGmGX2R5uvc+EorC9gXqYFT1RnwHk4AGssxJ/VLylGeN5XUQzyyJv
         owlHLl6Ap4CG5G2tEgeLNUIg+AURwuYJBhKv+t4D8/QUrY+PqjRpCKm+WvEAPbYWVQaU
         ffyQ==
X-Gm-Message-State: AFqh2koolekCwG6SaTiYa7Icao55wh6gjFTAYNSGdclsNSWBixYE7vGS
        ubD2xIlvG+3jGs6ABXdZ+SQJcr7++NLX8g==
X-Google-Smtp-Source: AMrXdXtpu04KaShqbfrEZgE6MfFjk7gq830CPu9vTqUkCq2L+IXiiQ+AjDC30AdwvWqPt0Qh/WKoYg==
X-Received: by 2002:a05:600c:21d9:b0:3d0:8d48:2993 with SMTP id x25-20020a05600c21d900b003d08d482993mr37009723wmj.36.1672955331473;
        Thu, 05 Jan 2023 13:48:51 -0800 (PST)
Received: from 192-168-1-215.localnet ([90.242.26.120])
        by smtp.gmail.com with ESMTPSA id bg41-20020a05600c3ca900b003d1e34bcbb2sm4405739wmb.13.2023.01.05.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:48:50 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From:   Adam Pigg <adam@piggz.co.uk>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Date:   Thu, 05 Jan 2023 21:48:46 +0000
Message-ID: <2864735.e9J7NaK4W3@192-168-1-215>
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3209878.aeNJFYEL58";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--nextPart3209878.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Adam Pigg <adam@piggz.co.uk>
Date: Thu, 05 Jan 2023 21:48:46 +0000
Message-ID: <2864735.e9J7NaK4W3@192-168-1-215>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0

On Wednesday, 4 January 2023 16:22:13 GMT Laurent Pinchart wrote:
> Hello,
> 
> This small patch series fixes format propagation in the sun6i-csi-bridge
> subdev from sink pad to source pad. In order to do so, it uses the V4L2
> subdev active state provided by the V4L2 subdev core (patch 2/2), with a
> preparatory patch (1/2) that drops direct access to the bridge fields
> from the capture side.
> 
> I haven't tested the patches myself as I lack a hardware platform for
> this, but Adam (on CC) has successfully tested them. Adam, if you want
> to reply with a Tested-by tag, that would be appreciated.
> 
> Laurent Pinchart (2):
>   media: sun6i-csi: capture: Use subdev operation to access bridge
>     format
>   media: sun6i-csi: subdev: Use subdev active state to store active
>     format
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
>  3 files changed, 110 insertions(+), 133 deletions(-)
> 
> 
> base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2
Tested-by Adam Pigg <adam@piggz.co.uk>

I have used these 2 patches, along with the other 5 here [1] to successfully
capture frames on the Pinephone rear camera (ov5640) using libcamera and its 
cam utility.

I will submit the other patches here shortly.

[1] https://github.com/sailfish-on-dontbeevil/kernel-megi/commits/pinephone-libcamera

--nextPart3209878.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEG9S9FlpVKT4WucElgZzecrq7HBkFAmO3Rb4ACgkQgZzecrq7
HBkVUA//YXWRrD33nE20D40rhD6rRbRGYM8GvA1v90f8+CNBst141aUL9FQa49CS
tI6oDTgZupUB0Inn2mPWxQEhKDOkwLAt+k6S0OtTPHIa2ooqY6/U7wGYRaZAe8YP
faFSxL+helPwpy2VWKFbwNxJeRAcBSL0vvMLafZuUz4et4rbBceTIeAL0cqUUB5L
mbIiGLcqu9d2ixh1HtceUsXMMS/9n0TP1uZ54E7rKDAjBjGo+3vLCf92oDe0xw5A
9Z7k3uiMANJcqXKyAeUrJBiRGm0v48S5bUFe3VeBIM3DeYdB75kcv8b/S4dc5Nds
+O9YNhfz4nrYycOMl57O1HV4iMpELUqbs0uuT9u8nNsZCAW9BbNDXCSFd+xd0+zV
PRXTZgYcsmOROT1f/5pUYqd4ay+M6hd60cWR92Ddb0qFvPsi1ONq3XsHz26/N46R
4valKT9Zh/V+iOPg6FBbEtK5v+OcC2xlb/MdJ31E3E0mjI/KsFP3ct+q5h0FTWKn
OKMJu6VPAr/06eDWAqm8DozKQOzOiYuZG78VoW5PepvnRB1zentZYsfJZjsr+f1g
bszBL5vXktUbtM8WmSl489C1p6IAQPPF8DlW7QkTB3zgHXMhCM7i8PNijyJ/pmgs
q1DvAh4FnO1NE1X2OPgtzaXK3bLtCiogeZVTgQELzbCSEphDyCY=
=GNd6
-----END PGP SIGNATURE-----

--nextPart3209878.aeNJFYEL58--



