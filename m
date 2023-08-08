Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE2E773D2E
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjHHQO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjHHQNW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F9B7EF2
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:30 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D538EEA;
        Tue,  8 Aug 2023 08:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475525;
        bh=vRnIlDnmxoAIJmsZfd+VIxjIEZzKktzdtPMdWo3rIZ0=;
        h=From:Subject:Date:To:Cc:From;
        b=pT0Hpuse/TfRlrHoRPaeEudMT3nPKfN/ibLLbqz61zN3tftBvKvkwQhWWe8FfxyWA
         8pzKbENOi+pQ6ikrFxnbcBennZHDITIWkwK54qPJyBnQ4/SbavOmNjLafyNrTszij1
         IcTB4sQi3hYz+Bj+dW3JtrrTAKTciVCyGm7ZhkZY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 0/8] v4l-utils: Support multiplexed streams
Date:   Tue, 08 Aug 2023 09:19:19 +0300
Message-Id: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGfe0WQC/0WMQQ6CMBAAv0J6dkmpxaIn/2E8FFhko+2SbSUmh
 L/bePE4k8xsKqEQJnWpNiW4UiKOBdyhUsPs4wOBxsLKaHPUnTaQsqAPCdJ7WVgyuFOPwxmbfup
 aVapFcKLP73i7F56EA+S5RP+PM1q7VltbW1tEAw1kDlSv/vVEihivNKJPHHv2MtYDB7XvX0eIa
 IirAAAA
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4008;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=vRnIlDnmxoAIJmsZfd+VIxjIEZzKktzdtPMdWo3rIZ0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6BRdLuoJ/c8Iy8xsHTbZaxLDQZs/ikbY/7P
 2KOm7KQaeuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHegQAKCRD6PaqMvJYe
 9VzJD/9olG0eZywmDxtoGF16hWjPk9/YnM+H9fvnyMplBVwRO2Q0FBkpUvjjIfZwSHq1e6MUxwf
 6m47cjWFfioCoK8zNoNb9nrCGxSQLQpYAVLHy0EoLJJAyjkbrDIdrO/ZEHq+Brq4jmLcv448Vnk
 8xG5q1pdyvydDzXkGngYJKLlKCJou+yhzaG8fkwv/8uGj4Nc/kIVdYV+qVzeYhkdRqs4vqaYNfG
 VKxkkja36Sef9RZUdxBgBfODBG/jOzBvPXDkZaepr1WkKa1oG4yEM6KrUpaEOMCpBn68H9QXD/V
 Qq9qZgtPua27tWpVr/T5bCV75k+ba24A5ivuXtKF/mGvPmXU/GibU8InEgkCWMoVfx3L3P/IwpO
 YBH8BFYJSZizJAwzwBc238Q10ZsHgvMFawdSZETrfhm1f6qDhe1GTlKITS2nA8YZUn1cgX2NTW+
 2Kpvgesl//0trR6b9PfjgpfZASIcc8QKC6CxX9GMl3c3AmVPmZ37Y7pxKyyWwl7AtQcelV6wAiz
 FV29vGMhKDisCesnOiBoJYAMHyV6/jBGnimWOvYFbwXYJMJq/22CIFUzr7TVYztVICPD+cDE0zF
 ehD10f3y3+MXSxVUzMGFesYRalDl4QBOpmdJRzksEvL/59FaWqRCYYK+CCcw3/RgZHjYOX6gbOL
 YkynklCTXU61+7A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for multiplexed streams.

---
Changes in v7:
- Fixes and improvements to testSubDevRouting():
  - Fix num_routes check
  - Improve VIDIOC_SUBDEV_G_ROUTING test by verifying num_routes is
    updated on successful call
  - Fix test of routing.reserved field on a failing
    VIDIOC_SUBDEV_S_ROUTING call.
- Link to v6: https://lore.kernel.org/all/20230720075044.442021-1-tomi.valkeinen@ideasonboard.com/
- Range diff against v6:

1:  5b814067 = 1:  b6927486 v4l2-ctl: Improve sub-device options help text
2:  8e349ff0 = 2:  0b1dc325 v4l2-ctl: Add routing and streams support
3:  5977db8f = 3:  38a5fd3f media-ctl: Add support for routes and streams
4:  7af03ced = 4:  36d0a8e0 v4l2-ctl/compliance: Add routing and streams multiplexed streams
5:  abb2d296 ! 5:  beaa6a09 v4l2-ctl/compliance: Add simple routing test
    @@ utils/v4l2-compliance/v4l2-test-subdevs.cpp: int testSubDevSelection(struct node
     +	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
     +	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
     +
    -+	if (routing.num_routes)
    ++	if (!routing.num_routes)
     +		return 0;
     +
    -+	/* Then get the actual routes */
    ++	/*
    ++	 * Then get the actual routes, and verify that the num_routes gets
    ++	 * updated to the correct number.
    ++	 */
     +
    -+	routing.num_routes = NUM_ROUTES_MAX;
    ++	uint32_t num_routes = routing.num_routes;
    ++	routing.num_routes = num_routes + 1;
     +	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
    ++	fail_on_test(routing.num_routes != num_routes);
     +
     +	/* Check the validity of route pads and flags */
     +
    @@ utils/v4l2-compliance/v4l2-test-subdevs.cpp: int testSubDevSelection(struct node
     +
     +		memset(routing.reserved, 0xff, sizeof(routing.reserved));
     +		fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing) != EINVAL);
    -+		fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
     +	}
     +
     +	return 0;
6:  bedf5aa3 = 6:  78cc79ce media-ctl: Check for Streams API support
7:  6e432bea = 7:  bfe6e80a utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
8:  05c3e4e6 = 8:  2096d081 v4l2-ctl: Check for Streams API support

---
Tomi Valkeinen (8):
      v4l2-ctl: Improve sub-device options help text
      v4l2-ctl: Add routing and streams support
      media-ctl: Add support for routes and streams
      v4l2-ctl/compliance: Add routing and streams multiplexed streams
      v4l2-ctl/compliance: Add simple routing test
      media-ctl: Check for Streams API support
      utils/common: Set V4L2_SUBDEV_CLIENT_CAP_STREAMS for subdevs
      v4l2-ctl: Check for Streams API support

 utils/common/cv4l-helpers.h                 |   1 +
 utils/common/v4l-helpers.h                  |  18 ++
 utils/common/v4l2-info.h                    |   6 +
 utils/media-ctl/libmediactl.c               |  43 ++++
 utils/media-ctl/libv4l2subdev.c             | 345 +++++++++++++++++++++++---
 utils/media-ctl/media-ctl.c                 | 113 +++++++--
 utils/media-ctl/mediactl-priv.h             |   1 +
 utils/media-ctl/mediactl.h                  |  16 ++
 utils/media-ctl/options.c                   |  15 +-
 utils/media-ctl/options.h                   |   1 +
 utils/media-ctl/v4l2subdev.h                |  66 ++++-
 utils/v4l2-compliance/v4l2-compliance.cpp   | 132 ++++++++--
 utils/v4l2-compliance/v4l2-compliance.h     |   9 +-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 121 ++++++++-
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 364 +++++++++++++++++++++++++---
 utils/v4l2-ctl/v4l2-ctl.cpp                 |   2 +
 utils/v4l2-ctl/v4l2-ctl.h                   |   2 +
 17 files changed, 1132 insertions(+), 123 deletions(-)
---
base-commit: a0c26a97308ea1c5e809245df570e2f04e668168
change-id: 20230802-streams-support-76bec9e1bf85

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

