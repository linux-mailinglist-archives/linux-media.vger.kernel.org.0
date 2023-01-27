Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3E867DAD5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 01:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjA0Abc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 19:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjA0Abb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 19:31:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA7259D6
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 16:31:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AF25CDB;
        Fri, 27 Jan 2023 01:31:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674779488;
        bh=THvmh/aS4ndeaTgR8Ic5BDYPv0LHoQr1fpV2vypIyGw=;
        h=From:To:Cc:Subject:Date:From;
        b=FxqC1rIBt6e0KKb8h0smLtM1M6BaJ2VsUlpqaQEtQqBnglcHPpeEc4Fnfzmn9Ls6i
         UR5Ro/4uRXsm/Iaj74njqXKSTrk7EF734iQkgEiqxztDjlatLoXgCMJffpZqBo8Zkn
         ylxbGZeWRujKF/mnjJTkwndEX6Pj52M2yiBYOXLA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/3] media: rkisp1: Convert to V4L2 subdev active state
Date:   Fri, 27 Jan 2023 02:31:21 +0200
Message-Id: <20230127003124.31685-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This small patch series converts the three subdevs of the rkisp1 (CSI,
ISP and resizer) to use the V4L2 subdev active state. This simplifies
the implementation of the subdevs, as well as the locking scheme. There
isn't much else to add here, please see individual patches for details.

I have successfully tested this series on an i.MX8MP (Debix) and an
RK3399 (Rock Pi 4).

Laurent Pinchart (3):
  media: rkisp1: resizer: Use V4L2 subdev active state
  media: rkisp1: isp: Use V4L2 subdev active state
  media: rkisp1: csi: Use V4L2 subdev active state

 .../platform/rockchip/rkisp1/rkisp1-common.h  |  18 --
 .../platform/rockchip/rkisp1/rkisp1-csi.c     | 107 +++----
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 261 +++++++-----------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 184 +++++-------
 4 files changed, 201 insertions(+), 369 deletions(-)

-- 
Regards,

Laurent Pinchart

