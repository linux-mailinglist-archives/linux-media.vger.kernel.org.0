Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E54848AD9E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239968AbiAKM3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239959AbiAKM3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:29:21 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFE7C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:29:21 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id m57so2123935vkf.9
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fv7pt9678shE7Q7gg0kgK0x1MbtUotyBshoy1BPYoNU=;
        b=gt0NMyRVmbPiSVLgHGoeirMn+6K8VRHjq5Z3bFtL/fdPTkq1tVYaM3/cBdxVPx1Vx9
         pwgDJcrxZ3wbfWmLcpJ/V7uxO3uFu/Oh7SuamB6Y9aK07us2006uvJALmV6I4jwvHOrM
         UUkk8Z2MuGVDo7ObjCmHRsesbL66x5g9Js09FgF51JJqECpPQm99SB1Iu9O1XS30M0SA
         JYNG3SaeUJ6mJLeY0f2aWpctQfo9yxaL/V+mnXmtHsTZtkCNc+fjZfL1rtJm5FJZxIOb
         zT55++Tyo+PHL+ZFLfmTvJHdz4+7NcOsct0cr3UV54Yms+0iBHH3lF2KKyvBB5g189Ww
         DQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fv7pt9678shE7Q7gg0kgK0x1MbtUotyBshoy1BPYoNU=;
        b=5v6kYGrC0VM5Hrb+BmIRdsmt9BtXsvvc67+o/OJpZ4urt+T2f0lROYeCy+mXZBKQSk
         hKaPXKcreJf/9feOBhNdXkr3+jKl3aNaZFbjrRbfjwkIPCxwOsTkh2FBdMsUOjJ4FWHS
         uAtRTYpGZggwlgov+VRlsPl+t3OBGw9tok6alTYDQL+WS4Zun7qZfHtjb1CAuFdX1TMl
         s7AKBhA6XvDElSLpTwywvyGtvdSnKxl6iLebPy/4X103pzWlxsBJ/hptiOQ/v98L1vvg
         1YFoN33qBhPRZfcdM7sdveCjF5GZ3OYAcRDKw1ADnlxxf4g7R7LmOC/zhkulZ+82aBd7
         S6tQ==
X-Gm-Message-State: AOAM5301A4/MJMCmM7qYgFj3YBmPP155HjRcgsRjrutomUiuDEvedAEI
        hU06PPxyS2YxLHibP8WFdjH7OQ==
X-Google-Smtp-Source: ABdhPJzdUf+2AyxBnCeYQvC08RwhDHivZ77KBn3JZgwWiYrkhZac07pExSkBYc60YwwSdyiiG4m9dQ==
X-Received: by 2002:ac5:cc4f:: with SMTP id l15mr1818832vkm.2.1641904160330;
        Tue, 11 Jan 2022 04:29:20 -0800 (PST)
Received: from eze-laptop ([190.190.187.46])
        by smtp.gmail.com with ESMTPSA id w62sm5403336vkd.47.2022.01.11.04.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:29:19 -0800 (PST)
Date:   Tue, 11 Jan 2022 09:29:14 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, kernel@collabora.com
Subject: Re: [PATCH 2/3] media: stk1160: move transfer_buffer and urb to same
 struct 'stk1160_urb'
Message-ID: <Yd14Gqq7Nmjhlihx@eze-laptop>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111065505.6323-3-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jan 11, 2022 at 08:55:04AM +0200, Dafna Hirschfeld wrote:
> Instead of having two separated arrays, one for the urbs and
> one for their buffers, have one array of a struct containing both.
> In addition, the array is just 16 pointers, no need to dynamically
> allocate it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/usb/stk1160/stk1160-v4l.c   |  2 +-
>  drivers/media/usb/stk1160/stk1160-video.c | 50 ++++++++---------------
>  drivers/media/usb/stk1160/stk1160.h       | 11 ++---
>  3 files changed, 23 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
> index 6a4eb616d516..a06030451db4 100644
> --- a/drivers/media/usb/stk1160/stk1160-v4l.c
> +++ b/drivers/media/usb/stk1160/stk1160-v4l.c
> @@ -232,7 +232,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
>  
>  	/* submit urbs and enables IRQ */
>  	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
> -		rc = usb_submit_urb(dev->isoc_ctl.urb[i], GFP_KERNEL);
> +		rc = usb_submit_urb(dev->isoc_ctl.stk1160_urb[i].urb, GFP_KERNEL);

The "stk1160_urb" field is a member of struct stk1160_isoc_ctl,
so it's not really needed to name it "stk1160_urb", you could just
name it "urb_ctl" or something like that.

I think the result should be saner:

		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb,
				    GFP_KERNEL);

Also, please make sure you run some regression tests with this patch alone
applied (without 3/3). It's easy to make a mistake on this kind of cleanups.

Thanks,
Ezequiel
