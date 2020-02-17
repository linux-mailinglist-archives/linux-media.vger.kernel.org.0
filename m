Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9DDF161C16
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 21:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgBQUDy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 15:03:54 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43906 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbgBQUDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 15:03:54 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 89396293265
Subject: Re: [PATCH] media: staging: rkisp1: remove serialization item in the
 TODO file
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200217175209.8279-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <b8b1bbd8-e802-be53-74c5-0dd9fea49d23@collabora.com>
Date:   Mon, 17 Feb 2020 17:03:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217175209.8279-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/17/20 2:52 PM, Dafna Hirschfeld wrote:
> The item 'Fix serialization on subdev ops.' was solved,
> so remove it from the TODO file.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> This patch is a follow-up patch of the patchset:
> 'media: staging: rkisp1: add serialization to the isp and resizer ops'
> 
>  drivers/staging/media/rkisp1/TODO | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index 03cd9a4e70f7..0aa9877dd64a 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,4 +1,3 @@
> -* Fix serialization on subdev ops.
>  * Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
>  e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
>  cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
> 
