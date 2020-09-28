Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F81927AFC3
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 16:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgI1OMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 10:12:44 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42211 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgI1OMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 10:12:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MttMk6kYjv4gEMttPkROmB; Mon, 28 Sep 2020 16:12:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601302361; bh=tCYrxQLs0ptZjaQbbKuxZVmedyj/sbq6LVmqSQgCCYs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NgDg30vewxZvAttfeTM6OeTLv5O4WCVEuyMZvUNOT+uz/jOcgF2pk81XJONne8wGn
         rTQFGfepRi9kW7U3PCrCBDMyjIrKfFnrn0+RucUbX0kcUSdX60Zz3zLx1wi64v51uZ
         qJe7VSv1xX9GXu26P8wOZll8hQVPq7xWOZebrjgQH5Eqlr8MOc/CFpecgpiaJZFQ3P
         R9rjZeVQdsX6mSbmOsmBCDvA0/g8H8DnlxGO3Z2Hwa/dwkCgEGxvVQgGVRAF6E0t5h
         zeKs9kEtuO+Jp9keUYMI8wvlsWBiL4FlnQb5nCWT1Uwo+fKELGig/Yejwl7fl23kZ5
         sNQpxhpjWH7PQ==
Subject: Re: [PATCH] media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Adrian Ratiu <adrian.ratiu@collabora.com>
References: <20200814071202.25067-9-xia.jiang@mediatek.com>
 <20200928140334.19070-1-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a25c5c3e-6ece-5996-101e-a36a660f6c5a@xs4all.nl>
Date:   Mon, 28 Sep 2020 16:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928140334.19070-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFgE24lYB1apI/z5TurW1TjBc86r2cEyO8A5Oi12umsNgKNI1yFZGqEMtfaLYNAFcWhyAKo1SV2kIROJDYp8dmIv04EO/AILUu8TlPV245zb3Hgv+Uyd
 4xiTfitveilQFEgtI1VUd7J+obFaQZwrlyDxl4+UczfEyDyKW2trhHpMIVJ914WePg1IHAUfwE4z8Qk8yL4o3snEgey/2ok7FowkdUqE8fWRedhFdZcg6Xtx
 yCDEEh+xE98dF1htLg+NGaVqi/2iQeqYZENIgeBOQQHGAQvVDvPkpggbwM4+vE8AZgbwZMYgZ3mQ6xg7YF0d5yKfCtH9bho7N7l+zs5kOttV3c/ZKyWserRz
 VXDURmvb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/09/2020 16:03, Ezequiel Garcia wrote:
> A seemingly bad rebase introduced a spurious v4l2_m2m_buf_done,
> which releases a buffer twice and therefore triggers a
> noisy warning on each job:
> 
> WARNING: CPU: 0 PID: 0 at drivers/media/common/videobuf2/videobuf2-core.c:986 vb2_buffer_done+0x208/0x2a0
> 
> Fix it by removing the spurious v4l2_m2m_buf_done.
> 
> Reported-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Fixes: 911ea8ec42dea ("media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index f626ba5ee3d9..b221b4e438a1 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -516,7 +516,6 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  
>  	if (WARN_ON(!src_buf || !dst_buf))
>  		goto unlock;
> -	v4l2_m2m_buf_done(src_buf, state);
>  	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>  	if (!dst_buf->is_held) {
>  		v4l2_m2m_dst_buf_remove(m2m_ctx);
> 

