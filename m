Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE9C3C87F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 12:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405456AbfFKKSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 06:18:04 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:35160 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405339AbfFKKSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 06:18:03 -0400
Received: by mail-ed1-f42.google.com with SMTP id p26so15213020edr.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c8jnMiv81FwEUDuhouV41YRUAtMXDx9VCwEGz+YrJoE=;
        b=NM4NN/J7d9ru8kd3dn7OtVQIZ0cawvdRGuCDqIkNkZMD8Ez/odI0RulfUMhxKDaWQg
         T4oSh/0nKy4M7wpOstzpi3+Gsqe/9d2tghUe8nzifFPlv2s5t4e2dU/mC3rydpUTxSeK
         G43KHW5c1W6w8DW2R0xGyThcHmBk8WMIZIcig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8jnMiv81FwEUDuhouV41YRUAtMXDx9VCwEGz+YrJoE=;
        b=pVLqey0/OEOzT4a6IiKp4zCXna0uDqLygCKUAEaAySOn0uzAMT/1po/G/uWaYzRSX7
         Msb/6bFhj+QVv7ojzXbLst/F+CjDGaFcbZhe9GWsjoxloPpYc9a9DmqP/Z+7ezCZ/Spd
         L/1D+mGw9RiyzxsfROpJifCO6ZbKenZw2p2gIDjX3zbDore2NMs8bDZmXAOmzu4IaPzc
         noAYyJyL/X1Wh7EJyvEvuL/qal5/kV5WKZAXOnfoEZmPUNV1MoI/lMZvvJhC59U6G4RO
         Kvd9ai4/38cH/gGmn3Rra8K3u5ZNVHT/SrKOD4cirzRFOZACyLaB0KIfYSbSas+zLefY
         MpHA==
X-Gm-Message-State: APjAAAVBOYweV7RZoX1AhA4TZZHci6W14k+OTIJ98XOpO/UcOtZwjiO4
        fETI+CQtWNjjzhjb92LeONHTA5wQL6HK7w==
X-Google-Smtp-Source: APXvYqzWP/7Be+Tu88S4hv9kbRCxYopYuRFbFmoah79dcTiljwwTGMGbWMWOvQwDPC3CMCo8qk99NA==
X-Received: by 2002:a17:906:1f48:: with SMTP id d8mr36317187ejk.288.1560248281644;
        Tue, 11 Jun 2019 03:18:01 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 93sm3622566edk.84.2019.06.11.03.18.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 03:18:01 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id f9so12331704wre.12
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2019 03:18:01 -0700 (PDT)
X-Received: by 2002:adf:f246:: with SMTP id b6mr554368wrp.92.1560247928904;
 Tue, 11 Jun 2019 03:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
 <20190516032332.56844-5-daoyuan.huang@mediatek.com> <20190604112039.GA12168@chromium.org>
 <1560244803.15624.6.camel@mtksdccf07>
In-Reply-To: <1560244803.15624.6.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 11 Jun 2019 19:11:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BmSrkRmQFuiGz5RcBP01Ae32w6EhtP0n3cO7Pki=9Rng@mail.gmail.com>
Message-ID: <CAAFQd5BmSrkRmQFuiGz5RcBP01Ae32w6EhtP0n3cO7Pki=9Rng@mail.gmail.com>
Subject: Re: [RFC v2 4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver
To:     Daoyuan Huang <daoyuan.huang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <frederic.chen@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daoyuan,

On Tue, Jun 11, 2019 at 6:20 PM Daoyuan Huang
<daoyuan.huang@mediatek.com> wrote:
>
> hi Tomasz:
>
> Thanks for your review comments, the corresponding modification
> & explanation is under preparation, will update soon.
>
> Thanks.

Thanks.

Note that Alexandre may already be reviewing the rest of this patch,
so I'd consult with him if sending a next revision or waiting for his
review is preferred.

Best regards,
Tomasz
