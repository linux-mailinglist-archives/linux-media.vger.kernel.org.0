Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6BB3078FF
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 16:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhA1PBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 10:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhA1PBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 10:01:44 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24EBC061574;
        Thu, 28 Jan 2021 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=MuQ55b6lQL0I5ueFfXsRaK8O5AcvEo+mmGNhqsq60gQ=; b=jkYUSm/Yl0s99oYdm2MBlnRPAI
        lagIosX5PANZ3deQL5v4LMDMKT3UMoOm+aTiACikMRmoxifXT41M5Y/0ShZxFrvvSzstoAJnErTHK
        sxNg6SQH+oqGmJpU3lfzDmo+XVYEIY0MYUEMZyWnhpVQQFgtH+c7ihkHuoptUM3I2Wgkcyu/41gEa
        IHZ0SZckorrXIgrxh3nIYif6YcIX/mGnRB1KAVdTOCNLMUwFUUmLoauj5Qqi3kl4OZDJ8lAt28LvV
        KaGDSc5P0AcQQfkhO7vHx/0U4thIwIlCbZFvyiuKcGRLoMbpYzx7nHXwc04Obj1pFaitsdln3g6hr
        UquB1PxQ==;
Received: from 213-225-36-89.nat.highway.a1.net ([213.225.36.89] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l58mv-008bD0-Sl; Thu, 28 Jan 2021 15:00:50 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: add a new dma_alloc_noncontiguous API
Date:   Thu, 28 Jan 2021 15:58:31 +0100
Message-Id: <20210128145837.2250561-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

this series adds the new noncontiguous DMA allocation API requested by
various media driver maintainers.
