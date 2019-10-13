Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45CEED5643
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2019 14:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729023AbfJMMvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Oct 2019 08:51:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42055 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbfJMMvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Oct 2019 08:51:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id c195so9943166lfg.9;
        Sun, 13 Oct 2019 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnEZZKLdchfPxZwyFhft+IvnfeeQym77vAh1RxoR6RE=;
        b=k84dxHEgTstDIIhGbELE2rRpmTdmcGZq1x4hqbvoWAYF1T78BxrJQjgrnbbUhUM1cg
         STob0XM6CKPLb5DM1J4BVW8s+9fYp8jwIKByatisIytbDL+fTAAqIvXShK4HsqdQuAHu
         AaSMWXCEy/dzopVjMd21JlyXWrKibjWY2E/SbaIUYcMCQhi5CQMDoK0ZMJA0tud9TZ7Y
         LBgTx29zlBojCbgPEa+LtrE+EiRimVr4+6YlABkMPQT71BSU/SiJTqSQo4hTfdg8nugp
         TLUQC4zV0quMkjhksL4lHFs616vkoWiwSHcdx/CDMmWmPLOuLhTC5U35yb2BO/bWdj1T
         TcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnEZZKLdchfPxZwyFhft+IvnfeeQym77vAh1RxoR6RE=;
        b=Vyl8OUVen4O/QtBfEdXraXGR2xZs5Aagg4t7HcgJCYEdX+LOUSimTOJfPFh9S/E0w2
         UwjNYA0Hcd5PagdQzktNxYMeTIm8AVCY4geKRCcflRF8brvbg30TSI2YUUgadKVLqEuS
         9BKTS3OBDNLZD2QJ8fRWTtdK3bDlCNm1s/O+NUJAxee818q8bE4f0q5jp34V3Mh3cUp6
         irU5Is3SXkv3aiwYRcOmWJ7nl160cvRDfeTNPboySwHIqFmGMWQPDcqS81qC2cFvvb/p
         drMwM0Ko1Ob8tg0TGVSMB+PdbEjW99sK7RkBLpV++OKZfhcHM5XkzW7unjjbSqWZKRgD
         /MpA==
X-Gm-Message-State: APjAAAXPbSbtzHcvWektuOzIcnBb1giznjQUbWpZocg64GyvsQBXSuus
        aZgXZp7Aib2JMZrPZ5Y3CzI/ljLH
X-Google-Smtp-Source: APXvYqzVf+ufiLIlLhdEtE0L4wWh31dT4i9CCLbtF90hgrXDLwILfxeg+n4DMT3Uuk6aYmZPd6MmYQ==
X-Received: by 2002:a19:ad0a:: with SMTP id t10mr14524567lfc.113.1570971104091;
        Sun, 13 Oct 2019 05:51:44 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id m18sm3327243lfb.73.2019.10.13.05.51.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Oct 2019 05:51:43 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 0/6] media: ov6650: Master and pixel clock handling fixes
Date:   Sun, 13 Oct 2019 14:50:44 +0200
Message-Id: <20191013125050.4153-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix issues with handling of master and pixel clock, mostly those
introduced as temporary workarounds when the driver was converted form
soc_camera sensor to a standalone V4L2 subdevice driver.

Janusz Krzysztofik (6):
  media: ov6650: Fix stored frame interval not in sync with hardware
  media: ov6650: Drop obsolete .pclk_limit attribute
  media: ov6650: Simplify clock divisor calculation
  media: ov6650: Don't reapply pixel clock divisor on format change
  media: ov6650: Drop unused .pclk_max field
  media: ov6650: Fix arbitrary selection of master clock rate

 drivers/media/i2c/ov6650.c | 129 +++++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 57 deletions(-)

-- 
2.21.0

