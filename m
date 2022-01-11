Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CDA48A9E9
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 09:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349044AbiAKIwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 03:52:35 -0500
Received: from verein.lst.de ([213.95.11.211]:41564 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349033AbiAKIwe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 03:52:34 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id A764268AFE; Tue, 11 Jan 2022 09:52:30 +0100 (CET)
Date:   Tue, 11 Jan 2022 09:52:30 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Christoph Hellwig <hch@lst.de>, ezequiel@vanguardiasur.com.ar,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, kernel@collabora.com
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <20220111085230.GA22703@lst.de>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com> <20220111065505.6323-4-dafna.hirschfeld@collabora.com> <20220111081331.GB21713@lst.de> <65307131-533a-3de1-7877-ca3020743cbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65307131-533a-3de1-7877-ca3020743cbe@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 10:50:50AM +0200, Dafna Hirschfeld wrote:
> I'll send v2 with shorter lines. (the official limit is now 100 char which I still follow).

No.  It is 80 lines with an exception to go over it if it sigificantly
improves readability.

> You mean you would call "invalidate_kernel_vmap_range" before "dma_sync_sgtable_for_cpu" ?

Yes.
