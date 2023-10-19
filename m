Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEC77CF27D
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 10:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbjJSI0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 04:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbjJSI03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 04:26:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4482AB
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 01:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697703987; x=1729239987;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=9QuoAd8wpjXY29snjXHRPaIKIScrkZtHkXLhcjFTs6g=;
  b=aWabV1LXimABwvhB0kEeLL+uTV485FYOvVeZABHPsISBkiIsgOBjx/8b
   LCg+0uuzKfweoWGwYF0Mo5Sv0rrYdLtiVImEgPCuugxp5qAqIJSCV8MrX
   ylqGlgKboKErLhuJ/yHNkvY7LUW83sCDyMcT5oynbil2m2D8y9xpYA1ZM
   2eTjo+VRbD8FR9Gajt8U4ESd4oom9EPC9/DYDVo3HIM7NOX7wLb4QOUyQ
   MSDs/vwJiePR40skutiZm//vuPlxIkprZMUtYYU7KRhZ9v3nDL8Karv5Q
   lQD6zdLMRSbybZObUpS/l0qEQnspqqDGFO/wA1WuCrPbFhSYJvAjcO1iJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452669647"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452669647"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930524664"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930524664"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 01:26:23 -0700
Subject: Re: [PATCH 01/15] media: intel/ipu6: add Intel IPU6 PCI device driver
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-2-bingbu.cao@intel.com>
 <c071d5b55ac369f039c180685742560b4a5d03cf.camel@gmail.com>
 <2cbd6b6e2d9ecefae822ed7b4915b52b10c2bcd3.camel@gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <ae2ec919-913c-4a36-30b3-41e4be242a42@linux.intel.com>
Date:   Thu, 19 Oct 2023 16:23:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2cbd6b6e2d9ecefae822ed7b4915b52b10c2bcd3.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Andreas,

On 10/16/23 5:39 PM, Andreas Helbech Kleist wrote:
> On Tue, 2023-10-03 at 12:12 +0200, Andreas Helbech Kleist wrote:
>> On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
> ...
>>> +static void ipu6_pci_remove(struct pci_dev *pdev)
>>> +{
>> ...
>>> +       ipu6_bus_del_devices(pdev);
>> ...
>>> +       ipu6_mmu_cleanup(isp->psys->mmu);
>>> +       ipu6_mmu_cleanup(isp->isys->mmu);
>>
>> I think ipu6_mmu_cleanup() should be done before
>> ipu6_bus_del_devices()
>> like in the ipu6_pci_probe() error path.
> 

Thank you for pointing out this issue.

> Scratch that, it also causes issues (because isys_remove frees stuff in
> the MMU).

What stuff in the mmu was freed in isys_remove()?

> 
> A fix that seems to work for me is to save the isp->isys->mmu pointer
> before calling ipu6_bus_del_devices, and then use that pointer when
> calling ipu6_mmu_cleanup.
> 
> diff --git
> a/drivers/media/pci/intel/ipu6/ipu6.cqb/drivers/media/pci/intel/ipu6/ip
> u6.c
> index 59ecefbcb56c..6333a4674d33 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -812,11 +812,13 @@ static int ipu6_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
>  static void ipu6_pci_remove(struct pci_dev *pdev)
>  {
>         struct ipu6_device *isp = pci_get_drvdata(pdev);
> +       struct ipu6_mmu *isys_mmu = isp->isys->mmu;
>  
>         ipu6_cpd_free_pkg_dir(isp->psys);
>  
>         ipu6_buttress_unmap_fw_image(isp->psys, &isp->psys->fw_sgt);
>  
> +
>         ipu6_bus_del_devices(pdev);
>  
>         pm_runtime_forbid(&pdev->dev);
> @@ -830,7 +832,7 @@ static void ipu6_pci_remove(struct pci_dev *pdev)
>         release_firmware(isp->cpd_fw);
>  
>         ipu6_mmu_cleanup(isp->psys->mmu);
> -       ipu6_mmu_cleanup(isp->isys->mmu);
> +       ipu6_mmu_cleanup(isys_mmu);
>  }
>  
>  static void ipu6_pci_reset_prepare(struct pci_dev *pdev)
> 

-- 
Best regards,
Bingbu Cao
