Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41B744F5BA
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 00:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhKMXlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Nov 2021 18:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhKMXlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Nov 2021 18:41:25 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D23AC061766;
        Sat, 13 Nov 2021 15:38:31 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t11so26467892ljh.6;
        Sat, 13 Nov 2021 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=v+/iTcFZe4U1/1rjP7zbNwYdPxzRegfOtpPoaAUoroU=;
        b=dWQ6ENVyq8MhX/gwVro2dCleMvO+eT8gEr3JRDDf3a8cJtNJafq3yk9v+CKR/aSS76
         cgopNddvyHz+xo7S4YPibPcmVsAWsrKr0ymtL7L+01LS82KIbe8STA1W5lNg8rqdwctZ
         wPPbT0RcbDIBSXSnWlC4ZaJhx4hdTRRPE1C35SbIlF1PZNOSKM5E9/zwYcxxfKcy3XSZ
         O0VHpcBX0+iAyFTFWtDzUUzJDWRachIuEzOuhQORGaA/cRuzOAKGn9ufMkRj/GOQ3rtJ
         KKWnvxytRWnXMG8xzhiRa7yjICc+0yjWWierMqBs7fO/EyKAb/+pDVVNymYO7xFn9Y+S
         t9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=v+/iTcFZe4U1/1rjP7zbNwYdPxzRegfOtpPoaAUoroU=;
        b=d8jOT/mWkRQJVkbSeI85TRW8juiB+Ui1ZDYpuPD/fAxoExLXi/7wPw28tVwZ8qt9I2
         HVG8iNRLoQkQMtOPfDPb1bwZegpFFS8ToG4Y85wlklui2jdoIrCHV4Dl0QOERIQAVLwc
         1O/XKm/rtX47haeXacObwxbYCCXDxaB+12NLRcDiN9H2JQ5TIZuVJ+JDl3+UIJrtQCSc
         rU51p9SUw5RGts62XNGKV59I7HpxEHHuDWwYIBfIrjr8q/0KpZf58OQ9Q+nOND2GSeUB
         VHpU426z2TOkqIxuNEJ6OgX0Agby2Egvwk/G7wRkwzIt1THu9i4D2pUIPzpBeEBaGYUc
         MZjw==
X-Gm-Message-State: AOAM530J6SZ/LcsoadpyrxiYHGGG7H+bore57P4gqP7mQ93ETG4nKtQc
        tZ308vZ8n4z3DlahMAp7Xt0im8ahGKJ4+g==
X-Google-Smtp-Source: ABdhPJzoprwLOZP8/l2BcdaiMQNeRcLJjyeYGYBZPprUHT+0JvRJpzVDZM1DnWhRXeUj3equYltDNQ==
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr26692272ljf.182.1636846709651;
        Sat, 13 Nov 2021 15:38:29 -0800 (PST)
Received: from razdolb ([185.7.153.254])
        by smtp.gmail.com with ESMTPSA id q10sm978049ljh.94.2021.11.13.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 15:38:29 -0800 (PST)
References: <20211010175457.438627-1-mike.rudenko@gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkisp1: use device name for debugfs
 subdir name
Date:   Sun, 14 Nov 2021 02:33:55 +0300
In-reply-to: <20211010175457.438627-1-mike.rudenko@gmail.com>
Message-ID: <877ddbpqx7.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-10-10 at 20:54 +03, Mikhail Rudenko <mike.rudenko@gmail.com> wrote:
> While testing Rockchip RK3399 with both ISPs enabled, a dmesg error
> was observed:
> ```
> [   15.559141] debugfs: Directory 'rkisp1' with parent '/' already present!
> ```
>
> Fix it by using the device name for the debugfs subdirectory name
> instead of the driver name, thus preventing name collision.
>
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 7474150b94ed..560f928c3752 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -426,7 +426,7 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_debug *debug = &rkisp1->debug;
>
> -	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
> +	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
>  	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
>  			     &debug->data_loss);
>  	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,

Gentle ping. Could this be merged please?

--
Best regards,
Mikhail Rudenko
