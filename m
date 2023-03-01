Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04826A6900
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 09:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCAInL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 03:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCAInK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 03:43:10 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDCAAD17
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677660189; x=1709196189;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=GI91omjEhnmi7xV4xWwnACTLFuqj97EkvpdSJKRQyJY=;
  b=L1P0ocSATtmkosOPzServWZuuclsB/D3xaxxpP+ehBngQlKNs8Ofs+A0
   iow8S1lbH6EpA+AIbSgswtFRqsVzi94CICgGwvh0sez8D0QdO1oGfECrO
   Ui25Qd6F3kNBItRk1lDpCIzwsEnHDd2VK2aXDYmgtAUrrlbsiP4oJ1w5T
   pSxacp4D0EP6OqL5dkY6H7rMXojshWJWzpJLQUQoBOg+QKMsP81s0PXdq
   w96Fh9b6g7z09zzwm6VE6H7CUIkUJHjydxXo9XJElSHNA9CArSTyQOCZh
   4QtcptOXt62cqzZpXK1JY8GsejiSseZn0ZPeiPAAtk6KitHZS1BO3SJEn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335846250"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="335846250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 00:43:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="817465432"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="817465432"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2023 00:43:03 -0800
Subject: Re: [PATCH 1/3] media: Zero-initialize all structures passed to
 subdev pad operations
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
 <20230215165021.6628-2-laurent.pinchart@ideasonboard.com>
 <Y/3Rz5DRX9DnLe8E@valkosipuli.retiisi.eu>
 <Y/6Ugu86FDL0Cv1s@pendragon.ideasonboard.com>
 <Y/6VInMEEPhpMlxd@pendragon.ideasonboard.com>
 <Y/8E4Ds+EOfYKsXi@valkosipuli.retiisi.eu>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0d409856-dbd5-2a97-35f8-37678053db6f@linux.intel.com>
Date:   Wed, 1 Mar 2023 16:43:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Y/8E4Ds+EOfYKsXi@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/1/23 3:55 PM, Sakari Ailus wrote:
> On Wed, Mar 01, 2023 at 01:58:26AM +0200, Laurent Pinchart wrote:
>> On Wed, Mar 01, 2023 at 01:55:49AM +0200, Laurent Pinchart wrote:
>>> On Tue, Feb 28, 2023 at 12:05:03PM +0200, Sakari Ailus wrote:
>>>> The second latter of the subject of the 3 patch should be lower case.
>>
>> What ? :-)
> 
> s/a/e/

:-) , s/S/s/ + s/a/e/

> 

-- 
Best regards,
Bingbu Cao
