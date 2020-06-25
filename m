Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C3F209D9F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 13:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404261AbgFYLi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 07:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404253AbgFYLi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 07:38:27 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE9C061573
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 04:38:27 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s9so6086677ljm.11
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cI6306ozHYw2zEH2MozHUcRsDUwQktAWoTE4C96WWMo=;
        b=eGqZhPKM1oZWV2B42UGUuAa2LkYs6KNRKVkP5tk62gKAgj8OOZ8Cglp+qoxGz7vw7Q
         cY+eEe1azQ7YWn5Py1uViSsQdVQznRcte4dUPfitrrgqayP1gSk40W6kek4qFqR8gvJB
         N1mSQrZQ1RKT91byCIHpK1Kp997gwAzv5PkMQcEf85jF67VoSZtvVpAQFGjM6+88Sc4a
         ozG1WL+22YOC0SoThAaU2/nFBcJl47jZsbGvqG8gxYkXVmlYvHBCiDLv9n3CPwOm04AK
         91BOq1Jcc/rvlKplqD29d/tMlKmHgD2hpqY89VIsM7HalD9uIjFmBqAkhlgePC730IZb
         hKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cI6306ozHYw2zEH2MozHUcRsDUwQktAWoTE4C96WWMo=;
        b=gAv5LRY2RKVrtvNfXXMvkDt+ZH5BBGB2PoVSRiLxFX4gB8xlDct+UPkFdENKjVyWHz
         NMnIBKwXk2SKHqX1XbLr4SiNUnBhpw3/r9LJZ3T8sQaEW2Z2ZwFcnF0zgJX99rebofkw
         l0iF/+F6aftsZ56lqt87+sA7YlLelgGMpOxf4xzaxP1lJUe2eDW8RaMVCD4taDC1s+/q
         F4YZmy0H99Lxs0KAbBUV5RcGgwrTKmmzOxe5bQK1dpPySSUk9bdkVet0XGN1DFpnAH3t
         I41uzAeByGmRs7z6Vo1+QM3QOEFZ0OKOHNWNU4j+NiqEObWWtE70pAALXhloAlwiOXxO
         gYHg==
X-Gm-Message-State: AOAM530/rMe0Whahd/UhZE4RNewfpVtMjQCiBvAD5hK2GzHdJV0ElM5q
        Na/2LY5QUOGKVUSQHPWyv6KvyON+hdgIx1Y0+B063HLW
X-Google-Smtp-Source: ABdhPJxhxrIsSxUeCCgMA8ZanLwiu23IEHkuP+ANile58y0JOfGtanwXx/UUSpNZvAQwjIyfx/7Vxdj8RR79bviqF2o=
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr17348593ljk.44.1593085105749;
 Thu, 25 Jun 2020 04:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
 <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com> <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
 <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com> <CAOMZO5BAsNzngLF2=1h38j0KYdvGLankQwzZ8tpG68sKSvaboQ@mail.gmail.com>
 <8b2f0c05-8e4f-72d9-d37f-c41936fcfd07@gmail.com> <CAOMZO5D4R+ta6By2Th5WF9THKXuzjFV8cLxPw+zyj-Kv4k=7kA@mail.gmail.com>
 <7431d1dc-10fc-0880-01ed-cf75b5ace704@gmail.com> <CAOMZO5CqZyUA0qRBV2LBBq4JEtcQCfuj2qBaBUVpkxTvoC+-Pg@mail.gmail.com>
 <a61a63b1-b7a6-32d8-df6e-0253cb87c227@xs4all.nl>
In-Reply-To: <a61a63b1-b7a6-32d8-df6e-0253cb87c227@xs4all.nl>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 25 Jun 2020 08:38:14 -0300
Message-ID: <CAOMZO5CTyLQVV+3UzF5MNxbYUTjxg3KH825JJ3kyyT3GY_Odwg@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 25, 2020 at 7:53 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> This discussion fizzled out, and in any case this patch no longer applies.

The current document has the correct instructions for both the imx6qdl
and imx6q sabreauto boards, so this patch is no longer needed.

Thanks
