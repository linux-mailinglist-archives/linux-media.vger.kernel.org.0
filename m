Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C74C1FB11C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgFPMsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgFPMsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:48:30 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1347C08C5C3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:48:23 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B44A611A002; Tue, 16 Jun 2020 13:48:18 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/4] Remove unused functions found with clang
Date:   Tue, 16 Jun 2020 13:48:14 +0100
Message-Id: <cover.1592302248.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sean Young (4):
  media: drx-k: remove unused MulDiv32 function
  media: nuvoton-cir: remove setting tx carrier functions
  media: fintek-cir: remove unused function fintek_clear_reg_bit
  media: cx23888: remove unused functions

 drivers/media/dvb-frontends/drxk_hard.c | 11 ---------
 drivers/media/pci/cx23885/cx23888-ir.c  | 20 ----------------
 drivers/media/rc/fintek-cir.c           |  7 ------
 drivers/media/rc/nuvoton-cir.c          | 32 -------------------------
 4 files changed, 70 deletions(-)

-- 
2.26.2

