Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF3C70F72A
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 15:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbjEXNDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 09:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235085AbjEXNC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 09:02:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4013310D2
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684933344; x=1716469344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6W9sI++O60QOOstp9EQd21YIdqI5qYqn1qp+kpFgKk=;
  b=GyFAJxc8UtKRbn89Vq+vJUO9YPjZXKfiYEWkrKuZDjpGYe7SmOElvrV4
   OdyUwdQRVLlubpnKUrHOjNC8wDlb1viC5N4zxiM2/mCoNIxV6qSYqgov/
   A9e0G5Xsqjlgt/n4kvgDC0GKSZfRxfaPvMjGfYqFPfdAx00krmp1wtkSQ
   MiMlL/BdSIE35qExvfUDfyWE4f6sgGmaCU3D+ltVoZ9bJpRxfP6UuUSRM
   iqpc4f6G0GJOvzIdU9olVUp9whM2cZEy2Udt2GBn8Vf67vqhrCnX9VjtX
   uHefftroNj7TkxPxWE2KivJAEEygbNpnW0etqv1eIeaL8ry41S+xxWjrV
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,189,1681164000"; 
   d="scan'208";a="31075446"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 May 2023 15:02:09 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 24 May 2023 15:02:09 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 24 May 2023 15:02:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684933329; x=1716469329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6W9sI++O60QOOstp9EQd21YIdqI5qYqn1qp+kpFgKk=;
  b=HZejIPjx9C760BJEoO4DpLVy/MSP+vD8uOjPtOnVoTUuIbPetVm7RCGM
   wq7IgUp6mFdtxW3BdQuQz0aQOK3SSi078Zb6pSvZs5u8uOkdCF2YSFmU8
   ujN+5UReOYk23/Y16WhFgp80sJLCaD5Wyosza8EcFqMoXztm38ehjoTET
   qColYakWhyJ5ieJa7oqRYsXzmWT2rmW1NpU2r1Js21aefPM8Jel2WFoZm
   jgryzokjmTQb74MqKiuhBN2GHtogpsNxyayo8JEYgdX87GCRVMVr1ZfiD
   704xvN+lD0zk+sKIiS7nY5bIlG1ih2kLH2rjmhFumA9shcfA477IDBOQY
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,189,1681164000"; 
   d="scan'208";a="31075444"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 May 2023 15:02:09 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2242E280082;
        Wed, 24 May 2023 15:02:09 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] Fix imx7-media-csi format settings
Date:   Wed, 24 May 2023 15:02:08 +0200
Message-ID: <2686251.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
References: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Am Mittwoch, 19. April 2023, 09:07:08 CEST schrieb Alexander Stein:
> Hi,
>=20
> v4 also incorporates feedback and improves commit messages a lot.
> Patch 3 is simplified now with hardware alignment constraintd being figur=
ed
> out.

Ping, any more reviews?

Thanks
Alexander

> Thanks,
> Alexander
>=20
> Alexander Stein (3):
>   media: imx: imx7-media-csi: Get rid of superfluous call to
>     imx7_csi_mbus_fmt_to_pix_fmt
>   media: imx: imx7-media-csi: Remove incorrect interlacing support
>   media: imx: imx7-media-csi: Relax width constraints for non-8bpp
>     formats
>=20
> Laurent Pinchart (1):
>   media: imx: imx7-media-csi: Init default format with
>     __imx7_csi_video_try_fmt()
>=20
>  drivers/media/platform/nxp/imx7-media-csi.c | 94 ++++++---------------
>  1 file changed, 24 insertions(+), 70 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


