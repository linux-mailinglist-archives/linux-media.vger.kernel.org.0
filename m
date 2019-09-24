Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418CEBCA4B
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 16:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441386AbfIXOfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 10:35:34 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58799 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437472AbfIXOfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 10:35:34 -0400
Received: from cobaltpc1.rd.cisco.com ([IPv6:2001:420:44c1:2577:813c:89fd:7ccb:168c])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CluaiEzGfz6EACludi89sK; Tue, 24 Sep 2019 16:35:32 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv5 0/3] v4l2-core: improve ioctl validation
Date:   Tue, 24 Sep 2019 16:35:25 +0200
Message-Id: <20190924143528.121869-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFBqh5I03CZM/RXifRsM/uHUzImoFe052d3IrU98GZDW4xZz7TsvuZBng2b17A/i1QT2U7uJixHM0wbsWeRwdnxZ39AK9drQi1a979E4T6LDFCBA9xdf
 KptiI/A7EpVUIMereA5YSIFRjpSnC/OAnY30nBNG4fIfWQsO1R3aohPo18dCx5icZ7tgxUMGDyThVK4IZzhW6782f3uWc9tw029sdYWw+YJSkG30YXI2ZtK+
 ezAVHZKghV+pH5dXavYF284v3QmdYpKfWL1zFOW+LoEAuqJP4uqe6yqzSHm6uoUVB/sfckLRPp1Q8fg/uSqCy/P+liHGJQjegfNjHPXrZ3oeQb5M3SxwkQ8u
 RDowDK1V59y90ENUZBWeOyGzc7jsKfCkoyLZh0w5OeO5V3SWwgg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This supersedes https://www.mail-archive.com/linux-media@vger.kernel.org/msg150027.html
based on feedback from Laurent:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150117.html

and Sakari:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150129.html

It actually makes the code a bit simpler in places compared to the v4, so
that's a good sign.

In this v5 I now check if a GRABBER device is a video or metadata device
(or both!) by checking device_caps.

Regards,

	Hans

Hans Verkuil (2):
  v4l2-dev: simplify the SDR checks
  v4l2-dev: fix is_tch checks

Vandana BN (1):
  v4l2-core: correctly validate video and metadata ioctls

 drivers/media/v4l2-core/v4l2-dev.c   | 104 ++++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c |  16 ++++-
 2 files changed, 75 insertions(+), 45 deletions(-)

-- 
2.23.0.rc1

