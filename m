Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7955871A3B4
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 18:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbjFAQFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 12:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbjFAQFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 12:05:36 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B1813D
        for <linux-media@vger.kernel.org>; Thu,  1 Jun 2023 09:05:30 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-626157a186bso13186856d6.1
        for <linux-media@vger.kernel.org>; Thu, 01 Jun 2023 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685635530; x=1688227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LusgW7kRLas1PCqAL/j4Ugd2jlhleJjtTI8FOrNEWo4=;
        b=o7OVNDCyxCG0LZr5motkiiKFmhEN6a5DLpPeZTWvZhpMHv5U1DZGD4R1eENNJ2ZCEi
         sSWtac0w1g402wxRaFWvCYTYAs5zVj35OVFIArAlhpLQXGJpTJxx4DqdT/VwTeDChzj8
         00kEj3qG2qn2zSoCRLKDJaDZyNNIqjPqd9Un2gXd9NucBBdRjASUzXmFIN91EYF43yHE
         TvqlBLma1pAVm3i5XHcd1MFGhb1Jr8EjVLO0cxgoaidEZlK8DLJWqBVeHlDE4Gqp9gJ5
         0EDAxhxPtmRlE1aZ7xz8GYdI5h6eZcV2HU7nVWDCfMcaYFe/Uw5c2Yxs6d4idz/F/NTX
         T7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685635530; x=1688227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LusgW7kRLas1PCqAL/j4Ugd2jlhleJjtTI8FOrNEWo4=;
        b=NusGGs86cEo09C/Jh0uNq1/ToEiaTZ+o5szO94raUPv0C6bZ9g7BNsxqrS9l5aH7N7
         YZ34S8Pc2CQIprHrSazTm8apA5BPb1TKAz7taDfVwet7TqEyZNmuUEKR1tOifenhs9/H
         2ZgtlyoJ7FWig8i5tBm4eBSfTYCVjpE1DzuU+YcriESBlO3ihW7dr2E5yWqkMhwd2IRj
         1gGkV4Nh3Mv+fAY9ZnHrKdi63voVFquYlaElV+ygQKDLM9Zgo/5nOL/PqOWFZzGaUW68
         /moRyaLl4+aDqBCK99ZFW8qMagzDdUd0YOp2yDrBf4a6sQnrTUzum7P1sooPlRLK0Bb4
         dFYA==
X-Gm-Message-State: AC+VfDyc0ZwCQjTp9pS9Fvx4eVLVA4wvRDXq7dKsWCwY4cuWXwSXDSfv
        0yEpAKRhOiVFcZMx9JBfvA2+XseCDCndesWqGrY=
X-Google-Smtp-Source: ACHHUZ7VAX2Wc7kYACLhqmb+hfWGE24VYBEGVucB04TT6s8Hz9Xi6qZonInXoiaIxjLRNf9H9NdVgUzP9tu33S28oK8=
X-Received: by 2002:ad4:5de1:0:b0:619:27af:bc58 with SMTP id
 jn1-20020ad45de1000000b0061927afbc58mr2105608qvb.18.1685635529762; Thu, 01
 Jun 2023 09:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230601145858.59652-1-hdegoede@redhat.com>
In-Reply-To: <20230601145858.59652-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Jun 2023 19:04:53 +0300
Message-ID: <CAHp75VfFB6CJ9aRtYd--kON8RwC9YmUrc3+Lbyzkj8RmA_g1KQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: atomisp: Selection API support bugfixes
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 1, 2023 at 5:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> Here is a set of bugfixes for the recently added Selection API support.

All three LGTM
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Regards,
>
> Hans
>
>
> Hans de Goede (3):
>   media: atomisp: Take minimum padding requirement on BYT/ISP2400 into
>     account
>   media: atomisp: Make atomisp_enum_framesizes_crop() check resolution
>     fits with padding
>   media: atomisp: Fix binning check in atomisp_set_crop()
>
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 42 ++++++++++++++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |  4 ++
>  .../media/atomisp/pci/atomisp_common.h        |  4 ++
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 18 +++++---
>  4 files changed, 58 insertions(+), 10 deletions(-)
>
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
