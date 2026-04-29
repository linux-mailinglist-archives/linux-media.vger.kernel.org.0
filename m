Return-Path: <linux-media+bounces-59909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IQWyIHmW8WkyigEAu9opvQ
	(envelope-from <linux-media+bounces-59909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:26:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16748F6AA
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91DC330329BB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 05:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE0F3890F7;
	Wed, 29 Apr 2026 05:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbYOEdpT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F733263E
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777440371; cv=none; b=IEoWWHiw/vJ0slVH7FoaroowAS+aL/WwpszCgZ97vSoN5gtIRyRWU5eF+jG5qW9sk33SCpebxqAlHxDpqJ8vEUpUPMVJHsz/EFCzv6JsbrIg+xJ9hAUkyq9akPetcLMqnxMPJZJIiIEnsv2AwU8MiBposTkkO58oeSk1b+binj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777440371; c=relaxed/simple;
	bh=iSTA9ut8ASNYA8HzP1hie6ztsu8wLv1j/2y4hcrj89M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=II4OW5C9W6xbNYlIzJOrc42PCfNLyvbZiDU/uMMcLG5U1SXVA8bXBoIxuFvgqrqiOvuVRFh+x4XytQHmlRg8TMuy7DR36lDRJ39C0+x63QlVu70NKnBhPPvLS4h90rjz9K9f6MC+d0kodRanxTTSNeN7YAe/O3WZFIPYbsOV6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hbYOEdpT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777440370; x=1808976370;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iSTA9ut8ASNYA8HzP1hie6ztsu8wLv1j/2y4hcrj89M=;
  b=hbYOEdpTxptXPKrsNewRB7qSUSMtz712u+m8qCr8UyrTSBVo/uIpRk6S
   BDWraOjz4TPVmDOuAkhkfR2HNnFWvS/L1OiB+s4hr9OPQ/t6uOyfkHxaN
   SRxXVodiLYXNItixkhCCzb5tnrKbGPXOVePWACPWS4EYK+oCBsTXGJpC6
   qEQHJu3W5g4uJAm9gnAQsGe6fAS7qUBuhDEvu4l2aQ2VQOG/+v8eoygjS
   f5hTV1tSPUwNvnSlcAILHbmslIeeaINGDIRIZthB5lC2eAkJ5Tfu/9BdB
   MvXfxj4zKqB4K9ur8k8ZQZtNyDArs/gO7jrtyFG8KZmoG7hsR5sEr0yDg
   g==;
X-CSE-ConnectionGUID: oMi55zjySoWUmHstcTYing==
X-CSE-MsgGUID: OPyQZB2VSvWJXmz3mPgSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="101023636"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="101023636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:26:09 -0700
X-CSE-ConnectionGUID: lqzbJM3/SzSbyN2gJed6cQ==
X-CSE-MsgGUID: gy8HDCV4Q1iCbz9HAUUGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="272299827"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Apr 2026 22:26:08 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHxQz-00000000Ae0-2FM6;
	Wed, 29 Apr 2026 05:26:05 +0000
Date: Wed, 29 Apr 2026 13:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 30/122]
 drivers/staging/media/max96712/max96712.c:267:20: error: initialization of
 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct
 v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer
 type 'int (*)(struct v4l2...
Message-ID: <202604291336.ZjaAXBvo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BF16748F6AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	LONG_SUBJ(2.21)[294];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59909-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,ragnatech.se:email,intel.com:email,intel.com:dkim,intel.com:mid]

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   489ab6e79288be8d219b68525a13699fde0248ae
commit: bdef7b84a4e74d1cef8cd5c1326c657cf4b86b3e [30/122] media: v4l2-subde=
v: Add struct v4l2_subdev_client_info pointer to pad ops
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026042=
9/202604291336.ZjaAXBvo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260429/202604291336.ZjaAXBvo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604291336.ZjaAXBvo-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/max96712/max96712.c:267:20: error: initialization =
of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, s=
truct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible =
pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, str=
uct v4l2_subdev_format *)' [-Werror=3Dincompatible-pointer-types]
     267 |         .set_fmt =3D v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/max96712/max96712.c:267:20: note: (near initializa=
tion for 'max96712_pad_ops.set_fmt')
   cc1: some warnings being treated as errors


vim +267 drivers/staging/media/max96712/max96712.c

ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  264 =20
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  265  static const struct v=
4l2_subdev_pad_ops max96712_pad_ops =3D {
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  266  	.get_fmt =3D v4l2_su=
bdev_get_fmt,
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10 @267  	.set_fmt =3D v4l2_su=
bdev_get_fmt,
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  268  };
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  269 =20

:::::: The code at line 267 was first introduced by commit
:::::: ce44dc1feab5f038edb39dc443b32eae3ac1234d media: staging: max96712: S=
tore format in subdev active state

:::::: TO: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

