Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1452F29FD31
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 06:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725767AbgJ3F2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 01:28:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55188 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3F2u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 01:28:50 -0400
Received: from [IPv6:2804:14c:483:7e3e::1005] (unknown [IPv6:2804:14c:483:7e3e::1005])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8DD421F4501B;
        Fri, 30 Oct 2020 05:28:46 +0000 (GMT)
Subject: Re: [PATCH] media: staging: rkisp1: uapi: add "WITH
 Linux-syscall-note"
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201020132514.26651-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2e5116d7-10c1-6eee-9a80-5350515ac314@collabora.com>
Date:   Fri, 30 Oct 2020 02:28:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201020132514.26651-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 10/20/20 10:25 AM, Dafna Hirschfeld wrote:
> Add "WITH Linux-syscall-note" to the uapi
> header SPDX comment.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Since Niklas reported[1], it wold be nice to add his Reported-by tag.

[1] https://www.spinics.net/lists/linux-media/msg177793.html

Regards,
Helen

> ---
>  drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> index 432cb6be55b4..8d906cc7da8f 100644
> --- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> +++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
>  /*
>   * Rockchip ISP1 userspace API
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> 
