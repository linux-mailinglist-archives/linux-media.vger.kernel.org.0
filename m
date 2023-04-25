Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06EA16EE3AA
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 16:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbjDYOKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 10:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233612AbjDYOKK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 10:10:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BF8B1
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 07:10:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00EB562A1B
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 14:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04074C433D2;
        Tue, 25 Apr 2023 14:10:06 +0000 (UTC)
Message-ID: <e3033fa8-11d2-8dfe-3ab9-b2d21d712deb@xs4all.nl>
Date:   Tue, 25 Apr 2023 16:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 13/13] media: bttv: convert to vb2
To:     Deborah Brouwer <deborah.brouwer@collabora.com>,
        linux-media@vger.kernel.org
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
 <bc025f256d5ad3890e100b4d1359caa1f1447ad5.1682379348.git.deborah.brouwer@collabora.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <bc025f256d5ad3890e100b4d1359caa1f1447ad5.1682379348.git.deborah.brouwer@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

I did some testing and found two issues. When streaming video, then
starting and stopping streaming from vbi, there are dropped frames in
the video stream. This happens both for vb1 and for vb2, although it seems
to happen in slightly different places (I think in one case the dropped
frame is when you start the second stream, and in the other case it is
when you stop the second stream. I have to retest this to confirm this
difference).

In any case, I don't think it should cause frames to drop at all. I will
investigate this when I have more time.

The second issue is a bug in the sequence counter, see below.

On 25/04/2023 02:10, Deborah Brouwer wrote:
> Convert this driver from the old videobuf framework to videobuf2.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/media/pci/bt8xx/Kconfig       |   2 +-
>  drivers/media/pci/bt8xx/bttv-driver.c | 805 ++++++++------------------
>  drivers/media/pci/bt8xx/bttv-risc.c   | 265 +++++----
>  drivers/media/pci/bt8xx/bttv-vbi.c    | 239 +++-----
>  drivers/media/pci/bt8xx/bttvp.h       |  60 +-
>  5 files changed, 491 insertions(+), 880 deletions(-)
> 

<snip>

>  static void
>  bttv_irq_wakeup_vbi(struct bttv *btv, struct bttv_buffer *wakeup,
> -		    unsigned int state)
> +				unsigned int state)
>  {
>  	if (NULL == wakeup)
>  		return;
> -
> -	wakeup->vb.ts = ktime_get_ns();
> -	wakeup->vb.field_count = btv->field_count;
> -	wakeup->vb.state = state;
> -	wake_up(&wakeup->vb.done);
> +	wakeup->vbuf.vb2_buf.timestamp = ktime_get_ns();
> +	wakeup->vbuf.sequence = btv->seqnr++;

If both video and vbi are streaming, then the seqnr is increased
too often: once for video, once for vbi.

Change this to:

      wakeup->vbuf.sequence = btv->seqnr;
      if (!vb2_start_streaming_called(&btv->capq))
              btv->seqnr++;

This avoids incrementing the sequence counter twice.

> +	vb2_buffer_done(&wakeup->vbuf.vb2_buf, state);
>  }
>  
>  static void bttv_irq_timeout(struct timer_list *t)

Regards,

	Hans

