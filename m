Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552E232DA77
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 20:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhCDTfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 14:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhCDTfi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 14:35:38 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB32C061574
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 11:34:58 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id r17so51648449ejy.13
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 11:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P5ZGS9SozG7SPJd7V+gBgZUerMurs1Mdjd6yuPEEvaU=;
        b=tBiasoTv2LxT4a0ybJ6WF7ayIBf4XYQW/xR8PJlVlPmWGbTgohO4r4XuX4iL6WQY6X
         7Do4NLO3+HpsnxlqWjH6FQT9PMbuePV+qUecLFYPZ619M3ON8PIG/fiZGL3UjANma92V
         paCOI19Xpwg/FW9fbq8+YcaHYILugK21z7UrilYzY3to/n9NApr54gBezoFysEA95R1H
         JsdPPCJAqgGfZesd5WszeFHywtJTmUCsPRav/MR9PJyi1KGI+U53F8EZA9t9EHqod1o6
         UgUbDOMg8Wx4bu1i+xouZ2y75Hf3Ci2tOD6nWyPkgeKL9LTSJNu2yxmITXaV+QlQHn5K
         4+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P5ZGS9SozG7SPJd7V+gBgZUerMurs1Mdjd6yuPEEvaU=;
        b=poIiDK7PLh+MHbnKWTbCQqmIgArxLUBWT7GX1rAlrOaRwi7OQ6Aq7nbbapEPCuk9uv
         iFKImSjGVlToQKC+bVpJB1FUm2fGSB4By81TFMC6hreV1371+9BSJHYH3xxyd8/vsYov
         84QePhP0ER7OYRpUxHF8GYgcoROy/d2AqcLnrAiKU9mok6g1DxBWVY/fk0J4pLpz13XF
         0Lfc/sUlK6n3gdFzM4xRwFpBRUmOlb2MP/t6NKc6WaGiUBOA2g/AIFodylr+Dg352D/w
         3qBfn4irkDIfpGVHtveJ1kUfCNaohgwyfbzgrWX3/7HnFV9u/q0beaZ53o3VGJM8v+D4
         Pg+w==
X-Gm-Message-State: AOAM533+BOuhMovdToBHkuH7YdrLbhjE61+opwBjduGU40XBSgk5cWGB
        dpyfPjds4UmRpP6YDxVoHimVvpjIICgCuEwjZ9qE0Q==
X-Google-Smtp-Source: ABdhPJya9onErgd7RmZV2QbMXsvyyX4P5lmwTcopxxOeiGXh+75lyKSQOGP8w3fJPmgTDoN4HPOeRGhtSkKcwauMSqA=
X-Received: by 2002:a17:906:32d1:: with SMTP id k17mr6076815ejk.141.1614886497160;
 Thu, 04 Mar 2021 11:34:57 -0800 (PST)
MIME-Version: 1.0
References: <45cda97c-a0e4-eef2-ba8f-ddc7e33b40d5@penguintechs.org>
 <4cdd691f-dc55-fc6e-1830-ac0c24b8e96b@penguintechs.org> <CAAEAJfAyuGwL==BHwyEwF0dMfrUQacEQyv8+zz82_P+BM-C5bw@mail.gmail.com>
 <20210304201055.78145b04@coco.lan>
In-Reply-To: <20210304201055.78145b04@coco.lan>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 4 Mar 2021 16:34:44 -0300
Message-ID: <CAAEAJfAGq=YvXZcBD_-w8OdZB1ZX_P3VB1y3CQSoazjzNSqGVQ@mail.gmail.com>
Subject: Re: v4l2loopback and v4l2-mem2mem framework
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Wren Turkal <wt@penguintechs.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 4 Mar 2021 at 16:11, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 2 Mar 2021 05:01:16 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> escreveu:
>
> > Hi Wren,
> >
> > How about you submit the loopback driver for integration in mainline?
> > We can review the driver, give feedback and help you get it merged.
>
> Please, don't top post.
>
> The loopback driver is not something that could be merged. It was
> already submitted a few times.
>
> One of the main issues is that userspace may sleep, and this could cause
> some bad effects and even hangups due to V4L2 core and VB2 mutex and
> spin locks.
>

Can you elaborate on this?

I always felt that it's a shame for something so popular as the loopback
to be out-of-tree and unsupported.

Thanks,
Ezequiel
