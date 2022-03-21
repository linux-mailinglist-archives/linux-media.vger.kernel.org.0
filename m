Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FC84E25B5
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 12:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346949AbiCULyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 07:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346978AbiCULyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 07:54:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C2715B86C
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 04:52:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 575F0B80EF0
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 11:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7145C340F2
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 11:52:37 +0000 (UTC)
Message-ID: <534cc11e-f3af-a961-69e5-bdc581f1d223@xs4all.nl>
Date:   Mon, 21 Mar 2022 12:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH for 5.18] v4l2-compat-ioctl32.c: zero buffer passed to
 v4l2_compat_get_array_args()
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <b80719f3-cff2-89f2-3ad1-d8e708808dbd@xs4all.nl>
In-Reply-To: <b80719f3-cff2-89f2-3ad1-d8e708808dbd@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/03/2022 09:33, Hans Verkuil wrote:
> The v4l2_compat_get_array_args() function can leave uninitialized memory in the
> buffer it is passed. So zero it before copying array elements from userspace
> into the buffer.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: syzbot+ff18193ff05f3f87f226@syzkaller.appspotmail.com

Fixes: 8dbcc3fa387c (media: v4l2: prepare compat-ioctl rework)

> ---
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 0f3d6b5667b0..55c26e7d370e 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -1040,6 +1040,8 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
>  {
>  	int err = 0;
> 
> +	memset(mbuf, 0, array_size);
> +
>  	switch (cmd) {
>  	case VIDIOC_G_FMT32:
>  	case VIDIOC_S_FMT32:

