Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0421F6759
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 14:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgFKL77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 07:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgFKL77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 07:59:59 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEEDC08C5C2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 04:59:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so5887517wru.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
        b=jwiYu/7L6j2sAYGVwtKRrycnxxCH9y03CsnXRJ8z3ly0et9m6tC9Gde+Yz+sPiMXXD
         QdTydr/V9aBC/hz/4sWIycY/BZDsNBVmWxLuaaTgoH+Bi7fsDz+VoIekGDOKRW/xZEG2
         GUVQPJN0MVSzz7sivc/AnoR9ZlIepkjQqaSPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
        b=GyQEolaSTOVigwUJcad3k+L6onaDTfepsQzpjChTv42KhOtngQYa0kyEa0TehW4D2g
         NvD0w4f1MPJ8XBLpIB9M9iaLroDotmm72oS8/y9h37YStZXM/5uCuaRNcaNfCedE6jgH
         aJtpdG9rmfaMp/pCBnSuQUo+fLQke9WpMEWhm8KAjFDR7wiF6/G/BiDRiZSFvKR53Jwx
         X5KqVK9JmR9PK9VgBVPaFBUi51h+ymX3M/zRwwWxWV64SmNXdpKCKTN2PrP+K1PAeBYh
         9Yepyyze6YuB6yN9dRPJCLdHLKfJmiZ4xvShWOFKmzB5VQP1cTiTHPIqvKtZ8EFPXMBZ
         ECww==
X-Gm-Message-State: AOAM530JNNs+Uae+Y+EfWJhhNvZjw8dxpZnfNiWgvZ83Kqu4TTqplyur
        /rwMLVKfIidFFw6xG3DOTv6uJw==
X-Google-Smtp-Source: ABdhPJxvbPyTd8RhVR3eBjnPhFunZ9jzxWDwTxaX1ZFBKznlJyB1xYBlLPEro/H0Z6e06/M4GOnLDg==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr9859784wro.271.1591876796211;
        Thu, 11 Jun 2020 04:59:56 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j16sm5307254wre.21.2020.06.11.04.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 04:59:55 -0700 (PDT)
Date:   Thu, 11 Jun 2020 11:59:54 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 06/18] media: platform: Delete the resetting
 hardware flow in the system PM ops
Message-ID: <20200611115954.GB135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-8-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-8-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:41PM +0800, Xia Jiang wrote:
> Delete the resetting hardware flow in suspend and resume function
> because that resetting operation will be done in device_run().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
