Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0B7327DE4
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 13:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhCAMJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 07:09:27 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:7184 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232943AbhCAMJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 07:09:24 -0500
X-IronPort-AV: E=Sophos;i="5.81,215,1610377200"; 
   d="scan'208";a="73495753"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2021 21:08:33 +0900
Received: from localhost.localdomain (unknown [172.29.52.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 687E54006182;
        Mon,  1 Mar 2021 21:08:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] VSP trivial enhancements
Date:   Mon,  1 Mar 2021 12:08:26 +0000
Message-Id: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series fixes 2 null pointer issues on the below cases

1) Use BRS without BRU module

2) UIF module is not used.

This issues were found during display bringup on RZ/G2L SoC.
RZ/G2L has only BRS module and no UIF module.

Biju Das (2):
  media: v4l: vsp1: Fix bru null pointer access
  media: v4l: vsp1: Fix uif null pointer access

 drivers/media/platform/vsp1/vsp1_drm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

