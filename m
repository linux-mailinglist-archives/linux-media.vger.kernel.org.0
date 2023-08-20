Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60ED781E76
	for <lists+linux-media@lfdr.de>; Sun, 20 Aug 2023 17:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbjHTPOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Aug 2023 11:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjHTPOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Aug 2023 11:14:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865CBCC
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 08:10:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so3790696e87.3
        for <linux-media@vger.kernel.org>; Sun, 20 Aug 2023 08:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692544200; x=1693149000;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C/tRUC8o70zTo7ztx9pTnEl2IxdkZBQc175QcFtoSWM=;
        b=RnZUt6u04efuH9cwiMQsb82oix7nhrjL6to2XaltDvKBVtiuCjNKr6GYQfbGflJ1kd
         5okq+pwRrTZfenWyE0y/h2GYPJeGzcgqugYYgrDVPrzEJbs+fIOEaGxR2FrJ1V/cgrZl
         9zSsZ4br07XKZLPZd6f3PgIg/MRKEdpojpyAkEyTlpdSv0nId8jFgyBAHKvscyULrWkD
         zjZunYdiyky9m4/zQmBGRTR0zRopm+mkre1/YVAPwYgX+d8+LxyvPQ2G5ZXUC5hTmWsx
         1qylIucYhZVxlcRS/31vTA5GD6lS2av1HYLnTxrFAhaZ5qMhzb7BWNsArXei6g/25iQF
         +vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692544200; x=1693149000;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/tRUC8o70zTo7ztx9pTnEl2IxdkZBQc175QcFtoSWM=;
        b=d4KZe4BpqYGiMGbOb7x10M9fOvRoVabTysJ5ufD+3qHWfgEawfPIR3gQ9RRkmhb4wr
         2C5bW3/8/GFJjm2G0rToSJl3g5bGN7SvDcUngF26ypq/A19lk9MfJF5llJ4lsnKDxrp6
         uOUgTbIaEJumI+NRhr6CMmEOotLF7gw2wKwFNpJpZgAsE2wT5Dp2tlrS8EbkGyM0ADF6
         Iig6iXAqQtSBipUUgBfVkaXFpqtITc6aKGdh4EvDhDBLbpk8Kg3iXF+GUc5Z6eTlq+cE
         PhWJOBdxpelWQLApchlfREpc1+iZj3otuF1Nqwap72i+iHl6HkXA97hGYWmuBcxl4FVh
         Ie9Q==
X-Gm-Message-State: AOJu0Yx277Utx9itHOZ2VbtOZmErMlgcEjRvR+35q1rA4IJG9lD2CZ4q
        0tHy8rTF8bIn8J6MNNGnHrE=
X-Google-Smtp-Source: AGHT+IGJYUgTHc1lgtCDYW3WxcEuH5W/28CF3gQguAHEHYjY03pyS5w04fJVwITp7DdoCvyTYeWzvA==
X-Received: by 2002:a05:6512:785:b0:4fd:d7ac:2654 with SMTP id x5-20020a056512078500b004fdd7ac2654mr2275300lfr.13.1692544199408;
        Sun, 20 Aug 2023 08:09:59 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004fe1448873asm1284879lfm.27.2023.08.20.08.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 08:09:58 -0700 (PDT)
Message-ID: <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Sun, 20 Aug 2023 17:09:57 +0200
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> This patch series adds a driver for Intel IPU6 input system.
> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> device which can be found in some Intel Client Platforms. User can
> use
> IPU6 to capture images from MIPI camera sensors.
>=20
>=20

Hello Bingbu.

First thanks for your work in upstreaming the IPU6 isys driver, and the
updates with v1 of the patch series.

I am trying to test it on a Dell XPS 9320 (0AF3) laptop

First - The patch series does not apply cleanly on linus 6.5-rc6, nor
the linux-media master.

For v6.5-rc6 I have an issue with

Patch failed at 0012 media: add Kconfig and Makefile for IPU6
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: drivers/media/pci/intel/Kconfig: does not exist in index
error: patch failed: drivers/media/pci/intel/Makefile:4
error: drivers/media/pci/intel/Makefile: patch does not apply

For linux media it fails after commit=20
https://git.linuxtv.org/media_tree.git/commit/?id=3Ddd61c2a3800371665172149=
57790a1486ae5d348
media: mediatek: vcodec: Consider vdecsys presence in reg range check

As next commit is
https://git.linuxtv.org/media_tree.git/commit/?id=3Dbda8953e8c3e7ecbbf6cb1b=
e11790496300e3961
media: v4l: async: Drop v4l2_async_nf_parse_fwnode_endpoints()

It fails on the v4l parts, and of cause the newer commits regarding
v4l: async in the linux-media master branch. So the IPU6 patch series
need a refresh to fit the linux-media.

I did a custom branch from linus tag v6.5-rc5 with the commits from
linux-media up to the "Drop v4l2_async_nf_parse_fwnode_endpoints()" and
then applied the IPU6 patches on top.
https://github.com/frosteyes/linux/tree/fe/v6.5-rc5/media_test

With this I am able to load the IPU6 modules, but I have problems with
the sensor.

The sensor module is loaded - named ov01a10 but the probe function is
not run - as far as I can see

Also in /sys/kernel/debug/v4l2-async/pending_async_subdevices I have it
as pending

ipu6:
 [fwnode] dev=3Dnil, node=3D\_SB.PC00.LNK1

Looking at the /sys/bus/acpi/devices I can see the sensor device with a
status of 15 (cat OVTI01A0\:00/status)

Will continue investigating, but I would like any input in getting the
driver up an running and testing on this Dell laptop. I think it should
be very close to working.

Regards
Claus Stovgaaard

