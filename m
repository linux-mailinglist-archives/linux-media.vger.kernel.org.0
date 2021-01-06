Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07C72EC30B
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbhAFSNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:13:11 -0500
Received: from mailoutvs41.siol.net ([185.57.226.232]:37769 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727129AbhAFSNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 13:13:11 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id ED59E5233E5;
        Wed,  6 Jan 2021 19:12:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id NEFu0ynyORRz; Wed,  6 Jan 2021 19:12:27 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id AD0BB5233E7;
        Wed,  6 Jan 2021 19:12:27 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id D33B25233E5;
        Wed,  6 Jan 2021 19:12:26 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, jernej.skrabec@siol.net,
        linux-sunxi@googlegroups.com
Subject: [PATCH 0/2] ARM: dts: sun8i: r40: Add deinterlace node
Date:   Wed,  6 Jan 2021 19:18:59 +0100
Message-Id: <20210106181901.1324075-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These two patches add support for deinterlace core found on R40. It's
compatible to H3 one, so only DT node is needed.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: media: Add Allwinner R40 deinterlace compatible
  ARM: dts: sun8i: r40: Add deinterlace node

 .../media/allwinner,sun8i-h3-deinterlace.yaml |  3 +++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

--=20
2.30.0

