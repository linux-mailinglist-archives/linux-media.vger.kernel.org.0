Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06211175E49
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgCBPd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:33:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33761 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgCBPd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:33:27 -0500
Received: by mail-lj1-f195.google.com with SMTP id f13so3391767ljp.0;
        Mon, 02 Mar 2020 07:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1+XRJJy42ZSFyjL3ICumxudKN6nuaWlh/hrQNXWmHs=;
        b=YhcrMb8qdlu+1+7X+oWQBU0VOFDbQmoyWa28VfvKwI9Zy8BEJzCRXG2m3iwkT8EVOP
         /QRrw8/dyTkulIGpeaTQYVOabTRejkaoyCiXtGESlw2iDFfUMhJFYhKEf8iXUJlWRKcq
         OnIs9HO7pgVwqUiLrD7UZDuzvrlqtK+mAZ6bwCCRJ6UMdXE0tYOtNBbiA/UHy7O2jzmW
         ZZL+0AHiPSGP+c+l+EdVROHj91vQyUwhl9XTt76nI0Q7BfbzQJC/9yn9XlliDgtTAPe/
         MQ6+Chrld4E9yxlmyN5UJh3VSJQajNSJkvU277Ma95CdKp+InfihIVMC5tenD+fhhyLc
         Yupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1+XRJJy42ZSFyjL3ICumxudKN6nuaWlh/hrQNXWmHs=;
        b=lF4VR3Sj9NEwJzVpbwBbUp58n6S1ZRaSQ85WUG4X0pDkVioSu9kf8UFvzk1SQoCfQg
         hXHJ29AinKmhhXH3PTLtGANquemoOgutpAFI9j/1gHFpXqJa4NPPamgG8S8mGf4/+RxN
         yWGvYMSBlXiZS9Aq84OCa3s/moWkh1S8FvJB0F9zoowU1s6zQfA/gZxXpWfQsKOEx6vg
         0eIv8eC7r998ZPMM21OTBoG6k80JWuBx3xjPywVPfRULSQWBfGZSnmk1qgP7vCcb+dsV
         VEMNoVcV6gVl2jzi+YO4Hst3t2axYXOiIuY4Y1lb0W/3M3imzhibLf3E43Goo7KSLAYQ
         i6bw==
X-Gm-Message-State: ANhLgQ3OC/w7TftVW7xS9oaAMdmXHbMY0V6h85lsu2aVMXTaM8DblgN2
        hLlxbWyt0oYiPiNitpK4T1JNyPTkJsvS/gD83+Y=
X-Google-Smtp-Source: ADFU+vuddxhLZiv9IVm3bmlaGjKFRPDJnYo5ZMO8KblJymAQ5Pw502u4vz0ALAhaR/SOh+6Y0ugIAMXLPwWQezRRx14=
X-Received: by 2002:a2e:b78e:: with SMTP id n14mr11528790ljo.269.1583163205431;
 Mon, 02 Mar 2020 07:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAOMZO5AP65Upj8v=KaPLzS10DNdwrz20gJGbwbcJfCDqZBx71Q@mail.gmail.com> <CA+V-a8s_d3Atp9J5KM=x4z2z_iAY8+9vcSHFUTyQ3XZ9HCCS3g@mail.gmail.com>
In-Reply-To: <CA+V-a8s_d3Atp9J5KM=x4z2z_iAY8+9vcSHFUTyQ3XZ9HCCS3g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 2 Mar 2020 12:33:13 -0300
Message-ID: <CAOMZO5DP3BMmmL3eM5dmhy0YdMGvD9UW1mUXb1tYds9eVbE6LA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Mon, Mar 2, 2020 at 4:19 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> > Should this be a device tree property instead?
> I did give a thought about it, but making this as DT property would
> make it more stiff.

In case a system has two OV5645 and we want to operate each OV5645
with a different virtual channel, it will not be possible with the
module_param approach.

Using a device tree property would make it possible though, so I think
it makes more sense to use a device tree property for this.

Thanks
