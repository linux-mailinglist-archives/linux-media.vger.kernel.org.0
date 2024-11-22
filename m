Return-Path: <linux-media+bounces-21810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8EA9D5C68
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4797B1F2239B
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FB51DE4C2;
	Fri, 22 Nov 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KXor3SUS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EE51DACA7
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269003; cv=none; b=GMFCyEoMbMvRksh6d+dfve4N1yjQ9iIM8jxMY00SJ7CMgF0MJ39rjbTLB4c/2q0bNWu40lHrs9jdp7coXwcotFQweaDyyatQU7o6tdnTg+9kJAOQiFCEs2XKRvfHH/MhReS7qVmmIad5V27N7PYc9/BtQxcaGq177KfEaoVg7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269003; c=relaxed/simple;
	bh=PvEGdxriQ64q0nn9Stq2sPLaEpishpGozwR3OcVmBwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIzxIowhGL8re9fq7o9tUcWLqonYIOCP9FWLzUS5TxqtZKP06NfJp/F540D6UCRG8/HWRfpiVepm2bNrEDsg+bZOw9kss9I4JisfTTidc28owULxS/IE7VTlCcymFSgRGoBmcdF1cQlznBAzOr9VJ1UU5D5v8vF+0GCqOIav9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KXor3SUS; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5ee645cf763so1023139eaf.2
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732269001; x=1732873801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=KXor3SUSqhCbhI0YEhOYNY8ODDpDa7wV8qcoomrzi6wmt4PELQ14BU+XSrUSBMqdia
         MJ/kU2z3CVrZ5Nvj9MbK+yL9vR+xHYTTvkTv7Jpxhi9I9bmXfOBDnJ9M0exktyMnWfNJ
         a0GZN4YuZ3Qb3TXM2NVGK1NyTx79xQiQpLbhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269001; x=1732873801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=sW2pOJAz5XGsDRAF4t78eS/ZGAzs7bQHgZpODFxA9+tUf1RQ3ClhBIuZU2MnI468x4
         FFJP2t1KzxRJymRmgmvPyPRVW8RjHXXRs6BCcxVtQHZ3go19oL6cayjTElza5hrV10AV
         /8xKL0zzbR/pgs7BWoyZRGKHHV8c3K6szCSdxr89u2kPPvIbNhE3kNHEEJ0PT5sY0ShP
         +fBc8GuLrVjqbwxvBPSTrT+D+Q9HXmzBoq2qRoqTxkfiPIZw6pfC5ucinjE2jIzBQ3/Q
         uQ1/C0syy2ecmh36iPpOSnsFz0ucJITL9SmuuTzeiopilyJ/Pv0i62RN1ZBKP0RD44Su
         gkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWkdgnRdfMiEwwJElq/dnQQcVH7uF0nnAQBON6fhITlJEilMONLbLGPrU4C1TOW9rz31vC7gQD5YE/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/6Zk84LN8o9yphRcd4pmmqTowG9UehGNOiApPlJag9InHy/d
	LmBGDRkryBFF90O457vLv4RqXGY1neoC9xwT70GnpFwEo9ymOxTiOZ6CzEAdrQ1CmUPzm0T+uvc
	=
X-Gm-Gg: ASbGncuXjv5uJFTGY+Kg/Bx3j6G5BGywhQvaWOJbhOPp7B8671hBtrrK+knsxQ7w3qi
	kLNldMHHNF8wkczkNF4sLGMpYGYVAuF8sefQ+Vd9pAQYKi6Zdao5pWGhHWd69KPesmDTH4DKBIG
	44Owa1W7R8RJ61MVvVwBk8F/585QVu3I6b4c7Rn2M0jNpiaL7zxNM3HYCdoFcMyytxLMoPi9fZE
	bPN/hxNTk4AUGByvAefRhu03W2loxh6eH3mUBSZRD3AWicLPMOiwOzJXUNIKvi/7EcaJfK2dzHX
	WS9Fltf5IvNsyeL9
X-Google-Smtp-Source: AGHT+IEw/EQyisi/UpNKDym4rZDy/jUSo/MIYI0bvQZwVlao0E8monT8YU/LawJWsp0HDpQEDfzKuQ==
X-Received: by 2002:a05:6820:607:b0:5ee:e096:686b with SMTP id 006d021491bc7-5f06a9fc961mr1790917eaf.7.1732269000840;
        Fri, 22 Nov 2024 01:50:00 -0800 (PST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f06987902bsm326809eaf.40.2024.11.22.01.49.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:49:59 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e606cba08eso991120b6e.0
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlbZ+VjBK9TOKZHslv9fuwZ1YpF3iJ8MGtfj2e+WW3fs6n/rL0jtEVBS+N2m1r1oWJMV5E4ur9A2aCPQ==@vger.kernel.org
X-Received: by 2002:a05:6808:1590:b0:3e7:6468:1fd5 with SMTP id
 5614622812f47-3e915a5886cmr2412276b6e.34.1732268998797; Fri, 22 Nov 2024
 01:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
 <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain> <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
 <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
In-Reply-To: <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 10:49:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 22 Nov 2024 at 09:11, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Fri, Nov 22, 2024 at 09:06:40AM +0100, Ricardo Ribalda wrote:
> > Hi
> >
> > On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dan,
> > >
> > > On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > > > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > > > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > > > compiler: alpha-linux-gcc (GCC) 14.2.0
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> > > >
> > > > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> > > >
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> > > >                                                                                                         ^^^^^^^^^^^^^^
> > > >
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> > > >
> > > >
> > > > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > > > loop.  We're stuck forever.
> > >
> > > The non-ACPI case is there just for the looks... I think what should be
> > > done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> > > patch.
> >
> > I saw your mail after I sent my patch :)
> > https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/
> >
> > If we make the entire loop conditional then we would not compile test the
> > loop.
>
> I'm fine with the patch as such but don't you think we might get just a
> different warning from this one? :-) I'm fine trying this though.

I have send a new series to fix it for real. Until the acpi guys
review the code we can land the first patch of the series. I have
tested it with smatch and sparse and it seems to be fine.

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

