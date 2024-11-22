Return-Path: <linux-media+bounces-21785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9149D5AAA
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E44E2838C6
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4983418A95E;
	Fri, 22 Nov 2024 08:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geVct8gg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C40422075
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262816; cv=none; b=i5FRxYIpVKox5AHvnjTt3UiEch3RMlsSIZG/Og0/p0HnP3v+4dhS7FE7+VEKXSLbTX8c0rbLZAIPQnzqd7TLXZ2SRS6P0SFfDlRP+EYeAD4V90MDY6/eStBvjKk2SIqHWY7UaveW0pEHYLgf018jcNGIt7oi6VbCx6zjE4DycCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262816; c=relaxed/simple;
	bh=Qi4/idXLvnIThje2gN76UzBa1XdNh7XOjU86E3VjFGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPIrhbMXlRypBmt8fGs0/rnF5iERHXdWc5VPiWNjFRU1VUoUeCQjnG1JizvKyzTGhkcNIBtRuqO8Rx/oD7cSn/sqcT0H9jguBomVZpbINVPAG9raVV4mDwjGwKkResp7OvWqfL6T1/MbAcQi5Y200cS7G012Snx3jR7+zZ1Un4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geVct8gg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so108274b3a.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732262814; x=1732867614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=geVct8ggys9lywarmAF1MWBnrSJl5cXMJomkYB+4MAMFguepIWvKacj9l9tCS2FiTu
         EotJ5U1CRevYiFXRgvOmkF77jAjgrBdkHMnP5L0yjj9HNwiXYMNB88NjVEDT9YHYbXKK
         wuvm9J5zyRogPvX943twD0AO4lJffdKJeervg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732262814; x=1732867614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EheqArWCj4tc46f2BqzjXCWprDHEPhu6m5IV043oQTA=;
        b=MPtx/KeCe5CuygnrMNp+nQCSXdYv2lbIfx5j0LXx30q1ASpytkXTyo2kMr0uoNHD2R
         aBwSbfdPVvL7c27+ynW353ZS7EdlU2GFvK0FPki+/BGwS+mOeaD3Bn2GXjckoBnVwtNF
         pPnp5/iBaIYbKqYdilcBAiBCeLdC10HHQOgewB9pyKHqffZJCWD1r0dad0nNner4eiGY
         32C6oWWOjDpyw4LgE8j7hcDh3qWiJohMkFmsRI8l9Q+0b7jjXw0gbDgckhJgc0ubkAtH
         J3Wh8Wfq9mMu6+BA9U+IEHep8PHoZZvZM9xwtPcIyhZKFoQjEKD03MWqhdmylhZGGVSn
         JJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9JhZy+5VXDR/9tjHstjndhrt8buS05nMkr7LvJomjwKy39udXUsIU66C/45zKqGmV6dUdNj5ZmZd6cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2yJ7t7CDvsUb4c8BWrE9S0hJPDQ30t0wGE21UWNFf2mAfMBEW
	l/+p5gWUH1Y90QttUnmFJswAF/YpS8s9NHu1RoDoKfqFT6yxdWvORkXpi6vqhTBpRJkUw7Cwxl4
	=
X-Gm-Gg: ASbGnctwd9tJqAfnCHmTx1sXnNQg66nMsiB+j6Qsv+c5jkJ5GGR/YnNFShRJRm1i6mC
	cEiNNjZLgHMbLPThZsyDr6GwAjv/847n+aayk6hhzHLdqRCxSnc+CGa/BtpnwHj7m1APJPxd7fa
	EFXU2tmDaNQSBWkumA2eZABMp+YJty4+5UCbt6kJ72Aa/4cHhUpbeSA563BN7zAcj7KP6IASLUY
	3I6fmgJJn7mYwCZSP4217dgXrxMdslnrYibL9EBTSMskmkEeteRe9B3GAFo+Y6W7o8d3zCO/rkK
	Zay5Mo/Rap1BdmQ2
X-Google-Smtp-Source: AGHT+IFDnbP3s24iYdaAp+3IMjJs5uo2rtgQx+bok+sOGbQVXYLoStoFoi9M1oNPIjb4by1BDpuDPQ==
X-Received: by 2002:a05:6a00:2313:b0:71e:db72:3c87 with SMTP id d2e1a72fcca58-724df660821mr3119920b3a.20.1732262813891;
        Fri, 22 Nov 2024 00:06:53 -0800 (PST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de532da6sm1067606b3a.105.2024.11.22.00.06.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:06:53 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1208844a12.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3HXRly3hczhxTdwiLZQD6hersMAH78J9S03jcckP+MUw7goSZdH6kX3OMezUaDPEZH36NSDtVUS0T8A==@vger.kernel.org
X-Received: by 2002:a05:6a21:999d:b0:1db:e328:dd13 with SMTP id
 adf61e73a8af0-1e09e3fe116mr2932241637.11.1732262812168; Fri, 22 Nov 2024
 00:06:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain> <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
In-Reply-To: <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:06:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Message-ID: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dan,
>
> On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> >
> > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> >                                                                                                         ^^^^^^^^^^^^^^
> >
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> >
> >
> > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > loop.  We're stuck forever.
>
> The non-ACPI case is there just for the looks... I think what should be
> done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> patch.

I saw your mail after I sent my patch :)
https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/

If we make the entire loop conditional then we would not compile test the loop.

Regards!



>
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765                     adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766                     if (!adev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767                             continue;
> >                                                                                                                         ^^^^^^^^
> >
> >
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769                     csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770                     if (!csi_dev)
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771                             ready = false;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773                     put_device(csi_dev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774                     acpi_dev_put(adev);
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775             }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776     }
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778     return ready;
> > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }
> >
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

