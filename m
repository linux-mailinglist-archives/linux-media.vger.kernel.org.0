Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285BD204EC0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgFWKFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:05:17 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38349 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWKFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:05:17 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BF2B5C0011;
        Tue, 23 Jun 2020 10:05:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 02/25] dt-bindings: media: ov5647: Document clock-noncontinuous
Date:   Tue, 23 Jun 2020 12:07:52 +0200
Message-Id: <20200623100815.10674-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the optional clock-noncontinuous endpoint property that
allows enabling MIPI CSI-2 non-continuous clock operations.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 58d64a69e9640..68d6998d7180c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -45,6 +45,11 @@ properties:
             description: |-
               phandle to the video receiver input port
 
+          clock-noncontinuous:
+            type: boolean
+            description: |-
+              Set to true to allow MIPI CSI-2 non-continuous clock operations
+
         required:
           - remote-endpoint
 
-- 
2.27.0

