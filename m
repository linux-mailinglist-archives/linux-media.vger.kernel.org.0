Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FAB937B31
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 19:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbfFFRgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 13:36:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59748 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730192AbfFFRgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 13:36:48 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A5DC2605F9;
        Thu,  6 Jun 2019 18:36:47 +0100 (BST)
Date:   Thu, 6 Jun 2019 19:36:44 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrl: Initialize _BUTTON and
 _CTRL_CLASS
Message-ID: <20190606193644.767f5246@collabora.com>
In-Reply-To: <20190606161254.17311-1-ezequiel@collabora.com>
References: <20190606161254.17311-1-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  6 Jun 2019 13:12:53 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> These two control types don't really need a default value,
> as they are not expected to carry any value.
> 
> However, it's slightly clearer to initialize them explicitly
> instead of falling back to the switch default.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Changes from v2:
> * Initialize the controls to zero, instead of default.
> 
> Changes from v1:
> * No change.
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1870cecad9ae..92a5521f6813 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -1532,6 +1532,10 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
>  	case V4L2_CTRL_TYPE_BOOLEAN:
>  		ptr.p_s32[idx] = ctrl->default_value;
>  		break;
> +	case V4L2_CTRL_TYPE_BUTTON:
> +	case V4L2_CTRL_TYPE_CTRL_CLASS:
> +		ptr.p_s32[idx] = 0;
> +		break;
>  	case V4L2_CTRL_TYPE_U8:
>  		ptr.p_u8[idx] = ctrl->default_value;
>  		break;

