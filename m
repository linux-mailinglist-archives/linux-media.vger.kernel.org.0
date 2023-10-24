Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADFC7D4D6B
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 12:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbjJXKOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 06:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbjJXKOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 06:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7BADC
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698142403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KFmK/LK0B/vyytJ0+QyDg/K5nB1FBx9M8LZBdOjWQTY=;
        b=cW3P2EP3iG6l5zLO6z4d2a8efVgxDM5owePCKGUoPd1D5vNrEzF5SR8qwc9z+GITOKsLML
        3KWHzolURd/LHfe9epsssYgZg6b+Z4LHdFoNz638T8c0aSw7bcAjeRHv3oII/RQysxnbDm
        t9O+FcwJOgxurj2vpOmhkCoq+SGQBBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-EjKE3ZUCO4qqw_th6AUbcA-1; Tue, 24 Oct 2023 06:13:21 -0400
X-MC-Unique: EjKE3ZUCO4qqw_th6AUbcA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F57E891F22;
        Tue, 24 Oct 2023 10:13:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.214])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 79CBF492BFB;
        Tue, 24 Oct 2023 10:13:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: mei_csi/mei_ace: Fix driver modalias not matching device modalias
Date:   Tue, 24 Oct 2023 12:13:17 +0200
Message-ID: <20231024101319.11878-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This fixes an issue with the mei device-id matching which I noticed while
debugging an out of tree IPU6 driver issue which a Fedora user was seeing
with kernels >= 6.5 on a Dell Precision 5470 which uses the VSC chip.

Note the root cause there was a different issue and these patches
have been compile tested only, please test.

Regards,

Hans


Hans de Goede (2):
  media: mei_csi: Fix driver modalias not matching device modalias
  media: mei_ace: Fix driver modalias not matching device modalias

 drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.41.0

