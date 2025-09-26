Return-Path: <linux-media+bounces-43233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D957BA27E0
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 08:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFA22A82D1
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 06:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E9727A92D;
	Fri, 26 Sep 2025 06:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7beQdu3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57260276047;
	Fri, 26 Sep 2025 06:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758866934; cv=none; b=U+S3+iPb4WjYJieVHqHZ1UP0TsVnRjGEhK4s6SvkUZJDYrcwLbba2E82kJdCUUA+eN4iWE4ieykJDTSaAzLEXYt1ufv9IjdKul17gnEc2Y0bSpui+hSJkCoYMnusLt7Fc/XCn86sFDrEu76dffUqDJEl1tMUojv8Ef+fiffksTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758866934; c=relaxed/simple;
	bh=MHK/UNMUroCGJT5JiELnrh3PnCYfmOqLIKfTXv/Yi2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCbT9UQBMWauFU4bXgCIFmuhZoJ9k+lNh5Dt5o7iXHpNDkMlbdlf+dTxL2JP6FiCxd+6Qvwv8l0MyVtIy9t7tUsblKPqiV5naJ+Ga0EX4QypRqwkFISatFgrYehn6Fw/zdUtScsENJKqnfoB7koArOeVRZaetwAYzMxG+IwBxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7beQdu3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758866932; x=1790402932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MHK/UNMUroCGJT5JiELnrh3PnCYfmOqLIKfTXv/Yi2U=;
  b=A7beQdu39Hv2Glj/TqauyFzvv8EBGzZyzl4WMocuSUh29OHfy5mvqTCG
   lOMmZ2sH161EDGs6NAi3tJEK01azRiddc9my6akKVsv+/Y4VA+ocTsoG6
   n7LOSs9CZlfreTIQ5rO+p8hLMz4jM+wnoIo4h+4KoIAOZGqzNItKfcQ2d
   HeFqebc0azm3/l7e+zHYa1qpbSaPk1AwGA2yvVRm9kq91BOp42XcNu8S3
   o/8SSr6nDnu2paEjIvY2BnGJIMgkMl0KpqhxPUyk+ErITWzOw8gBDLum7
   +n+EEOocVYQUOnEfHC84RiOmxlQ36JFZNwjDDxkC8RzC+waULMJE4Viw+
   w==;
X-CSE-ConnectionGUID: j3VLocSTSOqNaywIrfs8Qw==
X-CSE-MsgGUID: IDIgrNAdR8SJCND8U7oIvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65007345"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65007345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 23:08:52 -0700
X-CSE-ConnectionGUID: 5nu967bgSBqPcDjfGl7jNA==
X-CSE-MsgGUID: Mg0omiMNRHWHfbAvYnATqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="177091674"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Sep 2025 23:08:49 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v21dO-0005xN-16;
	Fri, 26 Sep 2025 06:08:46 +0000
Date: Fri, 26 Sep 2025 14:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] media: qcom: camss: tpg: Add TPG support for
 SA8775P and QCS8300
Message-ID: <202509261315.Ut2kQNiR-lkp@intel.com>
References: <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-camss_tpg-v4-3-d2eb099902c8@oss.qualcomm.com>

Hi Wenmeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on ce7f1a983b074f6cf8609068088ca3182c569ee4]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenmeng-Liu/media-qcom-camss-Add-support-for-TPG-common/20250925-083535
base:   ce7f1a983b074f6cf8609068088ca3182c569ee4
patch link:    https://lore.kernel.org/r/20250925-camss_tpg-v4-3-d2eb099902c8%40oss.qualcomm.com
patch subject: [PATCH v4 3/3] media: qcom: camss: tpg: Add TPG support for SA8775P and QCS8300
config: i386-buildonly-randconfig-005-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.Ut2kQNiR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.Ut2kQNiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.Ut2kQNiR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c:112:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |                 val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, input_format->height & 0xffff) |
         |                       ^
   drivers/media/platform/qcom/camss/camss-tpg-gen1.c:138:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     138 |         val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
         |               ^
>> drivers/media/platform/qcom/camss/camss-tpg-gen1.c:184:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |         hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
         |                  ^
   3 errors generated.


vim +/FIELD_PREP +112 drivers/media/platform/qcom/camss/camss-tpg-gen1.c

    86	
    87	#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
    88	#define TPG_HBI_CFG_DEFAULT			0x4701
    89	#define TPG_VBI_CFG_DEFAULT			0x438
    90	#define TPG_LFSR_SEED_DEFAULT			0x12345678
    91	#define TPG_COLOR_BARS_CFG_STANDARD \
    92		FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
    93	
    94	static int tpg_stream_on(struct tpg_device *tpg)
    95	{
    96		struct tpg_testgen_config *tg = &tpg->testgen;
    97		struct v4l2_mbus_framefmt *input_format;
    98		const struct tpg_format_info *format;
    99		u8 lane_cnt = tpg->res->lane_cnt;
   100		u8 dt_cnt = 0;
   101		u8 i;
   102		u32 val;
   103	
   104		/* Loop through all enabled VCs and configure stream for each */
   105		for (i = 0; i < tpg->res->vc_cnt; i++) {
   106			input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
   107			format = tpg_get_fmt_entry(tpg,
   108						   tpg->res->formats->formats,
   109						   tpg->res->formats->nformats,
   110						   input_format->code);
   111	
 > 112			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, input_format->height & 0xffff) |
   113			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, input_format->width & 0xffff);
   114			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
   115	
   116			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
   117			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
   118	
   119			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg->mode - 1) |
   120			      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
   121					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
   122			      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT, format->encode_format);
   123			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
   124	
   125			writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
   126	
   127			writel(TPG_HBI_CFG_DEFAULT, tpg->base + TPG_VC_n_HBI_CFG(i));
   128			writel(TPG_VBI_CFG_DEFAULT, tpg->base + TPG_VC_n_VBI_CFG(i));
   129	
   130			writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(i));
   131	
   132			/* configure one DT, infinite frames */
   133			val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
   134			      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
   135			writel(val, tpg->base + TPG_VC_n_CFG0(i));
   136		}
   137	
   138		val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
   139			  FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
   140			  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
   141			  FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
   142			  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
   143		writel(val, tpg->base + TPG_CTRL);
   144	
   145		return 0;
   146	}
   147	
   148	static void tpg_stream_off(struct tpg_device *tpg)
   149	{
   150		writel(0, tpg->base + TPG_CTRL);
   151		writel(1, tpg->base + TPG_CLEAR);
   152	}
   153	
   154	static void tpg_configure_stream(struct tpg_device *tpg, u8 enable)
   155	{
   156		if (enable)
   157			tpg_stream_on(tpg);
   158		else
   159			tpg_stream_off(tpg);
   160	}
   161	
   162	static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
   163	{
   164		if (val > 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
   165			tpg->testgen.mode = val;
   166	
   167		return 0;
   168	}
   169	
   170	/*
   171	 * tpg_hw_version - tpg hardware version query
   172	 * @tpg: tpg device
   173	 *
   174	 * Return HW version or error
   175	 */
   176	static u32 tpg_hw_version(struct tpg_device *tpg)
   177	{
   178		u32 hw_version;
   179		u32 hw_gen;
   180		u32 hw_rev;
   181		u32 hw_step;
   182	
   183		hw_version = readl(tpg->base + TPG_HW_VERSION);
 > 184		hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
   185		hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
   186		hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
   187		dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
   188			     hw_gen, hw_rev, hw_step);
   189	
   190		return hw_version;
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

