Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5032710E2E
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241220AbjEYOUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjEYOUi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:20:38 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F84A189
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:20:33 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:17:6c0::7a9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B89BA660296C;
        Thu, 25 May 2023 15:20:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685024431;
        bh=kckLKIas8OQKHj9mgS3dAcAlwkYBLOPS+UmpWGh3W54=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=hWmiJWTaoRi6hmuqDZOul6ASwBK4mXuIYiCHcrNkRzCFiy5UdEDNJp6Nc2KamYgjJ
         4Hm33Mh+ByPMeLWWF5zj1LDxShWSRuE/l06q6u3/EtyiE/m2EVOylocyMX2aKgNV8h
         +iDqS/Y67BcEogAcCdBn3cqwv//h6Z3WezQbuO9xbVD60+Ot0ZYR4dITkl77fE1Mw8
         PI8Qi7HlM39RGUKH5TCsYONCwrDoqU/AfaJxtWoWOovFcjwAQM7n9NrNqv+g7xbLKv
         5/4LIfzaQNrjaNlGEvdFbnAoH5DBLUoSkO6ssjnmPEDMzbYQ+C7kpsbMGDRIWClNK4
         iix1mQvJaKXIQ==
Message-ID: <c3aa61c2ae8c3ac98a2dd63d29a0064ae8b8aa46.camel@collabora.com>
Subject: Re: [RFC 2/2] media: rkvdec: Add VP8 encoder
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Ford <aford173@gmail.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com
Date:   Thu, 25 May 2023 10:20:21 -0400
In-Reply-To: <20230523064237.pvj6pipj7ftnduom@pengutronix.de>
References: <20230309125651.23911-1-andrzej.p@collabora.com>
         <20230309125651.23911-3-andrzej.p@collabora.com>
         <CAHCN7xKQv=Dx7cVSc_ekZ2GHzOVFuv6Yzum=kGQnCVfWxV0m5w@mail.gmail.com>
         <20230523064237.pvj6pipj7ftnduom@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

Le mardi 23 mai 2023 =C3=A0 08:42 +0200, Marco Felsch a =C3=A9crit=C2=A0:
> Hi Adam,
>=20
> On 23-05-20, Adam Ford wrote:
> > On Thu, Mar 9, 2023 at 6:59=E2=80=AFAM Andrzej Pietrasiewicz
> > <andrzej.p@collabora.com> wrote:
> > >=20
> > > A stateless VP8 encoder for rockchip vpu2 found e.g. in rk3399.
> > >=20
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> >=20
> > Is there a good place or resource where I could learn more about
> > what's needed to port the vpu1 VP8 encoder?  I'd really like to port
> > the Hantro H1 encoder that's used on the imx8mm, but it seems like the
> > vpu2 encoder has different registers than the H1 encoder on the Mini.
> > I was hoping my employer would send me to Prague for the conference at
> > the end of June, but unfortunately, that's not going to happen.  I'd
> > like to get more involved with projects like this as a personal side
> > project.
>=20
> I'm currently working on the i.MX8MM H264 encoder kernel bringup.

Keep us posted ! We are interested too. Are you basing you work on Paul's R=
FC ?

>=20
> Regards,
>   Marco
>=20

