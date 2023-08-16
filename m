Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5B777D9B8
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 07:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241837AbjHPFNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 01:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjHPFNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 01:13:09 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5746210C1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 22:13:08 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6418cc115cdso32387876d6.0
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 22:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692162787; x=1692767587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMNY2euz/s9x3Z0qfdUEn2uzb5Z/O+nXtYCNO7caL0s=;
        b=iLSjcpfK3BczxZQegGLu+ln3rwqTBrCHAxbEtyfwsPZzKW4Y7enE9yrA91WZHLeJdS
         dfPtTLlejnBbQRECJQ0UT4HARo27ISoXut5v8tSO+jQ8JIy8fOXQvkAVMh4nER8/CggO
         syomOJUilsPA+Hpfbqd0sZ4tiNJFnEuBvYVmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692162787; x=1692767587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMNY2euz/s9x3Z0qfdUEn2uzb5Z/O+nXtYCNO7caL0s=;
        b=ateHDWV2v+eJRjH120qCpLESvJlSQGoRLMYcBPkHERZOTO+wHoJToE0yeMgOju0DmM
         zYvrjuCVeKZt44qmdg43SKEhPR7JRY4QGl+ZyBAAYuZLWNxYnheX6dEhXEtdh67iizJ8
         5awkr6RBhzkO1qx3sL0mhJalJBXLu9A7bqFoepjClvFDK9EnS3BkZ3pCLxE9T8/9Uqv/
         xeV960XCjgmAQxTQErNK8Y+P3HmY79A62Pmo0AxjUpYlHuw3MruMRT3n8yHGn6Y5j+gO
         /8HYXjZNHqsz+4SCREU5p/bMY2sjrLRUiB527BOT/yBMOt/vaBteM3PgUAX60ss08nB/
         Prkg==
X-Gm-Message-State: AOJu0YwJsb3HmBoohEGRxPv3MS3BVv42nnwLYQY86yDhrzLh3vIQnwoP
        3dnuqt7Vm9QOSIbEwmoji9Un/KhEVfnCSQJydFBu0g==
X-Google-Smtp-Source: AGHT+IEXja9y+Hrhm3AppRVQhvJMrTptneL0uIjA/uKjXdyWv8ASxbXzcQHpWYQBZttZErnazZVyOg==
X-Received: by 2002:a0c:df0b:0:b0:632:207d:b834 with SMTP id g11-20020a0cdf0b000000b00632207db834mr855393qvl.58.1692162787034;
        Tue, 15 Aug 2023 22:13:07 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id v15-20020ae9e30f000000b0076ce061f44dsm4223224qkf.25.2023.08.15.22.13.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 22:13:06 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40f0b412b78so45620881cf.3
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 22:13:06 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:40f:e526:2ba6 with SMTP id
 f7-20020ac87f07000000b0040fe5262ba6mr1108993qtk.27.1692162786130; Tue, 15 Aug
 2023 22:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230816014921.2990087-1-liaoyu15@huawei.com>
In-Reply-To: <20230816014921.2990087-1-liaoyu15@huawei.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 16 Aug 2023 14:12:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cua7mF5o1ewVz-O7GGoJ5gms1L_qXtdsfnqU0wVgQGPQ@mail.gmail.com>
Message-ID: <CAAFQd5Cua7mF5o1ewVz-O7GGoJ5gms1L_qXtdsfnqU0wVgQGPQ@mail.gmail.com>
Subject: Re: [PATCH -next] media: use struct_size() helper
To:     Yu Liao <liaoyu15@huawei.com>
Cc:     m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yu,


On Wed, Aug 16, 2023 at 10:52=E2=80=AFAM Yu Liao <liaoyu15@huawei.com> wrot=
e:
>
> Prefer struct_size_t() over open-coded versions of idiom:
>
> sizeof(struct-with-flex-array) + sizeof(typeof-flex-array-elements) * cou=
nt
>
> where count is the max number of items the flexible array is supposed to
> contain.

Thanks for the patch. Please see my comment inline.

>
> Signed-off-by: Yu Liao <liaoyu15@huawei.com>
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/medi=
a/common/videobuf2/frame_vector.c
> index 0f430ddc1f67..c6bb88859e2a 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL(frame_vector_to_pfns);
>  struct frame_vector *frame_vector_create(unsigned int nr_frames)
>  {
>         struct frame_vector *vec;
> -       int size =3D sizeof(struct frame_vector) + sizeof(void *) * nr_fr=
ames;
> +       int size =3D struct_size_t(struct frame_vector, ptrs, nr_frames);

Would struct_size() be more appropriate here, since we have vec declared ab=
ove?

Best regards,
Tomasz

>
>         if (WARN_ON_ONCE(nr_frames =3D=3D 0))
>                 return NULL;
> --
> 2.25.1
>
