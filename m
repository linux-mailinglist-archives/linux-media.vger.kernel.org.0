Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4747F2A985E
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 16:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgKFPOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 10:14:53 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:49275 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726812AbgKFPOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 10:14:17 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 14F995806FA;
        Fri,  6 Nov 2020 10:14:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 06 Nov 2020 10:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:content-type:mime-version
        :content-transfer-encoding; s=fm1; bh=0cSynKWzgk09s6YfF0S84Qn9cx
        77ILObwbSgoXE1y18=; b=lx5ws79bgquU9wuamSzA3x0ZVzVykW22CapFSNlCIP
        yS1ZrlhBd3GWaYkZSFmWYFWKK/lWyPC/NErVWSPpVKPv/0ajAmR4p8WnliZglLFa
        OetzwZDCqF8YOYNtaHCxOpCOpAfift6r/0HKkUIYtFwnqGJnxQLUsm4O6NR2q+Ek
        R5jKnbBzbsWtbA1Di/+qofrlR6ysclj8v40EpwU/L76hPKdC6KqrYofUb9aGCnOU
        eWYRmIXV1ADz5dnMyWAAUihWhVvr2fn2NWc4Sl2GACunSFFq1FXe0EadpIzyxaBk
        jy4VVQSFK3lXOvO+q2mg/NqkeYFVfYzqlLlk2munkPUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0cSynK
        Wzgk09s6YfF0S84Qn9cx77ILObwbSgoXE1y18=; b=SYvhdwg2Lf16TiD5A4Psj5
        csk3uFLKflVVdLUUMay9n51Ia7Q6f9W7MXkY59hKyramJZTA88yYGlbkexFB11W7
        2DkWVtxP9Mx4Ghx3c8qe4Bygs6GeouMGARpI6h/JuP8xuAMHeSMmDi+MRPubt/pv
        muiMPvYbNy2llkeaibWao395HafbfgnZlH1sHoyh+aZ5/LughJfOF73uJwCLf9FB
        fkZVgRNUX2qIT636r2PJkk6ASOCahyQ7IvyDRBMgr6mm2hL9totN6edWtLGu0d6P
        xxTVaz8cTaP3hdh/7uCHQKyaYWsau8SNm91L5Na4v7rl+cvCmXBjXK50kk9lhhWQ
        ==
X-ME-Sender: <xms:RWilX9GyUVTo2jcG2OA309gwwNqnIOxNGNslX-slk93NnDlyMTAJbw>
    <xme:RWilXyUFE6zWW7eO72tkbhMQMRnHv7WbVat-G8_5sRQU69SJxdrVKSe5vIC1obhFW
    LkOYy82KeB0rJRa84M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RWilX_LGNCYfMJAMHprxRTem7lKkDKMmIu96s3JrPzdUQNAfYA7Cfw>
    <xmx:RWilXzGNMTe52PAvAvxgKDdtvb7i3PKh4X0p_ALiS1tB19vh0bLwbw>
    <xmx:RWilXzXoYuhkHQkYJMxQX98FovLYebYiTAWd8mi83enhIWnZIcjX_g>
    <xmx:SGilX0sORRT82W2kIZPOPlTlfAIshsS4_JGQzUi6Pr_PK46GBzfIag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D7D1F328037B;
        Fri,  6 Nov 2020 10:14:12 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 0/7] sunxi: Remove the calls to dma_direct_set_offset
Date:   Fri,  6 Nov 2020 16:14:04 +0100
Message-Id: <20201106151411.321743-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,=0D
=0D
Here's an attempt to removing the dma_direct_set_offset calls we have in=0D
numerous drivers and move all those quirks into a global notifier as sugges=
ted=0D
by Robin.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (7):=0D
  drm/sun4i: backend: Fix probe failure with multiple backends=0D
  soc: sunxi: Deal with the MBUS DMA offsets in a central place=0D
  drm/sun4i: backend: Remove the MBUS quirks=0D
  media: sun4i: Remove the MBUS quirks=0D
  media: sun6i: Remove the MBUS quirks=0D
  media: cedrus: Remove the MBUS quirks=0D
  media: sun8i-di: Remove the call to of_dma_configure=0D
=0D
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  13 --=0D
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 ----=0D
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  17 ---=0D
 .../media/platform/sunxi/sun8i-di/sun8i-di.c  |   4 -=0D
 drivers/soc/sunxi/Kconfig                     |   8 ++=0D
 drivers/soc/sunxi/Makefile                    |   1 +=0D
 drivers/soc/sunxi/sunxi_mbus.c                | 132 ++++++++++++++++++=0D
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   1 -=0D
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 -=0D
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 ---=0D
 10 files changed, 141 insertions(+), 83 deletions(-)=0D
 create mode 100644 drivers/soc/sunxi/sunxi_mbus.c=0D
=0D
-- =0D
2.28.0=0D
=0D
