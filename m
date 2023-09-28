Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7DAA7B170E
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjI1JUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Sep 2023 05:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjI1JUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Sep 2023 05:20:19 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E711A2
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 02:20:17 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 7DBBC240107
        for <linux-media@vger.kernel.org>; Thu, 28 Sep 2023 11:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1695892814; bh=vNg75BWjesiSPoc4xOBVO7NMpYNZqPj5y/QTD+itxPY=;
        h=Message-ID:Subject:From:To:Cc:Date:Content-Transfer-Encoding:
         MIME-Version:From;
        b=CEvae+P8PW/jhAfPAikzMwKPCPNtuZcpcXyMrOGYtyFmjWQ8KOh3Um7/Xp0/NPs+4
         2yiWP+ZWlIMFD3Oc8u0YJAeeaEDswO8HyfMQBIkcE+MIWCzPF0kotZpHTHKof/GpzH
         TfVDD2Hirt1HB++f+R+TmtRGomxxquaPfeb17499bNmMJuh1dhXMiaBPIG+1o3uBv7
         eKNSqpd6rYAAovFJqxOU9yEwubKdfcrK+3sGhh5gaNTB3hI/UDKD3uBsCtw8dBMxGh
         HNNn73bbCl6Z7Is3nzvuXzRIaiIj1XRk3/DzhOBCtlsm6mVjRZeBUOwLn07BRMR4+q
         8ijCVFQ/UaeJw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Rx7HJ5Q38z6twr;
        Thu, 28 Sep 2023 11:20:12 +0200 (CEST)
Message-ID: <38925de00ef14354a17e2437284e08d0524e6a23.camel@posteo.de>
Subject: Re: [PATCH] media: dt-bindings: hynix,hi846: Document orientation
 and rotation
From:   Martin Kepplinger <martink@posteo.de>
To:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org
Cc:     sakari.ailus@linux.intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Date:   Thu, 28 Sep 2023 09:20:12 +0000
In-Reply-To: <20230927181600.272904-1-festevam@gmail.com>
References: <20230927181600.272904-1-festevam@gmail.com>
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

Am Mittwoch, dem 27.09.2023 um 15:16 -0300 schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> Document the 'orientation' and 'rotation' properties, which
> are valid for the SK Hynix Hi-846 sensor.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> =C2=A0Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 4
> ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git
> a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> index 1e2df8cf2937..ab0ff6f60fc0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
> @@ -48,6 +48,10 @@ properties:
> =C2=A0=C2=A0 vddd-supply:
> =C2=A0=C2=A0=C2=A0=C2=A0 description: Definition of the regulator used fo=
r the VDDD power
> supply.
> =C2=A0
> +=C2=A0 orientation: true
> +
> +=C2=A0 rotation: true
> +
> =C2=A0=C2=A0 port:
> =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/$defs/port-base
> =C2=A0=C2=A0=C2=A0=C2=A0 unevaluatedProperties: false

hi Fabio,

thanks a lot, I like to have this fixed. I always thought we could re-
use media/video-interface-devices.yaml for these properties somehow...

if your change is preferred,

Acked-by: Martin Kepplinger <martink@posteo.de>

                         martin

