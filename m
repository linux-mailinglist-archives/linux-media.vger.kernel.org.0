Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 752F271A1BE
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 17:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234639AbjFAPCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 11:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbjFAPBF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 11:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79A310D7
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685631547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JVRvs8QJx9CNBtc2Rk8H2xebHJdKqyXP5sJ0dypZkx8=;
        b=imSsUv/SO37Szuru7Vy1CaxdWVo4hJoo/OY6BmEQBWuBjoB7k55ILotEEF14qkO6SijpS2
        wbtNF99W1+bg676mjCzFAQubx/wK8sGa4vagMANForR03ZFLzoI6KKjK7SzbVn5DYkyN3w
        doVIDzAOoiZbkmtWzBBKFNhv+TDOCCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-kiELqxH_ObOxVUAHr9yOGg-1; Thu, 01 Jun 2023 10:59:01 -0400
X-MC-Unique: kiELqxH_ObOxVUAHr9yOGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70EB101A585;
        Thu,  1 Jun 2023 14:59:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 67FDE20296C6;
        Thu,  1 Jun 2023 14:58:59 +0000 (UTC)
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
Subject: [PATCH 0/3] media: atomisp: Selection API support bugfixes
Date:   Thu,  1 Jun 2023 16:58:55 +0200
Message-Id: <20230601145858.59652-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is a set of bugfixes for the recently added Selection API support.

Regards,

Hans


Hans de Goede (3):
  media: atomisp: Take minimum padding requirement on BYT/ISP2400 into
    account
  media: atomisp: Make atomisp_enum_framesizes_crop() check resolution
    fits with padding
  media: atomisp: Fix binning check in atomisp_set_crop()

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 42 ++++++++++++++++---
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 ++
 .../media/atomisp/pci/atomisp_common.h        |  4 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 18 +++++---
 4 files changed, 58 insertions(+), 10 deletions(-)

-- 
2.40.1

