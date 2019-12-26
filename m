Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1096D12AC08
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2019 13:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfLZMCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Dec 2019 07:02:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:40958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbfLZMCf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Dec 2019 07:02:35 -0500
Received: from localhost (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E0932075E;
        Thu, 26 Dec 2019 12:02:34 +0000 (UTC)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add IR support for Hi3796CV300 SoC
Date:   Thu, 26 Dec 2019 20:02:20 +0800
Message-Id: <20191226120222.14745-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IR device on Hi3796CV300 SoC is mostly same as hix5hd2, except the
following two things.

 - IR_CLK offset is 0x60 instead of 0x48.
 - It needs to set an extra bit in IR_ENABLE register to enable IR.

The series adds a new compatible for Hi3796CV300 IR device and update
ir-hix5hd2 driver to support the device.

Shawn Guo (2):
  dt-bindings: media: add "hisilicon,hi3796cv300-ir" compatible
  media: rc: ir-hix5hd2: add hi3796cv300-ir support

 .../devicetree/bindings/media/hix5hd2-ir.txt  |  3 +-
 drivers/media/rc/ir-hix5hd2.c                 | 79 ++++++++++++++-----
 2 files changed, 63 insertions(+), 19 deletions(-)

-- 
2.17.1

