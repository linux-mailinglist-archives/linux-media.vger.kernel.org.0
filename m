Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFBF36905D
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 12:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhDWKal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 06:30:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhDWKak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 06:30:40 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85FC2332;
        Fri, 23 Apr 2021 12:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619173803;
        bh=HnB0Z8PkQFOAewJm05DotevU7SY3hBGxLYttCNC7Vto=;
        h=From:To:Cc:Subject:Date:From;
        b=vkFj3YwEiCsS5yFZ6y/pgFJ96CwAdx219w9lHUQ8TQhXCSKWFTaYokqIRTPFxmyx3
         DQZcZ9lZS3mJ3gxqrm/O5OkMRDP2fLOnUN/F58BwFzdUCG9GAqqN6Dy8tUnqhxZJzw
         11Tv66+VwSbUCOBv46cZhWFnkmUFMKjmEi8IjS7Y=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/1] RFC: media: v4l2-subdev: add subdev-wide config struct
Date:   Fri, 23 Apr 2021 13:29:51 +0300
Message-Id: <20210423102952.137638-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Second version of the RFC. The previous one is here:

https://lore.kernel.org/linux-media/20210409133659.389544-1-tomi.valkeinen@ideasonboard.com/

In v2:
- Rename v4l2_subdev_config -> v4l2_subdev_state
- Rename pad_configs -> pads
- Allocate the v4l2_subdev_state instead of embedding it

I didn't:
- Rename v4l2_subdev_pad_ops->init_cfg to init_state. There will be a
  huge amount of changes to drivers, and I'd like to keep any extra
  changes out of this series. For the same reason, I intend to keep
  the v4l2_subdev_state variable names as 'cfg' instead of trying to
  rename them to 'state'.
- Add number of pads or a pointer to subdev to v4l2_subdev_state. It can
  be added easily if someone has a need for it.

I also dropped the few driver changes I made. They are obvious trivial
changes and don't really give anything to the discussion.

 Tomi

Tomi Valkeinen (1):
  RFC: media: v4l2-subdev: add subdev-wide state struct

 drivers/media/v4l2-core/v4l2-subdev.c | 141 +++++++++++++++-----------
 include/media/v4l2-subdev.h           |  72 +++++++------
 2 files changed, 120 insertions(+), 93 deletions(-)

-- 
2.25.1

