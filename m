Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B73766811
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 11:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbjG1JCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 05:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjG1JCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 05:02:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5ACB6
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 02:02:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7452B62059
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 09:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65296C433C8;
        Fri, 28 Jul 2023 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690534939;
        bh=Vhj/BB+DVwglt9+HwG0lLh2yTQy8gagBrdFE6JNuBO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aWdMPUQbXPkZysC4pEvAfkvy5A82rJgC//SB2MxJuxO7KIu5mZa78eR3Wftkg0Jfv
         tAMht/N0kzOIu+h4Ai7ODIX8Ftv8Taqav4o1YH0/CWxInOUuBI1fXyvT62tFRewgIK
         SBAlyvNIh0eFZuEEZ+TjiM8JuPOylVy/zc49q/t0kUuwqknG+GQlfRbpc8N0ymLEtg
         4bb0TmUgVbbFyB5wpOirNODaPBgz5hKmbGiwIoT6r7Z9DAVa125/bx86sJ7iMrU0MQ
         abOR78xHaU5i17GiKM4VPncvAtZ698Avl9A9Mb+PbNh0DZecx2cluOE4zjnC1df7+U
         /leFOH7LhH6Iw==
Date:   Fri, 28 Jul 2023 11:02:10 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 38/38] media: Documentation: v4l: Document sub-device
 notifiers
Message-ID: <20230728110210.563a8dd1@coco.lan>
In-Reply-To: <20230727054255.1183255-39-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
        <20230727054255.1183255-39-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 27 Jul 2023 08:42:55 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Document that sub-device notifiers are now registered using
> v4l2_async_subdev_nf_init(). No documentation is changed as it seems that
> sub-device notifiers were not documented apart from kernel-doc comments.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> # rcar +=
 adv746x
> Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.M=
X6Q with TC358743
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Rene=
sas RZ/G2L SMARC
> ---
>  Documentation/driver-api/media/v4l2-subdev.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentati=
on/driver-api/media/v4l2-subdev.rst
> index eba5e4468282..e56b50b3f203 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -218,6 +218,17 @@ available. There may be one or more async connection=
s to a given sub-device but
>  this is not known at the time of adding the connections to the notifier.=
 Async
>  connections are bound as matching async sub-devices are found, one by on=
e.
> =20
> +Asynchronous sub-device notifier for sub-devices
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +A driver that registers an asynchronous sub-device may also register an
> +asynchronous notifier. This is called an asynchronous sub-device notifie=
r andthe
> +process is similar to that of a bridge driver apart from that the notifi=
er is
> +initialised using :c:func:`v4l2_async_subdev_nf_init` instead. A sub-dev=
ice
> +notifier may complete only after the V4L2 device becomes available, i.e.=
 there's
> +a path via async sub-devices and notifiers to a notifier that is not an
> +asynchronous sub-device notifier.
> +
>  Asynchronous sub-device registration helper for camera sensor drivers
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20

Hmm... you did a lot of reorder at the code for async devices. IMO,
you should be pointing at the documentation what's the expected order
of kAPI usage: what comes first? V4L2 register? async notifiers? etc.

Regards

Thanks,
Mauro
