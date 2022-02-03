Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C7A4A83DB
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 13:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350538AbiBCMd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 07:33:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37115 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350455AbiBCMd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Feb 2022 07:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643891605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/LVhd7ziYbsrNJgAaVNBY/o1mUWhuZgMTCYLeYjvhGg=;
        b=K8b5oEM/8uM2lntE1pgIe097x1IRkIXePRg27b6eK7EHBwVgbY9iZttF3f43CaNDMmAT2E
        QhLsHvYF9qx/Y+IYQGKmFf2BEkwr5Zaucg562gXbQYsbd9YM+nkOySFFbD8jgOcc327jdP
        V3Z3FW+uyJ+txSTiKwJvM6avssIFeyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-dXWeFPfUNQKMD1z-xSWlYQ-1; Thu, 03 Feb 2022 07:33:22 -0500
X-MC-Unique: dXWeFPfUNQKMD1z-xSWlYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8672981DFAD;
        Thu,  3 Feb 2022 12:33:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.196.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B6627D71E;
        Thu,  3 Feb 2022 12:33:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH v2 0/1] media: i2c: ov5648: Fix lockdep error
Date:   Thu,  3 Feb 2022 13:33:11 +0100
Message-Id: <20220203123312.505318-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patch seems to have fallen through the cracks, so I'm
resending it.

Regards,

Hans


Hans de Goede (1):
  media: i2c: ov5648: Fix lockdep error

 drivers/media/i2c/ov5648.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.33.1

