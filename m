Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240C63C59AA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350935AbhGLJHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 05:07:20 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45264 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357135AbhGLI6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 04:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626080136; x=1628672136;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Dy+6iS++meqFzqSVYFxZfoHj7hwMnTUdHBIuRK5abJ4=;
        b=nqK+FB6co5UdUFfGyeSFIxNM4MMi45ORkLHt4DViSvGcUKwsd3a8HcmERAF/yTKW
        00xdDd/s6EX2WK5OkyVnCfKJZ6i5uNXKEJig4rEp+vVo1Wrs5guMYQXNmfZbuQlg
        QoZj7YqAhrs6Cl+H9oixwh3Yq4HoctC19qb7HM+AZ7U=;
X-AuditID: c39127d2-1e4f970000001daf-19-60ec03882add
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D9.8D.07599.8830CE06; Mon, 12 Jul 2021 10:55:36 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071210553587-1131630 ;
          Mon, 12 Jul 2021 10:55:35 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v5 0/6] media: mt9p031: Read back the real clock rate
Date:   Mon, 12 Jul 2021 10:55:29 +0200
Message-Id: <20210712085535.11907-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:35,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:36
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRoCBS7eD+U2CwfpPzBbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZbQcm8lYsEKgYvOi9WwNjFd5uhg5OSQETCQabqxlBbGFBLYxShzpK+pi5AKy
        rzNKvFrTwgaSYBMwklgwrZEJJCEi0MYoseNIM5jDLLCFUeLz/f1MIFXCAq4SO+/tYwaxWQRU
        JVpabzOC2LwCNhI75vYzQ6yTl5h56Ts7RFxQ4uTMJywggyQErjBKrJxzkB2iSEji9OKzYA3M
        AtoSyxa+Zp7AyDcLSc8sJKkFjEyrGIVyM5OzU4sys/UKMipLUpP1UlI3MQID8vBE9Us7GPvm
        eBxiZOJgPMQowcGsJML7rfdVghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeDbwlYUIC6Yklqdmp
        qQWpRTBZJg5OqQbGhpi5523NTR7euVuuc0mWwyPs9qvwxk8SG88XRawU1Fi9sVtA8738o1Tl
        H0HpscrpeWtPTdkTpiLCujThW8/S5RlzFZ5oVIbMV77Kc2h+ZskjTzEPV/OowxW8DNcTPQrU
        5lzO4LzE4xPpt4Or7L/UYXMdjp0b33Lu42DZ7uj9zkRi0rtY6yolluKMREMt5qLiRABYeavb
        NgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

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

Christian Hemp (2):
  media: mt9p031: Make pixel clock polarity configurable by DT
  media: mt9p031: Add support for 8 bit and 10 bit formats

Dirk Bender (1):
  media: mt9p031: Fix corrupted frame after restarting stream

Stefan Riedmueller (3):
  media: mt9p031: Use BIT macro
  media: dt-bindings: mt9p031: Convert bindings to yaml
  media: dt-bindings: mt9p031: Add missing required properties

 .../bindings/media/i2c/aptina,mt9p031.yaml    |  97 ++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt |  40 ------
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |   1 +
 drivers/media/i2c/mt9p031.c                   | 121 ++++++++++++++----
 include/media/i2c/mt9p031.h                   |   1 +
 6 files changed, 196 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

--=20
2.25.1

