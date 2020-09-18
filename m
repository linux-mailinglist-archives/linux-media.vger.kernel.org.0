Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC9627001E
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 16:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgIROrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 10:47:00 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:34024 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgIROq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 10:46:59 -0400
X-Greylist: delayed 1301 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 10:46:58 EDT
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 2899E3AF79A;
        Fri, 18 Sep 2020 14:25:37 +0000 (UTC)
Received: from pc-2.home (lfbn-tou-1-1532-46.w90-89.abo.wanadoo.fr [90.89.95.46])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 641E424000E;
        Fri, 18 Sep 2020 14:25:10 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 0/3] media: Add support for the Techwell TW9900 video decoder
Date:   Fri, 18 Sep 2020 16:24:19 +0200
Message-Id: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Here's a series to add basic support for the Techwell TW9900 low-power
video decoder. This decoder support PAL, NTSC and SECAM inputs, with a
built-in comb filter and automatic input standard detection.

This series was based on previous work done by Rockchip, and is based on
vendor code. I apologise if there are some rough edges remaining in this
driver, as I'm not yet fully familiar with the media and V4L2
frameworks, so any review is appreciated.

This series adds basic support for NTSC and PAL B/D/G/H/I, along with
some very basic controls for brightness and contrast.

Thanks,

Maxime

Maxime Chevallier (3):
  dt-bindings: vendor-prefixes: Add techwell vendor prefix
  media: dt-bindings: media: i2c: Add bindings for TW9900
  media: i2c: Introduce a driver for the Techwell TW9900 decoder

 .../devicetree/bindings/media/i2c/tw9900.yaml |  59 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/media/i2c/Kconfig                     |   9 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/tw9900.c                    | 671 ++++++++++++++++++
 5 files changed, 742 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
 create mode 100644 drivers/media/i2c/tw9900.c

-- 
2.25.4

