Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A414141223
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 21:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgAQUMs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 15:12:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43530 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgAQUMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 15:12:48 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 84B4F293C5F
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, niklas.soderlund@ragnatech.se,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        tfiga@chromium.org, Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: media: rkisp1: make links immutable by default
Date:   Fri, 17 Jan 2020 17:12:18 -0300
Message-Id: <20200117201218.3745311-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only places which make sese to allow users to enable or disable
links are:

* between sensors and isp:
So users can select which sensor should be used while streaming

* between isp and the resizers:
              |
              v here
rkisp1_isp:2 -> rkisp1_resizer_mainpath -> rkisp1_mainpath (capture)
            \-> rkisp1_resizer_selfpath -> rkisp1_selfpath (capture)
              ^ here
              |

So users can disable one of the capture paths when unused, to avoid
worring about matching formats.

Make the following links immutable to simplify userspace:

rkisp1_resizer_mainpath -> rkisp1_mainpath
rkisp1_resizer_selfpath -> rkisp1_selfpath
rkisp1_params           -> rkisp1_isp
rkisp1_isp              -> rkisp1_stats

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
This is the topology graph after disabling all the links with
media -r
http://col.la/rkisp1immutable

Dashed links are the only one can can be enabled/disabled, the others
are immutable.

 drivers/staging/media/rkisp1/rkisp1-dev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 558126e66465..4030d5e71af1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -145,14 +145,15 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 		flags = 0;
 	}
 
-	flags = MEDIA_LNK_FL_ENABLED;
+	flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
 
 	/* create ISP->RSZ->CAP links */
 	for (i = 0; i < 2; i++) {
 		source = &rkisp1->isp.sd.entity;
 		sink = &rkisp1->resizer_devs[i].sd.entity;
 		ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
-					    sink, RKISP1_RSZ_PAD_SINK, flags);
+					    sink, RKISP1_RSZ_PAD_SINK,
+					    MEDIA_LNK_FL_ENABLED);
 		if (ret)
 			return ret;
 
-- 
2.24.0

