Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1926A2836D2
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 15:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJENpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 09:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgJENpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 09:45:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060C0C0613CE;
        Mon,  5 Oct 2020 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=OxXif+fXbfucPONjNwEH+NLF4UmeyrvEGunwmbnw5JM=; b=R096EP6yyDiow6cJ7rHZnAPYG8
        XTxa1BqFo8QeU/Zouw5LAZK387teemOLgybXYU7Vzp6kQFvYFUk6IQQZvnuoGBZnawLf4Fx4TZycH
        jKEJnWxy/No8eqiC1ga+ReKT3sDhk/wWZuUZZT3cE02wi5Cq4eMSXlOqLpf2NBCe11ZfcRA1ijbzO
        C7eU8Q5i3RfPquMlr4X68CN130Kd8vlWEy+t/bkyayH7L5e4n7H8GM8OYNOJriAP1cy7Uhbd+SWdx
        giXnvVKjJ+khNMi/k+ef1fk62uzplk0Ff9foz/Fd/8hlF9+vQp1ogsQcd4ZIlDJaCP/uguhdSV2d7
        u0OkvdwA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPQnw-0003BW-EP; Mon, 05 Oct 2020 13:45:28 +0000
Date:   Mon, 5 Oct 2020 14:45:28 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        ??rjan Eide <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
Message-ID: <20201005134528.GA11644@infradead.org>
References: <20201003040257.62768-1-john.stultz@linaro.org>
 <20201003040257.62768-8-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003040257.62768-8-john.stultz@linaro.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

How is this going to deal with VIVT caches?
