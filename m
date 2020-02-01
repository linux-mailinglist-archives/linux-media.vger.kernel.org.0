Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D7D14F976
	for <lists+linux-media@lfdr.de>; Sat,  1 Feb 2020 19:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBASeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 13:34:11 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44052 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgBASeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Feb 2020 13:34:11 -0500
Received: by mail-pf1-f194.google.com with SMTP id y5so5198294pfb.11;
        Sat, 01 Feb 2020 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rXnKiP6qW73uPOAfyX1Ew2bGelplKTmhc9fwE2EcDSQ=;
        b=eCxbEyUqMfJxHk7MjGa97Lzwuez7PBFd7IoYOWjLweIiit/9SuQXQLa8OBBareZSnx
         X0w43JCfXlkFUHPvEh5/oxatjHwl9cZDIW5LZRhlPc2k2TD+U2KUc/Mcgxj1kY9iQPwd
         pMdXvtWqetMI9r80a5UmQEluqNBVvLowqcM3qYDeh5WrCBZBqC9T14p1enBHAZepOoeI
         EIwM+cWoIYplaBryxMYX+aCBQ4Vk6W+NnQxahBKPFM4V9epFopQjCGMpE0k1ROobVFvN
         N0qcUXqfSokkIA5SoVriZ7imHfUu5f0Alb0vhp0S09jvkif6ZOU5BWp6jn0F22idWbIY
         Nh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rXnKiP6qW73uPOAfyX1Ew2bGelplKTmhc9fwE2EcDSQ=;
        b=PZnXJ4W1c3Ym6hSZABq0U1gDXonorztHs60X3nlohn0d9f0xAlGnuJiAaEGBkWP8eb
         21K4joXi6tBIJ1Oe2rB+dFZylIe7wknP9XDjF5J9LBqU9ltxQDOaTxYy5TW1/vV/SKDB
         XPyVnyYXlNnYXLUG//IWaktGlFp0nb7iA2CFcg+DjiuMpSxfjufTHjWJxS/QriNa3W4p
         GpgmZSG/jha0EcxfIRfHHbi4x0iOQzdP3HwMkIS2ZhD5pDAeozIzWt7kGY1xaBTK3so/
         0Cr1bJXlF+AD4tfFjE9mrWW979TOVxclhvxILhxBlfUvcrXSwxTQA6rTs7n6GC4wp1IT
         pdpw==
X-Gm-Message-State: APjAAAVqCgvl7oy+BEZGU3BNkgpzcVJFpigxToJ4E8k0/mu6Xy049xgR
        3n0h4t/s0l70QpD0qExH5U+vEZGKk1SqZIw2c74=
X-Google-Smtp-Source: APXvYqzRUsbdDrwkXQA60bA1JDcQ5ldEJOWeObOg7jNqw2AJXcH9UOkky8j2HEl+0B457DQdulq2mGkxMuM3oVASOq4=
X-Received: by 2002:a65:5242:: with SMTP id q2mr16291591pgp.74.1580582050258;
 Sat, 01 Feb 2020 10:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20200201151714.26754-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200201151714.26754-1-lukas.bulwahn@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 1 Feb 2020 20:33:59 +0200
Message-ID: <CAHp75Ve5gFF8R8i_ietRUi+sfy4nQi4MBzG4XnmJfJRqYH85wQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: correct entry in TI VPE/CAL DRIVERS section
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 1, 2020 at 5:17 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> perl scripts/parse-maintainers.pl complains:
>
> Odd non-pattern line '  Documentation/devicetree/bindings/media/ti,cal.yaml
> ' for 'TI VPE/CAL DRIVERS' at scripts/parse-maintainers.pl line 147,
> <$file> line 16742.
>
> Commit 2099ef02c6c0 ("media: dt-bindings: media: cal: convert binding to
> yaml") introduced this ill-formed line into MAINTAINERS.
>
> Rectify it now.

There is a patch waiting for upstream:
https://lore.kernel.org/linux-media/20200128145828.74161-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko
