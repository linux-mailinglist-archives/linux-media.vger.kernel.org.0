Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A87B458B4D
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239095AbhKVJ33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239021AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1204460F93;
        Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=dJPMNlK3b/bJuvSAkvT2aybug3z8MKZYIr2jaPmK8p4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p4D3825Q6PZGHQdPE9aQn1qmp0gbwN4Rk0UTervPwm4V70Jt65Bm+kb/sH6XIV5/X
         emphTAtNwehfROg7TV2U3PPVslFSpZ2BlvVwbVYKPlECcwGxZnrLtNWMy7GxnRon3W
         LuF4aN+SCPH1dPaSShn4baW4TFcPkH6wV1TXJULGea2DwO2+KhhCB9shMTXBrffmly
         XI013kIBJABZ3e8IZD3Oo5xZCszplXAj5Eq7z594F6AXyXZebHBOW+xBNt2pF9EkrY
         6REQ6Fh0/UI/5dC1Dc7WZdJp88AYTk28bly/tbW8rfIfjVuOE5Dk8sq1L3a7KpZKRY
         IRcsUuX79vcmg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiD-2e; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 01/10] media: cx25821: drop duplicated i2c_slave_did_ack()
Date:   Mon, 22 Nov 2021 09:26:03 +0000
Message-Id: <140dfc36fbd3b759a47e972774b362894f43911f.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is defined twice, one at cx25821-i2c and the other
inside cx25821-core. It turns that only the first
is actually used inside the code.

This causes a clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/cx25821/cx25821-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 40c10ca94def..3078a39f0b95 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -337,13 +337,6 @@ static int cx25821_risc_decode(u32 risc)
 	return incr[risc >> 28] ? incr[risc >> 28] : 1;
 }
 
-static inline int i2c_slave_did_ack(struct i2c_adapter *i2c_adap)
-{
-	struct cx25821_i2c *bus = i2c_adap->algo_data;
-	struct cx25821_dev *dev = bus->dev;
-	return cx_read(bus->reg_stat) & 0x01;
-}
-
 static void cx25821_registers_init(struct cx25821_dev *dev)
 {
 	u32 tmp;
-- 
2.33.1

