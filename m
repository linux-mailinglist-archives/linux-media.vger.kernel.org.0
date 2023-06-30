Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C06C743D64
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 16:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbjF3OYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 10:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbjF3OYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 10:24:19 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9269430DF
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:24:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51d88f1c476so2056480a12.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688135057; x=1690727057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLVKXeMIrYjh+8j4Qqf0eaByyZwhkMaMysnNWzYiTNA=;
        b=cJBGmcvNQ8NK2wAc5wjJeQ1brckcgwBeJ511lHsShyaqzX40fpqrXMMeT5Xe3tKE1e
         fUI5FLt8Fu/nq2flxsCvzPzrmi6YsTFpo5MggH4BVuDcWc3NO7B1JFtrKshL2ARE8VBz
         /8m0CwUYxnj37WetDs2XywYDSfP8tzTpaiAw1k+FEEyOh5Egepzj/b60sBxk6X9A4pSN
         ZhK2MiBMlfOo5Q7dJo/k02/9RzP57GYPOUc9Gm8bToe48havvZxW/KciA1c85kZh3Aq4
         4LYnLM+ciy+QqelQGi+uVI1YLkPR3RoewRBPTHRQnee6APVpEwbrwcU7ee3MRYiOOU71
         LHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688135057; x=1690727057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLVKXeMIrYjh+8j4Qqf0eaByyZwhkMaMysnNWzYiTNA=;
        b=W9ftaoIQbVzMU88RGm04gmvzSdNL69zW/ava6Adbn/7qY8ipTmwas4h64V7bLs6rnk
         6eODbJ4oqAkHfE1ycscGgteZJf+1jUkZ/tYDVvshhAXeIgoB49nj/Ktpai1acnKKgNSF
         VJaIZs8P+xAwhDku2EoiCcDXuBJ69+hMWf3zT70HYChpotwcQCqCPiKitm1JBjSo6pB1
         PoaEfqYJkqJ8HFmkhZ+xeLYBJlgFsNN/jVpHPJ9kPB9LyWqoEZRhD7Il4BVyWidFGKPF
         yooMwgGACemD84uE62swmD3zI/Tg9gEWByDUPyXH4IJLkFoMGmL1nvqspEOAT7gMh/3p
         RyfQ==
X-Gm-Message-State: ABy/qLYc1iW+nxu5v3mqgt+MZkgXqa1MnO1zjjkEcQ0r9bc6kirrPe4h
        d7pntwL9otocnmik/kJ9qAUcAP3lipgqtbTEcFY=
X-Google-Smtp-Source: APBJJlFPhLPwQF09k5L59MyWHVih+GzlOREwiVCDBEvio7aPhzfzJDWJ4Z0gWjVS/B06rNerHxK/POu+eHaId4Mlqxs=
X-Received: by 2002:aa7:d8c3:0:b0:51d:d2e6:c6e1 with SMTP id
 k3-20020aa7d8c3000000b0051dd2e6c6e1mr1745139eds.37.1688135056836; Fri, 30 Jun
 2023 07:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110643.209761-1-hdegoede@redhat.com> <20230630110643.209761-2-hdegoede@redhat.com>
In-Reply-To: <20230630110643.209761-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jun 2023 17:23:40 +0300
Message-ID: <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] media: ipu-bridge: Fix null pointer deref on
 SSDB/PLD parsing warnings
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Fabian_W=C3=BCthrich?= <me@fabwu.ch>
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

On Fri, Jun 30, 2023 at 2:06=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() run
> sensor->adev is not set yet.
>
> So if either of the dev_warn() calls about unknown values are hit this
> will lead to a NULL pointer deref.
>
> Set sensor->adev earlier, with a borrowed ref to avoid making unrolling
> on errors harder, to fix this.

TBH, I don't like this approach, it seems a bit dirty to me.

First of all, why do we need pci_dev to be a parameter in this function?
Second, why don't we consistently use the ACPI handle (with respective
acpi_handle_*() macros to print messages)?

So, my proposal here is to actually save the ACPI device handle in the
sensor object and use it for the messaging. It makes it consistent and
doesn't require to rewrite adev field which seems the dirty part to
me.

--
With Best Regards,
Andy Shevchenko
