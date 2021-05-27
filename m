Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2F93927FD
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 08:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbhE0GuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 02:50:01 -0400
Received: from smtprelay0200.hostedemail.com ([216.40.44.200]:52220 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229635AbhE0GuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 02:50:00 -0400
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 45192837F24D;
        Thu, 27 May 2021 06:48:25 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 2D8471A29F9;
        Thu, 27 May 2021 06:48:23 +0000 (UTC)
Message-ID: <39c5f5ea0367aa3bcfecc8c0ff2d6bb84f927d0c.camel@perches.com>
Subject: Re: [PATCH v2] media: v4l2-ioctl: deleted the repeated word 'the'
 in the comments
From:   Joe Perches <joe@perches.com>
To:     lijian_8010a29@163.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        arnd@arndb.de, sakari.ailus@linux.intel.com,
        sergey.senozhatsky@gmail.com, gustavoars@kernel.org,
        yepeilin.cs@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Date:   Wed, 26 May 2021 23:48:21 -0700
In-Reply-To: <20210527064107.149950-1-lijian_8010a29@163.com>
References: <20210527064107.149950-1-lijian_8010a29@163.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=4.05
X-Stat-Signature: 9f4z4j7akjbgmatq33dcqtweahpg6mmx
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 2D8471A29F9
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+A5bVFSabqaHqE6UkBRL+DfXfEtKKt0AY=
X-HE-Tag: 1622098103-576085
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-05-27 at 14:41 +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> deleted the repeated word 'the' in the comments of function
> v4l_sanitize_format()

Please update the suggested commit log message too as it
doesn't match the patch.

> ---
> v2: changed the repeated word 'the' to 'that' in the comments of
> function v4l_sanitize_format()
[]
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
[]
> @@ -999,7 +999,7 @@ static void v4l_sanitize_format(struct v4l2_format *fmt)
>  	/*
>  	 * The v4l2_pix_format structure has been extended with fields that were
>  	 * not previously required to be set to zero by applications. The priv
> -	 * field, when set to a magic value, indicates the extended fields
> +	 * field, when set to a magic value, indicates that the extended fields
>  	 * are valid. Otherwise they will contain undefined values. To simplify
>  	 * the API towards drivers zero the extended fields and set the priv
>  	 * field to the magic value when the extended pixel format structure


