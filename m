Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0E03D0495
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 00:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhGTVnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 17:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhGTVnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 17:43:32 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36119C061574;
        Tue, 20 Jul 2021 15:24:09 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id l1so30293930edr.11;
        Tue, 20 Jul 2021 15:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lEppuy6RYBjr45xnEaHtJ8rovvDCczMbopW2pe2QH4A=;
        b=Qq7JPADE2lUz0crkONCNrpRz7beK6py+R7GVxhrIBmPY4Ot6R8fuU9Y84UBtQmb6iF
         Wl5Ch/kGqRt0wTQJ2UN3DjNR9Y0euuse9vY/Zg4TpixV6FaNBGWm9WOtj44nEi7xqJto
         FXH4b0iQjuvaWoP12qJAdb2jRso2HtxNPcfT0Qh5WgjCvQo4rdL3eUqJtt0+yz83+m4t
         rxbBFDwtwqZwI+5G1ImH2/9WhclL/77VqMEGjteJHMy7hWJF8OW2Isf59EDL/DWadsWq
         eic9wj3a8wAnbebaQJRL+SptDSFJ73KHaW1qfAV4nG+Uzu0JThcjLp2Yvs0Egg2whOVu
         4yMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lEppuy6RYBjr45xnEaHtJ8rovvDCczMbopW2pe2QH4A=;
        b=mGFxCeN1xDka6yYj4A/1wO1fDmfE2Ih19ytvMb29iyMynqPBxMMvPbmCKtYplO6pST
         5WZkK+O4zBOKkJOyZG7WJ3zpdRUKzGa/LrQTXfmmNlJCcezzwwvdy8sisDjt6zSByOW8
         qPpb3+Tnq67YggXsvq75RjKQbQbbNKLuqbo3y6zQaIjdli9U2UwluAcn0k4x1l6HnV+u
         2CfWmvETRgMCh2IZaQ9abby1wRW1tQ4+yTH7EVDqIjkx83Dk2zVDnk5NuuYNWcl8TPfk
         OEZv6VJRz2XbE96Au9BwVxU0xsMq5/Brh53ngDU8MyAjIrjqIa8e33LEm0bNWxXPVPsm
         HFhQ==
X-Gm-Message-State: AOAM530ImoTwWU/mqw1zNkjKT1dyHQ6LPMlYfjoIr33OYsnQhlu2M8p6
        v/zUClQchjlUtPqtWUWPPszUnlW/QxdaxzBwlkI=
X-Google-Smtp-Source: ABdhPJyIKnL2YDkKvxCKwzXJwyZC6dY9lDWbPwqfQ8eyLCJ3/VhJ/lgVPZy+N9FPW0B9ZTzzYiMvhfFtTXNzE36gm+Q=
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr43990778eds.40.1626819847757;
 Tue, 20 Jul 2021 15:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210719170506.13539-1-viktor.prutyanov@phystech.edu> <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210719170506.13539-2-viktor.prutyanov@phystech.edu>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 21 Jul 2021 00:23:56 +0200
Message-ID: <CAFBinCAv6aF31GJxp7HUq0KXXEppdNx1Z4T=zA1KeH4cEovuTg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] media: rc: meson-ir-tx: document device tree bindings
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
        khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Viktor,

thanks for your work!

On Mon, Jul 19, 2021 at 7:05 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
