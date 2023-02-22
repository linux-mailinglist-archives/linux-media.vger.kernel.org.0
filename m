Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414DF69EDE3
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 05:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjBVETI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 23:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjBVETH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 23:19:07 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4D44EFE
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 20:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677039545; x=1708575545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=foVqbNwsSaT/XbSq2L56LbM/ErXYBob5z7eeWcgIvMs=;
  b=n4FwRSvE+e09VXw8q1yqFxE8Qenb+DymE0uEPpOFQrsV5dV8U+7GzQZg
   TXxnw/7j2d52SmtusrzrcTMgjhsWF9AcWexeMCHnUdFeG5ZxcNw2HORRB
   A+w8gGqzr6AlDCFStbHw8ccqKS7rpUggkxjlljrQueDI0iIEiGDOCOArq
   lofl84OsnGPPayaolf0du1DioTAR2CO58O35lAtUO5LjnKysMPZ/qtdaj
   0u/5a5Ws7JF+Yd8JiXso4BooJa7qi39EZV945j8BPa+SXUc2yKB66UP63
   pMoqtUmLY+wtXcS/67KdTMae9h5Q04d5lLldhM1MqQjud6tCXMWRAXl0Z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="395314723"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="395314723"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 20:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000851954"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="1000851954"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 20:19:00 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pUgaq-0000bB-0u;
        Wed, 22 Feb 2023 04:19:00 +0000
Date:   Wed, 22 Feb 2023 12:18:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
Message-ID: <202302221210.tOVPwauV-lkp@intel.com>
References: <20230221145906.8113-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[cannot apply to linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-Remove-depth-mode-support/20230221-230417
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230221145906.8113-3-hdegoede%40redhat.com
patch subject: [PATCH 02/10] media: atomisp: Remove continuous mode support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302221210.tOVPwauV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/130cc40ea8b4d6e5d3a752313fcffe29b63c46a5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hans-de-Goede/media-atomisp-Remove-depth-mode-support/20230221-230417
        git checkout 130cc40ea8b4d6e5d3a752313fcffe29b63c46a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/media/atomisp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221210.tOVPwauV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_get_dvs2_bq_resolutions':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:1919:44: warning: variable 'input_config' set but not used [-Wunused-but-set-variable]
    1919 |         struct ia_css_stream_input_config *input_config = NULL;
         |                                            ^~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/atomisp_cmd.c: In function 'atomisp_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4673:36: warning: variable 'isp_sink_fmt' set but not used [-Wunused-but-set-variable]
    4673 |         struct v4l2_mbus_framefmt *isp_sink_fmt;
         |                                    ^~~~~~~~~~~~


vim +/input_config +1919 drivers/staging/media/atomisp/pci/atomisp_cmd.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1910  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1911  /*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1912   * Function to get DVS2 BQ resolution settings
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1913   */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1914  int atomisp_get_dvs2_bq_resolutions(struct atomisp_sub_device *asd,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1915  				    struct atomisp_dvs2_bq_resolutions *bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1916  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1917  	struct ia_css_pipe_config *pipe_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1918  	struct ia_css_stream_config *stream_cfg = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19 @1919  	struct ia_css_stream_input_config *input_config = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1920  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1921  	struct ia_css_stream *stream =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1922  		    asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1923  	if (!stream) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1924  		dev_warn(asd->isp->dev, "stream is not created");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1925  		return -EAGAIN;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1926  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1927  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1928  	pipe_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
c01d5546773e3a drivers/staging/media/atomisp/pci/atomisp_cmd.c          Mauro Carvalho Chehab 2020-05-21  1929  		   .pipe_configs[IA_CSS_PIPE_ID_VIDEO];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1930  	stream_cfg = &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1931  		     .stream_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1932  	input_config = &stream_cfg->input_config;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1933  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1934  	if (!bq_res)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1935  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1936  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1937  	/* the GDC output resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1938  	bq_res->output_bq.width_bq = pipe_cfg->output_info[0].res.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1939  	bq_res->output_bq.height_bq = pipe_cfg->output_info[0].res.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1940  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1941  	bq_res->envelope_bq.width_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1942  	bq_res->envelope_bq.height_bq = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1943  	/* the GDC input resolution */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1944  	bq_res->source_bq.width_bq = bq_res->output_bq.width_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1945  				     pipe_cfg->dvs_envelope.width / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1946  	bq_res->source_bq.height_bq = bq_res->output_bq.height_bq +
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1947  				      pipe_cfg->dvs_envelope.height / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1948  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1949  	 * Bad pixels caused by spatial filter processing
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1950  	 * ISP filter resolution should be given by CSS/FW, but for now
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1951  	 * there is not such API to query, and it is fixed value, so
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1952  	 * hardcoded here.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1953  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1954  	bq_res->ispfilter_bq.width_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1955  	bq_res->ispfilter_bq.height_bq = 12 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1956  	/* spatial filter shift, always 4 pixels */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1957  	bq_res->gdc_shift_bq.width_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1958  	bq_res->gdc_shift_bq.height_bq = 4 / 2;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1959  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1960  	if (asd->params.video_dis_en) {
130cc40ea8b4d6 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1961  		bq_res->envelope_bq.width_bq = pipe_cfg->dvs_envelope.width / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1962  					       bq_res->ispfilter_bq.width_bq;
130cc40ea8b4d6 drivers/staging/media/atomisp/pci/atomisp_cmd.c          Hans de Goede         2023-02-21  1963  		bq_res->envelope_bq.height_bq = pipe_cfg->dvs_envelope.height / 2 -
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1964  						bq_res->ispfilter_bq.height_bq;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1965  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1966  
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1967  	dev_dbg(asd->isp->dev,
eaa399eb542cdf drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1968  		"source_bq.width_bq %d, source_bq.height_bq %d,\nispfilter_bq.width_bq %d, ispfilter_bq.height_bq %d,\ngdc_shift_bq.width_bq %d, gdc_shift_bq.height_bq %d,\nenvelope_bq.width_bq %d, envelope_bq.height_bq %d,\noutput_bq.width_bq %d, output_bq.height_bq %d\n",
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1969  		bq_res->source_bq.width_bq, bq_res->source_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1970  		bq_res->ispfilter_bq.width_bq, bq_res->ispfilter_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1971  		bq_res->gdc_shift_bq.width_bq, bq_res->gdc_shift_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1972  		bq_res->envelope_bq.width_bq, bq_res->envelope_bq.height_bq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1973  		bq_res->output_bq.width_bq, bq_res->output_bq.height_bq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1974  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1975  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1976  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c Mauro Carvalho Chehab 2020-04-19  1977  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
