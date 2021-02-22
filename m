Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205003220E3
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 21:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhBVUoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 15:44:08 -0500
Received: from mga01.intel.com ([192.55.52.88]:11080 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhBVUoF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 15:44:05 -0500
IronPort-SDR: lzIQLh9LkF5swvURmAIPfHLE5monsisWGqabujImPGpfMKoaN6NpWaTTuZXUIgKS4WiVKERzi2
 GhvYSrCkp5aA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="203995750"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; 
   d="gz'50?scan'50,208,50";a="203995750"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 12:43:20 -0800
IronPort-SDR: HqbvVIm/LYHpykD54RWn6yv6jjC5wTY6PjFlA75sIdIlLDP18tEj6ycmJchi2jOqya6sMrtxEc
 dQ5jqVcgU00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; 
   d="gz'50?scan'50,208,50";a="430390671"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2021 12:43:16 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lEI31-0000ei-Vp; Mon, 22 Feb 2021 20:43:15 +0000
Date:   Tue, 23 Feb 2021 04:42:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mirela Rabulea <mirela.rabulea@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, shawnguo@kernel.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     kbuild-all@lists.01.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v8 3/9] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Message-ID: <202102230417.oa0KWgTL-lkp@intel.com>
References: <20210222190738.2346378-4-mirela.rabulea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline
In-Reply-To: <20210222190738.2346378-4-mirela.rabulea@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mirela,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on robh/for-next linus/master v5.11 next-20210222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mirela-Rabulea/Add-V4L2-driver-for-i-MX8-JPEG-Encoder-Decoder/20210223-031832
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-s001-20210222 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-229-g60c1f270-dirty
        # https://github.com/0day-ci/linux/commit/6e821067180472a0ae64a91440bd234c86040310
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mirela-Rabulea/Add-V4L2-driver-for-i-MX8-JPEG-Encoder-Decoder/20210223-031832
        git checkout 6e821067180472a0ae64a91440bd234c86040310
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:16,
                    from drivers/media/platform/imx-jpeg/mxc-jpeg.c:43:
   drivers/media/platform/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_config_enc_desc':
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:891:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     891 |  dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:129:15: note: in definition of macro '__dynamic_func_call'
     129 |   func(&id, ##__VA_ARGS__);  \
         |               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:161:2: note: in expansion of macro '_dynamic_func_call'
     161 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:2: note: in expansion of macro 'dynamic_dev_dbg'
     123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:23: note: in expansion of macro 'dev_fmt'
     123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                       ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:891:2: note: in expansion of macro 'dev_dbg'
     891 |  dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
         |  ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:891:38: note: format string is defined here
     891 |  dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
         |                                   ~~~^
         |                                      |
         |                                      long long unsigned int
         |                                   %x
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:16,
                    from drivers/media/platform/imx-jpeg/mxc-jpeg.c:43:
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:893:21: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     893 |  dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:129:15: note: in definition of macro '__dynamic_func_call'
     129 |   func(&id, ##__VA_ARGS__);  \
         |               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:161:2: note: in expansion of macro '_dynamic_func_call'
     161 |  _dynamic_func_call(fmt,__dynamic_dev_dbg,   \
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:2: note: in expansion of macro 'dynamic_dev_dbg'
     123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:23: note: in expansion of macro 'dev_fmt'
     123 |  dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                       ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:893:2: note: in expansion of macro 'dev_dbg'
     893 |  dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
         |  ^~~~~~~
   drivers/media/platform/imx-jpeg/mxc-jpeg.c:893:38: note: format string is defined here
     893 |  dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
         |                                   ~~~^
         |                                      |
         |                                      long long unsigned int
         |                                   %x
   drivers/media/platform/imx-jpeg/mxc-jpeg.c: In function 'mxc_jpeg_probe':
>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:2086:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2086 |  mode = (int)(u64)of_id->data;
         |              ^


vim +891 drivers/media/platform/imx-jpeg/mxc-jpeg.c

   840	
   841	static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
   842					     struct mxc_jpeg_ctx *ctx,
   843					     struct vb2_buffer *src_buf,
   844					     struct vb2_buffer *dst_buf)
   845	{
   846		struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
   847		void __iomem *reg = jpeg->base_reg;
   848		unsigned int slot = ctx->slot;
   849		struct mxc_jpeg_desc *desc = jpeg->slot_data[slot].desc;
   850		struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data[slot].cfg_desc;
   851		dma_addr_t desc_handle = jpeg->slot_data[slot].desc_handle;
   852		dma_addr_t cfg_desc_handle = jpeg->slot_data[slot].cfg_desc_handle;
   853		void *cfg_stream_vaddr = jpeg->slot_data[slot].cfg_stream_vaddr;
   854		struct mxc_jpeg_q_data *q_data;
   855		enum mxc_jpeg_image_format img_fmt;
   856		int w, h;
   857	
   858		q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
   859	
   860		jpeg->slot_data[slot].cfg_stream_size =
   861				mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
   862							  q_data->fmt->fourcc,
   863							  q_data->w_adjusted,
   864							  q_data->h_adjusted);
   865	
   866		/* chain the config descriptor with the encoding descriptor */
   867		cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
   868	
   869		cfg_desc->buf_base0 = jpeg->slot_data[slot].cfg_stream_handle;
   870		cfg_desc->buf_base1 = 0;
   871		cfg_desc->line_pitch = 0;
   872		cfg_desc->stm_bufbase = 0; /* no output expected */
   873		cfg_desc->stm_bufsize = 0x0;
   874		cfg_desc->imgsize = 0;
   875		cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
   876	
   877		desc->next_descpt_ptr = 0; /* end of chain */
   878	
   879		/* use adjusted resolution for CAST IP job */
   880		w = q_data->w_adjusted;
   881		h = q_data->h_adjusted;
   882		mxc_jpeg_set_res(desc, w, h);
   883		mxc_jpeg_set_line_pitch(desc, w * (q_data->fmt->depth / 8));
   884		mxc_jpeg_set_bufsize(desc, desc->line_pitch * h);
   885		img_fmt = mxc_jpeg_fourcc_to_imgfmt(q_data->fmt->fourcc);
   886		if (img_fmt == MXC_JPEG_INVALID)
   887			dev_err(jpeg->dev, "No valid image format detected\n");
   888		desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
   889				 STM_CTRL_IMAGE_FORMAT(img_fmt);
   890		mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
 > 891		dev_dbg(jpeg->dev, "cfg_desc - 0x%llx:\n", cfg_desc_handle);
   892		print_descriptor_info(jpeg->dev, cfg_desc);
   893		dev_dbg(jpeg->dev, "enc desc - 0x%llx:\n", desc_handle);
   894		print_descriptor_info(jpeg->dev, desc);
   895		print_wrapper_info(jpeg->dev, reg);
   896		print_cast_status(jpeg->dev, reg, MXC_JPEG_ENCODE);
   897	
   898		/* validate the configuration descriptor */
   899		mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
   900	}
   901	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--cWoXeonUoKmBZSoM
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
C4tssEKZl1p5Anduvsp4kf8BCZ6WzJoRAgA=

--cWoXeonUoKmBZSoM--
