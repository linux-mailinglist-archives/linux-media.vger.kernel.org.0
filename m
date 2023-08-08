Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD09773D2C
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 18:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjHHQO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 12:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbjHHQNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 12:13:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B877EF5
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 08:47:26 -0700 (PDT)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 500B110FE;
        Tue,  8 Aug 2023 08:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691475525;
        bh=KaOBUJNw8+Vv4Fk6CQnOU73QDtqXE9uQbHHSa6I3XNs=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=fhQC+KmVPRZ5n9T3PSSPse7CZCaJcMiZFdHdTUUyolfk/5f/EbczlBNnbjqvXQLDs
         11QkkVGQk8kf2/js7VC0daQ7Lhg3as5aj3U31fr0opHm4fVU4Vf/o37JWgeNi05Bla
         v7YLW2Kx5Agr5D94kjdca+0EOXrXLVLGfxdnXuIs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date:   Tue, 08 Aug 2023 09:19:20 +0300
Subject: [PATCH v7 1/8] v4l2-ctl: Improve sub-device options help text
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-streams-support-v7-1-bd0b42a5826d@ideasonboard.com>
References: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
In-Reply-To: <20230808-streams-support-v7-0-bd0b42a5826d@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=KaOBUJNw8+Vv4Fk6CQnOU73QDtqXE9uQbHHSa6I3XNs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk0d6EyKIDm5JOCkEhD6k6UV/9uqgv44kvTpsOI
 ro+ifJpqZuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZNHehAAKCRD6PaqMvJYe
 9X5PD/4maDOarNkDGv4lRTqlkc05yOXYNZsbcKm8mkFV3SPu6QlKye1AUb3UUzjOz9fyltPhVam
 WbeW5hkDs06LeOjt3vCpn6e0qDcjTpxIjzCCfmVigmk6hBCobUNyC1KIqCuh/eDse5nbaNP8UqU
 wxNuCCArU6wc5JnmEERxxLhZawHEK6zXXYOJkfn5OKn/0kgGPchYLj2sg3UJzGiFTBsPICErlWa
 x7sobPjNTMRck1GyZm5+xfflBVmqrVIefQRCITNL9lChPs15TXr3evfoiPL0U3zEyONw/zNVKUo
 AptdpQOjFiRrnUwfwFzDh4HEqTLpJTTz9li15x4U4sUn/Q6bpH9KyQadO5HFM0J+5YW49r+TtEk
 FQiMwxOsPTNNHoGm8DaDTkUNBw5DrQIWmtvNuBe+Z+1OH1tq81jr0MCWrj//RzZ5EuV0+KtENtK
 rpoGRTLAXVjRXboDD1vxfnPE0QK5e3535PYSyuehYfSI7pGZcYxs37GGf5rgFxz+pLM1BLbgKPn
 9ChtIZ9dJM0+5wHICfzocLGmM6kwyEqHlDn571/8saR8yaYasq35OFeyduFgtmHuR6kz8WyYxy5
 DqUMdQ9p/VYO4b5zVr66dxtcMBY7Q7mvG6NwDiLFDb033rWqekxPEi3LVIcw4LRNjUA9QuRM330
 Yk/iT0kCboXpliw==
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

Explicitly mention that all the parameters to the options are optional,
and default to 0, and remove the one place where the default of 0 was
mentioned.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index 33cc1342..22fd9052 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -36,8 +36,9 @@ static double set_fps;
 void subdev_usage()
 {
 	printf("\nSub-Device options:\n"
+	       "Note: all parameters below (pad, code, etc.) are optional unless otherwise noted and default to 0\n"
 	       "  --list-subdev-mbus-codes <pad>\n"
-	       "                      display supported mediabus codes for this pad (0 is default)\n"
+	       "                      display supported mediabus codes for this pad\n"
 	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
 	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
 	       "                     list supported framesizes for this pad and code\n"

-- 
2.34.1

