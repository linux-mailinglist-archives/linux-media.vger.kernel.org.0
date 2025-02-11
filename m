Return-Path: <linux-media+bounces-26017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D850EA311ED
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875051634C1
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104A725A325;
	Tue, 11 Feb 2025 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOtIIDgq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E31C5D40;
	Tue, 11 Feb 2025 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292281; cv=none; b=Ca0RCnG0ntDnKOBhdGY92OrkTjboqv5DVHmGK72UlXQVRnKrkVgiVWSILz83Wi+tA7e9OhsYubb//O1E5fvswnNJxOMVm88VRmkvM8xxqeOwgQCmhFpWWiXVfFu+ndgFUWRfp7PpJADJrfHikbWZqnloTX+tQuDJLyAGtn3PNl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292281; c=relaxed/simple;
	bh=5rJQAJq527Lk85pSJ91MPUwDf6CsxpOeMkQW2gyUeH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rANzbVf8Mt/j3nnuX9y6F7cGHvdFJfx5Svoy8hRqadVfX8G0CL4mAMHJvYyclvU5HmoYciPKa89nXXxyXQAJ8EgItaWDE+pcMNpJNi02lN95snhe9sxa9Z0N8tjUX9UJPFZQlJSXExOU5TeToZwT2jZQkZjCnku4yNppaNTB0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOtIIDgq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292279; x=1770828279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rJQAJq527Lk85pSJ91MPUwDf6CsxpOeMkQW2gyUeH8=;
  b=aOtIIDgqrdCuLZCufWgU79gqbP/J8iKu9XROG4ER6S4fUxzgVO9NUhyU
   5H7MKAlqyCjUw4gM7k7eKN4qENzu4ER83Y8bNne+jpYLliUZnlTqVUt3n
   8RkhrlQQ4uLAm+mXasu0kUOBl6TiDZsm41mrdQa+Y4TXF5RPBE0fg7sry
   aPL97mmKRLUDzB+oR0JI+fBkWk26rOHpUs1w5fEG19rEZ94niuCbw9e3F
   Yqz7S+BE0lnohk9sjasupN1gYltt9CTJ/aO8gvvwXepMTRoAuiYzTSIiw
   doE8+doUqLmYwEGcLTT2q8/SGl4WZpFzYBFlmt9VsdOURYPbwPObE+rIX
   Q==;
X-CSE-ConnectionGUID: GKlrZNGdQoylLhkneoAjng==
X-CSE-MsgGUID: cJmp40fITO+XFsXrj5YMbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65276381"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="65276381"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:44:38 -0800
X-CSE-ConnectionGUID: +zJ1WdFLSeeeU8elakmM8g==
X-CSE-MsgGUID: 8vGt2TkySjyr0vt7tUOPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117486346"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Feb 2025 08:44:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thtNA-0014SJ-0u;
	Tue, 11 Feb 2025 16:44:32 +0000
Date: Wed, 12 Feb 2025 00:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH 8/8] media: chips-media: wave6: Improve debugging
 capabilities
Message-ID: <202502120017.COEwtixF-lkp@intel.com>
References: <20250210090725.4580-9-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-9-nas.chung@chipsnmedia.com>

Hi Nas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-platform-chips-media-wave5-Rename-Kconfig-parameter/20250210-171144
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250210090725.4580-9-nas.chung%40chipsnmedia.com
patch subject: [PATCH 8/8] media: chips-media: wave6: Improve debugging capabilities
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502120017.COEwtixF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120017.COEwtixF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120017.COEwtixF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c: In function 'wave6_vpu_dec_handle_dst_buffer':
>> drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:261:13: warning: variable 'buf_size' set but not used [-Wunused-but-set-variable]
     261 |         u32 buf_size;
         |             ^~~~~~~~
--
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_vpu_dec_flush':
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:1022:37: warning: variable 'fb' set but not used [-Wunused-but-set-variable]
    1022 |                 struct frame_buffer fb;
         |                                     ^~


vim +/buf_size +261 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c

de204321b54004 Nas Chung 2025-02-10  254  
de204321b54004 Nas Chung 2025-02-10  255  static void wave6_vpu_dec_handle_dst_buffer(struct vpu_instance *inst)
de204321b54004 Nas Chung 2025-02-10  256  {
de204321b54004 Nas Chung 2025-02-10  257  	struct vb2_v4l2_buffer *dst_buf;
de204321b54004 Nas Chung 2025-02-10  258  	struct v4l2_m2m_buffer *v4l2_m2m_buf;
de204321b54004 Nas Chung 2025-02-10  259  	struct vpu_buffer *vpu_buf;
de204321b54004 Nas Chung 2025-02-10  260  	dma_addr_t buf_addr_y, buf_addr_cb, buf_addr_cr;
de204321b54004 Nas Chung 2025-02-10 @261  	u32 buf_size;
de204321b54004 Nas Chung 2025-02-10  262  	u32 fb_stride = inst->dst_fmt.plane_fmt[0].bytesperline;
de204321b54004 Nas Chung 2025-02-10  263  	u32 luma_size = fb_stride * inst->dst_fmt.height;
de204321b54004 Nas Chung 2025-02-10  264  	u32 chroma_size = (fb_stride / 2) * (inst->dst_fmt.height / 2);
de204321b54004 Nas Chung 2025-02-10  265  	struct frame_buffer disp_buffer = {0};
de204321b54004 Nas Chung 2025-02-10  266  	struct dec_initial_info initial_info = {0};
de204321b54004 Nas Chung 2025-02-10  267  	int consumed_num = wave6_vpu_get_consumed_fb_num(inst);
de204321b54004 Nas Chung 2025-02-10  268  	int ret;
de204321b54004 Nas Chung 2025-02-10  269  
de204321b54004 Nas Chung 2025-02-10  270  	wave6_vpu_dec_give_command(inst, DEC_GET_SEQ_INFO, &initial_info);
de204321b54004 Nas Chung 2025-02-10  271  
de204321b54004 Nas Chung 2025-02-10  272  	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
de204321b54004 Nas Chung 2025-02-10  273  		dst_buf = &v4l2_m2m_buf->vb;
de204321b54004 Nas Chung 2025-02-10  274  		vpu_buf = wave6_to_vpu_buf(dst_buf);
de204321b54004 Nas Chung 2025-02-10  275  
de204321b54004 Nas Chung 2025-02-10  276  		if (vpu_buf->consumed)
de204321b54004 Nas Chung 2025-02-10  277  			continue;
de204321b54004 Nas Chung 2025-02-10  278  
de204321b54004 Nas Chung 2025-02-10  279  		if (consumed_num >= WAVE6_MAX_FBS)
de204321b54004 Nas Chung 2025-02-10  280  			break;
de204321b54004 Nas Chung 2025-02-10  281  
de204321b54004 Nas Chung 2025-02-10  282  		if (inst->dst_fmt.num_planes == 1) {
de204321b54004 Nas Chung 2025-02-10  283  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
de204321b54004 Nas Chung 2025-02-10  284  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  285  			buf_addr_cb = buf_addr_y + luma_size;
de204321b54004 Nas Chung 2025-02-10  286  			buf_addr_cr = buf_addr_cb + chroma_size;
de204321b54004 Nas Chung 2025-02-10  287  		} else if (inst->dst_fmt.num_planes == 2) {
de204321b54004 Nas Chung 2025-02-10  288  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
de204321b54004 Nas Chung 2025-02-10  289  				   vb2_plane_size(&dst_buf->vb2_buf, 1);
de204321b54004 Nas Chung 2025-02-10  290  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  291  			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
de204321b54004 Nas Chung 2025-02-10  292  			buf_addr_cr = buf_addr_cb + chroma_size;
de204321b54004 Nas Chung 2025-02-10  293  		} else if (inst->dst_fmt.num_planes == 3) {
de204321b54004 Nas Chung 2025-02-10  294  			buf_size = vb2_plane_size(&dst_buf->vb2_buf, 0) +
de204321b54004 Nas Chung 2025-02-10  295  				   vb2_plane_size(&dst_buf->vb2_buf, 1) +
de204321b54004 Nas Chung 2025-02-10  296  				   vb2_plane_size(&dst_buf->vb2_buf, 2);
de204321b54004 Nas Chung 2025-02-10  297  			buf_addr_y = wave6_get_dma_addr(dst_buf, 0);
de204321b54004 Nas Chung 2025-02-10  298  			buf_addr_cb = wave6_get_dma_addr(dst_buf, 1);
de204321b54004 Nas Chung 2025-02-10  299  			buf_addr_cr = wave6_get_dma_addr(dst_buf, 2);
de204321b54004 Nas Chung 2025-02-10  300  		}
de204321b54004 Nas Chung 2025-02-10  301  		disp_buffer.buf_y = buf_addr_y;
de204321b54004 Nas Chung 2025-02-10  302  		disp_buffer.buf_cb = buf_addr_cb;
de204321b54004 Nas Chung 2025-02-10  303  		disp_buffer.buf_cr = buf_addr_cr;
de204321b54004 Nas Chung 2025-02-10  304  		disp_buffer.width = inst->src_fmt.width;
de204321b54004 Nas Chung 2025-02-10  305  		disp_buffer.height = inst->src_fmt.height;
de204321b54004 Nas Chung 2025-02-10  306  		disp_buffer.stride = fb_stride;
de204321b54004 Nas Chung 2025-02-10  307  		disp_buffer.map_type = LINEAR_FRAME_MAP;
de204321b54004 Nas Chung 2025-02-10  308  		disp_buffer.luma_bitdepth = initial_info.luma_bitdepth;
de204321b54004 Nas Chung 2025-02-10  309  		disp_buffer.chroma_bitdepth = initial_info.chroma_bitdepth;
de204321b54004 Nas Chung 2025-02-10  310  		disp_buffer.chroma_format_idc = initial_info.chroma_format_idc;
de204321b54004 Nas Chung 2025-02-10  311  
de204321b54004 Nas Chung 2025-02-10  312  		ret = wave6_vpu_dec_register_display_buffer_ex(inst, disp_buffer);
de204321b54004 Nas Chung 2025-02-10  313  		if (ret) {
de204321b54004 Nas Chung 2025-02-10  314  			dev_err(inst->dev->dev, "fail register display buffer %d", ret);
de204321b54004 Nas Chung 2025-02-10  315  			break;
de204321b54004 Nas Chung 2025-02-10  316  		}
de204321b54004 Nas Chung 2025-02-10  317  
de204321b54004 Nas Chung 2025-02-10  318  		vpu_buf->consumed = true;
de204321b54004 Nas Chung 2025-02-10  319  		consumed_num++;
de204321b54004 Nas Chung 2025-02-10  320  	}
de204321b54004 Nas Chung 2025-02-10  321  }
de204321b54004 Nas Chung 2025-02-10  322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

