Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F676EBC82
	for <lists+linux-media@lfdr.de>; Sun, 23 Apr 2023 04:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjDWC75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Apr 2023 22:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjDWC74 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Apr 2023 22:59:56 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C802136
        for <linux-media@vger.kernel.org>; Sat, 22 Apr 2023 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682218795; x=1713754795;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=cyEyqs0ha9XvJgXyqwDebBN7HD8IFsito4+bRepRjqE=;
  b=btC1/y5x+cbfbISY/40PLxlbdw9rR0WiX1SW55i2qOz4sI8dDpyrhX19
   sReGI0Ct7VUgs4V+y+q4ty9OmXP4/7WcHhy2+McjHImLkfyC5qPUILq4A
   sq4SeDgLOn9PbetuNsmM6Y+aoPrvXRGaw7YdCda1dkaDNXPGJkkndMGtQ
   YfDItyDGbuTj7nWy+5/6qXUhIUc0Xo51Z938YqeNKAksIDwLG/5Uwa47c
   tCGmrkS5hkfR5netw35B4jJVaDsGP7/7GU90R3ZhHUEePVzR+ik+KHgic
   vzW1d+Ev5n59qejo1G/N7mdOHkZASAXJn7J/vC+8F1zK3qqdUhnhejz/+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="374178402"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="374178402"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 19:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="867080353"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="867080353"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2023 19:59:53 -0700
Subject: Re: [PATCH v2] media: i2c: add ov01a10 image sensor driver
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        bingbu.cao@intel.com, dave.stevenson@raspberrypi.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tomi.valkeinen@ideasonboard.com
References: <20230420042213.2045722-1-bingbu.cao@intel.com>
 <168199174036.2445904.14561161009082027354@Monstersaurus>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <2ff1a677-256a-b77b-c0b2-d2aa075738af@linux.intel.com>
Date:   Sun, 23 Apr 2023 10:59:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <168199174036.2445904.14561161009082027354@Monstersaurus>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran,

Thanks for your review.

On 4/20/23 7:55 PM, Kieran Bingham wrote:
> Hi Bingbu,
> 
> Running this through my sensor driver check script still highlights some
> missing features:
> 
> Selection Controls and fwnode properties (will become mandatory):
>  - V4L2_SEL_TGT_CROP_DEFAULT       : --------
>  - V4L2_SEL_TGT_CROP               : --------
>  - V4L2_SEL_TGT_CROP_BOUNDS        : --------
>  - .get_selection                  : --------
>  - v4l2_ctrl_new_fwnode_properties : found
> 
> Could you consider adding these controls please?

Yes, I will add them in v3.

> 
> Please see https://git.libcamera.org/libcamera/libcamera.git/tree/Documentation/sensor_driver_requirements.rst#n77:
> 
> The sensor driver should implement support for the V4L2 Selection API,
> specifically it should implement support for the
> `VIDIOC_SUBDEV_G_SELECTION` ioctl with support for the following selection
> targets:
> 
> .. VIDIOC_SUBDEV_G_SELECTION:
> 
> * `V4L2_SEL_TGT_CROP_BOUNDS` to report the readable pixel array area size
> * `V4L2_SEL_TGT_CROP_DEFAULT` to report the active pixel array area size
> * `V4L2_SEL_TGT_CROP` to report the analogue selection rectangle
> 
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-selection.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/v4l2-selection-targets.html
> 
> --
> Regards
> 
> Kieran
> 
> 
> Quoting bingbu.cao@intel.com (2023-04-20 05:22:13)
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Add v4l2 device driver for OmniVision ov01a10 image sensor, ov01a10
>> image sensor can deliver 1280x800 resolution BGGR10 images at 60 fps.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Yating Wang <yating.wang@intel.com>
>> ---
>> Changes from v1:
>>  - Create ORIENTATION and ROTATION controls if fwnode properties exists
>>  - Move sensor PLL related settings into mipi_data_rate_720mbps[]
>>  - Use v4l2 subdev active state API and remove private mutex
>>  - Add support for vertical and horizontal flip v4l2 control
>>  - Update the copyright header comment format
>>  - Remove some unused macros
>>  - Add entry in MAINTAINERS
>>
>> ---

..snip..

-- 
Best regards,
Bingbu Cao
