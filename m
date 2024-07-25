Return-Path: <linux-media+bounces-15331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040C93BF53
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A101C20C4E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 09:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D395C198E78;
	Thu, 25 Jul 2024 09:46:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F6198A2A;
	Thu, 25 Jul 2024 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721900816; cv=none; b=FGosMPS/+3U6AUX7HLAphd6OJIXJV3qd5yjP0pVb0qktI5/kogsquwb3RKfOp5sPCQFPDpnQGORPz/byoKC1PYLrJ0QDynMSv4wFtyLBvcOkD2R+ytFwH6axhdi18Fu50KesNx6ujLQ5+r1te5tRwcEPuOmoSddAhi66PuP4U8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721900816; c=relaxed/simple;
	bh=Zl6WxDvgI6EdQ86iGmiE7ATIMtA9F82mrPyf5FE1DF8=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=PAd54vqabUapv34rM/FoxpZ80D7d0uWiLMRt1vnRpBWHMEmxgAwXsuuFUvWsfas8ugFKf4xFx1OmjTUWdJ1YFSg+NMrK8qG9N9mQZFYf2cHX95WBZUitUCysQOiTULvAKATkdDXywKU3g5RdHpJbJb1SgHfb3IPlCfJTFeBR89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from harlem.collaboradmins.com (harlem.collaboradmins.com [IPv6:2a01:4f8:1c0c:5936::1])
	by madrid.collaboradmins.com (Postfix) with ESMTP id AE7C137811F4;
	Thu, 25 Jul 2024 09:46:51 +0000 (UTC)
From: "Shreeya Patel" <shreeya.patel@collabora.com>
In-Reply-To: <172142702137.153951.8294803513682327237.robh@kernel.org>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-3-shreeya.patel@collabora.com> <172142702137.153951.8294803513682327237.robh@kernel.org>
Date: Thu, 25 Jul 2024 10:46:51 +0100
Cc: kernel@collabora.com, mchehab@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, nelson.costa@synopsys.com, linux-arm-kernel@lists.infradead.org, heiko@sntech.de, mturquette@baylibre.com, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl, linux-rockchip@lists.infradead.org, shawn.wen@rock-chips.com, sboyd@kernel.org, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>, p.zabel@pengutronix.de, jose.abreu@synopsys.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, nicolas.dufresne@collabora.com
To: "Rob Herring (Arm)" <robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <ae465-66a21f00-1-25170f80@209442668>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 2/4] =?utf-8?q?dt-bindings=3A?=
 =?utf-8?q?_media=3A?= Document bindings for HDMI RX Controller
User-Agent: SOGoMail 5.10.0
Content-Transfer-Encoding: quoted-printable

On Saturday, July 20, 2024 03:40 IST, "Rob Herring (Arm)" <robh@kernel.=
org> wrote:

>=20
> On Fri, 19 Jul 2024 18:10:30 +0530, Shreeya Patel wrote:
> > Document bindings for the Synopsys DesignWare HDMI RX Controller.
> >=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> > ---
> >=20
> > Changes in v4 :-
> >   - No change
> >=20
> > Changes in v3 :-
> >   - Rename hdmirx=5Fcma to hdmi=5Freceiver=5Fcma
> >   - Add a Reviewed-by tag
> >=20
> > Changes in v2 :-
> >   - Add a description for the hardware
> >   - Rename resets, vo1 grf and HPD properties
> >   - Add a proper description for grf and vo1-grf phandles
> >   - Rename the HDMI Input node name to hdmi-receiver
> >   - Improve the subject line
> >   - Include gpio header file in example to fix dt=5Fbinding=5Fcheck=
 failure
> >=20
> >  .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++=
++++
> >  1 file changed, 132 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/snps,dw=
-hdmi-rx.yaml
> >=20
>=20
> My bot found errors running 'make dt=5Fbinding=5Fcheck' on your patch=
:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.exampl=
e.dts:53.38-39 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bind=
ings/media/snps,dw-hdmi-rx.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt=
=5Fbinding=5Fcheck] Error 2
> make: *** [Makefile:240: =5F=5Fsub-make] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20=
240719124032.26852-3-shreeya.patel@collabora.com
>=20
> The base for the series is generally the latest rc1. A different depe=
ndency
> should be noted in *this* patch.
>=20

My HDMI RX patches are based on the linux-next/master branch.
Since the bot tested the patches on top of rc1, it resulted in some err=
ors
due to missing reset ID patches.

I think the above statement means I should explicitly mention in this
patch that it is based on linux-next/master (something to keep in mind
for future :)


> If you already ran 'make dt=5Fbinding=5Fcheck' and didn't see the abo=
ve
> error(s), then make sure 'yamllint' is installed and dt-schema is up =
to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. =
Note
> that DT=5FSCHEMA=5FFILES can be set to your schema file to speed up c=
hecking
> your schema. However, it must be unset to test all examples with your=
 schema.
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com


