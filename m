Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685454751D4
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 06:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239806AbhLOFEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 00:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbhLOFED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 00:04:03 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C769BC061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 21:04:03 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h24so16305733pjq.2
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 21:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w3h1z2ZUOQdtw/Q+MQwqondvwrvk1h3D7alR26F4HjY=;
        b=Z3HmU0nMagUkYdu7+VontPj2taLCzQVuwNR7mgX1hry0t+7A4B/NjfOch2/CxqJUPs
         5zvv3pQh+y7muyHCN+/ZbmODnJwRMQO/ukzjIeGrN11jyOHUFBFhDhxPdcD6VpoTEiYE
         +s0RzEv+kICOe1SNMwJd1kXt7TNLBHc4T5HzuhQJnsoKF5o+0NQazp+EOIXlIQstmTAP
         v0I9R01wuidyII1CJ6yRKSf1Z7sVB6HDoE96ruAFt5l/bxdLRCXpDDoP9uwccQDjCz3U
         IJbg+B5gOIRoiQmCdzUiD4nMxMMfdvelJxq75WEC3wK/60lDlrqUZU0KnslT7Zjb+XNT
         U/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w3h1z2ZUOQdtw/Q+MQwqondvwrvk1h3D7alR26F4HjY=;
        b=w/EvfZ5zoLeXCSFnvrnf97yaSHz4xCLEpKxvVkvjjEUsMmqKuV+NLAPR+wkWQ+qrME
         ljXxOAYY6HWCzNYiH4XZPOhcmaDGey0myGXE72aTobsBKUKqdDn5upuU2xnHoyrPtt+E
         X4xQgloNeEYhRtpolLHSrG8yGLeJDTCxuKcgWo2ZMiInzTVAWdEDTUrAWDq69T81qxPB
         5pqcjT7NyjOzPHMElrYXcZb2gKIyNIN8Mk9kM4nP9u9/diVjvdm6vnQqEBWYFgJQEop5
         XQoTbbLeDP+lYScK9QbK0pSqZgzJvW1u1LBkjqp4IClgp/RpqI5Cwyz+Zj9cFzAz/DS0
         b32A==
X-Gm-Message-State: AOAM532A/VBL70/m5uRoeWD/rvsRVfu4jx4Az1XaGELdoTKoFFWfOKhs
        LoS5k4epj/YgFENxE9r3gcqFSQUxPzR4RQ==
X-Google-Smtp-Source: ABdhPJxucs3HR7YPsggkXj8v5xfCFbiTw9ADpgsT2tJCAtMOSuydrWDEDRG0g1K6R+1XTXzFr1LTaw==
X-Received: by 2002:a17:90a:46c9:: with SMTP id x9mr10047607pjg.183.1639544643091;
        Tue, 14 Dec 2021 21:04:03 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:754d:1c44:62a9:6d30])
        by smtp.gmail.com with ESMTPSA id lp12sm624066pjb.24.2021.12.14.21.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 21:04:02 -0800 (PST)
Date:   Wed, 15 Dec 2021 13:03:59 +0800
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mtk-vcodec: potential dereference of null pointer
Message-ID: <Ybl3PwH5CLBp8ZHz@google.com>
References: <20211215032834.94111-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215032834.94111-1-jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 15, 2021 at 11:28:34AM +0800, Jiasheng Jiang wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> index cd27f637dbe7..769228093e48 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
> @@ -102,6 +102,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
>  	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
>  
>  	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return ERR_PTR(-EINVAL);

It should return -ENOMEM for the case.
