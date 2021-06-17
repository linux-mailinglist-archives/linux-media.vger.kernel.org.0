Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7FB3AB358
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 14:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhFQMQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 08:16:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:5027 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbhFQMQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 08:16:46 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5LT83Bk1zXdNZ;
        Thu, 17 Jun 2021 20:09:32 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 20:14:35 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 20:14:34 +0800
Subject: Re: [PATCH -next v3] media: staging: atomisp: use list_splice_init in
 atomisp_compat_css20.c
To:     kernel test robot <lkp@intel.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <kaixuxia@tencent.com>,
        <gustavoars@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC:     <kbuild-all@lists.01.org>, <weiyongjun1@huawei.com>
References: <20210611081004.1348026-1-libaokun1@huawei.com>
 <202106171617.BN97N8mw-lkp@intel.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <d39a3cb0-4024-4abe-ad28-937fee53bc98@huawei.com>
Date:   Thu, 17 Jun 2021 20:14:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <202106171617.BN97N8mw-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, I only tested it with 'x86_64.config'.

I'm about to send a patch v4 with the changes to fix the error under 
your config.

Best Regards.


在 2021/6/17 16:52, kernel test robot 写道:
> Hi Baokun,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on next-20210616]
>
> url:    https://github.com/0day-ci/linux/commits/Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
> base:    c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>          # https://github.com/0day-ci/linux/commit/05c714d7b4e1722a75f949e40c5305f3ba28d048
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Baokun-Li/media-staging-atomisp-use-list_splice_init-in-atomisp_compat_css20-c/20210617-043443
>          git checkout 05c714d7b4e1722a75f949e40c5305f3ba28d048
>          # save the attached .config to linux build tree
>          make W=1 ARCH=i386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function 'atomisp_css_stop':
>>> drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2156:50: error: 'struct atomisp_sub_device' has no member named 'asd'
>      2156 |   list_splice_init(&asd->metadata_in_css[i], &asd->asd->metadata[i]);
>           |                                                  ^~
>     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2157:49: error: 'struct atomisp_sub_device' has no member named 'asd'
>      2157 |   list_splice_init(&asd->metadata_ready[i], &asd->asd->metadata[i]);
>           |                                                 ^~
>     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2107:31: warning: unused variable 'md_buf' [-Wunused-variable]
>      2107 |  struct atomisp_metadata_buf *md_buf;
>           |                               ^~~~~~
>     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2106:26: warning: unused variable 'dis_buf' [-Wunused-variable]
>      2106 |  struct atomisp_dis_buf *dis_buf;
>           |                          ^~~~~~~
>     drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:2105:26: warning: unused variable 's3a_buf' [-Wunused-variable]
>      2105 |  struct atomisp_s3a_buf *s3a_buf;
>           |                          ^~~~~~~
>
>
> vim +2156 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
>
>    2100	
>    2101	void atomisp_css_stop(struct atomisp_sub_device *asd,
>    2102			      enum ia_css_pipe_id pipe_id, bool in_reset)
>    2103	{
>    2104		struct atomisp_device *isp = asd->isp;
>    2105		struct atomisp_s3a_buf *s3a_buf;
>    2106		struct atomisp_dis_buf *dis_buf;
>    2107		struct atomisp_metadata_buf *md_buf;
>    2108		unsigned long irqflags;
>    2109		unsigned int i;
>    2110	
>    2111		/* if is called in atomisp_reset(), force destroy stream */
>    2112		if (__destroy_streams(asd, true))
>    2113			dev_err(isp->dev, "destroy stream failed.\n");
>    2114	
>    2115		/* if is called in atomisp_reset(), force destroy all pipes */
>    2116		if (__destroy_pipes(asd, true))
>    2117			dev_err(isp->dev, "destroy pipes failed.\n");
>    2118	
>    2119		atomisp_init_raw_buffer_bitmap(asd);
>    2120	
>    2121		/*
>    2122		 * SP can not be stop if other streams are in use
>    2123		 */
>    2124		if (atomisp_streaming_count(isp) == 0)
>    2125			ia_css_stop_sp();
>    2126	
>    2127		if (!in_reset) {
>    2128			struct atomisp_stream_env *stream_env;
>    2129			int i, j;
>    2130	
>    2131			for (i = 0; i < ATOMISP_INPUT_STREAM_NUM; i++) {
>    2132				stream_env = &asd->stream_env[i];
>    2133				for (j = 0; j < IA_CSS_PIPE_ID_NUM; j++) {
>    2134					ia_css_pipe_config_defaults(
>    2135					    &stream_env->pipe_configs[j]);
>    2136					ia_css_pipe_extra_config_defaults(
>    2137					    &stream_env->pipe_extra_configs[j]);
>    2138				}
>    2139				ia_css_stream_config_defaults(
>    2140				    &stream_env->stream_config);
>    2141			}
>    2142			memset(&asd->params.config, 0, sizeof(asd->params.config));
>    2143			asd->params.css_update_params_needed = false;
>    2144		}
>    2145	
>    2146		/* move stats buffers to free queue list */
>    2147		list_splice_init(&asd->s3a_stats_in_css, &asd->s3a_stats);
>    2148		list_splice_init(&asd->s3a_stats_ready, &asd->s3a_stats);
>    2149	
>    2150		spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
>    2151		list_splice_init(&asd->dis_stats_in_css, &asd->dis_stats);
>    2152		asd->params.dis_proj_data_valid = false;
>    2153		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
>    2154	
>    2155		for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
>> 2156			list_splice_init(&asd->metadata_in_css[i], &asd->asd->metadata[i]);
>    2157			list_splice_init(&asd->metadata_ready[i], &asd->asd->metadata[i]);
>    2158		}
>    2159	
>    2160		atomisp_flush_params_queue(&asd->video_out_capture);
>    2161		atomisp_flush_params_queue(&asd->video_out_vf);
>    2162		atomisp_flush_params_queue(&asd->video_out_preview);
>    2163		atomisp_flush_params_queue(&asd->video_out_video_capture);
>    2164		atomisp_free_css_parameters(&asd->params.css_param);
>    2165		memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
>    2166	}
>    2167	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
