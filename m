Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A572FD47C
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 16:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390037AbhATPr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 10:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732795AbhATPrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 10:47:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABF7C0613C1;
        Wed, 20 Jan 2021 07:46:21 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 594B5813;
        Wed, 20 Jan 2021 16:46:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611157578;
        bh=LJNrBznaDlESHFudoMlcR265ZAYihUvAz+X2cpl/Kj4=;
        h=From:To:Cc:Subject:Date:From;
        b=H9zz9d+rqavsX4Tqas52Q7CIv/Z2LG1qctx3Cq2dUjNvjm+PAaTH60KS2w1nhsz1K
         oaMa54HSmD6TnPnLVCyG+ORJv24N4QBxzL6vSEI3lFLonh+hS0tmREosLXqwahruJT
         ToXrVb9eztaGjjt31ZAEAaAOKK+ycF6CodFh+cUI=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 0/2] gmsl: Use unsigned constants and BIT where appropriate
Date:   Wed, 20 Jan 2021 15:46:12 +0000
Message-Id: <20210120154614.2750268-1-kieran.bingham+renesas@ideasonboard.com>
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
all of these entries. Entries where it is applicable and only a single
bit is modified have been converted accordingly.

Kieran Bingham (2):
  media: i2c: max9286: Use unsigned constants and BIT()
  media: i2c: max9271: Use unsigned constants

 drivers/media/i2c/max9271.h | 60 +++++++++++------------
 drivers/media/i2c/max9286.c | 96 ++++++++++++++++++-------------------
 2 files changed, 78 insertions(+), 78 deletions(-)

-- 
2.25.1

