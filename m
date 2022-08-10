Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5A458EBAA
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiHJMLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiHJMLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:11:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944F92DAA7
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:11:39 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BB8A481;
        Wed, 10 Aug 2022 14:11:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133497;
        bh=GqmAEUVbADTeNJfLyMDV3V2m2+B8HbVTtNvKPR/DViU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LGJuwWAs8lW/iXv8ZF4jLV4VmqBDaLrZFW9sMYPEdX1xGQZQNxDeE/fYONqEW3D7W
         /88yBfh7RKUTCCDCoCIBrCfk2blNexVH32lU7YpA7/jpNPLQmCv2xsh9RioATyyVrl
         ASQkNxHQXBjnccSqsH0KBOXOrEzWRUi9ryeXeIfk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v13 01/34] media: Documentation: mc: add definitions for stream and pipeline
Date:   Wed, 10 Aug 2022 15:10:49 +0300
Message-Id: <20220810121122.3149086-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The doc talks about streams and pipelines, but doesn't really define
them. This is an attempt to define them according to my understanding.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/mc-core.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
index 02481a2513b9..2a0c0aeec5f2 100644
--- a/Documentation/driver-api/media/mc-core.rst
+++ b/Documentation/driver-api/media/mc-core.rst
@@ -213,6 +213,18 @@ Link properties can be modified at runtime by calling
 Pipelines and media streams
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+A media stream is a stream of pixels or metadata originating from one or more
+source devices (such as a sensors) and flowing through media entity pads
+towards the final sinks. The stream can be modified on the route by the
+devices (e.g. scaling or pixel format conversions), or it can be split into
+multiple branches, or multiple branches can be merged.
+
+A media pipeline is a set of media streams which are interdependent. This
+interdependency can be caused by the hardware (e.g. configuration of a second
+stream cannot be changed if the first stream has been enabled) or by the driver
+due to the software design. Most commonly a media pipeline consists of a single
+stream which does not branch.
+
 When starting streaming, drivers must notify all entities in the pipeline to
 prevent link states from being modified during streaming by calling
 :c:func:`media_pipeline_start()`.
-- 
2.34.1

