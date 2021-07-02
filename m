Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF2F3B9EA5
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 12:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhGBKB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 06:01:57 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55530 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhGBKB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 06:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625219963; x=1627811963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=p9rlxZSBeYSZIBZ1+7KFz369cokhpJd7hOrC7JsuiFo=;
        b=Z09ed5gm2Z464mWthzSrfPyR4nGgdZU5u5z+hYPXOGrYPwzCae8DTTD6yDAxtAvp
        o8Nkb17ctbMWljzOwuLJo6H91UHE3OCS0/+jzxhWGiue/nKob2b3i0ASyylufkDs
        7NxPlRYMlJxVNTHmpE3UC6vyFQqROmMFFpyrjIUv0Cg=;
X-AuditID: c39127d2-a9fbd70000001c5e-72-60dee37abdd1
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 03.01.07262.A73EED06; Fri,  2 Jul 2021 11:59:22 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070211592281-1081045 ;
          Fri, 2 Jul 2021 11:59:22 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 0/6] media: mt9p031: Read back the real clock rate
Date:   Fri, 2 Jul 2021 11:59:16 +0200
Message-Id: <20210702095922.118614-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:22,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 02.07.2021 11:59:22
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrELMWRmVeSWpSXmKPExsWyRoCBS7fq8b0EgxmrbSzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgypj+ZBtzwXruir4DL1kaGF9zdDFyckgImEhs+ryGqYuRi0NIYBujxIS5y6Gc
        a4wScx8cZAKpYhMwklgwrRHMFhGIkvh5vocFxGYWeMAosf9VAogtLOAqMav9ESOIzSKgIjH7
        z392EJtXwFbi/ZQ97BDb5CVmXvoOFReUODnzCQvIMgmBK4wSy5vms0IUCUmcXnyWGWKBtsSy
        ha+ZJzDyzULSMwtJagEj0ypGodzM5OzUosxsvYKMypLUZL2U1E2MwHA8PFH90g7GvjkehxiZ
        OBgPMUpwMCuJ8IbOu5cgxJuSWFmVWpQfX1Sak1p8iFGag0VJnHcDb0mYkEB6YklqdmpqQWoR
        TJaJg1OqgbFeJW39fkdviXVHRc9Lxjz+6fDdzrWroPfawrV/7h8xUDAsFJMLMPw152tD6vfD
        Nwzehj+5/fqq85VjbL8P3vEvyL+ffSrAebFSR52FlNhevl8CMtn1ryduZLOzPDvxiVupSUnU
        ny27Cjff9d7eHLj04KqGONnUgI7qmR4Cc1casSvqLb4T16nEUpyRaKjFXFScCABAku82NQIA
        AA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

sorry it took me some time but this is the v3 for my previously send
patchstack:
https://lore.kernel.org/linux-media/20200930105133.139981-1-s.riedmueller@p=
hytec.de/

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
  dt-bindings: media: mt9p031: Add missing required properties
  dt-bindings: media: mt9p031: add pclk-sample property
  media: mt9p031: Use BIT macro

 .../devicetree/bindings/media/i2c/mt9p031.txt | 17 +++++
 drivers/media/i2c/Kconfig                     |  1 +
 drivers/media/i2c/mt9p031.c                   | 71 +++++++++++++++----
 include/media/i2c/mt9p031.h                   |  1 +
 4 files changed, 78 insertions(+), 12 deletions(-)

--=20
2.25.1

