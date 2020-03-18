Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8605C18A11E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 18:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgCRRGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 13:06:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41279 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRRGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 13:06:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id h9so2590145wrc.8;
        Wed, 18 Mar 2020 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/rEJdrbP9Ob4aYc7GSk/ci8eaOjcpS5YRjx6GQO3uAs=;
        b=XIxq+WXPDNxcs3ZfYLEdTqOIsMBqNzkc5j6NTvdfJNK7DHknFzHvXokFLMR5ERDqtt
         wBOeC7ZBe/TTBL++p6EKnaGsxzOS6aT6i2zt82J92Fsyay36G9nDwNf28FJA4rbcxfPL
         mRUbSxY9EAECGvIZq7GaSyojYMSZI3lxvZSmdiYoW9+9HqPc6r88YpxoiHNu5EaxvSKl
         dKSyCPcvhV9kZY1E8pFmc4Na7iawy6IhtYlpvG5VFmnbfGfRNyAVd0MNQFBXktGEdHIa
         Y5+omLp6zhyLKPK9yTBJtNgA7cNbHXkN9B3khysoWLJ6QL40QqJlJKXaZF7dgrhk7m26
         9hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/rEJdrbP9Ob4aYc7GSk/ci8eaOjcpS5YRjx6GQO3uAs=;
        b=mhrygYhXkgBE99YJAA6cMTdOfdKDs/p/rtlS4vdHXKAEQEvpKZ49leI/UKPs9XLzDp
         d9LOkhoZPheQoE6AC4G4mkpdd+XUt+lhX6t9ADb2yyPaPmBrduu+ao/P778KuBg2uCAP
         AlAcHcOGMVOMTz90U1Ig55t33vWSzXTHOWS/ibj1K2GU5qaXKEmgGhxYwXsN2XxlYBMk
         8BTs5rFVnm1wCVJLxGmmNq+WNgt8EUszERCWZsvribfvtI1VX+JnwuQmP6QHOkKiKmpq
         /t8dJswpKRvSw7OrdXLMZHLYVpfEKQoRSRpSUnvtEuXUIybV1XiieRs7uNs7tG9fAjke
         oVqg==
X-Gm-Message-State: ANhLgQ17SDz/TsZJbyG0cqOU2nZy1VtuHXY+DOkzkLTDGvLe/zoleJ/y
        nOdKWLJdKu0e1mJs0RKT+VE=
X-Google-Smtp-Source: ADFU+vvR+Pm/OGLW0mDVIzRa5nDNd/q4u6LEhmwplSYZWHV66M5vxycCxiEdtuAI3iuYIJgPPEQRhA==
X-Received: by 2002:a5d:4305:: with SMTP id h5mr5295246wrq.69.1584551204893;
        Wed, 18 Mar 2020 10:06:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:caa:1f1f:ffe5:ef76])
        by smtp.gmail.com with ESMTPSA id k5sm4661283wmj.18.2020.03.18.10.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:06:41 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2]  media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format 
Date:   Wed, 18 Mar 2020 17:06:36 +0000
Message-Id: <20200318170638.18562-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch of the series adds support for matching fwnode against
endpoints/nodes which are registered in v4l2-async and the later adds
supports for MEDIA_BUS_FMT_SRGGB8_1X8 format.

Changes for v3:
1: Dropped patch 1/1 from v2 as this handled neatly by patches
   https://patchwork.linuxtv.org/project/linux-media/list/?series=1974
2: Included Ack from Niklas for patch 2/2
3: Updated commit message for patch 1/1.

Changes for v2:
1: Added support for matching fwnode against endpoints/nodes.
2: Separated patch for rcar-vin and rcar-csi2.c which added
   MEDIA_BUS_FMT_SRGGB8_1X8.

Lad Prabhakar (2):
  media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
  media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format

 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c  | 11 ++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 4 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.20.1

