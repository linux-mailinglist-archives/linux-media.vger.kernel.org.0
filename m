Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379DD7A4D36
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 17:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjIRPrQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 11:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjIRPrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 11:47:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A2D19A6
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 08:44:37 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15D388820;
        Mon, 18 Sep 2023 16:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695049042;
        bh=LsGj1/rtZjHBR/pExOwBOd2Klr8bFOTZD5mcrj+hVVo=;
        h=From:Subject:Date:To:Cc:From;
        b=c41sdxUEStdbzVgf/aBzIKksNWcSXoym9IUGiI0fp7NEuT1sHiahwcPxqwlwb0z4l
         vmAWnZaw+2BZJBIbiqXuJ+UVcdplEghKAZ5yyHvIznXHx/EVCEGwTiufkddtqWG8Hm
         oNC24MdIwpB3hEjgvIkVHA9vjJIgjLNbpuE3Xx48=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 0/2] media: ti: cal: Add streams support
Date:   Mon, 18 Sep 2023 17:58:23 +0300
Message-Id: <20230918-cal-streams-v5-0-4851f073f58a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9lCGUC/23OQQ6CMBCF4auYri2ZUijgynsYFgUGmQitaZtGQ
 7i7hY0LXf7JzJe3Mo+O0LPLaWUOI3myJkV5PrF+0uaOnIbULIdcQg017/XMfXCoF8+7Rsga8l4
 1Y8HSx9PhSK9Du7WpR2cXHqZ0/DUk5AKgKstMNEKoggse7EJZ1PMDyaC50oDaW9NZ7Yast8suT
 +SDde9jZix2//+iuHtilJUSgNAU6ldrt237ADB/oAT3AAAA
To:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LsGj1/rtZjHBR/pExOwBOd2Klr8bFOTZD5mcrj+hVVo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlCGWsaCRMe2BV4ReCv2xOurxQF6H8Pl4efRelg
 f0AumxZTkuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZQhlrAAKCRD6PaqMvJYe
 9Y9XEACPJC9FwY6+aq2VlB6oZqQ7WHPt4VCdrUk74K7qjij/4HgJeU/xtRAP3cL25D8+WZTXYBx
 F6EuMOhAtF6Zm8RJ9kuryoY5YvF/GUOwxc/2Pde07aCUXcBaBop8/cuvVFxHhxMdIpDXpUmRzLl
 LLabtZkRlj1xt3DpZRBdNLQgk0tgMceQUaVwaWfyexuv8sa+5sAz8+M48yHhjjD3HU0W6/nD0zh
 lF8VPbh6YfzQhQu8e8vbDK1ZmIfH0d8n83Bb7mshj83UH++0eOyveJkD0LrsrZMcwjZNchcz2lb
 HDIlx5Kqk5gOSFs24Wqdv5BE/Ud6/0ImBwtLFLrHxvB9M7bwkYtoid0eLuC5/H6WefEf9Thtda2
 JDw+8kPJphio1dRk0AAx3qQPAdXWJGKNBHUFlphpbeUyMdwbC7iIMH6rAzzoyK33usIjW2U5Gez
 Eosc5Yb8kkke9qqfMNFfsYxR3m35CdObEBFrFjm5QKeeCxUUpFVxgjRyvYPv0SwabDR5u5qvYG9
 WjsliFxmrHcpvrj9sOmekM+iNiom49Y5FUu7T66HSF7gWFyx1vMPxxJWt1rdJ01168q2lO50dDj
 hTkXPAEMz/temSyQNcTKZs9glSPEnc0/7eNfWTO4jIVSGvmI8Exrc2G7IbsMAvOLyd00RBWd/lT
 ODzEZ49321cMD2w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds streams support to TI CAL driver. The first patch adds the
base stream support, and does not support metadata. The first patch
applies to current upstream. The second patch adds metadata support, and
depends on Sakari's "[PATCH v3 00/10] Generic line based metadata
support, internal pads" series.

The first patch could be picked separately, but I think it makes sense
review these together, in the hopes that the second patch giving
confidence that the first one is good too.

---
Changes in v5:
- Some improvements in the patch description of the first patch
- Add "media: ti: cal: Add metadata streams support"
- Link to v4: https://lore.kernel.org/r/20230808-cal-streams-v4-1-1f37610e0946@ideasonboard.com

Changes in v4:
- A few minor formatting changes
- Small changes regarding how the code handles metadata formats.
  No metadata formats are supported yet, but we do have some code to
  ensure that metadata formats aren't allowed on video nodes in video
  capture mode. A future patch will enable metadata capture, allowing
  the runtime change of video nodes between video and meta capture.
- Link to v3: https://lore.kernel.org/all/20230302100755.191164-6-tomi.valkeinen@ideasonboard.com/

---
Tomi Valkeinen (2):
      media: ti: cal: Add streams support
      media: ti: cal: Add metadata streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 269 +++++++++++++++++------
 drivers/media/platform/ti/cal/cal-video.c    | 315 +++++++++++++++++++++++----
 drivers/media/platform/ti/cal/cal.c          |  60 +++--
 drivers/media/platform/ti/cal/cal.h          |   6 +-
 4 files changed, 533 insertions(+), 117 deletions(-)
---
base-commit: 0b70ec8aae7d61396ce54514f2257c060d49c97e
change-id: 20230808-cal-streams-b913802c69f4

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

