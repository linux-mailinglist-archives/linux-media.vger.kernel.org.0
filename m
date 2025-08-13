Return-Path: <linux-media+bounces-39709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793BB23DB1
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 03:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE641B628A7
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 01:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B79719F12A;
	Wed, 13 Aug 2025 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEKnXw2T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB72C0F8F;
	Wed, 13 Aug 2025 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755048642; cv=none; b=IM7Rr/KcdRqqr05ti4ciMzy9+Y2pydFdiDbl0eKMo5zdBZ4iqL6bHmyJCzvkSo+XekBwjFCHmu+YJjtBK4t3xOPhJeoXuib/QqKjFXBAX9hQmKYC8QGKxuWa3qPOgRfWeopx850XkkhXzsOWNArRtYUfLLjEX6eNaAoxakSKnJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755048642; c=relaxed/simple;
	bh=00kgvQ3E3mMUK4/2JuryhLdEXJ7T8Tc5ujqXa2qhFU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6QYRypZdvQvFyP/+xXswPJgmT5r2Z69RaxhRAm+4I261MZbNka9e87gn/X0MX2IfUgCr1NbJmFjDwB6XS2oHpfGbBp0XjHyUlN7XesesPXoDnoqZUzr52kbxrpzoR5mHIGEGkkZmBZdnqXFZmyJVpFfEXrOfb5qgYRE7cnk5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEKnXw2T; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755048641; x=1786584641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=00kgvQ3E3mMUK4/2JuryhLdEXJ7T8Tc5ujqXa2qhFU8=;
  b=nEKnXw2TI93l3pr2yxDJEd37GHrI+uaz4IiQPxcXCA7akMXe2et2pF1R
   ggIey+02Q6+k30BTK71P4ABH9at7RBbuwPAyj1ifPYUjjTAOgrEdJxero
   mbtU3r07i0HWluUiz3uwdD+z/iUxGFQscVu25rTDVDBj8nd0HrFyPpmv1
   FnNeHjBBTu7dKqfMUsA1AWlEQ0gleR/kBc/vluvA9FiuZgqSRNfFt3gXp
   GG2NOaM6ZZ3iC5QO5lJJ1fi8E7ybChzgGIGj4XQrn09eLvQk4zn+Dg1GY
   pMh1bHdGydXetrbWD17tt2xNlFwHGF2PSG6PjzDZTXBiPc6vrv8Rl7eC7
   w==;
X-CSE-ConnectionGUID: kIbx9KLtT+uS65wPWPgtww==
X-CSE-MsgGUID: /PAsk/T9QR2INrLM8QRUxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57397573"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57397573"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 18:30:39 -0700
X-CSE-ConnectionGUID: ZNLe2exQT++nQgiXoeHG6w==
X-CSE-MsgGUID: iyl/+SfOTQKjgNISXYJB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170544406"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2025 18:30:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um0JS-0009RE-2C;
	Wed, 13 Aug 2025 01:30:07 +0000
Date: Wed, 13 Aug 2025 09:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Smirnov <asmirnou@pinefeat.co.uk>, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aliaksandr Smirnou <support@pinefeat.co.uk>
Subject: Re: [PATCH v2 2/2] media/i2c: Pinefeat cef168 lens control board
 driver
Message-ID: <202508130917.FKIv8K4Z-lkp@intel.com>
References: <20250811213102.15703-3-aliaksandr.smirnou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811213102.15703-3-aliaksandr.smirnou@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Smirnov/dt-bindings-Pinefeat-cef168-lens-control-board/20250812-053441
base:   2b38afce25c4e1b8f943ff4f0a2b51d6c40f2ed2
patch link:    https://lore.kernel.org/r/20250811213102.15703-3-aliaksandr.smirnou%40gmail.com
patch subject: [PATCH v2 2/2] media/i2c: Pinefeat cef168 lens control board driver
config: arm64-randconfig-r132-20250813 (https://download.01.org/0day-ci/archive/20250813/202508130917.FKIv8K4Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250813/202508130917.FKIv8K4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130917.FKIv8K4Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/cef168.c:37:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   drivers/media/i2c/cef168.c:37:13: sparse:     expected unsigned short [usertype] val
   drivers/media/i2c/cef168.c:37:13: sparse:     got restricted __le16 [usertype]
>> drivers/media/i2c/cef168.c:76:32: sparse: sparse: cast to restricted __le16
>> drivers/media/i2c/cef168.c:76:32: sparse: sparse: cast to restricted __le16
>> drivers/media/i2c/cef168.c:76:32: sparse: sparse: cast to restricted __le16
>> drivers/media/i2c/cef168.c:76:32: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:77:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:77:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:77:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:77:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:78:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:78:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:78:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:78:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:79:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:79:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:79:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:79:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:80:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:80:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:80:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:80:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:81:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:81:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:81:39: sparse: sparse: cast to restricted __le16
   drivers/media/i2c/cef168.c:81:39: sparse: sparse: cast to restricted __le16
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32
>> drivers/media/i2c/cef168.c:133:30: sparse: sparse: cast to restricted __le32

vim +37 drivers/media/i2c/cef168.c

    31	
    32	static int cef168_i2c_write(struct cef168_device *cef168_dev, u8 cmd, u16 val)
    33	{
    34		struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
    35		int retry, ret;
    36	
  > 37		val = cpu_to_le16(val);
    38		char tx_data[4] = { cmd, (val & 0xff), (val >> 8) };
    39	
    40		tx_data[3] = crc8(cef168_crc8_table, tx_data, 3, CRC8_INIT_VALUE);
    41	
    42		for (retry = 0; retry < 3; retry++) {
    43			ret = i2c_master_send(client, tx_data, sizeof(tx_data));
    44			if (ret == sizeof(tx_data))
    45				return 0;
    46			else if (ret != -EIO && ret != -EREMOTEIO)
    47				break;
    48		}
    49	
    50		dev_err(&client->dev, "I2C write fail after %d retries, ret=%d\n",
    51			retry, ret);
    52		return -EIO;
    53	}
    54	
    55	static int cef168_i2c_read(struct cef168_device *cef168_dev,
    56				   struct cef168_data *rx_data)
    57	{
    58		struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
    59	
    60		int ret = i2c_master_recv(client, (char *)rx_data,
    61					  sizeof(struct cef168_data));
    62		if (ret != sizeof(struct cef168_data)) {
    63			dev_err(&client->dev, "I2C read fail, ret=%d\n", ret);
    64			return -EIO;
    65		}
    66	
    67		u8 computed_crc = crc8(cef168_crc8_table, (const u8 *)rx_data,
    68				       sizeof(struct cef168_data) - 1, CRC8_INIT_VALUE);
    69		if (computed_crc != rx_data->crc8) {
    70			dev_err(&client->dev,
    71				"CRC mismatch calculated=0x%02X read=0x%02X\n",
    72				computed_crc, rx_data->crc8);
    73			return -EIO;
    74		}
    75	
  > 76		rx_data->moving_time = le16_to_cpu(rx_data->moving_time);
    77		rx_data->focus_position_min = le16_to_cpu(rx_data->focus_position_min);
    78		rx_data->focus_position_max = le16_to_cpu(rx_data->focus_position_max);
    79		rx_data->focus_position_cur = le16_to_cpu(rx_data->focus_position_cur);
    80		rx_data->focus_distance_min = le16_to_cpu(rx_data->focus_distance_min);
    81		rx_data->focus_distance_max = le16_to_cpu(rx_data->focus_distance_max);
    82	
    83		return 0;
    84	}
    85	
    86	static int cef168_set_ctrl(struct v4l2_ctrl *ctrl)
    87	{
    88		struct cef168_device *dev = to_cef168(ctrl);
    89		u8 cmd;
    90	
    91		switch (ctrl->id) {
    92		case V4L2_CID_FOCUS_ABSOLUTE:
    93			return cef168_i2c_write(dev, INP_SET_FOCUS, ctrl->val);
    94		case V4L2_CID_FOCUS_RELATIVE:
    95			cmd = ctrl->val < 0 ? INP_SET_FOCUS_N : INP_SET_FOCUS_P;
    96			return cef168_i2c_write(dev, cmd, abs(ctrl->val));
    97		case V4L2_CID_IRIS_ABSOLUTE:
    98			return cef168_i2c_write(dev, INP_SET_APERTURE, ctrl->val);
    99		case V4L2_CID_IRIS_RELATIVE:
   100			cmd = ctrl->val < 0 ? INP_SET_APERTURE_N : INP_SET_APERTURE_P;
   101			return cef168_i2c_write(dev, cmd, abs(ctrl->val));
   102		case CEF168_V4L2_CID_CUSTOM(calibrate):
   103			return cef168_i2c_write(dev, INP_CALIBRATE, 0);
   104			return 0;
   105		}
   106	
   107		return -EINVAL;
   108	}
   109	
   110	static int cef168_get_ctrl(struct v4l2_ctrl *ctrl)
   111	{
   112		struct cef168_device *dev = to_cef168(ctrl);
   113		int rval;
   114	
   115		if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE &&
   116		    ctrl->id != CEF168_V4L2_CID_CUSTOM(data) &&
   117		    ctrl->id != CEF168_V4L2_CID_CUSTOM(focus_range) &&
   118		    ctrl->id != CEF168_V4L2_CID_CUSTOM(lens_id))
   119			return -EINVAL;
   120	
   121		struct cef168_data data;
   122	
   123		rval = cef168_i2c_read(dev, &data);
   124		if (rval < 0)
   125			return rval;
   126	
   127		switch (ctrl->id) {
   128		case V4L2_CID_FOCUS_ABSOLUTE:
   129			ctrl->val = data.focus_position_cur;
   130			return 0;
   131		case CEF168_V4L2_CID_CUSTOM(focus_range):
   132			ctrl->p_new.p_u32[0] =
 > 133				(u32)le32_to_cpu(((u32)data.focus_position_min << 16) |
   134						 data.focus_position_max);
   135			return 0;
   136		case CEF168_V4L2_CID_CUSTOM(lens_id):
   137			ctrl->p_new.p_u8[0] = data.lens_id;
   138			return 0;
   139		case CEF168_V4L2_CID_CUSTOM(data):
   140			memcpy(ctrl->p_new.p_u8, &data, sizeof(data));
   141			return 0;
   142		}
   143	
   144		return -EINVAL;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

