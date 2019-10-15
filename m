Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93454D7AFC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfJOQQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:16:15 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42457 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfJOQQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:16:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so20854226lje.9
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oiRTM7fnB815ZrKA1x7meYkHZvrvOg9Y0XoiHNylS1Q=;
        b=VAFiJnfMUOGDP+Rhsa5CSVFUF67D7zgZXlkYrc7HGqeV8znZaqdmfSuu7v9hmgQB7Q
         nJ1kjYqhAPAHrAriKHmc32e6bfpAQ7STFFqcy4uPV+GKqGZfr0TiTJxB9ljw4R7VXDTk
         DB5QZVukGsaxLJkHjWj1/PolnOXS9GI2aY7STKIsGrJxBJ7eqyKL08Q0oliOX/w68oyX
         JdqvApeBqie9MLSK+WpdlhheMINFFo7UZ22UC/ZBLqY1uXlOo9jm1MGKiF7CzJ8+5zLc
         9UFhNGfl0aVxVr7JaX0nbZyXGAQdmuqqkkpiV6a7a+aCKBSqBBvkjjfIQdiwyBYfa1rZ
         G2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oiRTM7fnB815ZrKA1x7meYkHZvrvOg9Y0XoiHNylS1Q=;
        b=BpvvdAWSHu/2CYSKfj2/HBjju8EYv81nS2dU/31PsjmkNJjF7ezzeFBUgApgbZcNBR
         kmO0JtSQFKTRLI9T2Rs03zaObfT6vuNse6sgGQJN5LO9e8djhSU3J7HJLBiKUSwqtPpt
         I/kRRho9i9ERJ4uU+qXEeHMHS2uPkH52BRxbkmifhrTWClPT5WFrnjNbYKAR+kzL5nJ3
         NYXC4qBlLizJxN+TArHaaIJx+b0q0Rg7fJMggUd+PW49JHW5FyM6EuAgULBfhPRz93CJ
         KwTGYiH4mj+UkFLFihvgeOKirt7J3oVsrhEX2Rk/Ypgnezfe0VSaTddZONVcMDO+DlGw
         JNYQ==
X-Gm-Message-State: APjAAAUHgOgZp1MhYmIw0xyVfAdIdNclqZ+Ajb+XG0htZG+Z1efovbFP
        SYWYOcFCMrHU3h7bxjqJU6RS0wgCcrZlIaan4HE=
X-Google-Smtp-Source: APXvYqxtFC3x0iVC+QUZvmSblt1jFutmY23QaDqY27iBTNgVFlcD9uX/xrvjA+sPL4GpwUK8JiS60HJTzQ/eZoEKzCk=
X-Received: by 2002:a2e:86cd:: with SMTP id n13mr22791441ljj.239.1571156173139;
 Tue, 15 Oct 2019 09:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com> <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 13:16:09 -0300
Message-ID: <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Oct 15, 2019 at 1:07 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Right, I understand there is something else going on with the i.MX53
> but what about the i.MX6 testing related to these patches?

I tested it on a imx6 sabreauto board with 5.3.x kernel plus Steve's
patch that discard the 10 initial corrupted frames and I do not get
rolling video.

I do get rolling video if I remove/insert the cable though.

> Regarding the i.MX53 as you have a kernel that does work you could
> start looking for i2c register differences and csi config differences
> between the two kernels. I discovered an issue with the adv7280 by
> comparing i2c register dumps.

Yes, I am in the process of comparing the two kernels.

Thanks
