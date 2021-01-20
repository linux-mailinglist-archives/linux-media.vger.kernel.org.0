Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF912FDC40
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 23:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732395AbhATWL0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 17:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731533AbhATVKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 16:10:23 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B9EC061575
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:09:41 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id m6so15300701pfm.6
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4d6auqSX1j/vMOr3TsD18PFRnP6mGB4INh2IgrTTG4=;
        b=GdhLdiHi2LyrCQQMhzh0pvLH3gzKbpQzt27Y+CanmyiE5UaGiBQNAUzsr9Zaj0Zhr4
         KvJdY3Fzc3gckZGSp5QU8M5TxalhTsGKPF+fViwh/lBrax/yFrCK2Xm92/BNDmnnjPeU
         RZJryXRD7bznQNqVbnISwkIGndj8vzzsDJqNtcRJVPE2eUPb+buDtT72alBwOE5CVd1b
         5Zfg0FvQURoty3ptICEh9eSaAUog4x2tJQcdnvQcurrjdvmybFM9BWre3F69jbtW0JpG
         vKVbrvhCnyOPCsn02flcKhrtprB++yiII+28o7PgAqZ8wjCfT+pX98YN993EZcpX9kF6
         FN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O4d6auqSX1j/vMOr3TsD18PFRnP6mGB4INh2IgrTTG4=;
        b=cYVpFTCDQ9KwfJcSuSEwpD9fSvaj/QiK+cJicK+9P0m7kQSSuh1nsxfJ3NjPGUcFzv
         Q5OpHZVUcHjh4EcO9P2YKctB00oiffznDa/HEQf0mh8LLWFZN0pdEMfT3x4UanHRWw9O
         zxodSwt4ZpczG8Sw1biAqoHXx1QYWQm/ecWYFKiE/IwJw0jGni7/2JdbJAopSI2TAHss
         1BX8Nx4GpKHj9jewyyriPyZNLAH7963/k8ysC4MTtGHDZd+qV1s5WT5YfeQANl6UwsCH
         ZTT17a0p3n/UudLbk72X0M0x0g+dISMcFLDMYDY23TSMoad7guqVmeJ3BugJx4EYfrDX
         IEog==
X-Gm-Message-State: AOAM532IjypgqHVTBqY6HkvjICxHz3kZm6XexTURDpTCiXB+jldofZ95
        a4tRRuS3G8+bHcFn/6PeeDHELPaF6ISj6w==
X-Google-Smtp-Source: ABdhPJwVPrD98BzRwSDLgSwObG8PYNxIaFpiX8zRhpHlai6xWuIyDqUItiSV/D8Cpv4EqgdSPtOpcg==
X-Received: by 2002:a63:4d59:: with SMTP id n25mr10926215pgl.122.1611176980657;
        Wed, 20 Jan 2021 13:09:40 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id f15sm3265629pja.24.2021.01.20.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:09:39 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        Bing Song <bing.song@nxp.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 0/3] dmabuf heaps: system uncached and cma uncached heaps
Date:   Wed, 20 Jan 2021 21:09:34 +0000
Message-Id: <20210120210937.15069-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the last round submitting the system-uncached heap, I got
some feedback that Daniel would like to see it demonstrated with
a mesa based system. I'm still working on such a gralloc
implementation (using the db845c), but along with other work, so
I don't yet have something to share there. 

However, Bing Song reached out and was interested in having a
uncached variant for the CMA heap as well, and he shared this
patch providing an initial implementation.

This gave me some hesitation with regards to the earlier
discussion around what sort of attributes would be useful for
the flags field of the allocation IOCTL.

In earlier discussions, folks seemed happy to provide the
uncached system heap functionality as its own heap chardev, as
it seemed uncertain that the uncached attribute would truely be
generic across all heaps. 

But with Bing's patch, it seems like it may be generically useful,
and utilizing a flag might be a bit cleaner then adding lots of
duplicative heap names postfixed with "-uncached".

So I wanted to re-submit both of these together to reopen that
discussion on the question of if a BUF_FLAG_UNCACHED flag would
make sense, or if folks still think separate heap chardevs is
the way to go.

thanks
-john

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: Bing Song <bing.song@nxp.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Bing Song (1):
  dma-buf: cma_heap: Add a cma-uncached heap re-using the cma heap

John Stultz (2):
  dma-buf: dma-heap: Keep track of the heap device struct
  dma-buf: system_heap: Add a system-uncached heap re-using the system
    heap

 drivers/dma-buf/dma-heap.c          |  33 ++++++--
 drivers/dma-buf/heaps/cma_heap.c    | 119 +++++++++++++++++++++++++---
 drivers/dma-buf/heaps/system_heap.c | 111 ++++++++++++++++++++++----
 include/linux/dma-heap.h            |   9 +++
 4 files changed, 236 insertions(+), 36 deletions(-)

-- 
2.17.1

