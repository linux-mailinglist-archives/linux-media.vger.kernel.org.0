Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68DF1F674B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 13:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgFKL6p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 07:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgFKL6o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 07:58:44 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F878C08C5C2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 04:58:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l26so4721401wme.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0sNtpOa/PhRGjuV1OKVRTYfWbvM8AAbQMK//m/+CB8Y=;
        b=aQl8hp7A/JrN44Foty0jhdQAQ6zaHhp4Ec9iQuIy+6hb35sfhd5Dvo9niTT1K9Fl6p
         a/mZjwflMmDp0dgwfFRSgPDbxYlAZPatZ503QI9Sp7YvqFpsu5rzm0yoePu4yaUrjpeG
         Luy+nejClJAIU6AXcKGO2QAjU9OpjnKXHlzqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0sNtpOa/PhRGjuV1OKVRTYfWbvM8AAbQMK//m/+CB8Y=;
        b=nG9PgTcUylEgkd0mZaV2bqfkBsu2q2lljF+RCW5b8Sj54s5vb8oY1IeHSdgOa1D9J6
         LhvTDIfhmW4kyHQ9LGRQ81XQYuSMKK1cF/3Q6FAyTUYoQ4ZZsMEwfe8Zcjv7M/ONjIEM
         QqoFNduFQ4uvqvpQ2wRe+r21CN8HBCLF9NFlisNLyFmPzD7SyaJCWO/O7MVumZlAzb+V
         Hzgp8pHUdx+RnS7rCKbQ4gI0ju8DwEne1VCprAub4PRBeiJZM5fS97aePNCBDDFEx66K
         CDIyo7CpXo9dQmw+Iq4KmRJtGX2aMOqwlpQqtBo4eIBXRQN+8376oDoeXlSStlXi80De
         Exkw==
X-Gm-Message-State: AOAM533XHaqP6NdBemTklLwsg3EUIG8W5nZsbmoTkuP4RNdTBQc642nV
        tRqCTm8qons3ue0yuMsPBcvYLg==
X-Google-Smtp-Source: ABdhPJxxNGG1UkzGbKGGCaHnsiTH3T0JzEHtu2+2GE7i0eEz7ONUOHuoIWjLjOOtSxat5/GTwMPb8A==
X-Received: by 2002:a1c:bc0a:: with SMTP id m10mr7673668wmf.173.1591876722467;
        Thu, 11 Jun 2020 04:58:42 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id b14sm3768382wmj.47.2020.06.11.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 04:58:41 -0700 (PDT)
Date:   Thu, 11 Jun 2020 11:58:40 +0000
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
Subject: Re: [PATCH RESEND v9 04/18] media: platform: Change the fixed device
 node number to unfixed value
Message-ID: <20200611115840.GA135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-6-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-6-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:39PM +0800, Xia Jiang wrote:
> The driver can be instantiated multiple times, e.g. for a decoder and
> an encoder. Moreover, other drivers could coexist on the same system.
> This makes the static video node number assignment pointless, so switch
> to automatic assignment instead.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: change the commit message
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
