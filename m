Return-Path: <linux-media+bounces-27984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5CA5A65E
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 22:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712CA1718D2
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 21:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A81E47B3;
	Mon, 10 Mar 2025 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezDZRWFj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D21E25F9
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741643079; cv=none; b=bznbQEJy+tbuHk39Khqwhu24lDzImQSTZW4C3EZhGAT04kFDHt7NWeYbMt9M/hbJZZC7MCATox28xHeRBjLdKka9h0IbmAb2sF20j+3CTiY5rn+lnIAW0MYW2utqdwnACOj5a34rqFQ3yYS8AfV7AioktZQcptFTKtszXAMQI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741643079; c=relaxed/simple;
	bh=xFcD+WAS8JvggU+R6FqMm/oA/8bbDL1L5s7rvcehr1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHcjbizI7iV12xiAhuGhpBBzu5tDpNsfWnNjT38D0QZ4U8vgDEVPx88AjeYLJhddYJxThyU18z5Yb0qD0fGvZWmpXRLUTFZ+LZEGUlxOk7ejse/vRjfLWOjmKZ/3LSUU5hmKweuMWutP2KMvt8Zy2UpFf7/bQbpAHJR7DOCTdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezDZRWFj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741643077; x=1773179077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFcD+WAS8JvggU+R6FqMm/oA/8bbDL1L5s7rvcehr1Q=;
  b=ezDZRWFjzjrefCIltUPyRAobRjZAl4tqTdJraijNslHbH9OJLYmAKuzw
   bA5mgpV1ZT8qSitHMYAMDib72WSSGJG/lrdXB90hT01WKGut2w/rMjjFm
   D0ENa2sYWSdBv4BplZc4d65C80pyZIx7V/IckYAW77DM45bvdxBybE7if
   hAMOzRmP2/S7q0eTacZ6xcnj6BkzCVQA0+FGttMVJZ8xDFqWs0b3QL/7N
   WEXHV+PHDwruL6tJy83grPjbzxw4XMQyjnoOu0mgZjSudHgx5bsZXfCoC
   fDKw6LnFOLwcoAXHmnI/LfFZasMvpbfSbMgA920IWcLzo4HU4pUUt7qka
   g==;
X-CSE-ConnectionGUID: bFU7Tp5pRyWNLAdfJ2Ff7w==
X-CSE-MsgGUID: ZU2f3n2CQ1SRg0a997bzOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60065303"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="60065303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 14:44:37 -0700
X-CSE-ConnectionGUID: ibSaXHsCQnSnKzlQLfL5kw==
X-CSE-MsgGUID: ipuIL4ycQ3GMHWsrX9IWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120637791"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Mar 2025 14:44:35 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trkvI-000666-1F;
	Mon, 10 Mar 2025 21:44:32 +0000
Date: Tue, 11 Mar 2025 05:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 22/23]
 drivers/media/platform/atmel/atmel-isi.c:1075:27: warning: assignment to
 'const struct isi_format **' from 'int' makes pointer from integer without a
 cast
Message-ID: <202503110526.P3GrQ20d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
commit: 93c8dabd1d1ed94f03eb9a63c0bc291b62595bda [22/23] media: atmel-isi: use devm_kmemdup_array()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250311/202503110526.P3GrQ20d-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110526.P3GrQ20d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110526.P3GrQ20d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/atmel/atmel-isi.c: In function 'isi_formats_init':
   drivers/media/platform/atmel/atmel-isi.c:1075:29: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Werror=implicit-function-declaration]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                             ^~~~~~~~~~~~~~~~~~
         |                             devm_kmalloc_array
>> drivers/media/platform/atmel/atmel-isi.c:1075:27: warning: assignment to 'const struct isi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                           ^
   cc1: some warnings being treated as errors


vim +1075 drivers/media/platform/atmel/atmel-isi.c

  1043	
  1044	static int isi_formats_init(struct atmel_isi *isi)
  1045	{
  1046		const struct isi_format *isi_fmts[ARRAY_SIZE(isi_formats)];
  1047		unsigned int num_fmts = 0, i, j;
  1048		struct v4l2_subdev *subdev = isi->entity.subdev;
  1049		struct v4l2_subdev_mbus_code_enum mbus_code = {
  1050			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
  1051		};
  1052	
  1053		while (!v4l2_subdev_call(subdev, pad, enum_mbus_code,
  1054					 NULL, &mbus_code)) {
  1055			for (i = 0; i < ARRAY_SIZE(isi_formats); i++) {
  1056				if (isi_formats[i].mbus_code != mbus_code.code)
  1057					continue;
  1058	
  1059				/* Code supported, have we got this fourcc yet? */
  1060				for (j = 0; j < num_fmts; j++)
  1061					if (isi_fmts[j]->fourcc == isi_formats[i].fourcc)
  1062						/* Already available */
  1063						break;
  1064				if (j == num_fmts)
  1065					/* new */
  1066					isi_fmts[num_fmts++] = isi_formats + i;
  1067			}
  1068			mbus_code.index++;
  1069		}
  1070	
  1071		if (!num_fmts)
  1072			return -ENXIO;
  1073	
  1074		isi->num_user_formats = num_fmts;
> 1075		isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
  1076						       sizeof(isi_fmts[0]), GFP_KERNEL);
  1077		if (!isi->user_formats)
  1078			return -ENOMEM;
  1079	
  1080		isi->current_fmt = isi->user_formats[0];
  1081		return 0;
  1082	}
  1083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

