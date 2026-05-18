Return-Path: <linux-media+bounces-62048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDHgFEF3C2o+IAUAu9opvQ
	(envelope-from <linux-media+bounces-62048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 22:32:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6085736BB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 22:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2990A300F62B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 20:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720B43254A5;
	Mon, 18 May 2026 20:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4c8eIEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037D38C410;
	Mon, 18 May 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136311; cv=none; b=A/nMMXIvnFus3z1Lr5P7f+FVgEy8VjJHYb5aqAoPw8Wgv/+zdyZH/Ids7/B3fxq5e/GM3F5gUPgTYBoCW8WGtI0+sXHIOgkajZtKfi+qtLwhH5RnMzemcw1QkzL+QdtRMu/J9oB+ZstWCf1KlJnVMJPrVzTZxrQxOAUtkL4XKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136311; c=relaxed/simple;
	bh=ydXo2XIcnCDnuaeWYRtalIfepOWgfDw1EKpHwpkVH/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H97hxxSkgCA9WdWt1v6vZ8p0ErZOvXFtulxlv7lMdbLIsWpjLdNvTUoaWuwUgO6OI8jEd3nlK9zy24Oq5SsIllZ8ZlI7U5U4Jaoy7FQwJVlxRcHq6suE8A6mOyHYv6PaQT6mNP8NF8buqglGQbEp6W3h+U/9cxDIj48W2qTTAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4c8eIEf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779136310; x=1810672310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ydXo2XIcnCDnuaeWYRtalIfepOWgfDw1EKpHwpkVH/8=;
  b=H4c8eIEflAj2zhiX7yVOa3e00Q3NTjOdcdSjyzLUR5q61/xg5cLhmDW9
   FlLhOBTXtsSfIwuvgH4SvrQ+2+rljI8h4rDtszrWSGCjyQ/HxTsZDXGPg
   0DVQ6Noo58KGUO6CQah83kASdXEb9ge4AjT3zIVuox918Vjog9OqpgK0c
   DUmtzSKt3HAFRcJJWufA5fEJwMk0ngsBpetxEZTPkqeVraIwjkplUrF5X
   j0jcbeG5Xhsku2mbVscwo2o4BXzU9ztv2Y7mPNvYL6zbAZ62I/33MSAYy
   zK5OUn0DShG/vu8sGirvE5TFkwK2RGlk8fPyEI3iLrZa6W9BcPtPb51mS
   A==;
X-CSE-ConnectionGUID: PCMChLQpRyCN3g3ptqPFzA==
X-CSE-MsgGUID: 6lqcamR5Rzq/trZecizzQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80035060"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80035060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 13:31:50 -0700
X-CSE-ConnectionGUID: d0m9t1lWTf6cVYdn+o0JBQ==
X-CSE-MsgGUID: 13v+sl6tR2GHBYRSdDRZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233164454"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 13:31:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP4cq-000000003N4-14ih;
	Mon, 18 May 2026 20:31:44 +0000
Date: Tue, 19 May 2026 04:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video
 register failure
Message-ID: <202605190406.bMshG7YY-lkp@intel.com>
References: <20260518125500.1000083-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518125500.1000083-1-lgs201920130244@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62048-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mediatek.com,kernel.org,collabora.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,linuxtv.org:url,intel.com:email,intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5B6085736BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190406.bMshG7YY-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190406.bMshG7YY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190406.bMshG7YY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c: In function 'mtk_mdp_register_m2m_device':
>> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:40: error: expected ';' before 'mdp'
    1217 |         video_device_release(mdp->vdev)
         |                                        ^
         |                                        ;
    1218 |         mdp->vdev = NULL;
         |         ~~~                             


vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c

  1172	
  1173	int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
  1174	{
  1175		struct device *dev = &mdp->pdev->dev;
  1176		int ret;
  1177	
  1178		mdp->variant = &mtk_mdp_default_variant;
  1179		mdp->vdev = video_device_alloc();
  1180		if (!mdp->vdev) {
  1181			dev_err(dev, "failed to allocate video device\n");
  1182			ret = -ENOMEM;
  1183			goto err_video_alloc;
  1184		}
  1185		mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
  1186		mdp->vdev->fops = &mtk_mdp_m2m_fops;
  1187		mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
  1188		mdp->vdev->release = video_device_release_empty;
  1189		mdp->vdev->lock = &mdp->lock;
  1190		mdp->vdev->vfl_dir = VFL_DIR_M2M;
  1191		mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
  1192		snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
  1193			 MTK_MDP_MODULE_NAME);
  1194		video_set_drvdata(mdp->vdev, mdp);
  1195	
  1196		mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
  1197		if (IS_ERR(mdp->m2m_dev)) {
  1198			dev_err(dev, "failed to initialize v4l2-m2m device\n");
  1199			ret = PTR_ERR(mdp->m2m_dev);
  1200			goto err_m2m_init;
  1201		}
  1202	
  1203		ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
  1204		if (ret) {
  1205			dev_err(dev, "failed to register video device\n");
  1206			goto err_vdev_register;
  1207		}
  1208		mdp->vdev->release = video_device_release;
  1209	
  1210		v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
  1211			  mdp->vdev->num);
  1212		return 0;
  1213	
  1214	err_vdev_register:
  1215		v4l2_m2m_release(mdp->m2m_dev);
  1216	err_m2m_init:
> 1217		video_device_release(mdp->vdev)
  1218		mdp->vdev = NULL;
  1219	err_video_alloc:
  1220	
  1221		return ret;
  1222	}
  1223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

