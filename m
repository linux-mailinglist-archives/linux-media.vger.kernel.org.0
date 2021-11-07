Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8994144745C
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhKGRSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51055 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231284AbhKGRSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Acd9jEvalxM/pfSj9gWojnRbfdFmXqF5ylFUMapoJ5Q=;
        b=UaXV9GR+oniZNqPDPRjLvhCthf6zoDemwJja0b8feJQVB6iasn+0o1Ki0t240+rQzLxG5w
        ftw+Ff/BeJoEXhhiusV5GHf3ww0V2gGkg9rRoloDdR4Kh6wFIm2pelz1NxO6LzRZ6yIBBk
        nYsbEMoXNozHBNE7FKt/fyHoiVRfoKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-c2tM518iMmSSo8xZUvoP4Q-1; Sun, 07 Nov 2021 12:15:54 -0500
X-MC-Unique: c2tM518iMmSSo8xZUvoP4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABEE15721;
        Sun,  7 Nov 2021 17:15:52 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 372CE57CD3;
        Sun,  7 Nov 2021 17:15:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 00/11] media: atomisp-ov2680: Cleanups and exposure + gain fixes
Date:   Sun,  7 Nov 2021 18:15:38 +0100
Message-Id: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I've finally made some time to look into running the atomisp2 driver
from staging on an Asus T101HA. Thanks to the great work from
Tsuchiya and Mauro I actually got a working picture in camorama
now, which is awesome!

But I noticed that exposure / gain setting was not working, not
even if I first set it using the --exposure option to v4l2n before
running camorama.

There were a number of issues, which this series all fixes,
after this series you can set an exposure + gain with v4l2n
and the run camorama and actually see the difference.

Note despite the cleanups in here the atomisp-ov2680 code still
is far from great, but it works :)

Regards,

Hans

p.s.

I've also given the current media-staging code a real quick
test on a T100HA, fwiw it does not work there atm. I did
not investigate this further (not yet anyways).


Hans de Goede (11):
  media: atomisp-ov2680: Remove a bunch of unused vars from
    ov2680_device
  media: atomisp-ov2680: Turn on power only once
  media: atomisp-ov2680: Push the input_lock taking up into
    ov2680_s_power()
  media: atomisp-ov2680: Remove the ov2680_res and N_RES global
    variables
  media: atomisp-ov2680: Move ov2680_init_registers() call to power_up()
  media: atomisp-ov2680: Save/restore exposure and gain over sensor
    power-down
  media: atomisp-ov2680: Make ov2680_read_reg() support 24 bit registers
  media: atomisp-ov2680: Fix and simplify ov2680_q_exposure()
  media: atomisp-ov2680: Fix ov2680_write_reg() always writing 0 to 16
    bit registers
  media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
  media: atomisp-ov2680: Fix ov2680_set_fmt() messing up high exposure
    settings

 .../media/atomisp/i2c/atomisp-ov2680.c        | 167 +++++++-----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  59 +------
 2 files changed, 71 insertions(+), 155 deletions(-)

-- 
2.31.1

