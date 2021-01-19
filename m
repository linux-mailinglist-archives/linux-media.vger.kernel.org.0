Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EAA2FBF37
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 19:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388721AbhASSbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 13:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbhASSaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 13:30:22 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1728C061574
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:29:41 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id p13so23099874ljg.2
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWWYuzWaghP5Q544uqJbXr3wVFNCkeCk1gyHHkDdQ/A=;
        b=xnRYIRj8nrXC1Xt9zSBJsXJhgrBfjtCh3CpB6YoNFq2VStdTH5p5X55ThbO9d1T1QX
         W4s3X+eaII0u/7aakfdFOHqfMiUcebQtCqGbU6qrTrTIw/bmaobbAmF5g8xQdlH+JcMm
         MwOW3qhK6j4IEuDDA9aUNzDZHWOBV902OvyIedTiWvaRgws3zCpOuRkUoF7aUpFxFq3D
         40LMffLZW2m8ILnF63bEftJER/hfJVcH/wFwzdFaBuEzghmJBC93E7qNrD9P7KluZaeX
         XSeU0f3WfA72mJTI8MrG5TUXjTsupJjNWOUFcePRC+6ucYsae6rZqQivHGipbnhG0lhg
         MmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWWYuzWaghP5Q544uqJbXr3wVFNCkeCk1gyHHkDdQ/A=;
        b=G6hZekF9Yaj2dBLIigudSWehHOGj5C2NnWheVnEXDg+UabUTIHRGtdwzYG9NE+ucBq
         9FMmPLG9W0A2/RmFPp5Ju0zXxIKutyPvSVYp/wtyT6SC5V7PtoAMqzDXpWeIRVChiaqA
         3kJ/uQcznPWyd7Q11aGcF7EGUNQ5HPsReTewpl3DUiqSQtaus1a44H84BlJ3buyekhfA
         NG1KioZIEU1d34O70pwj0zpaHr/het80/UwC3Gki+rUiz/5Zvxi+qC51BNiGDObgMyNA
         zO0cyszECXvB9ZuCQZA92y3BDVVX/yZ8UwtHwgU0FEKEqAbErpiLchD66qWGr2iLMmNO
         Akhw==
X-Gm-Message-State: AOAM531Uat5N6c54ysg0dYOr1ss2VzW8gZ8sy2T3vO/RnjkGdzW6fbKS
        VCvlmrjHSJ2VCiSKDo8iZYiCeqc/jfs5KpceN/XTPQ==
X-Google-Smtp-Source: ABdhPJyoOd3Tzkorx9mIjYO8VVetUnWwDqJgYwdoxP5M9bwFey7dBLq3et+JsaDPEcCzrb4F1+lPqF4gjUDlxQ1XCog=
X-Received: by 2002:a05:651c:10e:: with SMTP id a14mr2543204ljb.128.1611080980220;
 Tue, 19 Jan 2021 10:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20210113012143.1201105-1-minchan@kernel.org> <20210113012143.1201105-5-minchan@kernel.org>
In-Reply-To: <20210113012143.1201105-5-minchan@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 19 Jan 2021 10:29:29 -0800
Message-ID: <CALAqxLWPT8PWYue0h1863NjNxKn_FH0DtoRtArpmmxZ1Ve5xCw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hyesoo Yu <hyesoo.yu@samsung.com>, david@redhat.com,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 12, 2021 at 5:22 PM Minchan Kim <minchan@kernel.org> wrote:
>
> From: Hyesoo Yu <hyesoo.yu@samsung.com>
>
> This patch supports chunk heap that allocates the buffers that
> arranged into a list a fixed size chunks taken from CMA.
>
> The chunk heap driver is bound directly to a reserved_memory
> node by following Rob Herring's suggestion in [1].
>
> [1] https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/#m3dc63acd33fea269a584f43bb799a876f0b2b45d
>
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
...
> +static int register_chunk_heap(struct chunk_heap *chunk_heap_info)
> +{
> +       struct dma_heap_export_info exp_info;
> +
> +       exp_info.name = cma_get_name(chunk_heap_info->cma);

One potential issue here, you're setting the name to the same as the
CMA name. Since the CMA heap uses the CMA name, if one chunk was
registered as a chunk heap but also was the default CMA area, it might
be registered twice. But since both would have the same name it would
be an initialization race as to which one "wins".

So maybe could you postfix the CMA name with "-chunk" or something?

thanks
-john
