Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D405C647177
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 15:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiLHOUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 09:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiLHOUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 09:20:30 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4362ED2FD;
        Thu,  8 Dec 2022 06:20:29 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C0F00C0010;
        Thu,  8 Dec 2022 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670509227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Er/zpDRtCQXlbS772FbVkPP0n/UrKmzzmTIs7nTLoI4=;
        b=n1k1Yf0W5V1TTM6CadsEXCVgumhJKTHTq0FWkWUdr9QeBrRsW1ZBLXAs8O0UiZV0hRlV8P
        wiqNfUm97nmrAPO4f2GrajxSfnn81eoI9sxm6IH5KxBd1iLIbhKKDchR22kKkOLrzZB0Ts
        hfC2q4CQ9x9K3PpllK+Gm//rzFDWZybKnRsnm0o3VaU3ybwqP/HeMK8jWNuSIcXQm+HSaI
        Zm0kzal1hQd3Qjh8uFX5nwmWdhssmVKgj/QhTWtzuMsVfPwcLRJ7IRx+fZuwjAHiIWvXSc
        IBjokKolhZ+pWOxEmvE6OVclNUabiWdcTSFneZXGFwOqkXcbU6WBYGl3/76rUw==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Conor Dooley <conor@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v3 00/12] Allwinner A31/A83T CSI/ISP/MIPI CSI-2 media fixes
Date:   Thu,  8 Dec 2022 15:19:54 +0100
Message-Id: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series resolves reported smatch warnings against the recently-introduced
Allwinner A31/A83T CSI, ISP and MIPI CSI-2 drivers.

Smatch was ran again on the updated tree and no longer shows any error or
warning.

Changes since v2:
- Added isp params pending buffer fix;
- Added fixes tags where needed;
- Reworded cosmetic commits;
- Changed sunxi-isp to the proper sun6i-isp.

Changes since v1:
- Added fixes for static struct declarations;
- Fixed ISP commit titles by replacing bridge with proc.

Paul

Paul Kocialkowski (12):
  media: sun6i-csi: bridge: Fix return code handling in stream off path
  media: sun6i-csi: bridge: Error out on invalid port to fix warning
  media: sunxi-csi: bridge: Declare subdev ops as static
  media: sun6i-csi: capture: Remove useless ret initialization
  media: sun6i-mipi-csi2: Clarify return code handling in stream off
    path
  media: sun8i-a83t-mipi-csi2: Clarify return code handling in stream
    off path
  media: sun6i-isp: proc: Fix return code handling in stream off path
  media: sun6i-isp: proc: Error out on invalid port to fix warning
  media: sun6i-isp: proc: Declare subdev ops as static
  media: sun6i-isp: capture: Fix uninitialized variable use
  media: sun6i-isp: params: Fix incorrect indentation
  media: sun6i-isp: params: Unregister pending buffer on cleanup

 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c | 8 ++++----
 .../media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c    | 2 +-
 .../platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c      | 5 ++---
 .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c     | 5 ++---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 4 ++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 6 ++++--
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 8 ++++----
 7 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.38.1

