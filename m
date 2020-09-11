Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0C4265D88
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 12:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgIKKOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 06:14:34 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:59494 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725710AbgIKKOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 06:14:33 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="57031544"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Sep 2020 19:14:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4BE7A4007548;
        Fri, 11 Sep 2020 19:14:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 0/2] media: rcar-vin: Kconfig: Update Kconfig
Date:   Fri, 11 Sep 2020 11:14:20 +0100
Message-Id: <20200911101422.20333-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This is trivial patch series updating the rcar-vin Kconfig to
include Renesas RZ/Gx SoC's

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2
    config
  media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_VIN
    config

 drivers/media/platform/rcar-vin/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

