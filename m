Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46AF5501B
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 15:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfFYNTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 09:19:49 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:45236 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfFYNTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 09:19:49 -0400
Received: by mail-io1-f44.google.com with SMTP id e3so3037423ioc.12
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 06:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjQxlcCcMybS1PlA3cbedI86fLsLoU2UaRYnx0yjR64=;
        b=KeT30z/A3i+X9U6BGJsY7TlwhrAfYCRSTkIx6yUYHoYcXKsERLYGzvZiDQjOSWqBVU
         8/o311LX4TqrP4Rp3nLMJRNHrZhqc39M/62AUtHJHOx/6oKxW6gBFHr41MrAh0cj6tQk
         1ipgm4HlNazyDETEXifCzS16ss6fdgFY02yeW5ykUG171fFJuoGW24HawgYMnkjNden+
         FYoInYEwrX/GQpuUJjTH3tOpQ+D5EvCqywQ3p3zlcsseVjbSt8Iuu2x9JsHS9fo12UuB
         Rm6ePAEkk7Qsw11WNRZyvNqbWc8MSMC7i7/k5V7l3oK2GrxGTVm168Bqfqr7AvnsFEid
         zj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjQxlcCcMybS1PlA3cbedI86fLsLoU2UaRYnx0yjR64=;
        b=KZqn9CRIz42tzkHaxFaGnPfsb6WRCJoqEgCj5PcnxermpYkmZNCsGCGZ4J9s1i7DQt
         M7c9XrwAqpdSMI5Vg/hsktpa8Gln5/8inMg7BuDHwjxfPo88RdNCd/X/sXddx1aIxu9N
         pWsLYVekdLGyyXDHekjnCsxtAM1nLrbTq6iQM/fqls8otbpguaG3mLHU6Yj/BJU6WujL
         X9Cn5JafgG38k6Qw2MH1YTgfGN9LzxwmjY/e4ail4iflDR17dhMsnqily9FkN7YJ281r
         jIkT516izDDmBnU/yjsORsngyZ5y17nNLxydTjfyWYRqos9f0vxAp5Y9caIg5rqs1Otp
         2G2A==
X-Gm-Message-State: APjAAAWGTpcIfxI1lJAZxtSJvsOSsBwWamh/x1Oiy7LolTb8tkxslh39
        OBOxMfMNmqqF0IwTB2K2N884rNC9NK5GCGmTLauh3Q==
X-Google-Smtp-Source: APXvYqz8IMITSh/Xie95zh7BbBKKdq7Ur761LqrsqGuNmBgDWZZxs0U+4ZdvPrS8GrP20xK3X9tsxWaSp/jOQBj+4hM=
X-Received: by 2002:a6b:b256:: with SMTP id b83mr19284468iof.48.1561468788034;
 Tue, 25 Jun 2019 06:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl> <20190624160330.38048-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-3-hverkuil-cisco@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 25 Jun 2019 15:19:37 +0200
Message-ID: <CALFZZQGuAB9rt4Px0VXPwRE1HOipxmT7q1tF890bMBiNw2JLgA@mail.gmail.com>
Subject: Re: [PATCHv8 02/13] cec: add struct cec_connector_info support
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

Patches 1 and 2 look good to me. There is one comment here that I
forgot to update as the code evolved.

On Mon, Jun 24, 2019 at 6:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
...
> +/**
> + * struct cec_event_connector - tells if and which connector is associated
> + * with the CEC adapter.
> + * @card_no: drm card number
> + * @connector_id: drm connector ID
> + */
> +struct cec_drm_connector_info {
> +       __u32 card_no;
> +       __u32 connector_id;
> +};
> +
The comment for the above struct is now appropriate for the struct below.

> +#define CEC_CONNECTOR_TYPE_NO_CONNECTOR        0
> +#define CEC_CONNECTOR_TYPE_DRM         1
> +struct cec_connector_info {
> +       __u32 type;
> +       union {
> +               struct cec_drm_connector_info drm;
> +               __u32 raw[16];
> +       };
> +};
> +

Best regards.
