Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF0C3D5457
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhGZGyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:51 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56428 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhGZGyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284918; x=1629876918;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qxOFmUW6q/tdE/nq5AMZH6Fmc9XyQiz1E75+b8GctxI=;
        b=fnTHOYQVV0U9r94LRvWXBYk+gXYXtb+yZrOo232++I7jZyKKYSLTn2oth6K2xaKL
        9b1u3YnCU78Oc8JLvHo/qGeTo/LnrmKpaOCPA/J5ApXEb9wjaxNC6W1FrdZhkt9X
        dUb96Xpw1qyY1gN/mdvwsjcvUsCWoS1IBtuLgClFPt0=;
X-AuditID: c39127d2-1e4f970000001daf-a0-60fe65b65d82
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id F2.82.07599.6B56EF06; Mon, 26 Jul 2021 09:35:18 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351818-1233313 ;
          Mon, 26 Jul 2021 09:35:18 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v7 0/6] media: mt9p031: Read back the real clock rate
Date:   Mon, 26 Jul 2021 09:35:12 +0200
Message-Id: <20210726073518.2167398-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:18,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:18
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRoCBS3db6r8Eg2n/lC3mHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyrj97SBLQZdwxdEVe5kbGN/zdTFyckgImEh0T5zO2sXIxSEksI1RYltHKxNI
        QkjgAqPE3bZKEJtNwEhiwbRGJpAiEYE2RokdR5rBHGaBLYwSn+/vB+sQFnCV6N9wlB3EZhFQ
        lTj+ahtYnFfATuLs4QPsEOvkJWZe+s4OEReUODnzCQvIIAmBK4wSK9tPsEAUCUmcXnyWGcRm
        FtCWWLbwNfMERr5ZSHpmIUktYGRaxSiUm5mcnVqUma1XkFFZkpqsl5K6iREYkIcnql/awdg3
        x+MQIxMH4yFGCQ5mJRFehxW/E4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzbuAtCRMSSE8sSc1O
        TS1ILYLJMnFwSjUwFukecJ7yQZ55xYvUY42e/bdmvfZycRHQOrXK5l1l2PRH15Il3q/5pCSg
        X/5gVXHMVC67vE6t8Exhy6U6Mk4mijp7uVfGGSrwTn15I7qr3GXSm5zmNX714VuVc7nO3Np2
        iKfh7tKzD3d6ys0v5uObsCmqrno6y0c9u8TQyc/5bSvqduj1sfxQYinOSDTUYi4qTgQA9Y9s
        6DYCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Changes in v7:
 - Drop bus-type and bus-width documentation since there is only one
   possible setting.

Changes in v6:
 - Add type, description and constraints to custom endpoint properties
 - Add properties from video-interfaces.yaml
 - Add reviewed-by from Rob to
   media: dt-bindings: mt9p031: Add missing required properties

Changes in v5:
 - Fixed issues reported by dt=5Fbinding=5Fcheck
 - Use /schemas/graph.yaml#/$defs/port-base instead of
   /schemas/graph.yaml#/properties/port since we have additional
   endpoint properties
 - Update commit message

Changes in v4:
 - Add two missing BIT macro conversions
 - Switch to dt-bindings yaml schema before applying changes
 - Drop explicit pclk-sample property documentation patch since it is
   documented in the referenced video-interface schema now. (I hope that
   is correct)

Changes in v3:
 - Dropped 1/5 media: mt9p031: Add support for 8 bit and 10 bit formats
 - Dropped 3/5 media: mt9p031: Implement [gs]=5Fregister debug calls
 - Added reviewed-by from Laurent Pinchart to
   media: mt9p031: Read back the real clock rate
 - Dropped unnecessary register reads in
   media: mt9p031: Fix corrupted frame after restarting
 - Changed sorting of register bits from MSB to LSB
 - Added patch to switch to BIT macro
 - Added two additional dt-bindings patches to add missing properties
   documentation

Christian Hemp (1):
  media: mt9p031: Make pixel clock polarity configurable by DT

Dirk Bender (1):
  media: mt9p031: Fix corrupted frame after restarting stream

Enrico Scholz (1):
  media: mt9p031: Read back the real clock rate

Stefan Riedmueller (3):
  media: mt9p031: Use BIT macro
  media: dt-bindings: mt9p031: Convert bindings to yaml
  media: dt-bindings: mt9p031: Add missing required properties

 .../bindings/media/i2c/aptina,mt9p031.yaml    | 108 ++++++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt |  40 -------
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |   1 +
 drivers/media/i2c/mt9p031.c                   |  80 ++++++++++---
 include/media/i2c/mt9p031.h                   |   1 +
 6 files changed, 173 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

--=20
2.25.1

