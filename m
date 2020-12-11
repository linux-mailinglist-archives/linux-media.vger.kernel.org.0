Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66802D7791
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 15:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391262AbgLKOPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 09:15:10 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:50921 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405903AbgLKOPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 09:15:02 -0500
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 87A56200003;
        Fri, 11 Dec 2020 14:14:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, tfiga@chromium.org,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: Add get_selecton to ov56470 and ov13858
Date:   Fri, 11 Dec 2020 15:14:22 +0100
Message-Id: <20201211141424.277975-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the .get_selection pad operation to ov5670 and ov13858
sensor drivers.

Support the V4L2_SEL_TGT_CROP_BOUNDS and V4L2_SEL_TGT_CROP_DEFAULT
targets which report the same rectangles, as the size of the active
and readable pixel matrix is the only information available in public
documentation.

Question: do I really need to initialize the try_crop rectangle at open() time?
I don't think it's strictly necessary, but for simmetry and to guard against
future developments, I think it's fair to have it.

Thanks
   j

Jacopo Mondi (2):
  media: i2c: ov13858: Add .get_selection support
  media: i2c: ov5670: Add .get_selection support

 drivers/media/i2c/ov13858.c | 31 +++++++++++++++++++++++++++++++
 drivers/media/i2c/ov5670.c  | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

--
2.29.2

