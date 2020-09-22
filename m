Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ECB2745C6
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 17:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgIVPwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 11:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgIVPwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 11:52:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDC0C061755;
        Tue, 22 Sep 2020 08:52:22 -0700 (PDT)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3652C555;
        Tue, 22 Sep 2020 17:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600789935;
        bh=hKt0OopOTNPF1u9iAM4FiL6RWXzzSs/A/FXCb5IoBg0=;
        h=From:To:Cc:Subject:Date:From;
        b=s8TJsKTMZTy7F4lku7/LsXI1HPFe8ruT98eops+ZTqXCDPaYxzmp+y9qHVCybDDkG
         guI+7bfHHIHnWt1NN0VQ9nKiASq+Xth6Te6onR5IVbL9l/6EMH1EQWHR+oG7CUlCGy
         31qnGTMlOUAS+fR2e1W0x8zvZFRNMn2AD+005ZeY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 0/2] gmsl: Use unsigned constants
Date:   Tue, 22 Sep 2020 16:52:08 +0100
Message-Id: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During pre-integration reviews of the GMSL (MAX9286/MAX9271) patches,
one comment was to mark the constants used in bitfield shifts as
explicitly unsigned. This ensures that any use of a register write that
updates bit 31 is operated correctly.

Whilst none of these register shifts affect bit 31 in any of the
registers, update the values to follow best practices and ensure
consistency if further additions are made.

Please note, this does not remove or clean up the 'Prefer BIT' check
patch warnings, as the use of the BIT macro is still not applicable to
these entries.

Kieran Bingham (2):
  media: i2c: max9286: Use unsigned constants
  media: i2c: max9271: Use unsigned constants

 drivers/media/i2c/max9271.h | 60 +++++++++++------------
 drivers/media/i2c/max9286.c | 96 ++++++++++++++++++-------------------
 2 files changed, 78 insertions(+), 78 deletions(-)

-- 
2.25.1

