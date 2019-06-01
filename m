Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DDE31AB4
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 11:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfFAJFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 05:05:10 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46260 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfFAJFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 05:05:10 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9793F2613D9;
        Sat,  1 Jun 2019 10:05:08 +0100 (BST)
Date:   Sat, 1 Jun 2019 11:05:06 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 1/2] media: v4l2-ctrl: Initialize _BUTTON and
 _CTRL_CLASS
Message-ID: <20190601110506.786c24cd@collabora.com>
In-Reply-To: <20190530171909.19018-1-ezequiel@collabora.com>
References: <20190530171909.19018-1-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 30 May 2019 14:19:08 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> These two control types don't really need a default value,
> as they are not expected to carry any value.
> 
> However, it's slightly clearer to initialize them explicitly
> instead of falling back to the switch default.

If they don't carry any value, why not having a case that does nothing?
I find it disturbing to assign a default to something that does not
have a value attached to it.

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1870cecad9ae..c7d5fdb8efb4 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1530,6 +1530,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_MENU:
>  	case V4L2_CTRL_TYPE_BITMASK:
>  	case V4L2_CTRL_TYPE_BOOLEAN:
> +	case V4L2_CTRL_TYPE_BUTTON:
> +	case V4L2_CTRL_TYPE_CTRL_CLASS:
>  		ptr.p_s32[idx] = ctrl->default_value;
>  		break;
>  	case V4L2_CTRL_TYPE_U8:

