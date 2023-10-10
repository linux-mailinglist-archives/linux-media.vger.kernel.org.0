Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F5E7BF3E6
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:15:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442406AbjJJHPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442392AbjJJHPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:15:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536BC9E
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696922112; x=1728458112;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SR0z5+k7f09X4oSIBT6JZPi+wmKyVNI03qo0ZaVho9s=;
  b=QiZNuep8nl1SF7lGVSCUzvnBB1fe4N0ZzLQ2PcgjHv3gkCR4rY+FCWKK
   t6wvOC7V69wu80iJb7XzAcGP99DcW0w1h72zB5cYi4VNE5W8Zw++r1Zhj
   CVgcXwYvzgn3KZajGCP4ilVY5MiPoN/xu6l6d3cJ8qFOXkxJvnD80xsWq
   Oq9mBT+3xGhrH5NpYz3i8eudGxobasBkyLTtIzETp6OIyzVuTRYnuOTHj
   33A/gwOPC/ILSQeE5o1OqHLKdphfbqfjdvQMrLtWHd1q5ZuWVN9fNxko4
   J5wzW1Vv3RhN3rxLyOjrZ57kTo1UMWT3b7+RdYqlUe6J0CRoOzw/rr62v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="2917020"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2917020"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823672182"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823672182"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 00:15:08 -0700
Subject: Re: [PATCH] media: intel/ipu6: Set V4L2_CAP_IO_MC flag for isys
 /dev/video# nodes
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20231002172306.111601-1-hdegoede@redhat.com>
 <ZSO07yIijONinNEw@kekkonen.localdomain>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <c0550b3d-65dd-f0c7-4876-9d47ca618990@linux.intel.com>
Date:   Tue, 10 Oct 2023 15:12:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ZSO07yIijONinNEw@kekkonen.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/9/23 4:08 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Oct 02, 2023 at 07:23:06PM +0200, Hans de Goede wrote:
>> The IPU6 isys is a media-controller centric device which needs
>> the pipeline to be configured using the media controller API before use.
>>
>> Set the V4L2_CAP_IO_MC flag to reflect this.
>>
>> This also allows dropping of the enum_input() g_input() and s_input()
>> implementations, with V4L2_CAP_IO_MC set the v4l2-core will take care
>> of those.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks.
> 
> Cc'd Bingbu. (Also bounced the patch to him.)

Applied, thanks. :)
> 
>> ---
>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 ++-----------------
>>  1 file changed, 2 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> index ad74a19527b7..e6fc32603c3f 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>> @@ -262,29 +262,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>>  	return 0;
>>  }
>>  
>> -static int vidioc_enum_input(struct file *file, void *fh,
>> -			     struct v4l2_input *input)
>> -{
>> -	if (input->index > 0)
>> -		return -EINVAL;
>> -	strscpy(input->name, "camera", sizeof(input->name));
>> -	input->type = V4L2_INPUT_TYPE_CAMERA;
>> -
>> -	return 0;
>> -}
>> -
>> -static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
>> -{
>> -	*input = 0;
>> -
>> -	return 0;
>> -}
>> -
>> -static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
>> -{
>> -	return input == 0 ? 0 : -EINVAL;
>> -}
>> -
>>  static int link_validate(struct media_link *link)
>>  {
>>  	struct ipu6_isys_video *av =
>> @@ -1017,9 +994,6 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>>  	.vidioc_streamon = vb2_ioctl_streamon,
>>  	.vidioc_streamoff = vb2_ioctl_streamoff,
>>  	.vidioc_expbuf = vb2_ioctl_expbuf,
>> -	.vidioc_enum_input = vidioc_enum_input,
>> -	.vidioc_g_input = vidioc_g_input,
>> -	.vidioc_s_input = vidioc_s_input,
>>  };
>>  
>>  static const struct media_entity_operations entity_ops = {
>> @@ -1217,7 +1191,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
>>  
>>  	mutex_init(&av->mutex);
>>  	av->vdev.device_caps = V4L2_CAP_STREAMING |
>> -			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
>> +			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>> +			       V4L2_CAP_IO_MC;
>>  	av->vdev.vfl_dir = VFL_DIR_RX;
>>  
>>  	ret = ipu6_isys_queue_init(&av->aq);
>> -- 
>> 2.41.0
>>
> 

-- 
Best regards,
Bingbu Cao
