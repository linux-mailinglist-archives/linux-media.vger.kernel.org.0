Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57346435456
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 22:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhJTUL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 16:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbhJTULz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 16:11:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD8AC061749
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:40 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so12122404wmz.2
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V88g9/D29zrL6QHXR48P4CVKxzPOpttF64BNB2SYKh0=;
        b=T3xM4yevAQsdlSbe7tJduXmvuw1wLh41A21wunlqMrt2wPTvY48XfGZiA7811S17dh
         fhg5V50GGtvAeWfHaI2Hw7AlbfPoqs/uaW+XySPKNvNSwHwUK/Mi9yBbtqO1leS68XEB
         4Ds1Z3EqL5ksQ+4S8++1kx5LB+lcqleMFMroPMY+aKSM0RQcKMr/bj2HuV2x408SJi8n
         sU4NHn1lVTm7RV7bpTpGFBsuVTEo8E9ovDwIefVa4h+cbW0ndY16MIDhgtlS2LWkXBXG
         Fkh9SI5HxWSjchWgfJBBXycDlv9kXSHmE1Zm7QWSVgodD1Pe/3YH8BDSDidIoMGAmH9m
         HX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V88g9/D29zrL6QHXR48P4CVKxzPOpttF64BNB2SYKh0=;
        b=FjzGhsUWv9CBNhRzn9YOYYK8d5llfaaBiqmOzBH6ZzuOLYt7EkSnSXi+Hd2bUXc8H/
         Yq7GsS+XtCp3HaSAmLDg8a8fU7FsLCixE62Nb2G5HBIkxBILPks1Jh2usqzDEpjmWh8T
         MP8x7HaXt2hcpc1eiZH/h+BbkxIykyJM46x6vp9q7EeKJ+jao5V3BMUMkgl5pY6jp/pX
         GSR4sINmgbOfjOeGvHYu5/wNoiPPafW3n2jhIYA4Zi9njxWsYubYe6u6UvGJp+P82IiR
         ID5KhqJBMpsw8hkFVobN5Q9dNeCaCzk/ZOQXEOENwHgn5jS0O60rECxkJ6vjqYEcPxfa
         A7LA==
X-Gm-Message-State: AOAM532VUqOEoyvd+uA+oy8+Dd9Nk4VvkXNjYrigV78FrimNoMQ8DVb+
        oIYL7G+GVp0J1LjufN7Cig/iWw==
X-Google-Smtp-Source: ABdhPJyAT9FcwRXpA2k33OerYwYt9w+1kD0AOmcY0kTScuHqKuKZ4CMbckfEc7ftLk2Fdf4jjo4emg==
X-Received: by 2002:a7b:c941:: with SMTP id i1mr16398540wml.40.1634760579350;
        Wed, 20 Oct 2021 13:09:39 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id x7sm2849904wrq.69.2021.10.20.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 13:09:38 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP
Date:   Wed, 20 Oct 2021 22:02:22 +0200
Message-Id: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
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

 drivers/media/platform/rcar-vin/rcar-core.c | 379 ++++++--------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  58 ++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
 4 files changed, 167 insertions(+), 290 deletions(-)

-- 
2.33.1

