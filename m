Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05B721248A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgGBNZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:25:41 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51576 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgGBNZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 09:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593696340; x=1625232340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YaxDvS8jDu2VQTjokUgNcdOotzhnd0DUR1G1UJzTGVE=;
  b=ijOtvO5zz5Pq/ydNL2n/P3w8jBaO8KIHf+1u2IVvJzn7T5bJ59abGjTU
   G1e/BvPLlEBqe28SXp4dMWGn3hbEX5NEEz3rg8Qb4LDgQjUn8DiqO/4y1
   17lA9Xx0j0Rsn9HRI3JpVXZj8twrZ/Yx7pKRX+tF6uhna7lJNjx8hs+Mw
   Lvn3YQs7dPE37ZqeTJ3wtABsau43IjJhaezR5UFbC3hrph0eYJCcp75Cq
   HOmIj9lDJQgNeDFxXacpKoMOUiknLmO++JTNcCpAgXd4iU75ZN1qCGfaa
   OKVFhft1by5cZVolCNV+sdvpLCEUGD69tUSvPmEjh6dWI1MnaTcUrOvNN
   A==;
IronPort-SDR: 2ZlXcmkfo9X4AvA3wPImu7YRM49/Tofkm72itfPfSijReVXXdR+KFluJuGKRiRJkmZHhAGHnCS
 WrvMp1qZJOuSIgkOcrIF5WGIebVPe8YlcYHn6VSyAdvvuFAM+B5vEOzNmpIu0gKdoYxaRYhqAl
 2uv/x/7JpBaP58X5KQYW/rlH/8uAbFFoHqcM1F03LEIWk5y+uib+mkEoDZM2Du10OFAoF+rdB3
 yO0hptHgl12uqt5QGde0q2JWZTl23WkMF+HW+krpySIrwT+ZEUNTAf80YCmrQ0wplMAFiw/LPu
 EtU=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="80498545"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2020 06:25:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 06:25:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 2 Jul 2020 06:25:19 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 0/4] media: introduce microchip csi2dc driver
Date:   Thu, 2 Jul 2020 16:23:55 +0300
Message-ID: <20200702132359.122844-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series adds support for the Microchip csi2dc csi-2 demux controller.

I was not fully sure where is the best place for such a helper chip, thus
I added the driver in a separate 'misc' menu under the media menu.

There are references in the binding driver to the Synopsys IDI interface,
which is not yet in kernel mainline, as per the patch series at [1].

As this driver is still new, it still can get plenty of improvement, so,
waiting for feedback.

Thanks everyone for reviewing !

[1] https://lwn.net/Articles/790917/

Eugen Hristev (4):
  dt-bindings: media: csi2dc: add bindings for microchip csi2dc
  media: misc: introduce miscellaneous menu for helper chips
  media: misc: introduce microchip_csi2dc driver
  MAINTAINERS: add microchip csi2dc

 .../bindings/media/microchip,csi2dc.yaml      | 186 +++++
 MAINTAINERS                                   |   7 +
 drivers/media/Kconfig                         |   1 +
 drivers/media/Makefile                        |   2 +-
 drivers/media/misc/Kconfig                    |  22 +
 drivers/media/misc/Makefile                   |   2 +
 drivers/media/misc/microchip_csi2dc.c         | 705 ++++++++++++++++++
 7 files changed, 924 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
 create mode 100644 drivers/media/misc/Kconfig
 create mode 100644 drivers/media/misc/Makefile
 create mode 100644 drivers/media/misc/microchip_csi2dc.c

-- 
2.25.1

