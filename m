Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBA940DA4A
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 14:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239708AbhIPMuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 08:50:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:43429 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239589AbhIPMuL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 08:50:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209644848"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="gz'50?scan'50,208,50";a="209644848"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 05:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="gz'50?scan'50,208,50";a="553907031"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2021 05:48:46 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mQqoo-000147-3i; Thu, 16 Sep 2021 12:48:46 +0000
Date:   Thu, 16 Sep 2021 20:48:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     kbuild-all@lists.01.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/6] staging: media: wave5: Add the v4l2 layer
Message-ID: <202109162020.3hqzQ82c-lkp@intel.com>
References: <20210915162324.25513-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20210915162324.25513-4-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dafna,

I love your patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Dafna-Hirschfeld/staging-media-wave5-add-wave5-codec-driver/20210916-002552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git 5e57c668dc097c6c27c973504706edec53f79281
config: csky-randconfig-r033-20210916 (attached as .config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/99e6d1e51b84739f614c6ae5a772b04671bad9ba
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dafna-Hirschfeld/staging-media-wave5-add-wave5-codec-driver/20210916-002552
        git checkout 99e6d1e51b84739f614c6ae5a772b04671bad9ba
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=csky 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/kfifo.h:39,
                    from drivers/staging/media/wave5/vpuapi/vpuapi.h:11,
                    from drivers/staging/media/wave5/vpuapi/vpuapi.c:9:
   arch/csky/include/asm/bitops.h:77: warning: "__clear_bit" redefined
      77 | #define __clear_bit(nr, vaddr) clear_bit(nr, vaddr)
         | 
   In file included from arch/csky/include/asm/bitops.h:76,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/kfifo.h:39,
                    from drivers/staging/media/wave5/vpuapi/vpuapi.h:11,
                    from drivers/staging/media/wave5/vpuapi/vpuapi.c:9:
   include/asm-generic/bitops/non-atomic.h:34: note: this is the location of the previous definition
      34 | #define __clear_bit arch___clear_bit
         | 
   drivers/staging/media/wave5/vpuapi/vpuapi.c: In function 'vpu_dec_get_bitstream_buffer':
>> drivers/staging/media/wave5/vpuapi/vpuapi.c:323:26: warning: variable 'p_attr' set but not used [-Wunused-but-set-variable]
     323 |         struct vpu_attr *p_attr;
         |                          ^~~~~~
   drivers/staging/media/wave5/vpuapi/vpuapi.c: In function 'vpu_enc_register_frame_buffer':
>> drivers/staging/media/wave5/vpuapi/vpuapi.c:824:32: warning: variable 'open_param' set but not used [-Wunused-but-set-variable]
     824 |         struct enc_open_param *open_param;
         |                                ^~~~~~~~~~
--
   In file included from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/staging/media/wave5/vdi/vdi.h:13,
                    from drivers/staging/media/wave5/vdi/vdi.c:8:
   arch/csky/include/asm/bitops.h:77: warning: "__clear_bit" redefined
      77 | #define __clear_bit(nr, vaddr) clear_bit(nr, vaddr)
         | 
   In file included from arch/csky/include/asm/bitops.h:76,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from drivers/staging/media/wave5/vdi/vdi.h:13,
                    from drivers/staging/media/wave5/vdi/vdi.c:8:
   include/asm-generic/bitops/non-atomic.h:34: note: this is the location of the previous definition
      34 | #define __clear_bit arch___clear_bit
         | 
>> drivers/staging/media/wave5/vdi/vdi.c:239:6: warning: no previous prototype for 'byte_swap' [-Wmissing-prototypes]
     239 | void byte_swap(unsigned char *data, int len)
         |      ^~~~~~~~~
>> drivers/staging/media/wave5/vdi/vdi.c:251:6: warning: no previous prototype for 'word_swap' [-Wmissing-prototypes]
     251 | void word_swap(unsigned char *data, int len)
         |      ^~~~~~~~~
>> drivers/staging/media/wave5/vdi/vdi.c:264:6: warning: no previous prototype for 'dword_swap' [-Wmissing-prototypes]
     264 | void dword_swap(unsigned char *data, int len)
         |      ^~~~~~~~~~
>> drivers/staging/media/wave5/vdi/vdi.c:277:6: warning: no previous prototype for 'lword_swap' [-Wmissing-prototypes]
     277 | void lword_swap(unsigned char *data, int len)
         |      ^~~~~~~~~~
--
   In file included from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/media/v4l2-ctrls.h:11,
                    from drivers/staging/media/wave5/v4l2/vpu.h:10,
                    from drivers/staging/media/wave5/v4l2/vpu_enc.h:10,
                    from drivers/staging/media/wave5/v4l2/vpu_enc.c:7:
   arch/csky/include/asm/bitops.h:77: warning: "__clear_bit" redefined
      77 | #define __clear_bit(nr, vaddr) clear_bit(nr, vaddr)
         | 
   In file included from arch/csky/include/asm/bitops.h:76,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/media/v4l2-ctrls.h:11,
                    from drivers/staging/media/wave5/v4l2/vpu.h:10,
                    from drivers/staging/media/wave5/v4l2/vpu_enc.h:10,
                    from drivers/staging/media/wave5/v4l2/vpu_enc.c:7:
   include/asm-generic/bitops/non-atomic.h:34: note: this is the location of the previous definition
      34 | #define __clear_bit arch___clear_bit
         | 
   drivers/staging/media/wave5/v4l2/vpu_enc.c: In function 'to_vpu_codstd':
>> drivers/staging/media/wave5/v4l2/vpu_enc.c:84:24: warning: implicit conversion from 'enum wave_std' to 'enum cod_std' [-Wenum-conversion]
      84 |                 return W_AVC_ENC;
         |                        ^~~~~~~~~
   drivers/staging/media/wave5/v4l2/vpu_enc.c:86:24: warning: implicit conversion from 'enum wave_std' to 'enum cod_std' [-Wenum-conversion]
      86 |                 return W_HEVC_ENC;
         |                        ^~~~~~~~~~
   drivers/staging/media/wave5/v4l2/vpu_enc.c:88:24: warning: implicit conversion from 'enum wave_std' to 'enum cod_std' [-Wenum-conversion]
      88 |                 return STD_UNKNOWN;
         |                        ^~~~~~~~~~~
   drivers/staging/media/wave5/v4l2/vpu_enc.c: In function 'vpu_enc_queue_setup':
>> drivers/staging/media/wave5/v4l2/vpu_enc.c:1150:27: warning: implicit conversion from 'enum cod_std' to 'enum wave_std' [-Wenum-conversion]
    1150 |                 inst->std = to_vpu_codstd(inst->dst_fmt.pixelformat);
         |                           ^


vim +/open_param +824 drivers/staging/media/wave5/vpuapi/vpuapi.c

77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  818  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  819  enum ret_code vpu_enc_register_frame_buffer(struct vpu_instance *inst, int num, int stride,
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  820  					    int height, enum tiled_map_type map_type)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  821  {
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  822  	struct enc_info *p_enc_info;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  823  	enum ret_code         ret;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15 @824  	struct enc_open_param *open_param;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  825  	struct frame_buffer *fb;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  826  	struct vpu_device *vpu_dev = inst->dev;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  827  	u32 size_luma, size_chroma;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  828  	int i;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  829  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  830  	p_enc_info = &inst->codec_info->enc_info;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  831  	open_param = &p_enc_info->open_param;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  832  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  833  	if (p_enc_info->stride)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  834  		return RETCODE_CALLED_BEFORE;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  835  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  836  	if (!p_enc_info->initial_info_obtained)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  837  		return RETCODE_WRONG_CALL_SEQUENCE;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  838  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  839  	if (num < p_enc_info->initial_info.min_frame_buffer_count)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  840  		return RETCODE_INSUFFICIENT_FRAME_BUFFERS;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  841  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  842  	if (stride == 0 || (stride % 8 != 0) || stride < 0)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  843  		return RETCODE_INVALID_STRIDE;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  844  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  845  	if (height == 0 || height < 0)
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  846  		return RETCODE_INVALID_PARAM;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  847  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  848  	if (mutex_lock_interruptible(&vpu_dev->hw_lock))
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  849  		return RETCODE_FAILURE;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  850  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  851  	p_enc_info->num_frame_buffers   = num;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  852  	p_enc_info->stride            = stride;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  853  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  854  	fb = inst->frame_buf;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  855  	size_luma   = stride * height;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  856  	size_chroma = ALIGN(stride / 2, 16) * height;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  857  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  858  	for (i = 0; i < num; i++) {
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  859  		if (fb[i].update_fb_info) {
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  860  			fb[i].update_fb_info = FALSE;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  861  			fb[i].stride         = stride;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  862  			fb[i].height         = height;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  863  			fb[i].map_type        = COMPRESSED_FRAME_MAP;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  864  			fb[i].cbcr_interleave = true;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  865  			fb[i].endian         = VDI_128BIT_LITTLE_ENDIAN;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  866  			fb[i].buf_y_size       = size_luma;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  867  			fb[i].buf_cb          = fb[i].buf_y + size_luma;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  868  			fb[i].buf_cb_size      = size_chroma;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  869  			fb[i].buf_cr_size      = 0;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  870  		}
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  871  	}
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  872  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  873  	ret = wave5_vpu_enc_register_framebuffer(inst->dev->dev, inst, &fb[0],
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  874  						 COMPRESSED_FRAME_MAP, p_enc_info->num_frame_buffers);
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  875  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  876  	mutex_unlock(&vpu_dev->hw_lock);
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  877  
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  878  	return ret;
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  879  }
77ec4cac6e8198 Dafna Hirschfeld 2021-09-15  880  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--ReaqsoxgOBHFXBhH
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ZMulVjrnkgfRyRidU7j/B/zacsg0+AEA

--ReaqsoxgOBHFXBhH--
