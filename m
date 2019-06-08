Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80FD839FE4
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 15:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfFHNXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 09:23:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39272 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfFHNXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jun 2019 09:23:06 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A2C65D
        for <linux-media@vger.kernel.org>; Sat,  8 Jun 2019 15:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560000184;
        bh=qhUl9OXtsop2GlYlVXOTm7x+J1HIDwp7RI7BVulnu6w=;
        h=Date:From:To:Subject:From;
        b=c70RFBMfsFlSZ7byg+sVhKh3h2L6ul0rBd3/+2am6DghLKKcwzX9sx95El2EgUkPo
         FKRT+hkqDlrk7CLWqjdp5yWzdYhsDduD9KAwazND6wXYa+Zie6cVury82QiVJwrTbC
         ySEczqepODUA7Jrdu9QsJZg9JC3ovqothr0ZEVVQ=
Date:   Sat, 8 Jun 2019 16:22:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.3] R-Car FPD1 changes
Message-ID: <20190608132249.GD4786@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit edadd68031e5b7c1ba0c413a9549dce62a02844c:

  media: MAINTAINERS: update email address (2019-06-05 15:58:40 -0400)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-fdp1-20190608

for you to fetch changes up to 73b88ee156f6065c21e74c84c64ba5b9dea09a53:

  media: fdp1: Support M3N and E3 platforms (2019-06-08 16:02:10 +0300)

----------------------------------------------------------------
FDP1 changes for v5.3

----------------------------------------------------------------
Kieran Bingham (1):
      media: fdp1: Support M3N and E3 platforms

 drivers/media/platform/rcar_fdp1.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
Regards,

Laurent Pinchart
