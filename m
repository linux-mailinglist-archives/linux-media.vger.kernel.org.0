Return-Path: <linux-media+bounces-35541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC1AE2F5F
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 12:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 033877A88A3
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0411E1C07D9;
	Sun, 22 Jun 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pks8zNdb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93997347C7
	for <linux-media@vger.kernel.org>; Sun, 22 Jun 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750587934; cv=none; b=kBjHM8nwPgdwzTgBr2oR3nRrS1GMcM8DJDSnhT8rvaUX78ubVpH+W83cLSrg1z6q1jf1GqHhRjpzbFkXj6allhAZmB0TVIjQYfOJh+P3aO4uGwhRCHlKmTeItkIhwc7+yZ/phTYIakHk/GKDv3Ywp9a/AOQUckA2LVCGoC7ZiZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750587934; c=relaxed/simple;
	bh=TCPv6Ti1ftUrTRsBhy60VHOFbAQnuh6cgOVaKw3tQso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiOZ+Yoj5Xbfgr5Ij7qdMf/QXNW0OERw17qEVUfcaPykE+Z1kKR5Sf1I4+L12nJfonV6iJjZ+nzch43wzMVVu/brl/QMC6zH/CJKwRzVYSjo9atbrxyfQGTUc/PMhtU0LE7LD/yZXa+xiMI3tmkQkGkXNiHW7JXUM3B/jEkLQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pks8zNdb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750587933; x=1782123933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCPv6Ti1ftUrTRsBhy60VHOFbAQnuh6cgOVaKw3tQso=;
  b=Pks8zNdbja/Q5l7ksixUd8Ef9izaMSrkzxu/FAZAaZdmrEjnkgev9+20
   sxSeQosal8fulJ84WvyWdGRJ8LZE6rX6JQWaI+8wwQ32d9nYYj0owgqLw
   dV/NolQ3LhY85a4C1CrGZ4sJH5YEZ4bIG/VeN4RFoJDaBuQvjcgvcHItA
   6dKuNiyYdTpteGhlQX+lZuunfuM5lVdZ552R1yNvwW4nepDmnG7KxOyqz
   F84b0AidBrM6CcmHAIaBOSRLDloouQbJcKets3CnPz9/wHzXSs+s6SkSE
   HwfIKwiHu7MJiRzJ1aCflT8U8uMdB8qROQa2WwGusoNWvno2i09LTGFXd
   w==;
X-CSE-ConnectionGUID: A9LdVfhvQGayv0mOSsmuFg==
X-CSE-MsgGUID: hdxUrCcWQXeLJyyKnirHtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52947608"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52947608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 03:25:32 -0700
X-CSE-ConnectionGUID: CvNtXvQgQj6yZe2/CA0cTA==
X-CSE-MsgGUID: LSDquZ7oTnCe7U2KOFbn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="155632265"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2025 03:25:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTHtB-000NCk-0S;
	Sun, 22 Jun 2025 10:25:29 +0000
Date: Sun, 22 Jun 2025 18:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 74/78] drivers/media/i2c/imx219.c:898:3:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <202506221817.CDFFIVk9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   2eb7b0a1567fd0da91e70f762d8cf94af1ffd7f9
commit: 65722cd911646712bb021c04b233c1f79f788067 [74/78] media: imx219: Add support for generic raw formats
config: sparc64-randconfig-001-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221817.CDFFIVk9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221817.CDFFIVk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221817.CDFFIVk9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/imx219.c: In function 'imx219_enum_mbus_code':
>> drivers/media/i2c/imx219.c:898:3: error: a label can only be part of a statement and a declaration is not a statement
      const u32 img_codes[] = {
      ^~~~~


vim +898 drivers/media/i2c/imx219.c

   889	
   890	static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
   891					 struct v4l2_subdev_state *state,
   892					 struct v4l2_subdev_mbus_code_enum *code)
   893	{
   894		struct imx219 *imx219 = to_imx219(sd);
   895	
   896		switch (code->pad) {
   897		case IMX219_PAD_IMAGE:
 > 898			const u32 img_codes[] = {
   899				IMX219_NATIVE_FORMAT,
   900				MEDIA_BUS_FMT_RAW_10,
   901			};
   902	
   903			/* The internal image pad is hardwired to the native format. */
   904			if (code->index > ARRAY_SIZE(img_codes))
   905				return -EINVAL;
   906	
   907			code->code = img_codes[code->index];
   908			return 0;
   909	
   910		case IMX219_PAD_EDATA:
   911			if (code->index > 0)
   912				return -EINVAL;
   913	
   914			code->code = MEDIA_BUS_FMT_META_8;
   915			return 0;
   916	
   917		case IMX219_PAD_SOURCE:
   918		default:
   919			break;
   920		}
   921	
   922		/*
   923		 * On the source pad, the sensor supports multiple image raw formats
   924		 * with different bit depths. The embedded data format bit depth
   925		 * follows the image stream.
   926		 */
   927		if (code->stream == IMX219_STREAM_IMAGE) {
   928			u32 format;
   929	
   930			if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
   931				u32 idx = code->index - ARRAY_SIZE(imx219_mbus_formats);
   932				if (idx >= ARRAY_SIZE(imx219_mbus_formats_raw))
   933					return -EINVAL;
   934	
   935				format = imx219_mbus_formats_raw[idx];
   936			} else {
   937				format = imx219_mbus_formats[code->index * 4];
   938			}
   939			code->code = imx219_get_format_code(imx219, format);
   940		} else {
   941			struct v4l2_mbus_framefmt *fmt;
   942	
   943			if (code->index > 0)
   944				return -EINVAL;
   945	
   946			fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
   947							   IMX219_STREAM_EDATA);
   948			code->code = fmt->code;
   949		}
   950	
   951		return 0;
   952	}
   953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

