Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75FB1340C2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 09:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfFDHyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 03:54:03 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:41484 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfFDHyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 03:54:02 -0400
Received: by mail-ot1-f52.google.com with SMTP id 107so12852495otj.8
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdoY+3UrNN3k7BHN8aNWywmO5ugEgyn9Qd2QfjzsAuo=;
        b=bEsPvPk0DVDweIcQ4mfy5vBH6qJf5qU8QfBnJjTHYsRGh9+dEiARILOFl/ydAmbbV7
         MgZzKM9EXIWmaiTm3Bhfvk8PrJER6JFWGcS8ncDEY3Vbl/WCN1KsxqNnLq/yGVX+f5sD
         6MngoQU1emapXEOiIllMyTsgK1dJed0uWr9mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdoY+3UrNN3k7BHN8aNWywmO5ugEgyn9Qd2QfjzsAuo=;
        b=SJEpCtp5qwGYW1wMOrPPHYOUsf3P7nuXw4jbhcNS9fsHXfgXqnOndj9tB2fHbZEH9T
         kiU/wB1Kuj1WF7aPvFl06p9CVncIWvxdDRY2o6CHC4ny4ekVIY6suAeDaNvR9fb3BeRK
         WJ6WpKCGNB6mpQTTcOOVDUCb5PN/5ET2yMlnV94MRv7iLuLC3qddIlX1BOWCy3CHXa++
         GF+Ym6F21lM8QnVo2RNmTBMHwuPHWxgNP/RCZuBZqqnSt3Is9S1ojFlW5jYVsQmAbb7l
         xZYUKejBqiizjrYb8BYAjJc5aVcgVaHUmz1kSvxI5BWCyviGn3cBEcCDnfVK6z+S/dhz
         EdDA==
X-Gm-Message-State: APjAAAWzyt5Zmm6mWMPhYQmhqDvGRR6r2JgZbI4YkHazdkKnYZJtlz4F
        z3HmO0UznwjNxzdjiZI/MeJ3C+c8PGM=
X-Google-Smtp-Source: APXvYqxCCpnLa34o0tA3e2R8unX5SYXOaWBqokP1asymJT8ly8E5GSvpe0VOS65SNG0KiP66I/gqUA==
X-Received: by 2002:a9d:4d05:: with SMTP id n5mr3960749otf.361.1559634840975;
        Tue, 04 Jun 2019 00:54:00 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id l13sm2181203otl.44.2019.06.04.00.53.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 00:54:00 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id l17so18695340otq.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 00:53:59 -0700 (PDT)
X-Received: by 2002:a9d:1b4b:: with SMTP id l69mr4047896otl.141.1559634839440;
 Tue, 04 Jun 2019 00:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190528055635.12109-1-acourbot@chromium.org> <20190528055635.12109-8-acourbot@chromium.org>
 <b4320740-a016-4a0e-b9ae-e042fd305b12@xs4all.nl>
In-Reply-To: <b4320740-a016-4a0e-b9ae-e042fd305b12@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 4 Jun 2019 16:53:47 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUTG3Pe6pU=gD0m0N3mOOHGyEp5Je58s3ahH_83a4i1rg@mail.gmail.com>
Message-ID: <CAPBb6MUTG3Pe6pU=gD0m0N3mOOHGyEp5Je58s3ahH_83a4i1rg@mail.gmail.com>
Subject: Re: [RFCv1 07/12] media: mtk-vcodec: abstract firmware interface
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 6:16 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > MT8183's codec firwmare is run by a different remote processor from
> > MT8173. While the firmware interface is basically the same, the way to
> > invoke it differs. Abstract all firmware calls under a layer that will
> > allow us to handle both firmware types transparently.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > [acourbot: refactor, cleanup and split]
>
> High-level question: is the mt8183 firmware different from the MT8173?
> And if so, is or will that firmware be part of linux-firmware?

Yes, the firmware is different, and AFAICT it will be posted to linux-firmware.
