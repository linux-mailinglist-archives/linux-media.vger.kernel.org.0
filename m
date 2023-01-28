Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB9867FB22
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 22:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjA1V1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 16:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjA1V1k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 16:27:40 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45A71817F
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 13:27:38 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 15C94CD4EE;
        Sat, 28 Jan 2023 21:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1674941257; bh=BYlZH2VAlJu3U/ahgexW+J/uNhDJ+yzq3ciBE0NKIbA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=tC0w8NWEQvVWTlTzJNHlaWlTTBo4TLzEUfdfNMZCPxOmAWZ6xyfHVZ2L9cUf2UJAQ
         gJIPtoPBT6MzlDlYAk1pYalkWoJ0ych0H4b6RpxwaxwoOJmnpGkXk0SAcDlq2Pb8g2
         w27yNEGU8Z95cHsU7PGOlFlYosaRoFofkqZQyE8U=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v6 0/9] media: i2c: ov5670: OF support, runtime_pm,
 regulators
Date:   Sat, 28 Jan 2023 22:27:35 +0100
Message-ID: <3715796.kQq0lBPeGt@g550jk>
In-Reply-To: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
References: <20230126165909.121302-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Donnerstag, 26. J=E4nner 2023 17:59:00 CET Jacopo Mondi wrote:
> Hello
>   this small series introduces OF support for the ov5670 sensor and
> adds support for regulators clocks and GPIOs.
>=20
> Last year I dropped the ball as I didn't have access to HW anymore.
> Luca (in cc) has reported he has a sensor and might give this new version
> a spin, thanks!

With this series the sensor initializes correctly for me on msm8974pro-
fairphone-fp2. I locally have essentially one more change that configures t=
he=20
sensor for single-lane operation (currently dual-lane is hardcoded) and wit=
h=20
that I can get image that using libcamera.

Tested-by: Luca Weiss <luca@z3ntu.xyz>


Thanks for respinning this!

Regards
Luca

>=20
> Cheers
>   j
>=20
> v5->v6:
> - Rework clock parsing as suggested by Sakari
> - Move runtime_pm enablement after async subdev registration
> - Use DIV_ROUND_UP to round clock freq
>=20
> v4->v5:
> - Enable clock in ov5670_runtime_resume() as suggested by Luca
> - Add a patch to handle HBLANK, PIXEL_RATE and LINK_FREQ in .set_ctrl()
>   to fix a warning again reported by Luca
>=20
> v3->v4:
> - Rework power enablement in power up sequence to support !CONFIG_OF
> - Minor changes as per Sakari's review
>=20
> v2->v3:
> - bindings:
>   - Drop assigned-clock properties from schema (moved to example)
>   - s/pwdn-gpios/powerdown-gpios/
>=20
> - driver
>   - Use is_of_node() to decide how to parse clocks
>   - Fix:
>     drivers/media/i2c/ov5670.c:1787:18: error: initializer element is not=
 a
> compile-time constant .analog_crop =3D ov5670_analog_crop,
>                                   ^~~~~~~~~~~~~~~~~~
>=20
>     reported by kernel test robot and Nathan Chancellor with
>     clang15 and gcc < 8
>=20
> v1->v2:
> - Address Krzysztof comments on bindings
> - 2/8: new patch to use the common clock framework
> - Address Lauren's comment on runtime_pm function names
> - 7/8: new patch to implement init_cfg as suggested by Laurent
> - Rework 8/8 which was incorrect as reported by Laurent
>=20
> Thanks
>    j
>=20
> Jacopo Mondi (8):
>   media: dt-bindings: Add OV5670
>   media: i2c: ov5670: Allow probing with OF
>   media: i2c: ov5670: Use common clock framework
>   media: i2c: ov5670: Probe regulators
>   media: i2c: ov5670: Probe GPIOs
>   media: i2c: ov5670: Add runtime_pm operations
>   media: i2c: ov5670: Implement init_cfg
>   media: i2c: ov5670: Handle RO controls in set_ctrl
>=20
> Jean-Michel Hautbois (1):
>   media: i2c: ov5670: Add .get_selection() support
>=20
>  .../bindings/media/i2c/ovti,ov5670.yaml       |  92 ++++++
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/ov5670.c                    | 312 +++++++++++++++---
>  3 files changed, 360 insertions(+), 45 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
>=20
> --
> 2.39.0




