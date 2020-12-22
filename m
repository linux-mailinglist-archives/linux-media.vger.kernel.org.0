Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19FC2E0D03
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 17:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgLVQE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 11:04:56 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48041 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727199AbgLVQE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 11:04:56 -0500
X-Originating-IP: 90.55.97.122
Received: from pc-2.home (apoitiers-259-1-26-122.w90-55.abo.wanadoo.fr [90.55.97.122])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 148D21C0005;
        Tue, 22 Dec 2020 16:04:12 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 0/3] media: i2c: Introduce driver for the TW9900 decoder
Date:   Tue, 22 Dec 2020 17:04:04 +0100
Message-Id: <20201222160407.501586-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

This is the third version of the series adding support for the Techwell
TW9900 multi standard decoder. It's a pretty simple decoder compared to
the TW9910, since it doesn't have a built-in scaler/crop engine.

This V3 addresses coding-style issues reported by Paul, and fixes the
example binding.

Any feedback is appreciated,

Thanks,

Maxime

Maxime Chevallier (3):
  dt-bindings: vendor-prefixes: Add techwell vendor prefix
  media: dt-bindings: media: i2c: Add bindings for TW9900
  media: i2c: Introduce a driver for the Techwell TW9900 decoder

 .../devicetree/bindings/media/i2c/tw9900.yaml |  60 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/tw9900.c                    | 617 ++++++++++++++++++
 6 files changed, 697 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml
 create mode 100644 drivers/media/i2c/tw9900.c

-- 
2.25.4

