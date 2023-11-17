Return-Path: <linux-media+bounces-521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E54E7EF786
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 19:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233981F258F4
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 18:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7E537156;
	Fri, 17 Nov 2023 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hb051JIG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DBF93
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700246588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/MBmD0zcRHkIe/DTUv120C3niX9TajKLFZNMTqD4ig=;
	b=Hb051JIGptZYEQWG1qBl/zk9AqFhicXVY2TStIsnlI1LHj4dF4xw1d1mGiaswmJNRwAXIb
	yjmYXJOb3+StA16Vxx1pdT0+qE7hPQGrkWRIbh9vdpalDKPusC3bTXmBfBG2T0BbkMdh/j
	39ulw4sOdDMw7ZDXpS+EL9BkgDnl7cU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-mOYcqJ5jPkG4b_K4f2qrUw-1; Fri, 17 Nov 2023 13:43:07 -0500
X-MC-Unique: mOYcqJ5jPkG4b_K4f2qrUw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9f7dce1428dso73868366b.2
        for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 10:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700246586; x=1700851386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/MBmD0zcRHkIe/DTUv120C3niX9TajKLFZNMTqD4ig=;
        b=RKug8CC2ig48QIJV0xphbmP0vwPfG1Qb/Jg05R1ruB4yKPZXSKWwvCepf8efQTP2lq
         CRdrlWoTOc9aE78oKw9J2OJWWjVHu8pkQVDuyz7SrJSUPlwofUBVJcPPPPP62RVM8syN
         EZQ46WFJqWkMd0GUGTi1drWIqw9nSnNshGUkL7wXGQCJ77NYkVsLrXDUfw+h6dFi9SmT
         qTInBl0tns9pXEjmF8XwvhBxmu8/EKi1dvS9JHuHXRTz+KIWiM4cuMeXJ0RytGt037Rg
         p28nT3MgfVwviL4/CR6rnabXIPyXY5gH5kmSrfu6pvrhkWVTECBepcbUCGiH/vG7Tl7m
         kQhQ==
X-Gm-Message-State: AOJu0YxqRUh9znIYtdVX4ZQv5aqaeHYQLmGTdZ0MzrLYzKF3ynvaofbz
	2uX7maWSqCKgq0NmdSBihxKg58IJSqvMKvDALt/XL9nFWawRgIMHdVKTk9vkMW/G+ggJEknuR6X
	AwIcHrKdmch9my60LpmwrQlY=
X-Received: by 2002:a17:906:3c12:b0:9da:e922:12f1 with SMTP id h18-20020a1709063c1200b009dae92212f1mr16547ejg.18.1700246586260;
        Fri, 17 Nov 2023 10:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPFr5sQbScPw8AEsKpszEhp8TaTuyRb47dlChOctjYbvycJ/dNsBZqrpBBDJr4eoziSUkoTA==
X-Received: by 2002:a17:906:3c12:b0:9da:e922:12f1 with SMTP id h18-20020a1709063c1200b009dae92212f1mr16528ejg.18.1700246585898;
        Fri, 17 Nov 2023 10:43:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u1-20020a170906b10100b009b9977867fbsm1058100ejy.109.2023.11.17.10.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 10:43:05 -0800 (PST)
Message-ID: <65475a54-5b97-4c60-a55b-dedb66a02cbb@redhat.com>
Date: Fri, 17 Nov 2023 19:43:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Content-Language: en-US, nl
To: Andreas Helbech Kleist <andreaskleist@gmail.com>,
 Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
 <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
 <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d9fa902626486899929202f56f3e924b4ba27a73.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/8/23 15:10, Andreas Helbech Kleist wrote:
> Hi Hans,
> 
> On Wed, 2023-11-08 at 12:25 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> Intel Image Processing Unit 6th Gen includes input and processing
>>> systems
>>> but the hardware presents itself as a single PCI device in system.
>>>
>>> IPU6 PCI device driver basically does PCI configurations and load
>>> the firmware binary, initialises IPU virtual bus, and sets up
>>> platform
>>> specific variants to support multiple IPU6 devices in single device
>>> driver.
>>>
>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>>> Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>>> ---
>>>  .../media/pci/intel/ipu6/ipu6-platform-regs.h | 179 ++++
>>>  drivers/media/pci/intel/ipu6/ipu6.c           | 952
>>> ++++++++++++++++++
>>>  drivers/media/pci/intel/ipu6/ipu6.h           | 352 +++++++
>>>  3 files changed, 1483 insertions(+)
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-
>>> regs.h
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
>>>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
>>
>> <snip>
>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c
>>> b/drivers/media/pci/intel/ipu6/ipu6.c
>>> new file mode 100644
>>> index 000000000000..84960a283daf
>>> --- /dev/null
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
>>> @@ -0,0 +1,952 @@
>>
>> <snip>
>>
>>> +static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
>>> +{
>>> +       int ret;
>>> +
>>> +       /* disable IPU6 PCI ATS on mtl ES2 */
>>> +       if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping ==
>>> 0x2 &&
>>> +           pci_ats_supported(dev))
>>> +               pci_disable_ats(dev);
>>> +
>>> +       /* No PCI msi capability for IPU6EP */
>>> +       if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
>>> +               /* likely do nothing as msi not enabled by default
>>> */
>>> +               pci_disable_msi(dev);
>>> +               return 0;
>>> +       }
>>> +
>>> +       ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
>>
>> This does not work on TGL systems (and is not reached on ADL and
>> RPL).
>>
>> The out of tree driver instead uses:
>>
>>         ret = pci_enable_msi(dev);
>>
>> and that does work correctly on TGL.
> 
> Did you see my previous (25//10) comment on the same lines? 
> 
> pci_alloc_irq_vectors returns number of irqs, so the "if (ret)" check
> following the quoted line is wrong.

Ah right, so a proper fix for this would look something like this:


From 34de6611d3482d6695dd73eddf7bf3dc1f96883c Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Tue, 7 Nov 2023 11:40:29 +0100
Subject: [PATCH] media: ipu6: Fix interrupts not working on TGL

pci_alloc_irq_vectors() returns the number of successfully allocated
interrupts. Fix the error checking to handle this correctly.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index b652662fa72e..66565cfdb703 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -532,10 +532,12 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
 	}
 
 	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
-	if (ret)
+	if (ret < 0) {
 		dev_err_probe(&dev->dev, ret, "Request msi failed");
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static void ipu6_configure_vc_mechanism(struct ipu6_device *isp)
-- 
2.41.0


Bingbu, please squash something like the above into the next
version of this series.

Regards,

Hans


