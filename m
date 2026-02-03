Return-Path: <linux-media+bounces-52138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMYiFyN9gmnAVQMAu9opvQ
	(envelope-from <linux-media+bounces-52138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 23:56:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E87DF735
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 23:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FE8304995F
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 22:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E379C374188;
	Tue,  3 Feb 2026 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3vbZbXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1932471B;
	Tue,  3 Feb 2026 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159361; cv=none; b=HRscY5FV3JdiqZb/P6sAWKPsL8J2vDGg9p9Cq0rNChtWchG58LMohusGceYgk17XUa8FKnc8x5CZbZWFMfjMcOVfvrKgliVu/TD/zUIH7Qv0OKDkctRAod5+Opp7n2EkX3uN8ezqcauxpEwyNx42GLWnJeBy49o8KGjGyNPlV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159361; c=relaxed/simple;
	bh=EpGvoxDrKuv7hIK1fCK6uHMFVNI2vX0KggMpEgCxAwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZK1d8j81G2LKBDmcVgjSUeahV8pK+YuY5oQaQt+3oGrlWYDKgcb00VBcDSUODO6QXjeFfSG5YLANUZNLDTm+LYqO3evsQ+LdO7jiPD/xVdfHJHF+M12ZI50EFKWpOBZe6YWOInkiGgC7Y+kE0fuSSw+5MtUfMgCoe9VNFcnauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3vbZbXC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770159360; x=1801695360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EpGvoxDrKuv7hIK1fCK6uHMFVNI2vX0KggMpEgCxAwY=;
  b=I3vbZbXCd86/reSBcjIBcOa3Qv8FT8V8+5pL8PRaKD3mJG8f0oroEdyM
   r3DiyTHK08sW3p29RJTwk4D7y9YDUY12flwczh8qfBS3VWVHAKLcttBTs
   BK5ZzfXaICiKgtJiJ2LB6g0RTWdEs39/kkq/cObgD6PkXVBqZP8+tfNC+
   WNlZ/7d33Fkh1zItGUt3ETyDkZLWVE9rmaiJV346i3vFigjpvUBqDkBeA
   538ffg1EB4DsgMO/Q6OxPygp3y0XmRENv8WuHGCERFDGHZCDfOYV3ainQ
   JsM9/8WfLacKaAET97RfNR+hyb1YgSfGCdUifDYsO4Rd9hPkk25IvD/vv
   Q==;
X-CSE-ConnectionGUID: IxArffcwRJiUUIQodsHAQw==
X-CSE-MsgGUID: yJRQcNgUSOqZA4oB+8L4Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71402300"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71402300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:55:59 -0800
X-CSE-ConnectionGUID: GQiDoYA+Qam4UgwOSktzIQ==
X-CSE-MsgGUID: C6nqfGIRQr21qCll8mjDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214138905"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 14:55:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnPJJ-00000000hFi-1tvB;
	Tue, 03 Feb 2026 22:55:53 +0000
Date: Wed, 4 Feb 2026 06:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper
 functions
Message-ID: <202602040608.vLI553iq-lkp@intel.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52138-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: A6E87DF735
X-Rspamd-Action: no action

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb4ee870747c3a77a9c3c84d84efb64bd481013a]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmipp-share-struct-dcmipp_device-among-subdevs/20260202-220852
base:   eb4ee870747c3a77a9c3c84d84efb64bd481013a
patch link:    https://lore.kernel.org/r/20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014%40foss.st.com
patch subject: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper functions
config: riscv-randconfig-r122-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040608.vLI553iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040608.vLI553iq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c:41:1: sparse: sparse: symbol 'dcmipp_pixel_formats_list' was not declared. Should it be static?

vim +/dcmipp_pixel_formats_list +41 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c

    17	
    18	#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
    19	#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
    20	#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
    21	#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
    22	#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
    23	#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
    24	#define DCMIPP_MAIN_POSTPROC_INOUT					\
    25		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
    26	#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
    27	#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
    28	#define DCMIPP_AUX_POSTPROC_INOUT					\
    29		(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
    30	#define DCMIPP_ALL_POSTPROC_SINK					\
    31		(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
    32	#define DCMIPP_ALL_POSTPROC_INOUT					\
    33		(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
    34	
    35	#define PIXMAP_MBUS(mbus, applicable_pipes)		\
    36		{						\
    37			.code = MEDIA_BUS_FMT_##mbus,		\
    38			.pipes = applicable_pipes,		\
    39		}
    40	const struct dcmipp_pixelpipe_pix_map
  > 41	dcmipp_pixel_formats_list[] = {
    42		/* RGB formats */
    43		/* RGB565 / RGB888 */
    44		PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    45		PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    46		PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    47		PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
    48		/* YUV formats */
    49		PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    50		PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    51		PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
    52		/* GREY */
    53		PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    54		PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    55		PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    56		PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
    57		/* Raw Bayer */
    58		/* Raw 8 */
    59		PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
    60		PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
    61		PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
    62		PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
    63		/* Raw 10 */
    64		PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
    65		PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
    66		PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
    67		PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
    68		/* Raw 12 */
    69		PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
    70		PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
    71		PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
    72		PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
    73		/* Raw 14 */
    74		PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
    75		PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
    76		PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
    77		PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
    78	};
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

