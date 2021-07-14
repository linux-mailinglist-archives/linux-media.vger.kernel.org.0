Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0841A3C856B
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 15:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhGNNlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 09:41:44 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56710 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbhGNNlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 09:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626269929; x=1628861929;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PxSYG0xhrv/QCqqU6/r124I8xNYe3YTtw9Z9lrbsBUw=;
        b=HemsVzuCQ00HOSLRfXsXtVoXh0QCHzUHUdCOLMa395L3Jci1AddMtQE1lsHaxn00
        xSYFrKOl/Xzeimcd9Fbpxv6KLp1bPhy1GgiAN4O0Mr5S3wrcxIT1j9n9wdI+tK7i
        zKEbTfJEUySdy9Wa5wrIqtc5M4O0EiSoQW4gqVqSe7w=;
X-AuditID: c39127d2-1e4f970000001daf-1a-60eee8e94f31
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C9.57.07599.9E8EEE06; Wed, 14 Jul 2021 15:38:49 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071415384934-1154287 ;
          Wed, 14 Jul 2021 15:38:49 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v6 0/6] media: mt9p031: Read back the real clock rate
Date:   Wed, 14 Jul 2021 15:38:43 +0200
Message-Id: <20210714133849.1041619-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:49,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.07.2021 15:38:49
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRoCBS/fli3cJBjNe6FrMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAlXGrt4+pYJZQxc7L7YwNjDP4uhg5OSQETCSe37/M2sXIxSEksI1RYlnLVjYI
        5wKjxP5F89lBqtgEjCQWTGtkAkmICLQxSuw40gzmMAtsYZT4fH8/E0iVsICrxKHvq5m7GDk4
        WARUJSZezwYJ8wrYScy+fJsVYp28xMxL39kh4oISJ2c+YQGZIyFwhVFi4Y4NjBBFQhKnF59l
        BrGZBbQlli18zTyBkW8Wkp5ZSFILGJlWMQrlZiZnpxZlZusVZFSWpCbrpaRuYgQG5OGJ6pd2
        MPbN8TjEyMTBeIhRgoNZSYR3qdHbBCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8G3hLwoQE0hNL
        UrNTUwtSi2CyTBycUg2MTdvcbCbeZZLzPCK6Z8nKKkU5eXaJpNU60xYsfDt5+s9K7s+li1dt
        Oekn8+L8hCnamX9T/JNbXJ8vKI2YO6myRqToa2VmsZjTy2sur/+LP5xR7H4/5ZlSmV3utspH
        x6y076xVl9m/8qTrJIM7yzf+PxwwsXfdbC7r156fDvfMvfit7qi/6FEpLSWW4oxEQy3mouJE
        AJpym8c2AgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

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

 .../bindings/media/i2c/aptina,mt9p031.yaml    | 114 ++++++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt |  40 ------
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/Kconfig                     |   1 +
 drivers/media/i2c/mt9p031.c                   |  80 +++++++++---
 include/media/i2c/mt9p031.h                   |   1 +
 6 files changed, 179 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

--=20
2.25.1

