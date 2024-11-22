Return-Path: <linux-media+bounces-21781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A29D5A2C
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FAE52826A3
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 07:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9522413AA38;
	Fri, 22 Nov 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MH8QkPQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706B22081
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261561; cv=none; b=HmDKOB3DUgHsvkAYh1B48cWPR4wIBRhe9kcpnwJ7KZTZFpM5Ua/OnHUT4r+Q6rFaSCI9T038nPgZ0sew7d1m5YB/tuaCE6tZ6EmKxGHZXFCcaDFP95bBQ0SKGvDVWtsnYd5zNDwhngmuOvSGmOS8UZLckE3vewm7RFjozrpca1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261561; c=relaxed/simple;
	bh=5HXtMqhw3tXV3gZZK7lbXDy0S3J+fgiHJzU7zjwgBZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WREWUdpMLwog+jvLkTfMEVMEv9j9WoZvg4cbOrXVgDii2dG33hm892lU4VtjUTg8vNOA67eoxkc1SFth7Elz1KQW6cQyDBfAwRNYCukSbubZGWaYMcLocT2eEG2cmHW9bAh+qhVc9abnHk2m5DgJx9fdkrbthv5IC3mL1EKFS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MH8QkPQo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso16554695e9.0
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732261557; x=1732866357; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3Es+EYJzhWtzxIqPztkeb+fLawoz/8tmOGiwlpXsU=;
        b=MH8QkPQozo9FTnE5yFmsBovPF0jJhICB3VV5MOh2XCcjG9I4bwfUP59D17xXgGz236
         E5akstVULk8z+2FwCAA1yDkSd38hGPNbbhZp0SNiFp7kFqlAEfyC3PjvSeqgj+HrroeS
         KX0CoalOD9aND8Y59+IQzQk90olRdMuQoOi5giWFRp7ou6ozRv+9YAn4BAL4C2frvII+
         CD0zu2F0i+khgByDepwRtKTDOWlxFRim8gHsavfRA0GeGpzNxZZMUXahhS875GOMsGR5
         mzwXk8WK9S9cNKmoCTQHCpOnLTghmXPNxQloNsHK3KElohzumWpVDnk3vuw2G/xuFFg5
         ou1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261557; x=1732866357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3Es+EYJzhWtzxIqPztkeb+fLawoz/8tmOGiwlpXsU=;
        b=hyQdMPBjmUhyHd/CYBxJkx047KslwAzBhWRyDPEq9C4JNOAZmjjrafyheR4Na6lrfY
         v8lG/puKH+v+eh58q68rvqmo6hQLeTcF0FRInB6bo3yAQntsXA2hqZuXx4yejtrsHUsA
         eABI7bGv0miebNyqXzDD2EoRE5nA+GNL3j/T+gzYleuEY0kT/iLIro5FgX/R16v5ArIK
         f8TspIzrarpvZ5Pbm57rTdppNoNmFYG6Qdjfr8FEVMdGDm03S/fS0vGd112/tvtMkniS
         R2gdFJn8S4GMycQiew86TDEiGpZDkqIRUEqgA4pO48J4brjVAsLlFhopMPPbNFUgbkWk
         0w8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl/YbxOmCZIrMEisplxv7OCcddcKoonN9VmBynGOodKOx6dzUBj6SbE9Xtvo41GTJk+bTy/+AqyZ6aHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfSK37NKU3yrAd4QdxDSrcxm6QrWIY2WiC8dOoLlJIiMJL2MF0
	t5SQ5XbXK4AmM85mnN/Y7TdsoaCo+PrltIc5EuJXRk+BthibNkSBvFxxSGvP5kfmi0wN4VtkA7T
	sfmfsYg==
X-Gm-Gg: ASbGnctFViCR7KxLl4NP8mbuzPyjnBp+g4R9XP9ucrAbToIwcWTzQIFx/idG0TT76Xd
	s/r8fuFtvtjLGQxROgvylB1UYV+ZJi3AIYyp/lSrRUSUcR1No9rjty9g2KATvDsQVcZzDfJrRST
	JPsde70EG7l/ym8fr3gWyEFGN1rU+Goau6igrSh2VSNS/rUtbzgMAxaTrQbtCQgnD7vPM633pQt
	OH3AvsVJXoshcZQqEqDX5wtKG+PTaAVPwMsMHh1oQy0sSvt4pfbYSs=
X-Google-Smtp-Source: AGHT+IFwRn6hrEcHQ9I6nQ268X1gXrm8sfvunsDK3GyTofhPaRS1QQnV5dbgZWbsMLcZFqf7T3+lYQ==
X-Received: by 2002:a05:6000:1545:b0:382:3efc:c6de with SMTP id ffacd0b85a97d-382601132d7mr1279165f8f.3.1732261557506;
        Thu, 21 Nov 2024 23:45:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc44f7sm1692299f8f.82.2024.11.21.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:45:57 -0800 (PST)
Date: Fri, 22 Nov 2024 10:45:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
Message-ID: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

vim +/i +752 drivers/media/pci/intel/ipu-bridge.c

c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747  	struct acpi_device *sensor_adev, *adev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748  	struct device *csi_dev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749  	bool ready = true;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750  	unsigned int i;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752  	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754  		const struct ipu_sensor_config *cfg =
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755  			&ipu_supported_sensors[i];
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757  		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759  		while (true) {
                                                                                                        ^^^^^^^^^^^^^^

8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760  			sensor_adev = NULL;
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762  			if (!ACPI_PTR(sensor_adev->status.enabled))
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763  				continue;


These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
loop.  We're stuck forever.

c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765  			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766  			if (!adev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767  				continue;
                                                                                                                        ^^^^^^^^


c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769  			csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770  			if (!csi_dev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771  				ready = false;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773  			put_device(csi_dev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774  			acpi_dev_put(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775  		}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776  	}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778  	return ready;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


