Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1B251992
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 15:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgHYN1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 09:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgHYN1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 09:27:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86003C061574;
        Tue, 25 Aug 2020 06:27:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 34C76295FCD
Subject: Re: [PATCH] MAINTAINERS: add Dafna Hirschfeld for rkisp1
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, tfiga@chromium.org
References: <20200825132209.193435-1-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <ca53cdf2-e82b-9370-86d8-9005b104ca04@collabora.com>
Date:   Tue, 25 Aug 2020 15:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825132209.193435-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 25.08.20 um 15:22 schrieb Helen Koike:
> Add Dafna Hirschfeld to rkisp1 maintainers list
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index deaafb617361c..3deb954b2bb5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14858,6 +14858,7 @@ F:	include/linux/hid-roccat*
>   
>   ROCKCHIP ISP V1 DRIVER
>   M:	Helen Koike <helen.koike@collabora.com>
> +M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	drivers/staging/media/rkisp1/

Acked-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> 
