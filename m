Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13A648AA03
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 10:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349099AbiAKJAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 04:00:03 -0500
Received: from verein.lst.de ([213.95.11.211]:41588 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349097AbiAKJAC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 04:00:02 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id A481068AFE; Tue, 11 Jan 2022 09:59:58 +0100 (CET)
Date:   Tue, 11 Jan 2022 09:59:58 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Christoph Hellwig <hch@lst.de>, ezequiel@vanguardiasur.com.ar,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, kernel@collabora.com
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Message-ID: <20220111085958.GA22795@lst.de>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com> <20220111065505.6323-4-dafna.hirschfeld@collabora.com> <20220111081331.GB21713@lst.de> <65307131-533a-3de1-7877-ca3020743cbe@collabora.com> <20220111085230.GA22703@lst.de> <6c40de5b-274d-1dc4-3aa5-498343bb3a43@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c40de5b-274d-1dc4-3aa5-498343bb3a43@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 10:55:47AM +0200, Dafna Hirschfeld wrote:
>
>
> On 11.01.22 10:52, Christoph Hellwig wrote:
>> On Tue, Jan 11, 2022 at 10:50:50AM +0200, Dafna Hirschfeld wrote:
>>> I'll send v2 with shorter lines. (the official limit is now 100 char which I still follow).
>>
>> No.  It is 80 lines with an exception to go over it if it sigificantly
>> improves readability.
>
> Ok, didn't know that.
>
>>
>>> You mean you would call "invalidate_kernel_vmap_range" before "dma_sync_sgtable_for_cpu" ?
>>
>> Yes.
>
> Could you explain why?

the vmap range is the one actually use for cpu access and thus most
prone for speculation, so I'd invalidate it first.  It probably does
not matter to much, but that order looks more sensible.
