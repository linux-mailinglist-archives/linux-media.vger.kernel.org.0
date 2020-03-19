Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A32F18AD7F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 08:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgCSHuk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 03:50:40 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33246 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCSHuk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 03:50:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oaQS114016;
        Thu, 19 Mar 2020 02:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584604236;
        bh=WGCcq8ItaapvMjdB9faK0yGfrVcWztG0nO2WT9Kyw8M=;
        h=From:To:CC:Subject:Date;
        b=O8PJ1IAJM6n4cvudJfArEz1o0S5soEiBgpSem3QvTXKf7cUdJVHiKVRy4ySiF4ass
         m/b6m1AWY4ie1HN0W5Ui/txhnGHA1+uK7vyjlXED5RRJ6RcjtsAsa3VU/+l4SO9I/V
         YWuSsVjOEj5LKGnRY3lGMp6Fu8Ff6lmDhgR7w2vo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02J7oa3n035369
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 02:50:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 02:50:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 02:50:35 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02J7oXqd047151;
        Thu, 19 Mar 2020 02:50:33 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 00/19] CAL fixes and improvements
Date:   Thu, 19 Mar 2020 09:50:04 +0200
Message-ID: <20200319075023.22151-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is v2 of the series.

Rebased on top of linux-media.

I have resolved most of the comments I got for the v1, although there
were a few from Laurent where I did not agree or didn't know how to
solve the comment.

The series contains a few new patches:

"fix DMA memory corruption" which I previously had sent separately, but
it touches the same parts, so it's easier to have it as part of this
series.

"drop cal_runtime_get/put", which is just a cleanup.

"improve enable_irqs", which is also a cleanup.

 Tomi

Tomi Valkeinen (19):
  media: ti-vpe: cal: fix DMA memory corruption
  media: ti-vpe: cal: improve enable_irqs
  media: ti-vpe: cal: fix use of wrong macro
  media: ti-vpe: cal: use runtime_resume for errata handling
  media: ti-vpe: cal: drop cal_runtime_get/put
  media: ti-vpe: cal: catch error irqs and print errors
  media: ti-vpe: cal: print errors on timeouts
  media: ti-vpe: cal: simplify irq handling
  media: ti-vpe: cal: remove useless CAL_GEN_* macros
  media: ti-vpe: cal: remove useless IRQ defines
  media: ti-vpe: cal: use reg_write_field
  media: ti-vpe: cal: cleanup CIO power enable/disable
  media: ti-vpe: cal: fix dummy read to phy
  media: ti-vpe: cal: program number of lines properly
  media: ti-vpe: cal: set DMA max seg size
  media: ti-vpe: cal: move code to separate functions
  media: ti-vpe: cal: improve wait for CIO resetdone
  media: ti-vpe: cal: improve wait for stop-state
  media: ti-vpe: cal: fix stop state timeout

 drivers/media/platform/ti-vpe/cal.c      | 398 ++++++++++++++---------
 drivers/media/platform/ti-vpe/cal_regs.h |  21 +-
 2 files changed, 245 insertions(+), 174 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

