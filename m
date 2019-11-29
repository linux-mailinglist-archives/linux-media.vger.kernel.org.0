Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5289E10DA3A
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 20:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfK2TtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 14:49:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33893 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfK2TtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 14:49:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so5381981lfc.1;
        Fri, 29 Nov 2019 11:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBnj05Eh4vt/qckTOfX4DMzfi31Ryvk7fXMdBVIV/rY=;
        b=KydJdq1QA2zZAeBkqhj2V46cvAvxvxGbz4MMaJ70OrWEAcZlvWx/ZVn0vwpTY/vEV+
         16QsAODLnSTxf1gOc2XR5CCuM04rhH2mHfVTXvJrCssdT66ZW+9danUP5yU+v4Pk0ypQ
         oXA8SymZnrZAs9/xLMcbdufTlvHxo+cEIQ6ssDaOeHqbFW7x6YhWpv4JjTg4wi42f14k
         S1PRQh0KkGzyIGJ4AJqEqtH98nfLk/16kMifwzi2p7hxIyShW3LGdR0kHdo99Ac2//hW
         UuAcg3bXtUuj88hu1ruw1nEWvDyxFBb89RPtXwqg40s92raZ32cIUoTVsXp3xRlfNRkI
         mHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBnj05Eh4vt/qckTOfX4DMzfi31Ryvk7fXMdBVIV/rY=;
        b=fp0MVYdNGT0CkIgJML9UowLLaSAwSu2TnyA5Nq02GxG+P0Ok7/oCoqRiwqR1PBC2O2
         KaSZ4l25mA176EYyJH4t8J3tQTe8NlDk6xzNj1eDaFvqumwMjYsAREkgqyR0lQwWMAS4
         oV1qq3k8vJn7Hv7kswDCriipe+o0f+xlAVoRFohJ/4J0tq0ybiZvRwcS6wmWUhC4YDBU
         CBlbEyst+FkZ0LiUflOw4XeVrdYapE1V8xUf3uc7fuHKumQOtcY+t+cBOdenU4ZaKRus
         2Lw846XmHbV0W3gTpzG1uTlRUcQgX4fKyHZvOfNrMm0ktxjS1s0gP1mZ/59WOx+QwXl3
         I+QA==
X-Gm-Message-State: APjAAAXijtDOd7sYc+c677XC3Bqc8GmwP4yVDIXODVUmXo/UrCH1fZh1
        9jiVteDn3/lau1asEdA79EuzfHvl0T/PRfJbLq95hQ==
X-Google-Smtp-Source: APXvYqxtTPuuT1Vh36OW8NOSd7X7fwzEom9MD0Gh+xzrA1PUqS3z6w13CLFApoRnrIWs+eTFNITNVgOfDrryREaW5y0=
X-Received: by 2002:a19:f80a:: with SMTP id a10mr26306239lff.107.1575056952064;
 Fri, 29 Nov 2019 11:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org> <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191129190541.30315-4-manivannan.sadhasivam@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 29 Nov 2019 16:49:25 -0300
Message-ID: <CAOMZO5Btkd0NLM5RBFZHD5dryE7mR5JZRLC2X__pQNmjHGCywA@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: i2c: imx290: Add RAW12 mode support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, c.barrett@framos.com,
        linux-kernel <linux-kernel@vger.kernel.org>, a.brela@framos.com,
        Peter Griffin <peter.griffin@linaro.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Manivannan,

On Fri, Nov 29, 2019 at 4:07 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
               }
> +
> +               imx290->bpp = 10;
> +
> +               break;
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> +                                               ARRAY_SIZE(
> +                                                       imx290_12bit_settings));

Could you please write the ARRAY_SIZE and its parameter in the same line?

It would improve readability.

Thanks
