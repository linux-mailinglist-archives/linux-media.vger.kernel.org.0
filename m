Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623DE721879
	for <lists+linux-media@lfdr.de>; Sun,  4 Jun 2023 18:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjFDQO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jun 2023 12:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFDQO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jun 2023 12:14:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2533CB3
        for <linux-media@vger.kernel.org>; Sun,  4 Jun 2023 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685895258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=prUSpACnesFBdISjfYXBDJBfz4kA8+GM5OJe6WPYwwA=;
        b=dbnIVPBXJDuSrKz9vL0cSDhZ1yRfJ5KMY2Qq3Z8iMvonmDYNWtQ3pXPfb0twneTdxAgHMJ
        n8XliH/8HvycCKOFIRqeyhzwDJttgiRzBrdvv6g57OPLTgpAsHacB7XqFDS4d8U3xlz0QF
        DfE1rqmegYesS4xXW7M/Zc3KuSufRsc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-O0DazDfYNC6bMA-5g0xA-Q-1; Sun, 04 Jun 2023 12:14:14 -0400
X-MC-Unique: O0DazDfYNC6bMA-5g0xA-Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920DE38035BF;
        Sun,  4 Jun 2023 16:14:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB1F7492B00;
        Sun,  4 Jun 2023 16:14:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 0/5] media: atomisp: ov2680 work + add testing instructions
Date:   Sun,  4 Jun 2023 18:14:01 +0200
Message-Id: <20230604161406.69369-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is some more ov2680 sensor driver work. This work is the result
of trying to get the main drivers/media/i2c/ov2680.c driver in a shape
where it is good enough to replace the atomisp specific version.

The plan is to port recent improvements to atomisp-ov2680.c over
to the main driver. While working on this I noticed some issues which
need fixing before copying them over to the "main" driver.

Besides that this also adds a small patch to make testing with
gstreamer easier and this adds testing instruction to the TODO file.

Regards,

Hans


Hans de Goede (5):
  media: atomisp: Stop resetting selected input to 0 between /dev/video#
    opens
  media: atomisp: ov2680: Stop using half pixelclock for binned modes
  media: atomisp: ov2680: Remove unnecessary registers from
    ov2680_global_setting[]
  media: atomisp: ov2680: Rename unknown/0x370a to sensor_ctrl_0a
  media: atomisp: Add testing instructions to TODO file

 drivers/staging/media/atomisp/TODO            |  33 +++++
 .../media/atomisp/i2c/atomisp-ov2680.c        |  15 +--
 drivers/staging/media/atomisp/i2c/ov2680.h    | 118 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_fops.c  |   3 -
 4 files changed, 95 insertions(+), 74 deletions(-)

-- 
2.40.1

