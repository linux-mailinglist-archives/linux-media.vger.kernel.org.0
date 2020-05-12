Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70861CEF68
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgELIph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:45:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgELIpg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:45:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2BEE206CC;
        Tue, 12 May 2020 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589273136;
        bh=HHIUAU+1SaQZGuj/kMFvsg276gIp0yMSTOdsnW2u5/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kp1CjhZx2evs7dpoOGovhGH3+KzVfWpMQIKjROna1SzcunxkhfKN/q4EJuNt652bf
         qSQLSbIuWYOvrCEmfblr82+/hJoHBqePBcNEZcbn71U75ERldDAvaHEMDvQpaIye0N
         LtbBSKL3m1z71mcv8hXp93UXZmC5Y1JxRj7gVjHM=
Date:   Tue, 12 May 2020 10:45:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charan Teja Kalla <charante@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, vinmenon@codeaurora.org,
        sumit.semwal@linaro.org, ghackmann@google.com, fengc@google.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: fix use-after-free in dmabuffs_dname
Message-ID: <20200512084534.GA3557007@kroah.com>
References: <1588060442-28638-1-git-send-email-charante@codeaurora.org>
 <20200505100806.GA4177627@kroah.com>
 <8424b2ac-3ea6-6e5b-b99c-951a569f493d@codeaurora.org>
 <20200506090002.GA2619587@kroah.com>
 <3bc8dd81-f298-aea0-f218-2e2ef12ca603@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc8dd81-f298-aea0-f218-2e2ef12ca603@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 10:43:18AM +0530, Charan Teja Kalla wrote:
> > Ok, but watch out, now you have 2 different reference counts for the
> > same structure.  Keeping them coordinated is almost always an impossible
> > task so you need to only rely on one.  If you can't use the file api,
> > just drop all of the reference counting logic in there and only use the
> > kref one.
> 
> I feel that changing the refcount logic now to dma-buf objects involve
> changes in
> 
> the core dma-buf framework. NO? Instead, how about passing the user passed
> name directly
> 
> in the ->d_fsdata inplace of dmabuf object? Because we just need user passed
> name in the
> 
> dmabuffs_dname(). With this we can avoid the need for extra refcount on
> dmabuf.

Odd formatting :(

> Posted patch-V2: https://lkml.org/lkml/2020/5/8/158

Please just post links to lore.kernel.org, we have no control over
lkml.org at all.

I'll go review that patch now...

greg k-h
