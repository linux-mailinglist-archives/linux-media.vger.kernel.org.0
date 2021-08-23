Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613B13F48A6
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 12:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbhHWK3h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 06:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbhHWK3g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 06:29:36 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644C0C061757
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:28:54 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so5491586pjw.2
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ilKjy382tEqa7gStpBRz59Gr6MRunEshTjEeiH1h2JA=;
        b=Nf9y0HaDZZTMBiU3gKfNU1c8lX/eVkGiVZtSy/+Z7QdeLAz8ZEw6+m3aSB2Q70T+8d
         NWhQv9c94DaK58O13+01OKgVouHiRX8y1aMCYomnvkVYOGtCfRl3cbeWKHxBRE1qp7zB
         jE23PmQzrvCySaZ62ujHBand3wNsZQzdAJi+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ilKjy382tEqa7gStpBRz59Gr6MRunEshTjEeiH1h2JA=;
        b=YX9atMq1hGpJT4oLlqEHfPmUW8bK4zpJyQ2NczrImr0h1e4xTlqmG1C3eFAzfNp3Qy
         yqwbxeHrshYr/mvsGz6hpQ85k+Xe01ZZbj9RUE00FRgoGMgWTeTRY2l7ujkJAPGnE8B8
         2vPhN42iUdkj20PjNS+Y8hU0e2TEj7asImB10fy4UiZlySlrTHOugN0kjn5IYmINKPPi
         nU/qRELywr7wWFrEE6Y7Zi0hY0OVrxivAY25tkjWCcXz2c+GOoBG0Wr6v1qwpSgDGBfW
         zSZm1P+9el5zYOiEVeOX+KAZaYapnYH/S6lXFPZPMElXWAo/IIBghEjoSUMzUoIqVCpF
         8MsA==
X-Gm-Message-State: AOAM5331+8yknvz6m5JJrGbMm9Hrv3IlBoaM5mP5mWeQx5cU84EUeMVN
        v/4KhlQNN9KAeuyBoBUibo6Efg==
X-Google-Smtp-Source: ABdhPJzReVtwd7Yt+cXXy5xtZ6aXZ+ZHjspUFa/ZcLYCB9GL/ljwsw0yWGII3+QOh3jIWf0ZciDm4w==
X-Received: by 2002:a17:90b:2348:: with SMTP id ms8mr19205896pjb.121.1629714533737;
        Mon, 23 Aug 2021 03:28:53 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id m9sm6793814pfk.61.2021.08.23.03.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 03:28:53 -0700 (PDT)
Date:   Mon, 23 Aug 2021 19:28:48 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YSN4YJZwsSo4JwCu@google.com>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org>
 <7e172194-9519-fd1f-6261-c40108a5d722@xs4all.nl>
 <9e5b1d16-bfb8-dc89-beda-94a641be793d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e5b1d16-bfb8-dc89-beda-94a641be793d@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/08/03 10:39), Hans Verkuil wrote:
> >> +
> >> +	/*
> >> +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
> >> +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vadd().
> 
> Typo: vb2_dc_vadd -> vb2_dc_vaddr

Done.
