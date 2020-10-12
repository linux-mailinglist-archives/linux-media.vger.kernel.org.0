Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AF28BFC0
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 20:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387823AbgJLSbR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 14:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387669AbgJLSbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 14:31:17 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DCCC0613D0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:31:15 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o3so5160460pgr.11
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vC5ukxUApftCYYuzXLZi8ow7qNvq/NURL4Xx7lRfx4s=;
        b=XjxXbst4ESFUDP69+/dDxdgmS+SV+7lcKFZ7T4LzblDzkNMcC0cOkGXXLlSQ0Ltb8g
         y7cvvG99Y1EAs4mfHXgN6qWQSllO9mVAqTue8qdDr1lsFJHU9X85TQAa1Z15yhVNiTCd
         gAAvt/Ig9l13KEPqNi3Odz+axALTghCQnta6oqnNxn7T11kqiKCzhaSv857Y8KYDyw+p
         EpzGZYcshUbSAVje+H7OlDw5htwwDNPlwcIo+sUuFHhq3BkBz73lhBrKFzd9C0ZbrsPV
         2nIFS1rDbYGhE6OSB+FRDbog6RwFJP4ZaiKMbkUAEDopGlcEkYNoZDtq/ESslA65geSZ
         TpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vC5ukxUApftCYYuzXLZi8ow7qNvq/NURL4Xx7lRfx4s=;
        b=TjSJ4T+zlEN8By/nqIZ6Xd8o4oB58B0KsXyWon3q+c3tu8fVoa6RT8bMPP7sC9kwCO
         0XzCVLSpO0rslDPvJB3Nwf+0rzQc0+1+NocqMkt7zBPUq3ZU8gL+bx//GGnBnS1nbSKT
         7sqNjD0LjL2sZpPZrNcjMHyWcJJH//1CBHvPiS2cgD3R1eAggvTQOorTPTsmaEi9C0xB
         MvtUVmCGGN4vqY5IU/v5QIHjRAdRIJe3i0HXbKMyyBOl7scXIN+cm9NZAnVgfi2fjVLX
         eqGJb8qx8Q8N3J6sQRglElsXBqHKcxvkJJgzJzPOD/P+Ww/SzBwxiI9Of6ZIlYwtxCdy
         yc/w==
X-Gm-Message-State: AOAM532LefjZkJT0Jmam8wxGJ5/IlIzhmQTWD4k/KfN+I63M1R3HS8HS
        4EL+gnyUo/Se/dSXnp9tAzYo4pOIM+2bZIZ/lhg=
X-Google-Smtp-Source: ABdhPJziuRrWZZFybc5kc4tgU2qg0rLK4mZjLYuR2Fx/v+iHMyOMB62Kid13a07HtKnVi10je6hQaugtLOOWd0XpxyM=
X-Received: by 2002:a17:90b:305:: with SMTP id ay5mr21408531pjb.129.1602527475243;
 Mon, 12 Oct 2020 11:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201012180414.11579-1-sakari.ailus@linux.intel.com> <20201012180414.11579-9-sakari.ailus@linux.intel.com>
In-Reply-To: <20201012180414.11579-9-sakari.ailus@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 21:32:04 +0300
Message-ID: <CAHp75VcQ9vY14qkQF_kq=YRbQdc_1WS67hdB19TX_W6YXsGGYA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] ipu3-cio2: Remove traces of returned buffers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 12, 2020 at 9:07 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> If starting a video buffer queue fails, the buffers are returned to
> videobuf2. Remove the reference to the buffer from driver's queue as well.

the driver's

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: stable@vger.kernel.org # v4.16 and up
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index d9baa8bfe54f..51c4dd6a8f9a 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -791,6 +791,7 @@ static void cio2_vb2_return_all_buffers(struct cio2_queue *q,
>                         atomic_dec(&q->bufs_queued);
>                         vb2_buffer_done(&q->bufs[i]->vbb.vb2_buf,
>                                         state);
> +                       q->bufs[i] = NULL;
>                 }
>         }
>  }
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
