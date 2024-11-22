Return-Path: <linux-media+bounces-21786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E349D5ABF
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1A82822CE
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0AD18B466;
	Fri, 22 Nov 2024 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QNBVIxyH"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DEF17C9B7;
	Fri, 22 Nov 2024 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263096; cv=pass; b=hcOHRjkVaNpv8j5SmWDP3m8pF0kJGZtfDCqTgWY9mgkErsHI/DfftmCei413A3HqguZ7YqBo6HssEG6FSr2l4XHv9zvDDMjb7i4hO4QO0olVcvFddk6cbXQca1CLwBoREYZLzU2VluCBKTxG5wyTmqhmfzZJMHbiQ7wTtgWHsVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263096; c=relaxed/simple;
	bh=5OSIA5yfXfTEOiApH3tLTnSXeO90aFWKH284IvMHd/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeddNFToGS67+hqvjRKc53yC5FshhlypRbyJDAtkBWFpMHz+6E209xiYzLo75jASjOW3Draf2ptUXn2jf6Dy1kErsHbxApVNrMq1GyyBMf0OMVC0MGPx8G85CHMVAIZyHSWsXB10a4bFn+JG/B+TwWApCSomy5hcubNgVSqWuvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QNBVIxyH; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XvnqM2jqkz49Pv3;
	Fri, 22 Nov 2024 10:11:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1732263083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ippbDKWwjgedKHUNgriEsvQ+7CFSQnkoFmjAHD1jXZA=;
	b=QNBVIxyHJ5Wg/2tJoHqa8dzsBI4cbLRxK6HNFo6lCS2r/ZB/VaOGhVWN1VvbQOWJfhJ518
	zvALd2r/HpjnM8jb7CdPSj8k1pbVkUSK20X6wHHd309p20tj4wQJUlejrDe8eBCABAM8Y4
	pi1ZaPonDDyaiAb6q6SWv2t6su6IUTGPVL+6RGVtxGFdJ17huhLlVQT7ZyrFXN5EfOrO0c
	bcpJMbgOaGbQ7Nc3PMn+lf3wx7qYaIMeRbJl3aKGEtA5W30mlpqEdueAnHzRZ+t2zAolhx
	cQou2A/hghr9cgm9dQmVwy5pq3rqkRB2HY4FlirUeFidzNNMbIj1wIeFI8UDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1732263083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ippbDKWwjgedKHUNgriEsvQ+7CFSQnkoFmjAHD1jXZA=;
	b=Ju20UBMnbjl7q5ZgAYJ67rCvTDAyVLhcng9pDQt8wmRHvmxqxAMdfLB2Xsb8kfkNQCnXP3
	D9JeZu2nPdJW4z0J+s7w3JggEnGXYFtCDHzSY9PC6XzJQbkQqdFOc9fVvictDkThCadEMg
	9Wal8dS9A5HB8wYbFpXlHOwoRWnutwqPTnbQ66VC+rkMV3pAptHnNIzz4LROoxeOP4i4Xg
	f/n9Y07D7gDXQGR7s3VyMWqdB20tYjhU7Zgoc6JAkt5CJvUlrrN1vd9X9h2w9vf5jr3yGU
	3Xg60irCTXy45MaTrmLZgxMfsSwK1uaTbQg1aoPjUuSFODQ+8ySN+n6RCYXnlQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1732263083; a=rsa-sha256;
	cv=none;
	b=olQ0irYzoKLmBB1ix3ON2yfzoUuhwWTuNM+TJU55M3xaw9ejgBLT+a04RQ+NXZFSfVg/sk
	JVUoU8qhTGZbSixlXbGDjTzZcXHq4Q+1H2nDYvWzHhKKTyMiBO3eka8+Z4yVPgOTeAuYsT
	Vg5GJyYy9wqS2noa8BgqAMwpwMX4TNN7ZdHIWkbhArjiMyeMl+eRZWAahCdcl/CZ99xHLX
	XmEhYkcYeADJsPuE/z2Z2WLVvyGVFCzqceh8yVp7clxfx/Sid3JhvDDuN35LPNNGNvVzRE
	EIHJb5sdvrtiwV/dDAyB+FVVy96UPpTp/rajFNjw17AUrGbngZplbuhQIh3XIA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0BE47634C93;
	Fri, 22 Nov 2024 10:11:10 +0200 (EET)
Date: Fri, 22 Nov 2024 08:11:10 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752
 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
Message-ID: <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
 <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain>
 <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>

Hi Ricardo,

On Fri, Nov 22, 2024 at 09:06:40AM +0100, Ricardo Ribalda wrote:
> Hi
> 
> On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dan,
> >
> > On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > > compiler: alpha-linux-gcc (GCC) 14.2.0
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > >
> > > smatch warnings:
> > > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> > >
> > > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> > >
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> > >                                                                                                         ^^^^^^^^^^^^^^
> > >
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> > >
> > >
> > > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > > loop.  We're stuck forever.
> >
> > The non-ACPI case is there just for the looks... I think what should be
> > done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> > patch.
> 
> I saw your mail after I sent my patch :)
> https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/
> 
> If we make the entire loop conditional then we would not compile test the
> loop.

I'm fine with the patch as such but don't you think we might get just a
different warning from this one? :-) I'm fine trying this though.

-- 
Sakari Ailus

