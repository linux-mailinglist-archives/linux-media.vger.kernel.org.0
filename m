Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBB160028D
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 19:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiJPR5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 13:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJPR5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4278B27B32
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665943063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bNMBnjvfrzkdnfwWyZTfK7G/c+bKomsasGS1xsA6FV4=;
        b=ERJKGR+bS6MpeypQn3FCQZQH8w0NMGtdZkl08HQt/Cy84gT/tZTg25APyp9KtGOEIXA0Na
        i0mJ5iY6dRr0HB5b/bRUGCay5vMIr4i0SqmIKIoRozLweUnFzRu+5FVxa2vDoHGG2GqHfd
        Q3Sp0UUp4mFiEQW13Y6eArY9vO9COaQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-oeXvGoFzMTaL7xRSFjsdGQ-1; Sun, 16 Oct 2022 13:57:41 -0400
X-MC-Unique: oeXvGoFzMTaL7xRSFjsdGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB7773C01D9D;
        Sun, 16 Oct 2022 17:57:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E66D0414A815;
        Sun, 16 Oct 2022 17:57:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4l-utils 0/4] Fix various v4lconvert functions assuming stride == width
Date:   Sun, 16 Oct 2022 19:57:25 +0200
Message-Id: <20221016175729.187258-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I (finally) have my videobuf2 conversion of the atomisp2 driver working
(I'll post the kernel patches real soon now). This means working MMAP mode,
which means I can use e.g. camorama with libv4l2 to do the conversion.

By hacking libv4lconvert to prefer certain formats I have been able to test
yuv420, yuyv, rgb565, nv12 and nv16 support in the atomisp2 code. Which has
resulted in me finding a bunch of issues inside v4lconvert because
the atomisp2 driver generally creates frames where stride != width.

This patch series fixes this. All patches have been tested on actual
hw, at least all the input -> rgb24 paths.

Regards,

Hans


Hans de Goede (4):
  libv4lconvert: Fix v4lconvert_yuv420_to_rgb/bgr24() not taking stride
    into account
  libv4lconvert: Fix v4lconvert_rgb565_to_rgb/bgr24() not taking stride
    into account
  libv4lconvert: Fix v4lconvert_nv12_*() not taking stride into account
  libv4lconvert: Fix v4lconvert_nv16_to_yuyv() not taking stride into
    account

 lib/libv4lconvert/libv4lconvert-priv.h | 14 +++---
 lib/libv4lconvert/libv4lconvert.c      | 32 ++++++------
 lib/libv4lconvert/rgbyuv.c             | 70 +++++++++++++++++---------
 3 files changed, 69 insertions(+), 47 deletions(-)

-- 
2.37.3

