Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB1428B57C
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 15:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgJLNGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 09:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728167AbgJLNGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 09:06:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6D6C0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 06:06:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a5so16848875ljj.11
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sr+miGtmKiQlMJZViTyN9LGyTgV2vGDMC7o5a33ZVMA=;
        b=gEMlyo2fMdPwytzJk410GLURAoLONWGFPUA5UTJrkdPJDeULUxusY3lA/OxIJsAXqb
         EEuGPspdsLvGgQw54y5LM6UjaIFIrsWTTaOWYO8ESXGKgGTq8UDM1iOUlLvbBYahanRC
         mZt6pvZ/Z0ooeB8W+n2p4KEMXIZ2qIOJHX7yvpt7lDylBb7NRyz3B3OEaupOeXCl5dcW
         ciFer0CB3S4t/duavkcNcLtKYj+8h1lxAiPF3SdT+L8ngg3+ituKV37Z/zcWwSQGTwt8
         J9HQ66lr/N4OepikaLxNWQZr9aGgeJbfeY9EuMqiyOSOQmjr9hFj6I4bEvTzj+/7F1Oh
         rUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sr+miGtmKiQlMJZViTyN9LGyTgV2vGDMC7o5a33ZVMA=;
        b=heL3YfYKD+lXkR1Ze5TiWI/EYpjTr7JThUhSwNRUOW0b02QaPyPiR79BvdDpByHapB
         Fkw8iIP/zSOeq4JfzFscKLx2BgmJzgKUVgcXTPNOzTkbepewGL42RKccC/grTvpBD5Me
         vHZpWzsVXarSsNLUX+iJvZsuCq70VUwQsT+/RJpT2ogegBVuI36wjHBMinV/pd0Vsrdb
         MmZYIuzGCPK2C1AqoXGxjfZ/XhegGwKJ98KNURfnrKRuXeFh2rJg7wtspExiDqALq4Qg
         eESAVXT/HvW2cY9/DWCw+idJ1Y169CQXg3fe8ST3LfBnsS+yPMX3L6Mn1tX9/DLEtU/S
         5Eeg==
X-Gm-Message-State: AOAM532xxQfmMg9L13lQNqD/DCD8Hal52HnhX4FG8RBiiBEu8EMZoKZ4
        xU/3b4+cf3rruyp0/Q7h5QuQtKFcPqhG8PNI/tc=
X-Google-Smtp-Source: ABdhPJz2KW3LDXfBK+6BREEN0InKvIyjh5fiizcIqeaswtV5Tgimvnw4nbrEXLtitWlRRqFlDZLgNUZQ+jvL3ukfFkU=
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr9470247ljp.403.1602507989473;
 Mon, 12 Oct 2020 06:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201007103544.22807-1-ezequiel@collabora.com>
 <CAOMZO5DpGXoyXm0D63BL84qMAnPkNOiUcmYsmp9QdogePrLxZw@mail.gmail.com> <4521d217f456dbab1279cfba2d23b426435c6d9c.camel@collabora.com>
In-Reply-To: <4521d217f456dbab1279cfba2d23b426435c6d9c.camel@collabora.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 12 Oct 2020 10:06:18 -0300
Message-ID: <CAOMZO5B=3Y5C-5mStLFwdzmV+t7nqEgEOHoK6-6217UWdJWd3g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] CODA timeout fix & assorted changes
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>, Benjamin.Bara@skidata.com,
        Lucas Stach <l.stach@pengutronix.de>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 7, 2020 at 8:34 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:

> While that is typically the case, it won't change much.
>
> You'll find that the fix in patch 5 can be applied cleanly
> on top of v5.4 and v5.8 :-)
>
> Now that you mention this, I believe that the patch
> should carry:
>
> Cc: stable@vger.kernel.org # v5.4

And a Fixes tag too :-)
