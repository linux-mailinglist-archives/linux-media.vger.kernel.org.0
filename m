Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0CC460044
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 17:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhK0Qra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 11:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhK0Qp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 11:45:29 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1569C061574
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:14 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a18so25894373wrn.6
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUGQw/RbSx1j8ovUrt/ZuOt4au7QA9TK8ji9FOOrBxk=;
        b=HhMegenwDHWa3zeqMY6cCs4h5577RWILuB6Op9U7qQAxFirGeZePeF5AfYNNj+HDV1
         90x7ylYa9LlwbL3i+fSFA2lioaSpK8wBy9Dtb1fgg8553kJhVaKeDYn0oQXiIWT5ySem
         k8Hig1nWVz2UgUL6z++nF5S1uT4ZLWA/vHl8VMporJE7KITAjiZR10UqSFCS9JC+erFE
         jhYkciV8F9eYTyyGDTid1GNGjskfZUthK8oIIDPRTglbZ+9cuvdijet/iG1hZ5XqkVYS
         8MBfvft9Kd3Zv+c84ZItSJmku2/N/GwizgHzhyiNZJF5olpTfdENjT57kt3LOqS7liiN
         NFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MUGQw/RbSx1j8ovUrt/ZuOt4au7QA9TK8ji9FOOrBxk=;
        b=F/TTCvOTbsLc3Egtnr3hHrYnWBz4CJDsE7NDV/9eBse4awGf1hbgF1v5A41EZT5uIw
         QR4MeNylhZwg38ePvXgr3+EZNHWBK8rQPooYwL6NMFe6uHp4/PNCGAXAXVZ6vGm1+l0g
         GgvmjOjWe782d+r3HMDn1g2K+4+F/Vas2dEeM0kCuTxeB+irz4TfG6M/T3ITEdHB5LTU
         SBvEaDiJJ9sUIEGos0SMB68zPJd3g25ujElOLG0Me/QX4EPvoLvyh1/klq9ie3K77kUe
         Y+QrGTX1Mm7E1p22xtAP8Uo+CrfFA2hBQsehA6mudQ6NFLYe/VqrCLUY7aDl4E93KQac
         n/7A==
X-Gm-Message-State: AOAM531hVmW1N4Z2o6Zo5I2NdjtexXqSFZ780EuRDo+bvMgHE9PMNIq1
        J7W5UknexUkw4osS6Zk0pDPKpHHAoSyq+t57
X-Google-Smtp-Source: ABdhPJz9f8epAGt2qNO9xIHO1qqlBY5wWwmL2tBRGYp0XoaAf4FacZhagRuavoC+cFRMNbodBEeYTA==
X-Received: by 2002:adf:e848:: with SMTP id d8mr22196995wrn.3.1638031333462;
        Sat, 27 Nov 2021 08:42:13 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id u13sm2900104wmq.14.2021.11.27.08.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 08:42:13 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP
Date:   Sat, 27 Nov 2021 17:41:32 +0100
Message-Id: <20211127164135.2617686-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series attempts to increase the flexibility of the R-Car VIN
capture pipeline by allowing for free form Virtual Channel routing
within the same CSI-2 IP block.

When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
routing was centred around the CHSEL register which multiplex the
different parallel buses that sits between the CSI-2 receivers source
side and the VIN dma engines. This was a bad design as the multiplexing
do allow for only a few combinations and do not play nice with many
video streams in the system.

For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
given CSI-2 receiver to be used together with the scaler.

Later datasheets have expanded the documentation and it is now possible
to improve on this design by allowing any Virtual Channel to be routed
to any R-Car VIN instance, provided that there exists a parallel bus
between them. This increases the flexibility as all Virtual Channels can
now be used together with the scaler for example.

The redesign is not however perfect. While the new design allows for
many more routes, two constrains limit a small portion of routes that
was possible in the old design but are no more.

- It is no longer possible to route the same CSI-2 and VC to more then
one VIN at a time. This was theoretically possible before if the
specific SoC allowed for the same CSI-2 and VC to be routed to two
different VIN capture groups.

- It is no longer possible to simultaneously mix links from two CSI-2 IP
blocks to the same VIN capture group.

For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
capture from CSI40. While VIN{4,5,6,7} is still free to capture from
any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
are disabled that VIN capture group is free again to capture from any
other CSI-2 IP it is connected to.

At the core of the redesign is greater cooperator of the R-Car VIN and
CSI-2 drivers in configuring the routing. The VIN driver is after this
change only responsible to configure the full VIN capture groups
parallel buses to be to a particular CSI-2 IP. While the configuration
of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
IP output ports is handled by the CSI-2 driver.

Before this change the CSI-2 Virtual Channel to output port was static
in the CSI-2 driver and the different links only manipulated the VIN
capture groups CHSEL register. With this change both the CHSEl register
and the CSI-2 routing VCDT registers are modified for greater
flexibility.

Patch 1/3 and 2/3 are cleanup patches moving code around preparing for
the real work in 3/3. The work is based on the latest media-tree.

Kind Regards,
Niklas Söderlund

Niklas Söderlund (3):
  media: rcar-vin: Refactor link notify
  media: rcar-vin: Breakout media link creation
  media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2
    IP

 drivers/media/platform/rcar-vin/rcar-core.c | 387 ++++++--------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
 4 files changed, 173 insertions(+), 292 deletions(-)

-- 
2.34.0

