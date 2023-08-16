Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEC677DB2C
	for <lists+linux-media@lfdr.de>; Wed, 16 Aug 2023 09:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbjHPHeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Aug 2023 03:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242425AbjHPHeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Aug 2023 03:34:01 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D04310C8
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 00:34:00 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6490c2c4702so503496d6.2
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692171239; x=1692776039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRlXL5X71weBkAngucEu83v3Y8ahhHRWrZOT7E6Zw8U=;
        b=c/ur+AOtyxdZy9C5UqD3yIr7x689EMS+p4izHzZQIoPC0OzWozROzVxGE4Dx0GBeac
         D5EIJqQWpt+/GkR8EaYpYZuRBod/PbcfL/NYbWGbEjUWo22ZdzCSBhUt4XybYyTxeDKV
         jI4Z7+QBbVWIrVpGgW0O0k/4R3GKGGy8K1ETQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692171239; x=1692776039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRlXL5X71weBkAngucEu83v3Y8ahhHRWrZOT7E6Zw8U=;
        b=QFVKc6SKz6kKGy46hDZg+vzaiD6sv0DLPrra4hoIOt1C+rC2Sk6rt5PIO0zTWW89C7
         uy3kBpFg9G4ewt670fRtYrPDUmmBBO+ZvSSY+8LBreIGlM8gAaeD+KicRKplpnyYamcU
         LqNeuDRTj8tjMb7f344106hk/koS8V942HTO2hTmy61ETqw9ridQc4xk8BHBxnFuuMtI
         uCu7qt1cabAC9Ch938IHQnUJBBuQuWuQaXHLt/3r4m2B9NTaD428BYiMmoymNkx6PlgU
         E42oB453RsjsHmW2E9Bf2QeTRCz0OKo+a4oagmf+XQ1/Njs4bm4dcWY5M//PV4CrdQER
         H4DQ==
X-Gm-Message-State: AOJu0Yyd725CD8zi8Godp6+7r1SaRj5AC+7Atm7w+aabMJE7kg0gc6AN
        w/uSRehjBak8lAxtfAAk41ZkoF9bqc3NA4PWwvdaMw==
X-Google-Smtp-Source: AGHT+IHHdzuI6HbpKT8OnlpQ1r6kTOkNSAfqNp7/XlSGWZAfxbE4/tbIMVCpX2R8kxubvsrmVo5oMA==
X-Received: by 2002:a0c:e44f:0:b0:63c:ec39:13d0 with SMTP id d15-20020a0ce44f000000b0063cec3913d0mr887090qvm.64.1692171239233;
        Wed, 16 Aug 2023 00:33:59 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id g30-20020a0caade000000b0064805ab33e0sm407782qvb.67.2023.08.16.00.33.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 00:33:58 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6490c2c4702so503386d6.2
        for <linux-media@vger.kernel.org>; Wed, 16 Aug 2023 00:33:58 -0700 (PDT)
X-Received: by 2002:a0c:f2cc:0:b0:647:2039:3525 with SMTP id
 c12-20020a0cf2cc000000b0064720393525mr953947qvm.35.1692171238286; Wed, 16 Aug
 2023 00:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230816063143.1003676-1-liaoyu15@huawei.com>
In-Reply-To: <20230816063143.1003676-1-liaoyu15@huawei.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 16 Aug 2023 16:33:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C80YyhEzeHZN77QjiPFc+7GH1vJjkwdsELtQGf_F8KOg@mail.gmail.com>
Message-ID: <CAAFQd5C80YyhEzeHZN77QjiPFc+7GH1vJjkwdsELtQGf_F8KOg@mail.gmail.com>
Subject: Re: [PATCH v2 -next] media: use struct_size() helper
To:     Yu Liao <liaoyu15@huawei.com>
Cc:     liwei391@huawei.com, m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 16, 2023 at 3:35=E2=80=AFPM Yu Liao <liaoyu15@huawei.com> wrote=
:
>
> Prefer struct_size() over open-coded versions of idiom:
>
> sizeof(struct-with-flex-array) + sizeof(typeof-flex-array-elements) * cou=
nt
>
> where count is the max number of items the flexible array is supposed to
> contain.
>
> Signed-off-by: Yu Liao <liaoyu15@huawei.com>
> ---
>
> v1 -> v2:
> - use struct_size() since vec is declared
>
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/medi=
a/common/videobuf2/frame_vector.c
> index 0f430ddc1f67..ff1c3ebee4b0 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -157,7 +157,7 @@ EXPORT_SYMBOL(frame_vector_to_pfns);
>  struct frame_vector *frame_vector_create(unsigned int nr_frames)
>  {
>         struct frame_vector *vec;
> -       int size =3D sizeof(struct frame_vector) + sizeof(void *) * nr_fr=
ames;
> +       int size =3D struct_size(vec, ptrs, nr_frames);
>
>         if (WARN_ON_ONCE(nr_frames =3D=3D 0))
>                 return NULL;
> --
> 2.25.1
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
