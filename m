Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF837144697
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 22:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgAUVpR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 16:45:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:46968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728831AbgAUVpQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 16:45:16 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2838024672;
        Tue, 21 Jan 2020 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579643116;
        bh=sW3Z/vDCOlrs/wYR714h8Inna747mCM9wqEoq6y+Ywk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BH49rnPO3D5lfEKZk9x1zhVQ0sEUW4S9mHVXxPmuKZ7EfczXrLkpCOHPSJFk9Ra3p
         RS09z4rhFdD+JrZJHIJuci0dcKlI1ibdF8IpVaUomUkilpoXV+IzB4pcOP0xwB6qCj
         YhBeojp5DcZaaESZ9hka7LGE5C9YGRGEnQqu6tJ8=
Received: by mail-qt1-f169.google.com with SMTP id i13so4003312qtr.3;
        Tue, 21 Jan 2020 13:45:16 -0800 (PST)
X-Gm-Message-State: APjAAAXPdJQ7l3rdNdSa26IJ4RXT4LuvtkJksLxcjzO1QOcOvsBlMl5x
        GGkupHI8wIabdBOX3PtHoh23g6q8HCDZcmyOJA==
X-Google-Smtp-Source: APXvYqx4PwccTkV+t/aD29wO5YL0fi71bBCe5y6Otd0s7hRSgBALPre4Tw0eOtz6QNmolgArMK3ckPCvqapfFEfHT1k=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr6804541qtp.224.1579643115282;
 Tue, 21 Jan 2020 13:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20200120081558.25258-1-andrey.konovalov@linaro.org>
 <20200120081558.25258-2-andrey.konovalov@linaro.org> <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
In-Reply-To: <c3c8c2a7-d21a-6e2d-f4ec-e62cfac1d5d6@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jan 2020 15:45:04 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJJKM5eBTO9ub4bbjWR6c7VbOz-RTvzsztWWP5W-Stc9A@mail.gmail.com>
Message-ID: <CAL_JsqJJKM5eBTO9ub4bbjWR6c7VbOz-RTvzsztWWP5W-Stc9A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Peter Griffin <peter.griffin@linaro.org>,
        dave.stevenson@raspberrypi.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 20, 2020 at 5:32 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> v3 of this patch got "Reviewed-by" from Rob Herring.
> But unfortunately, as one more property had to be added afterwards, my understanding
> is that that "Reviewed-by" doesn't apply to v4.

It's fine to keep it.

Rob
