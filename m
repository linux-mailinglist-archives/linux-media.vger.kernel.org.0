Return-Path: <linux-media+bounces-61596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMihEHKhBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:18:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D355404B6
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47B4F3022F81
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470283B1006;
	Thu, 14 May 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sqngusou"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93737390219;
	Thu, 14 May 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753773; cv=none; b=Vl7TRHkXcKjlO6RHi+HMqD2OZ5AsapL8B4OSSJDTthv2uxdnsJczWM0ggWNWNUevdKskGaw90D31BZSumZFM64GARJqVSTKjOy/TbGt0d8cwUYSLFRTRGHrtMwSlfbE32jW7rEqJpXV0BUC8MANqTzNq66ZJ1jC1QihfEpDNNj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753773; c=relaxed/simple;
	bh=E9ry05Rq6EIFB/4oeFnN5Wx6Z5D2YCZaoRisb0V93Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7pavYI31+g1JzgixspmH+HAkHXR5qoLooYjkH3GXriNf+t3X5Eg+ve8Co77WdTjyV9c9DfKHGJ3dEqPIxVAoetJcj4k0KOG1+fgXDhwhifM+Ixkqmp1cqqroSLb114bRbKD1OBZDgQ00YdVhq1y52B+3g7KHrKECtDZHdbPG/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sqngusou; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778753772; x=1810289772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E9ry05Rq6EIFB/4oeFnN5Wx6Z5D2YCZaoRisb0V93Ug=;
  b=Sqngusou1pzKGclP0L4ZeVTnHmoaQm3+3JdKl3lL+jDIQ6txOp3EEYCx
   YDfjtw5tpVw+XBy3tnj9GC3SaAhkAbFbexrKtLGzff6D8iaTacR6O9DMr
   lkn5KqoMpNR1k8xpVUKo7tYkvw7tFs2NUQqyfl0+Il6y+NkBrch2rSG0V
   esXXLbazyp4ztKC7rXOp+usTGnSYhPkKuH/ffOMsHWHH6qMY4NGQo+ECC
   yicI0aEydZeKHOSS/AHcdqZbTiRCGvBF6JRambszJmZ1FD0hHZGCJuug3
   Vj/HBInORLWrpoh2Vew8P063/iAejgmFs+v7NKK1GmjGiq6tPZyTOPekh
   g==;
X-CSE-ConnectionGUID: g/nJNFqjRMWcjCz69O0l2w==
X-CSE-MsgGUID: treF6zwiTTOKbjqRmtzD/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97264382"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="97264382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 03:16:11 -0700
X-CSE-ConnectionGUID: GAe5zrqgQaCNFXE2VoXVHQ==
X-CSE-MsgGUID: 6KZfNXkNSWaAnJPHaKVxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238243091"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 03:16:09 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNT6s-000000006L1-0dLf;
	Thu, 14 May 2026 10:16:06 +0000
Date: Thu, 14 May 2026 18:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil+cisco@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] media: pci: add AVMatrix HWS capture driver
Message-ID: <202605141850.c6zw6nTk-lkp@intel.com>
References: <20260506192618.35384-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506192618.35384-1-hoff.benjamin.k@gmail.com>
X-Rspamd-Queue-Id: 83D355404B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61596-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Action: no action

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 74fe02ce122a6103f207d29fafc8b3a53de6abaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Hoff/media-pci-add-AVMatrix-HWS-capture-driver/20260514-065339
base:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
patch link:    https://lore.kernel.org/r/20260506192618.35384-1-hoff.benjamin.k%40gmail.com
patch subject: [PATCH v6] media: pci: add AVMatrix HWS capture driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260514/202605141850.c6zw6nTk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141850.c6zw6nTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141850.c6zw6nTk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/hws/hws_v4l2_ioctl.c:280:5: warning: no previous prototype for 'hws_vidioc_query_dv_timings' [-Wmissing-prototypes]
     280 | int hws_vidioc_query_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c: In function 'hws_vidioc_query_dv_timings':
   drivers/media/pci/hws/hws_v4l2_ioctl.c:286:25: warning: variable 'live_ok' set but not used [-Wunused-but-set-variable]
     286 |         bool interlace, live_ok;
         |                         ^~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c: At top level:
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:309:5: warning: no previous prototype for 'hws_vidioc_enum_dv_timings' [-Wmissing-prototypes]
     309 | int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:326:5: warning: no previous prototype for 'hws_vidioc_g_dv_timings' [-Wmissing-prototypes]
     326 | int hws_vidioc_g_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:352:5: warning: no previous prototype for 'hws_vidioc_s_dv_timings' [-Wmissing-prototypes]
     352 | int hws_vidioc_s_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:412:5: warning: no previous prototype for 'hws_vidioc_dv_timings_cap' [-Wmissing-prototypes]
     412 | int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:504:5: warning: no previous prototype for 'hws_vidioc_querycap' [-Wmissing-prototypes]
     504 | int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:520:5: warning: no previous prototype for 'hws_vidioc_enum_fmt_vid_cap' [-Wmissing-prototypes]
     520 | int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:529:5: warning: no previous prototype for 'hws_vidioc_g_fmt_vid_cap' [-Wmissing-prototypes]
     529 | int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:556:5: warning: no previous prototype for 'hws_vidioc_try_fmt_vid_cap' [-Wmissing-prototypes]
     556 | int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:633:5: warning: no previous prototype for 'hws_vidioc_s_fmt_vid_cap' [-Wmissing-prototypes]
     633 | int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:690:5: warning: no previous prototype for 'hws_vidioc_g_parm' [-Wmissing-prototypes]
     690 | int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:711:5: warning: no previous prototype for 'hws_vidioc_enum_input' [-Wmissing-prototypes]
     711 | int hws_vidioc_enum_input(struct file *file, void *priv,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:724:5: warning: no previous prototype for 'hws_vidioc_g_input' [-Wmissing-prototypes]
     724 | int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *index)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:730:5: warning: no previous prototype for 'hws_vidioc_s_input' [-Wmissing-prototypes]
     730 | int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:735:5: warning: no previous prototype for 'hws_vidioc_s_parm' [-Wmissing-prototypes]
     735 | int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
         |     ^~~~~~~~~~~~~~~~~


vim +/hws_vidioc_query_dv_timings +280 drivers/media/pci/hws/hws_v4l2_ioctl.c

   275	
   276	/* Query the *current detected* DV timings on the input.
   277	 * If you have a real hardware detector, call it here; otherwise we
   278	 * derive from the cached pix state and map to the closest supported DV mode.
   279	 */
 > 280	int hws_vidioc_query_dv_timings(struct file *file, void *fh,
   281					struct v4l2_dv_timings *timings)
   282	{
   283		struct hws_video *vid = video_drvdata(file);
   284		const struct hws_dv_mode *m;
   285		u32 w, h;
   286		bool interlace, live_ok;
   287	
   288		if (!timings)
   289			return -EINVAL;
   290	
   291		w = vid->pix.width;
   292		h = vid->pix.height;
   293		interlace = vid->pix.interlaced;
   294		live_ok = hws_get_live_dv_geometry(vid, &w, &h, &interlace);
   295		/* Map current (live if available, otherwise cached) WxH/interlace
   296		 * to one of our supported modes.
   297		 */
   298		m = hws_find_dv_by_wh(w, h, !!interlace);
   299		if (!m)
   300			return -ENOLINK;
   301	
   302		*timings = m->timings;
   303		vid->cur_dv_timings = m->timings;
   304		vid->current_fps = m->refresh_hz;
   305		return 0;
   306	}
   307	
   308	/* Enumerate the Nth supported DV timings from our static table. */
 > 309	int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
   310				       struct v4l2_enum_dv_timings *edv)
   311	{
   312		if (!edv)
   313			return -EINVAL;
   314	
   315		if (edv->pad)
   316			return -EINVAL;
   317	
   318		if (edv->index >= hws_dv_modes_cnt)
   319			return -EINVAL;
   320	
   321		edv->timings = hws_dv_modes[edv->index].timings;
   322		return 0;
   323	}
   324	
   325	/* Get the *currently configured* DV timings. */
 > 326	int hws_vidioc_g_dv_timings(struct file *file, void *fh,
   327				    struct v4l2_dv_timings *timings)
   328	{
   329		struct hws_video *vid = video_drvdata(file);
   330	
   331		if (!timings)
   332			return -EINVAL;
   333	
   334		*timings = vid->cur_dv_timings;
   335		return 0;
   336	}
   337	
   338	static inline void hws_set_colorimetry_state(struct hws_pix_state *p)
   339	{
   340		bool sd = p->height <= 576;
   341	
   342		p->colorspace   = sd ? V4L2_COLORSPACE_SMPTE170M : V4L2_COLORSPACE_REC709;
   343		p->ycbcr_enc    = V4L2_YCBCR_ENC_DEFAULT;
   344		p->quantization = V4L2_QUANTIZATION_FULL_RANGE;
   345		p->xfer_func    = V4L2_XFER_FUNC_DEFAULT;
   346	}
   347	
   348	/* Set DV timings: must match one of our supported modes.
   349	 * If buffers are queued and this implies a size change, we reject with -EBUSY.
   350	 * Otherwise we update pix state and (optionally) reprogram the HW.
   351	 */
 > 352	int hws_vidioc_s_dv_timings(struct file *file, void *fh,
   353				    struct v4l2_dv_timings *timings)
   354	{
   355		struct hws_video *vid = video_drvdata(file);
   356		const struct hws_dv_mode *m;
   357		const struct v4l2_bt_timings *bt;
   358		u32 new_w, new_h;
   359		bool interlaced;
   360		int ret = 0;
   361		unsigned long was_busy;
   362	
   363		if (!timings)
   364			return -EINVAL;
   365	
   366		m = hws_match_supported_dv(timings);
   367		if (!m)
   368			return -EINVAL;
   369	
   370		bt = &m->timings.bt;
   371		if (bt->interlaced)
   372			return -EINVAL; /* only progressive modes are advertised */
   373		new_w = bt->width;
   374		new_h = bt->height;
   375		interlaced = false;
   376	
   377		lockdep_assert_held(&vid->state_lock);
   378	
   379		/* If vb2 has active buffers and size would change, reject. */
   380		was_busy = vb2_is_busy(&vid->buffer_queue);
   381		if (was_busy &&
   382		    (new_w != vid->pix.width || new_h != vid->pix.height ||
   383		     interlaced != vid->pix.interlaced)) {
   384			ret = -EBUSY;
   385			return ret;
   386		}
   387	
   388		/* Update software pixel state (and recalc sizes) */
   389		vid->pix.width      = new_w;
   390		vid->pix.height     = new_h;
   391		vid->pix.field      = interlaced ? V4L2_FIELD_INTERLACED
   392						 : V4L2_FIELD_NONE;
   393		vid->pix.interlaced = interlaced;
   394		vid->pix.fourcc     = V4L2_PIX_FMT_YUYV;
   395	
   396		hws_set_colorimetry_state(&vid->pix);
   397	
   398		/* Recompute stride/sizeimage/half_size using your helper */
   399		vid->pix.bytesperline = hws_calc_bpl_yuyv(new_w);
   400		vid->pix.sizeimage    = hws_calc_size_yuyv(new_w, new_h);
   401		vid->pix.half_size    = hws_calc_half_size(vid->pix.sizeimage);
   402		vid->cur_dv_timings   = m->timings;
   403		vid->current_fps      = m->refresh_hz;
   404		if (!was_busy)
   405			vid->alloc_sizeimage = vid->pix.sizeimage;
   406		return ret;
   407	}
   408	
   409	/* Report DV timings capability: advertise BT.656/1120 with
   410	 * the min/max WxH derived from our table and basic progressive support.
   411	 */
 > 412	int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
   413				      struct v4l2_dv_timings_cap *cap)
   414	{
   415		u32 min_w = ~0U, min_h = ~0U;
   416		u32 max_w = 0,       max_h = 0;
   417		size_t i, n = 0;
   418	
   419		if (!cap)
   420			return -EINVAL;
   421	
   422		memset(cap, 0, sizeof(*cap));
   423		cap->type = V4L2_DV_BT_656_1120;
   424	
   425		for (i = 0; i < ARRAY_SIZE(hws_dv_modes); i++) {
   426			const struct v4l2_bt_timings *bt = &hws_dv_modes[i].timings.bt;
   427	
   428			if (hws_dv_modes[i].timings.type != V4L2_DV_BT_656_1120)
   429				continue;
   430			n++;
   431	
   432			if (bt->width  < min_w)
   433				min_w = bt->width;
   434			if (bt->height < min_h)
   435				min_h = bt->height;
   436			if (bt->width  > max_w)
   437				max_w = bt->width;
   438			if (bt->height > max_h)
   439				max_h = bt->height;
   440		}
   441	
   442		/* If the table was empty, fail gracefully. */
   443		if (!n || min_w == U32_MAX)
   444			return -ENODATA;
   445	
   446		cap->bt.min_width  = min_w;
   447		cap->bt.max_width  = max_w;
   448		cap->bt.min_height = min_h;
   449		cap->bt.max_height = max_h;
   450	
   451		/* We support both CEA-861- and VESA-style modes in the list. */
   452		cap->bt.standards =
   453			V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT | V4L2_DV_BT_STD_CVT;
   454	
   455		/* Progressive only, unless your table includes interlaced entries. */
   456		cap->bt.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE;
   457	
   458		/* Leave pixelclock/porch limits unconstrained (0) for now. */
   459		return 0;
   460	}
   461	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

