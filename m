Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34697E1CD9
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 10:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjKFJAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 04:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjKFJAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 04:00:11 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D610D8
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699261208; x=1730797208;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=a+aqkiJFF84BfrGQskyWvfazAVnKEpRlbxzGK/r1Oto=;
  b=Q8k/f/3GC7VYRRZ7xRSsfwq1NWwqA24C+8e7T252Blf0ARS5fJVZNni4
   FC/NrSaaNs+dMuoqM1YBr/Il9He+n8tSGr4vwzqSxyoal+anT+9rXl3dH
   X5JEQ1oxBYZNVS/L+heR+TVBmJMgw3IwszAgJFOg+oALRdCwZdm5cR2MI
   baYTXamzoWeE/hJeAQQmEUoTo51nYkndiORTkeVBZaKYo2u2xburqp1Jo
   BJy55D0d1qT8EF8ysTjnJkuSgFk03nXUTwxLsWmDrAnq9RXNKRlgZ1Q2T
   R/ZXa4NnDPq5d79faXEhE3BmB3AeE5gxTqN85HJs+PS06vo9djaY0AL4l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10771356"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="10771356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 01:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712141425"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="712141425"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 01:00:02 -0800
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
To:     Hans de Goede <hans@hansg.org>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
 <9c567345-43a4-c79f-cbbd-6f13a55a0b3c@hansg.org>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <1e41895e-9b92-9c1e-7caa-5b505a3efffe@linux.intel.com>
Date:   Mon, 6 Nov 2023 16:55:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9c567345-43a4-c79f-cbbd-6f13a55a0b3c@hansg.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 11/5/23 10:43 PM, Hans de Goede wrote:
> Hi,
> 
> 
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Intel Image Processing Unit 6th Gen includes input and processing systems
>> but the hardware presents itself as a single PCI device in system.
>>
>> IPU6 PCI device driver basically does PCI configurations and load
>> the firmware binary, initialises IPU virtual bus, and sets up platform
>> specific variants to support multiple IPU6 devices in single device
>> driver.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Reported-by: Hans de Goede <hdegoede@redhat.com>
>> Suggested-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> 
> Thank you. Just one small remark, not a full review:
> 
> <snip>
> 
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
>> new file mode 100644
>> index 000000000000..84960a283daf
>> --- /dev/null
>> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> 
> <snip>
> 
>> +static struct ipu6_bus_device *
>> +ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
>> +	       struct ipu6_buttress_ctrl *ctrl, void __iomem *base,
>> +	       const struct ipu6_isys_internal_pdata *ipdata)
>> +{
>> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>> +	struct ipu6_bus_device *isys_adev;
>> +	struct ipu6_isys_pdata *pdata;
>> +	int ret;
>> +
>> +	/* check fwnode at first, fallback into bridge if no fwnode graph */
>> +	ret = ipu6_isys_check_fwnode_graph(fwnode);
>> +	if (ret) {
>> +		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
>> +			dev_err(&pdev->dev,
>> +				"fwnode graph has no endpoints connection\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +
>> +		ret = ipu_bridge_init(&pdev->dev, ipu_bridge_parse_ssdb);
>> +		if (ret) {
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err_probe(&pdev->dev, ret,
>> +					      "IPU6 bridge init failed\n");
> 
> dev_err_probe() already silences logging of -EPROBE_DEFER errors itself,
> so this "if (ret != -EPROBE_DEFER)" guard here is not necessary.

Good catch, thanks.

> 
> Regards,
> 
> Hans
> 
> 
> 
> 

-- 
Best regards,
Bingbu Cao
