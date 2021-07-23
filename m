Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059D43D395B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 13:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhGWKmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 06:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhGWKmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 06:42:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A36EC061575
        for <linux-media@vger.kernel.org>; Fri, 23 Jul 2021 04:22:44 -0700 (PDT)
Received: from perceval.ideasonboard.com (unknown [103.251.226.103])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 104E83F2;
        Fri, 23 Jul 2021 13:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627039361;
        bh=siZQp5ZJWbnQumB6qW1rlmXOsdhdGPpCdhMkIWh/t74=;
        h=From:To:Cc:Subject:Date:From;
        b=ACKSejX+iL0MMbuv6eTkH/PSXaDqFq7jCnK4XQZczEyKyB2Bj7v2zl4ONvhpnwZKK
         YVatkm1lrOgauf+4T+E9r25HhHz4VFTIOY5bwEaCvosZVBwCohCDN8yMPpjygX+CY4
         XJFGeaQgkHRZ7uz89p7/qjDwo8mO4i06AXMZkL08=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     libcamera-devel@lists.libcamera.org,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 0/2] IMX258 driver fixes
Date:   Fri, 23 Jul 2021 16:52:31 +0530
Message-Id: <20210723112233.1361319-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While working on libcamera with a IMX258 sensor attached
to IPU3 ISP, we noticed a few niggles that seem to be driver
related. After running a series of investigations based on
libcamera and v4l2-ctl tools, we could pin-point and address
a couple of them for release immediate pain points.

Laurent Pinchart (1):
  media: imx258: Rectify mismatch of VTS value

Umang Jain (1):
  media: imx258: Limit the max analogue gain to 480

 drivers/media/i2c/imx258.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.31.1

