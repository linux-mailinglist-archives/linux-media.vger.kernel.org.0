Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A5C3BF76A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhGHJWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:07 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46330 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbhGHJWF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735962; x=1628327962;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3PXh34z5hHskudF1buVvXccfk5Dp/8JaB8bjicQftPo=;
        b=sNNO97DmzttzEerctp4x0u30gcQWvLpTzy8apnZL20CsKhLU7S21iuVx7l4Ei9ml
        /QfgP8nrpizgMlKgs7c/qMWGmb5CjUagQC2uvITLbb4I105t/se+HlMBr08DE4sy
        cDt63vhLV73laRHQ3KIdLMseYYPFsDblCgrFU36Vhwk=;
X-AuditID: c39127d2-1e4f970000001daf-7b-60e6c31af88c
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 96.B7.07599.A13C6E06; Thu,  8 Jul 2021 11:19:22 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192213-1113440 ;
          Thu, 8 Jul 2021 11:19:22 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v4 0/6] media: mt9p031: Read back the real clock rate
Date:   Thu, 8 Jul 2021 11:19:16 +0200
Message-Id: <20210708091922.5508-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:22,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:22
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRoCBS1fq8LMEg7b74hbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZUw8u5mx4CBfxcWNB5gaGGdxdzFyckgImEjs2jeFvYuRi0NIYBujxJXXM5kg
        nGuMEsd7jrCAVLEJGEksmNYIlhARaGOU2HGkGcxhFtjCKPH5/n4gh4NDWMBV4vMkLpAGFgEV
        iVmXZjOC2LwC1hI3379lhVgnLzHz0nd2iLigxMmZT1hA5kgIXGGU6P/YzA5RJCRxevFZZhCb
        WUBbYtnC18wTGPlmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZlSWqyXkrqJkZgQB6eqH5pB2Pf
        HI9DjEwcjIcYJTiYlUR4jWY8SxDiTUmsrEotyo8vKs1JLT7EKM3BoiTOu4G3JExIID2xJDU7
        NbUgtQgmy8TBKdXAqNv4WdC6qnLOFHF3j3PKGwz+VZ71VuesVLAXX3+58WpMpN3ivFurV+dv
        3x+5IFBvpvALwx3rHevvWE6aG1yw9KVci9eFCqMuxtxjJ4X+Z9glZnP/9FwQ1Mzw8Whm90d5
        Xem1e1pm3w3UuBfievzWpgUL46du9RSuf/2ddUPCk4dbLXZYriq6qMRSnJFoqMVcVJwIAG4K
        Vkc2AgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

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

 .../bindings/media/i2c/aptina,mt9p031.yaml    | 97 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt | 40 --------
 MAINTAINERS                                   |  1 +
 drivers/media/i2c/Kconfig                     |  1 +
 drivers/media/i2c/mt9p031.c                   | 80 +++++++++++----
 include/media/i2c/mt9p031.h                   |  1 +
 6 files changed, 162 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

--=20
2.25.1

