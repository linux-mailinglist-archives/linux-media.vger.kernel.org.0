Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA333729D0
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 14:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhEDMEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 08:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhEDMEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 08:04:10 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE25C061574;
        Tue,  4 May 2021 05:03:13 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id h1so2971655uar.0;
        Tue, 04 May 2021 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0NQ3MxerAvkWC6zK3NhV+dHLrT6/5kHmGE1fwXLZAqM=;
        b=FkpRK+jEf7isXI0Qdtak7RrFHk3ZHt8kM5lmd2REFZn8qfSYiUgITWQQM3MzCVpWx/
         Tf85N+8FguZJ3g6gkDnb8aw4dIPFRmpLaWf+ar8JgM/8YNwCfmHAtP8m2Pi4lziwpnyZ
         2tq4rf6kfn+ACrhE7Lq2rmzQa++95832bgvGyIPwCxEN/NqjXqjL8rkxNOkVbjJIR7hQ
         9i6vFEs4I7SjuyANvtBDCPWVrLzbk7A+y1jk65bFW8W9xVG+2Xc7SY0cKiT6GVpkwptC
         u66Ep3zlGBhgazxWCjjd4w4V7+ITY6iGRgPF+rLtfbSeisygr9SurCyCynxkYJMi9N2V
         NjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0NQ3MxerAvkWC6zK3NhV+dHLrT6/5kHmGE1fwXLZAqM=;
        b=dIQwDDb5P7x5PC8+vj0s4L59pjqglfxr7aipeDch+IxAzyf69ZyBeYJL47d3jDGR7U
         Iv9Sz7rUHwYSFtjt0E55iDV+irANoUkaweRae4XlIJ/F3Kyd4nrflDVAiWwLHdJW7KZ9
         kulOD91X5bVrnwlvpyJvkNnGpGX9x/wBnQC0jLEl8zhfw3Js72UllK0Pp5MMbQ63+biu
         GgQ34JjV43hGYdV1mMK6LSt97+g6hOttqF/7587IUhwtu4fAIy1zxSLoJ4ukxmeeWJOE
         66suTqrj3GBM/xs5uAAi32mgVaKipFq51oGHtvvxi/629T/D8NkrGsiJA/ZjKFlSP4Fg
         Y6eg==
X-Gm-Message-State: AOAM531lFe++DJSPK9bXhYOk8su3fvl6UTnmmUCmdoDwfKF/S5QYgB8v
        dgfcDUdnLaWJFx41U+718K1wD79GcedI9hujhvcbPOkxLKo=
X-Google-Smtp-Source: ABdhPJwolUHKgw8s5TS7v3bK0fvyUEvgy0j1O2UMeWhWHwzjOALlPvZZe1ZltFvtzTTZ34NcfqHT+RU+6Jx+d2/+28Q=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr19059785uam.106.1620129793193;
 Tue, 04 May 2021 05:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com> <CACvgo50-fKJk_EpY-G_SGes6-FUs=nAouzBmSN-CYgMTpoeN_w@mail.gmail.com>
In-Reply-To: <CACvgo50-fKJk_EpY-G_SGes6-FUs=nAouzBmSN-CYgMTpoeN_w@mail.gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 4 May 2021 13:03:02 +0100
Message-ID: <CACvgo53Mkvx8n8RQ4BRCNWgb2wBWhyn8A2syYzHmuv0eJ=eChg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Microchip SAMA5D4 VPU support et al
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, all

On Wed, 14 Apr 2021 at 11:32, Emil Velikov <emil.l.velikov@gmail.com> wrote:
<snip>

> Is there anything I can do to move the series forward?
>

Based on the Patchwork tracking [1], I suspect that Hans will be
merging the series.
Although if there is anything I can do to ease things, please let me know.

Thanks
Emil
[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=5041
