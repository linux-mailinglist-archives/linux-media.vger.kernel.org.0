Return-Path: <linux-media+bounces-29045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB6A7644F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ADC23AB3A9
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCA21E0B91;
	Mon, 31 Mar 2025 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b+m+bsl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723291DFDB9
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 10:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417242; cv=none; b=jj9mSeFA7nbXLFIFnzAT5qf7XEHuSJd+8wPzL+trJhjuI64+Sj3u/ZpP/EtIf3YZkYUrkjtiSKAMDiGzvdRmr4xfDu9Udu7TH5wsxn1yXq8Kx8wY6wGXD2UX6u7rQVgAvtNMggRUJxodQcEa758J53vNChsGcaq480bSVKexbX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417242; c=relaxed/simple;
	bh=QdePJzntHBFPog0fZh36LJ0GzufJKGYvG0XKRdPn5FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yl+4RrVlTVoLFbGJP3hy+FHz8N+YCfkW4MeaNi21qXxlu586Ilfy0/KoJiZdwB8mp922RKFsCz5EbC/W2EhhQImk1Gtjjdb3hL8BSUH4EIikvuM2aHxdFOa2lIzx7m7m+MKvNSa6DZJ9lFwOFpGSi2KokmuqVx9Mt073LvVjTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b+m+bsl3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913d45a148so3684770f8f.3
        for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743417239; x=1744022039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWZgGDwlAbPbiL5FveYelCRSDG0LmvCzE51A2ZLXHiM=;
        b=b+m+bsl3nwarUItsAAGodeVUe8HNi2UptsAh7KzFGHPE2SC4hikGP7yWqDQy06Ubyp
         SiVnSwGtlT2IZ71tGiwPyiLbtOEk38QeK4nfahiKIx8+d27hWwi6OVJzSfx6nUW5kVT7
         5Omc4ATj76SkRyjOF4pjob1ZqdyaBtgLD3tnRnx+ZKgLp0XBHGMQTwM1sMc+UJeM+/vc
         HRp3Cfq0wTHR0OSgqOPJhvIQKKtDwVby7nO1GIRgnoWjYoCJjahaTOHcCWEzzhDtBads
         qksqGXlvEzWtEGkbZpN2RIpe6lslliN/+54jmbNkELc7XuvM3LOEIBfIWAP9pdmtUlY1
         yc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417239; x=1744022039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWZgGDwlAbPbiL5FveYelCRSDG0LmvCzE51A2ZLXHiM=;
        b=KKbBHL+Zs8VcDO08iMqm7SL4ovul4Z/UF5mD7XXWGVWiFAQeVmCbCQyI+B1XnDEgu/
         ie3T1Wl/Ihn+ojLL1dmUPyqqJI6R7DaSSQKx8eRrkCCllXLEEt4UqtgdEhE46pvaWTVi
         sXLre6tsGrFqVGJmtb7SO9KqbH5LaAhTgNCSwMlyOq542ARIheLKlpuAcRV44EcKAD6q
         sj3RazAE60oGGaq5VJBxfjlk3irHUZGCZq01PpaVkukkDRaqUcrMriGup4+RnC/lOLcf
         U5nJCWotN9ADEz9bl/cGknjOXLRSAdtDpTxkeunVHFH/S0H9ETgKfE+MA/SQVhjUE4Eb
         asbA==
X-Forwarded-Encrypted: i=1; AJvYcCUi8RV5q9ClVx/z69crdP8LNNiexmp2mamLqVbAf+i/9Abt/0Wb+2BjbWRqE3e7VkqPl4reB0Nc7jQrdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZXkOsWr2j919ISpoS9FWGurVoyQNwl1MgBL6vg3+OszZl7lc
	Bsf+I8FZk8ZRLMyixvoOhctc9XM1IiJpRdtBAAwXpDyxeV2otrHan7kGLwikLfY=
X-Gm-Gg: ASbGncvNAZ6xS7VloXg3f+gy8aCrx1OL7LY2JlRgWdIzOB42/RqQi/jcpQWXTfQc/A9
	uJ3y7EXgEezbRmxKlAgtw+ogBU9JW1i3iQI2PFOeb67UyghSF5+m731X1fuV2BH1TlQPWoofB3M
	HW3tEXvbtWoOuZ1ypKMK9RZLQtf30k0w3CI/2j9RmQuJ16LsooTNrOmjrOXq/2hXU/YxN1RpBy0
	tH2YSzS/hPTYbWy2bvAcL9jYVvOK+XDjGLI6VV2BJJCLcdr/jERQia5kl/KYVPNd5HMN8BvbiO+
	eOEZCvW6FBJe2Q0MBUlg4dl0eMauEPa/n2KhE2wqLtfLEIhsT8dCJBZ0fTAA
X-Google-Smtp-Source: AGHT+IHO9cBoSvB3iVCumQWnhZfL9iEojBiJlN66/O1EAjClqWvOe7pPJkr3sXgzdj/O31fvLFiy8A==
X-Received: by 2002:a5d:47c1:0:b0:391:2995:5ef2 with SMTP id ffacd0b85a97d-39c12114e24mr6628557f8f.37.1743417238699;
        Mon, 31 Mar 2025 03:33:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d82efdffdsm159335275e9.18.2025.03.31.03.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:33:58 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:33:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	lkft-triage@lists.linaro.org, rfoss@kernel.org,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc-6.13.8-rc1: Dragonboard 845c: kernel NULL pointer
 dereference - camss_find_sensor
Message-ID: <0e3e469f-f8cd-410b-aac3-d7a9c7207411@stanley.mountain>
References: <CA+G9fYuquxGrt81z4FBSEDuvAMpu2qYAoFXwYKpfSuw2YYNS0w@mail.gmail.com>
 <b8624ef5-d806-4016-b51d-1f23ddb65054@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8624ef5-d806-4016-b51d-1f23ddb65054@nxsw.ie>

On Thu, Mar 20, 2025 at 05:15:40PM +0000, Bryan O'Donoghue wrote:
> On 20/03/2025 09:50, Naresh Kamboju wrote:
> > Regressions on arm64 Dragonboard 845c boot failed with stable-rc 6.13.8-rc1
> > 
> > Regressions found on Dragonboard 845c :
> >   - boot (debug Kconfigs)
> > 
> > Regression Analysis:
> >   - New regression? Not sure. But the crash looks new.
> >   - Reproducible? Intermittent
> > 
> > Since it is not easy to reproduce this crash, it is hard to bisect.
> > 
> > Boot regression: Dragonboard 845c kernel NULL pointer dereference
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > 
> > ## Boot log
> > [    7.871211] xhci-pci-renesas 0000:01:00.0: failed to load firmware
> > renesas_usb_fw.mem, fallback to ROM
> > [    7.877652] CAN device driver interface
> > [    7.879182] Bluetooth: hci0: setting up wcn399x
> > [    7.884439] Bluetooth: HCI UART protocol Marvell registered
> > [    7.890767] xhci-pci-renesas 0000:01:00.0: xHCI Host Controller
> > [    7.938433] xhci-pci-renesas 0000:01:00.0: new USB bus registered,
> > assigned bus number 3
> > [    7.941274] spi_master spi0: will run message pump with realtime priority
> > [    7.946642] xhci-pci-renesas 0000:01:00.0: Zeroing 64bit base
> > registers, expecting fault
> > [    7.969396] ath10k_snoc 18800000.wifi: Adding to iommu group 16
> > [    7.983424] mcp251xfd spi0.0 can0: MCP2517FD rev0.0 (-RX_INT -PLL
> > +MAB_NO_WARN +CRC_REG +CRC_RX +CRC_TX +ECC -HD o:40.00MHz c:40.00MHz
> > m:10.00MHz rs:10.00MHz es:0.00MHz rf:10.00MHz ef:0.00MHz) successfully
> > initialized.
> > [    7.987793] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000030
                                  ^^

drivers/media/platform/qcom/camss/camss.c

  1700  struct media_entity *camss_find_sensor(struct media_entity *entity)
  1701  {
  1702          struct media_pad *pad;
  1703  
  1704          while (1) {
  1705                  pad = &entity->pads[0];
  1706                  if (!(pad->flags & MEDIA_PAD_FL_SINK))


0x30 matches really nicely with a NULL entity->pad pointer.

  1707                          return NULL;
  1708  
  1710                  pad = media_pad_remote_pad_first(pad);
  1710                  if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
  1711                          return NULL;
  1712  
  1713                  entity = pad->entity;
  1714  
  1715                  if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
  1716                          return entity;
  1717          }
  1718  }

Hand waving ensues:

The fact that it's intermittent suggests that we're calling video open
before the subdevices are registered.  So maybe either
camss_subdev_notifier_bound() or camss_subdev_notifier_complete() needs
to set a flag and then vfe_set_power() could do if (!everything_configured)
return -EPROBE_DEFER or something.

regards,
dan carpenter

