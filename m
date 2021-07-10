Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DFC3C333D
	for <lists+linux-media@lfdr.de>; Sat, 10 Jul 2021 08:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbhGJGju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 02:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:51340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhGJGju (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 02:39:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CAC961375;
        Sat, 10 Jul 2021 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625899025;
        bh=gV2Pfj2NN055Q0X+lsNhoIQOi7ituo+LVpl15VX3Qrg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iEVZdslJuwgHl1Srn3duqBR3Jq8/GB/5xleLtRueB22Bu6QKo8kD1wKLtcP1DUuYb
         beLL3TiJyKW6LS+CMwlzKhA0XEKb/4ZbFUePsoutrpMHHu3qlGbHrpdcKRlphAGHAW
         UCFSE2sxxI4o6shXYxjYeAo7d4BFhuxnJ1nVUubM=
Date:   Sat, 10 Jul 2021 08:37:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hridya Valsaraju <hridya@google.com>
Cc:     daniel@ffwll.ch, Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kernel-team@android.com, john.stultz@linaro.org, surenb@google.com
Subject: Re: [PATCH] dma-buf: Delete the DMA-BUF attachment sysfs statistics
Message-ID: <YOlADy6gdrUDNltl@kroah.com>
References: <20210710051027.42828-1-hridya@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710051027.42828-1-hridya@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 09, 2021 at 10:10:24PM -0700, Hridya Valsaraju wrote:
> The DMA-BUF attachment statistics form a subset of the DMA-BUF
> sysfs statistics that recently merged to the drm-misc tree.
> Since there has been a reported a performance regression due to the
> overhead of sysfs directory creation/teardown during
> dma_buf_attach()/dma_buf_detach(), this patch deletes the DMA-BUF
> attachment statistics from sysfs.
> 
> Fixes: bdb8d06dfefd (dmabuf: Add the capability to expose DMA-BUF stats
> in sysfs)
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> ---

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
