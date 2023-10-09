Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802B97BD4DF
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 10:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345469AbjJIIIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 04:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345456AbjJIIIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 04:08:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE05394
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696838900; x=1728374900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTuIPhu4NFCXr/dZaV7naDJR+jpiCWpPGaeUUTNDXMQ=;
  b=BNCjy5xWGvBx4KmYY/KrqsOGLGe3Q1L0ylfp7DYOGeJ8KpuXpH7YEUQu
   6fodQB91QuqEbp5OqBjLrXDsax9NmhvoePR8yTBLxrUGTDXeee8C0GwTS
   n30E5cCgQ84oxqVGkTtkUM8UEGtVMtrL6Qi9vorEwVngn0j7TYJ5kFL3a
   WIdI1km+NVZSuffUAlaonyq5aNnfZx/kybcd4J9/9e7ECvLPO8SfsgSWD
   Skxz1QcRuRYAgU9u5pPEsF/XGuFeuNAZGqn482VUvUNjoiugZK/5kdgu4
   u+9CCme3k7Uhb0K9hMB9xSJ43fn+KqaqK4JcN83UXBD/jgV/efLHr899X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="5640899"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="5640899"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 01:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="752939267"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="752939267"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 01:08:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 05FF211FC2C;
        Mon,  9 Oct 2023 11:08:15 +0300 (EEST)
Date:   Mon, 9 Oct 2023 08:08:15 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH] media: intel/ipu6: Set V4L2_CAP_IO_MC flag for isys
 /dev/video# nodes
Message-ID: <ZSO07yIijONinNEw@kekkonen.localdomain>
References: <20231002172306.111601-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002172306.111601-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Oct 02, 2023 at 07:23:06PM +0200, Hans de Goede wrote:
> The IPU6 isys is a media-controller centric device which needs
> the pipeline to be configured using the media controller API before use.
> 
> Set the V4L2_CAP_IO_MC flag to reflect this.
> 
> This also allows dropping of the enum_input() g_input() and s_input()
> implementations, with V4L2_CAP_IO_MC set the v4l2-core will take care
> of those.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks.

Cc'd Bingbu. (Also bounced the patch to him.)

> ---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 ++-----------------
>  1 file changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index ad74a19527b7..e6fc32603c3f 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -262,29 +262,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int vidioc_enum_input(struct file *file, void *fh,
> -			     struct v4l2_input *input)
> -{
> -	if (input->index > 0)
> -		return -EINVAL;
> -	strscpy(input->name, "camera", sizeof(input->name));
> -	input->type = V4L2_INPUT_TYPE_CAMERA;
> -
> -	return 0;
> -}
> -
> -static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
> -{
> -	*input = 0;
> -
> -	return 0;
> -}
> -
> -static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
> -{
> -	return input == 0 ? 0 : -EINVAL;
> -}
> -
>  static int link_validate(struct media_link *link)
>  {
>  	struct ipu6_isys_video *av =
> @@ -1017,9 +994,6 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>  	.vidioc_streamon = vb2_ioctl_streamon,
>  	.vidioc_streamoff = vb2_ioctl_streamoff,
>  	.vidioc_expbuf = vb2_ioctl_expbuf,
> -	.vidioc_enum_input = vidioc_enum_input,
> -	.vidioc_g_input = vidioc_g_input,
> -	.vidioc_s_input = vidioc_s_input,
>  };
>  
>  static const struct media_entity_operations entity_ops = {
> @@ -1217,7 +1191,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
>  
>  	mutex_init(&av->mutex);
>  	av->vdev.device_caps = V4L2_CAP_STREAMING |
> -			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> +			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			       V4L2_CAP_IO_MC;
>  	av->vdev.vfl_dir = VFL_DIR_RX;
>  
>  	ret = ipu6_isys_queue_init(&av->aq);
> -- 
> 2.41.0
> 

-- 
Sakari Ailus
