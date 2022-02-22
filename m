Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517664BF4C8
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 10:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiBVJeT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 04:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiBVJeT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 04:34:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE14113D8B
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 01:33:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D4547F;
        Tue, 22 Feb 2022 10:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645522429;
        bh=7blLsgG0PFY2blh1Pq6pYIMamIrmQfbObl/rjt/2imY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BvxjqgZg8ekFw+9fBqW1INDZEi71tbA6aOL9Zt5JpL5K7ISX+aDF+k1FbNTR8u/qA
         nXXvn2/pHL2dEwLdHuHUKU1Pma/CFOJkk3f47zjhLBPPA6e3peNqyxaMOUUjwu1N8d
         W/RfUgwkadkEhtKQ8pMUVn7g+gbQXZfA6OUHRJ8Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
References: <20220222063202.petjwwcfctzsbhxx@basti-TUXEDO-Book-XA1510> <5d5dee88-9dbf-e4d0-4a91-11ff4ecd82ea@xs4all.nl>
Subject: Re: Deprecated Maintainer entries?
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     dafna@fastmail.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Helen Fornazier <helen.fornazier@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke <sebastian.fricke@posteo.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Date:   Tue, 22 Feb 2022 09:33:47 +0000
Message-ID: <164552242717.3903979.13120370672946514368@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Quoting Hans Verkuil (2022-02-22 07:46:31)
> The same is true for VIMC where Helen was maintainer. Shuah, would you
> be willing to take over VIMC as maintainer? If not, then I can put myself
> up there as maintainer (but 'odd fixes' only, probably).
>=20
> I added a few collabora people to the CC and also Helen's email, although
> I don't know if she actively monitors her gmail address.

As VIMC is one of the (well, it IS the) main drivers that will test
libcamera in a virtual environment, I'm keen to see it progress, so I'll
throw my hat in the ring to help out here too.

--
Kieran


>=20
> Thanks for pointing this out, Sebastian.
>=20
> Regards,
>=20
>         Hans
>=20
> On 2/22/22 07:32, Sebastian Fricke wrote:
> > Hey folks,
> >=20
> > I noticed that in:
> > ```
> > ROCKCHIP ISP V1 DRIVER
> > M:=C2=A0=C2=A0=C2=A0 Helen Koike <helen.koike@collabora.com>
> > M:=C2=A0=C2=A0=C2=A0 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > L:=C2=A0=C2=A0=C2=A0 linux-media@vger.kernel.org
> > L:=C2=A0=C2=A0=C2=A0 linux-rockchip@lists.infradead.org
> > S:=C2=A0=C2=A0=C2=A0 Maintained
> > F:=C2=A0=C2=A0=C2=A0 Documentation/admin-guide/media/rkisp1.rst
> > F:=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/media/rockchip-i=
sp1.yaml
> > F:=C2=A0=C2=A0=C2=A0 Documentation/userspace-api/media/v4l/pixfmt-meta-=
rkisp1.rst
> > F:=C2=A0=C2=A0=C2=A0 drivers/media/platform/rockchip/rkisp1
> > F:=C2=A0=C2=A0=C2=A0 include/uapi/linux/rkisp1-config.h
> > ```
> >=20
> > Both maintainers do not work for Collabora anymore, so they probably
> > will not receive any mail on those mail addresses.
> >=20
> > @Dafna: I do not know which mail address Helen currently uses, are you
> > aware of any?
> >=20
> > Greetings,
> > Sebastian
