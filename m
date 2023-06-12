Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5142E72BF20
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 12:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbjFLKdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 06:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjFLKcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 06:32:42 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50F046B0
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 03:13:58 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75d4a4cf24aso351112485a.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686564776; x=1689156776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4m0YIAou5lBAuWMzfnrVVOjY6o8BdsPHfPrRkVtvGc8=;
        b=Pzlpr3g1uqL6e4wdeUHA7Ve7dm6/qzeQPUvYYPn6FFkizyNJDxOgs38Ojx18F/XQM1
         /9ouS2WMQA/zQQTOOZaQTYOHOJ/es6/F4A7E4qAYSHMtyRJ2teSWspx5ts7hP3BIxI0I
         v87NvxeZ54TBuzpwDvn3aR9FfXgrGhe3GUgue3QYXe/fYngZwhqdhD62fuRbLSG73Z/Y
         Ndjb+75PtMDIW+RlJnHrvFVjxp6e6tszBcMezsyAQov0vutZnBzhZpkIe93llWDS+rWY
         2G/iQqapTxOEhxxz104B9C2UUaUMiV+YA9ybwjl9WOvVddP/KVao0zw0wecfeET562Xb
         PIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564776; x=1689156776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4m0YIAou5lBAuWMzfnrVVOjY6o8BdsPHfPrRkVtvGc8=;
        b=Sn1mCQdgaKos+4vqS+NetCpUR46/aevpH7ldMjFJja2lnx4hHMyjXrlg7gISIUY/Se
         CdrkwUhxtYAodyvHeVNPkgNo5/Ne4mDJIXX5+u1R295JAy2gU+53WHBAT011MtmLLmkO
         CtjrNd7kBC3itlRwsPb0Jd2xr6NDH/PpbAaIQ3rGI4TMACrLZhwV0C3xGXFEGhNLDTkm
         TPj+xvNdMrt5BUslAhVp0jUhRdT/y1x88D0w6IaD9eEgSuKnxPbYpPv6DCSMtetXosXI
         oUOOJ/KZHkkNIDkR7HDMdK8cJmZUtVVnBy6L7bZL82kMk2yQrBfbsWxofoAkZTJ02Hwu
         G+vw==
X-Gm-Message-State: AC+VfDwBSM0Qsdwhq0BLdctMj8/ndq5n1AuFYMaSaDkGuZ9boRBuY6cM
        zbpJz+Q/mLEkZO6hlKIX1i9JZa9f2LPNOH5VHv/QvGplzAk=
X-Google-Smtp-Source: ACHHUZ6zmHVtWgwlfVo7mZuNinBqWCgZ7ogEXJCLw69cSm9zZXy6LqDYW2Ili2xZwlCHvRgtYIsdfdsEM+ColVXBpPk=
X-Received: by 2002:a05:6214:5298:b0:61b:5e9b:a15d with SMTP id
 kj24-20020a056214529800b0061b5e9ba15dmr10245671qvb.36.1686563904692; Mon, 12
 Jun 2023 02:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230607164712.63579-1-hdegoede@redhat.com> <20230607164712.63579-2-hdegoede@redhat.com>
 <8575dadf-7db6-5c97-7fbb-1822c1fab0ee@ideasonboard.com> <c7d90ea3-6a87-4dba-5c53-d62d95a3bef9@redhat.com>
 <0e24ca78-31bf-a394-2134-3fcca1f5d379@ideasonboard.com>
In-Reply-To: <0e24ca78-31bf-a394-2134-3fcca1f5d379@ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Jun 2023 12:57:48 +0300
Message-ID: <CAHp75Vdaj4ynLvJLBONPLjGeBHMV4fxBD_-XExT6vxknp-_5Rg@mail.gmail.com>
Subject: Re: [PATCH 01/28] media: ov2680: Remove auto-gain and auto-exposure controls
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
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

On Mon, Jun 12, 2023 at 10:59=E2=80=AFAM Dan Scally <dan.scally@ideasonboar=
d.com> wrote:
> On 12/06/2023 08:44, Hans de Goede wrote:

...

> Ah yeah I see it now. Looks good to me then: Reviewed-by: Daniel Scally <=
dan.scally@ideasonboard.com>

Do not forget to put tags on a separate line, so tools, such as b4,
may pick them up.




--=20
With Best Regards,
Andy Shevchenko
