Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596E91654B1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 02:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgBTBtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 20:49:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41604 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbgBTBtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 20:49:25 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BB96563
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2020 02:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582163363;
        bh=KVb2XhxDY2z3wkabJ6Uc1jr7Z3KdQTyZPhIK2DZZ0GM=;
        h=Date:From:To:Subject:From;
        b=GwbZGZPQ2ycFwdUztFE3kRsagJr0R9+bPNla2r6n1jdgJJ/FxXKgbHtcm2YYu2tyX
         AfP4itoHj9QsAM35ccxIwGehoB8ZJ85SpbP0B92CceE60b2puGPwHqyv8FqNTsJB4I
         T4KvirXdcP62XUjkHbybgUyQseCdtSP+BKz4JECE=
Date:   Thu, 20 Feb 2020 03:49:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.7] VSP1 minor fix
Message-ID: <20200220014904.GG5070@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-vsp1-20200220

for you to fetch changes up to b131ac5059b27c1028feb9879787f9f4a8e27159:

  media: vsp1: tidyup VI6_HGT_LBn_H() macro (2020-02-20 03:45:22 +0200)

----------------------------------------------------------------
- VSP1 minor fix

----------------------------------------------------------------
Kuninori Morimoto (1):
      media: vsp1: tidyup VI6_HGT_LBn_H() macro

 drivers/media/platform/vsp1/vsp1_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
