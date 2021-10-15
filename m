Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430FC42F02F
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238654AbhJOMJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:09:01 -0400
Received: from mblankhorst.nl ([141.105.120.124]:47934 "EHLO mblankhorst.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229921AbhJOMI6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:08:58 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Oct 2021 08:08:58 EDT
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 0/2] dma-buf: Fix breakages from dma_resv_iter conversion.
Date:   Fri, 15 Oct 2021 13:57:18 +0200
Message-Id: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Urgent fixes!

dma_resv_test_signaled is completely broken, dma_resv_wait_timeout kind of broken.

Maarten Lankhorst (2):
  dma-buf: Fix dma_resv_wait_timeout handling of timeout = 0.
  dma-buf: Fix dma_resv_test_signaled.

 drivers/dma-buf/dma-resv.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
2.33.0

