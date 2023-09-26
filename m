Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA047AE69C
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 09:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjIZHS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 03:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjIZHS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 03:18:28 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C07DDE
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 00:18:22 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id E2931240103
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 09:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1695712699; bh=X0PoM1F6cAIBp1xCCBKZz0CKN/WlTbBuBtj9LVo7xTU=;
        h=Message-ID:Subject:From:To:Cc:Date:Content-Transfer-Encoding:
         MIME-Version:From;
        b=oDUl/VysOyRT+VqLVFTB0RAMYxxC040LgppbqNFAIVeIAhV+PUEEqAsq9kLOwOCCY
         lk5ofo9udo9D7qj/qOdWhqlVqL5VPgyc+eqU+zzbFXxiWuAzyHezzS5rrb5dlHuTqT
         sBD0QDrxhdzITt7PCt1cAUU10SLeJNAcfnVx+VBSxvoD7OPQMEplyB+9LotGQHHPBt
         c4KY8uQRYoUkclXnuQPjNuQOtqLUh7nioE67gP+O2ikJxp6EGcfnvRgj/9CjFo9dw7
         WjDvdI9y1/fTlWew4TfklPs5gYYGIWSrkiWmAGliw0yck/U4WDH56m2XXAXlpln8d9
         PY5EpfqX1ryOw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Rvrgb1qmWz9rxH;
        Tue, 26 Sep 2023 09:18:19 +0200 (CEST)
Message-ID: <6976d91d1d83a7f932a4667f5923a1f2bd1857fd.camel@posteo.de>
Subject: Re: [PATCH 03/57] media: i2c: hi846: Drop check for reentrant
 .s_stream()
From:   Martin Kepplinger <martink@posteo.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Date:   Tue, 26 Sep 2023 07:18:18 +0000
In-Reply-To: <20230914181704.4811-4-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
         <20230914181704.4811-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, dem 14.09.2023 um 21:16 +0300 schrieb Laurent Pinchart:
> The subdev .s_stream() operation shall not be called to start
> streaming
> on an already started subdev, or stop streaming on a stopped subdev.
> Remove the check that guards against that condition.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> =C2=A0drivers/media/i2c/hi846.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index fa0038749a3b..746e1f75f9d0 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1607,9 +1607,6 @@ static int hi846_set_stream(struct v4l2_subdev
> *sd, int enable)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client=
 =3D v4l2_get_subdevdata(sd);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret =3D 0;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (hi846->streaming =3D=3D en=
able)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return 0;
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&hi846->mutex)=
;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (enable) {


Tested-by: Martin Kepplinger <martink@posteo.de>

thanks Laurent,

                                 martin

