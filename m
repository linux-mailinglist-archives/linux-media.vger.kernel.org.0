Return-Path: <linux-media+bounces-56771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM2hOOekwWknUQQAu9opvQ
	(envelope-from <linux-media+bounces-56771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 21:39:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6407D2FD603
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 21:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22685306242E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D533E1D14;
	Mon, 23 Mar 2026 20:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzHr7xkC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB623E1CED;
	Mon, 23 Mar 2026 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298227; cv=none; b=B32iDKcg46hyRsfi5bgD0E+8ObM17+pB3zXcs9j3WB1BL5jSnyQNkFco7p1gBiRE0mywvBgEn0vB8lEcheKgxjE0Y8gL0F+YSgqNht4VLW7Uc2Mty19dXlOySIhAHwVY/fD+Fu2kUJuKhRbMCNs4i8CFBgTDV6VRjGyPD1mds/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298227; c=relaxed/simple;
	bh=yGyce9YhsfprRiXcjDxa0I2ZHxLi8y3Dztmn/6a58nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz8CZVz4Kql7MklM/1HHq5joDrJwk5F0D2iKWfFyr6/NtAqq1TKD9jR0YeI7uWwRSXbdjtHsqgUp6kRYMwb6ctC5mVKgX4mTkRJy+z6edkwe5SThnr/KkPOlRrcyf0oTqzQYr/kyPf4eFvC/gJUacFE+fhsj/RGsUoUiSzoG5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzHr7xkC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774298224; x=1805834224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGyce9YhsfprRiXcjDxa0I2ZHxLi8y3Dztmn/6a58nM=;
  b=BzHr7xkCAxX5SVZXNJF/HUDo9u17WYJqTCDoqXekpAZVwuuPBtbWRj0X
   rgfajqQL/6P/WolFNoarf/gcbYaNNQIJ3MHI0H6ChT92ZkKB67LCxL0aZ
   MMdtfUwUzCNqrDCUvRT3+JFdkV2u4Fo+crCaIUGZr+8MZp4CVnbwpo2sv
   Lz4OF2mwCqexZwe2ysRgOuJ817wqEgyVpeaq7h6RGMAuzed1/4ENcocpX
   pCYhWEQbSau+Fsry8cUusEH2apXp0+on9ur4BzWQ2flhKPk/2UyDtMiZb
   H/SOh8vfi2QzDIpEWWHZESsJWR4JvG9LOQbuiMTEm1QPN/pne9TYz72vr
   g==;
X-CSE-ConnectionGUID: g93K4i/FSauezYki9gvugQ==
X-CSE-MsgGUID: VvcctIlmSb6gLvl0fgRKMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100758862"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100758862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:37:01 -0700
X-CSE-ConnectionGUID: wPSxvJFrT6iCol+Am0aGUw==
X-CSE-MsgGUID: F8gtb9JJSbOTu/qh2tdM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247840996"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 13:36:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4m19-000000003Cl-1s7b;
	Mon, 23 Mar 2026 20:36:55 +0000
Date: Tue, 24 Mar 2026 04:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	hverkuil@kernel.org, nicolas.dufresne@collabora.com,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	opensource206@gmail.com, jernej.skrabec@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference lists
Message-ID: <202603240457.8kfXE4xy-lkp@intel.com>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,collabora.com,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org,iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-56771-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,linuxtv.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,git-scm.com:url,01.org:url]
X-Rspamd-Queue-Id: 6407D2FD603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Pengpeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v7.0-rc5 next-20260323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/media-v4l2-ctrls-validate-HEVC-slice-reference-lists/20260323-221415
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260323083031.30941-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference lists
config: s390-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240457.8kfXE4xy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240457.8kfXE4xy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240457.8kfXE4xy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1263:3: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1263 |                 p_hevc_slice_params = p;
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1265:7: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1265 |                 if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1269:20: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1269 |                 for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l0_active_minus1;
         |                                  ^~~~~~~~~~~~~~~~~~~
         |                                  p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1271:8: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1271 |                         if (p_hevc_slice_params->ref_idx_l0[i] >=
         |                             ^~~~~~~~~~~~~~~~~~~
         |                             p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1271:29: error: no member named 'ref_idx_l0' in 'struct v4l2_ctrl_h264_slice_params'
    1271 |                         if (p_hevc_slice_params->ref_idx_l0[i] >=
         |                             ~~~~~~~~~~~~~~~~~~~  ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1275:7: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1275 |                 if (p_hevc_slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_B)
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1278:7: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1278 |                 if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1282:20: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1282 |                 for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l1_active_minus1;
         |                                  ^~~~~~~~~~~~~~~~~~~
         |                                  p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:1284:8: error: use of undeclared identifier 'p_hevc_slice_params'; did you mean 'p_h264_slice_params'?
    1284 |                         if (p_hevc_slice_params->ref_idx_l1[i] >=
         |                             ^~~~~~~~~~~~~~~~~~~
         |                             p_h264_slice_params
   drivers/media/v4l2-core/v4l2-ctrls-core.c:968:38: note: 'p_h264_slice_params' declared here
     968 |         struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
         |                                             ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:1284:29: error: no member named 'ref_idx_l1' in 'struct v4l2_ctrl_h264_slice_params'
    1284 |                         if (p_hevc_slice_params->ref_idx_l1[i] >=
         |                             ~~~~~~~~~~~~~~~~~~~  ^
   10 errors generated.


vim +1263 drivers/media/v4l2-core/v4l2-ctrls-core.c

   952	
   953	/*
   954	 * Compound controls validation requires setting unused fields/flags to zero
   955	 * in order to properly detect unchanged controls with v4l2_ctrl_type_op_equal's
   956	 * memcmp.
   957	 */
   958	static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
   959					 union v4l2_ctrl_ptr ptr)
   960	{
   961		struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
   962		struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
   963		struct v4l2_ctrl_vp8_frame *p_vp8_frame;
   964		struct v4l2_ctrl_fwht_params *p_fwht_params;
   965		struct v4l2_ctrl_h264_sps *p_h264_sps;
   966		struct v4l2_ctrl_h264_pps *p_h264_pps;
   967		struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
   968		struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
   969		struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
   970		struct v4l2_ctrl_hevc_ext_sps_lt_rps *p_hevc_lt_rps;
   971		struct v4l2_ctrl_hevc_ext_sps_st_rps *p_hevc_st_rps;
   972		struct v4l2_ctrl_hevc_sps *p_hevc_sps;
   973		struct v4l2_ctrl_hevc_pps *p_hevc_pps;
   974		struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
   975		struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
   976		struct v4l2_area *area;
   977		struct v4l2_rect *rect;
   978		void *p = ptr.p + idx * ctrl->elem_size;
   979		unsigned int i;
   980	
   981		switch ((u32)ctrl->type) {
   982		case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
   983			p_mpeg2_sequence = p;
   984	
   985			switch (p_mpeg2_sequence->chroma_format) {
   986			case 1: /* 4:2:0 */
   987			case 2: /* 4:2:2 */
   988			case 3: /* 4:4:4 */
   989				break;
   990			default:
   991				return -EINVAL;
   992			}
   993			break;
   994	
   995		case V4L2_CTRL_TYPE_MPEG2_PICTURE:
   996			p_mpeg2_picture = p;
   997	
   998			switch (p_mpeg2_picture->intra_dc_precision) {
   999			case 0: /* 8 bits */
  1000			case 1: /* 9 bits */
  1001			case 2: /* 10 bits */
  1002			case 3: /* 11 bits */
  1003				break;
  1004			default:
  1005				return -EINVAL;
  1006			}
  1007	
  1008			switch (p_mpeg2_picture->picture_structure) {
  1009			case V4L2_MPEG2_PIC_TOP_FIELD:
  1010			case V4L2_MPEG2_PIC_BOTTOM_FIELD:
  1011			case V4L2_MPEG2_PIC_FRAME:
  1012				break;
  1013			default:
  1014				return -EINVAL;
  1015			}
  1016	
  1017			switch (p_mpeg2_picture->picture_coding_type) {
  1018			case V4L2_MPEG2_PIC_CODING_TYPE_I:
  1019			case V4L2_MPEG2_PIC_CODING_TYPE_P:
  1020			case V4L2_MPEG2_PIC_CODING_TYPE_B:
  1021				break;
  1022			default:
  1023				return -EINVAL;
  1024			}
  1025			zero_reserved(*p_mpeg2_picture);
  1026			break;
  1027	
  1028		case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
  1029			break;
  1030	
  1031		case V4L2_CTRL_TYPE_FWHT_PARAMS:
  1032			p_fwht_params = p;
  1033			if (p_fwht_params->version < V4L2_FWHT_VERSION)
  1034				return -EINVAL;
  1035			if (!p_fwht_params->width || !p_fwht_params->height)
  1036				return -EINVAL;
  1037			break;
  1038	
  1039		case V4L2_CTRL_TYPE_H264_SPS:
  1040			p_h264_sps = p;
  1041	
  1042			/* Some syntax elements are only conditionally valid */
  1043			if (p_h264_sps->pic_order_cnt_type != 0) {
  1044				p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 = 0;
  1045			} else if (p_h264_sps->pic_order_cnt_type != 1) {
  1046				p_h264_sps->num_ref_frames_in_pic_order_cnt_cycle = 0;
  1047				p_h264_sps->offset_for_non_ref_pic = 0;
  1048				p_h264_sps->offset_for_top_to_bottom_field = 0;
  1049				memset(&p_h264_sps->offset_for_ref_frame, 0,
  1050				       sizeof(p_h264_sps->offset_for_ref_frame));
  1051			}
  1052	
  1053			if (!V4L2_H264_SPS_HAS_CHROMA_FORMAT(p_h264_sps)) {
  1054				p_h264_sps->chroma_format_idc = 1;
  1055				p_h264_sps->bit_depth_luma_minus8 = 0;
  1056				p_h264_sps->bit_depth_chroma_minus8 = 0;
  1057	
  1058				p_h264_sps->flags &=
  1059					~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
  1060			}
  1061	
  1062			if (p_h264_sps->chroma_format_idc < 3)
  1063				p_h264_sps->flags &=
  1064					~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
  1065	
  1066			if (p_h264_sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)
  1067				p_h264_sps->flags &=
  1068					~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
  1069	
  1070			/*
  1071			 * Chroma 4:2:2 format require at least High 4:2:2 profile.
  1072			 *
  1073			 * The H264 specification and well-known parser implementations
  1074			 * use profile-idc values directly, as that is clearer and
  1075			 * less ambiguous. We do the same here.
  1076			 */
  1077			if (p_h264_sps->profile_idc < 122 &&
  1078			    p_h264_sps->chroma_format_idc > 1)
  1079				return -EINVAL;
  1080			/* Chroma 4:4:4 format require at least High 4:2:2 profile */
  1081			if (p_h264_sps->profile_idc < 244 &&
  1082			    p_h264_sps->chroma_format_idc > 2)
  1083				return -EINVAL;
  1084			if (p_h264_sps->chroma_format_idc > 3)
  1085				return -EINVAL;
  1086	
  1087			if (p_h264_sps->bit_depth_luma_minus8 > 6)
  1088				return -EINVAL;
  1089			if (p_h264_sps->bit_depth_chroma_minus8 > 6)
  1090				return -EINVAL;
  1091			if (p_h264_sps->log2_max_frame_num_minus4 > 12)
  1092				return -EINVAL;
  1093			if (p_h264_sps->pic_order_cnt_type > 2)
  1094				return -EINVAL;
  1095			if (p_h264_sps->log2_max_pic_order_cnt_lsb_minus4 > 12)
  1096				return -EINVAL;
  1097			if (p_h264_sps->max_num_ref_frames > V4L2_H264_REF_LIST_LEN)
  1098				return -EINVAL;
  1099			break;
  1100	
  1101		case V4L2_CTRL_TYPE_H264_PPS:
  1102			p_h264_pps = p;
  1103	
  1104			if (p_h264_pps->num_slice_groups_minus1 > 7)
  1105				return -EINVAL;
  1106			if (p_h264_pps->num_ref_idx_l0_default_active_minus1 >
  1107			    (V4L2_H264_REF_LIST_LEN - 1))
  1108				return -EINVAL;
  1109			if (p_h264_pps->num_ref_idx_l1_default_active_minus1 >
  1110			    (V4L2_H264_REF_LIST_LEN - 1))
  1111				return -EINVAL;
  1112			if (p_h264_pps->weighted_bipred_idc > 2)
  1113				return -EINVAL;
  1114			/*
  1115			 * pic_init_qp_minus26 shall be in the range of
  1116			 * -(26 + QpBdOffset_y) to +25, inclusive,
  1117			 *  where QpBdOffset_y is 6 * bit_depth_luma_minus8
  1118			 */
  1119			if (p_h264_pps->pic_init_qp_minus26 < -62 ||
  1120			    p_h264_pps->pic_init_qp_minus26 > 25)
  1121				return -EINVAL;
  1122			if (p_h264_pps->pic_init_qs_minus26 < -26 ||
  1123			    p_h264_pps->pic_init_qs_minus26 > 25)
  1124				return -EINVAL;
  1125			if (p_h264_pps->chroma_qp_index_offset < -12 ||
  1126			    p_h264_pps->chroma_qp_index_offset > 12)
  1127				return -EINVAL;
  1128			if (p_h264_pps->second_chroma_qp_index_offset < -12 ||
  1129			    p_h264_pps->second_chroma_qp_index_offset > 12)
  1130				return -EINVAL;
  1131			break;
  1132	
  1133		case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
  1134			break;
  1135	
  1136		case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
  1137			p_h264_pred_weights = p;
  1138	
  1139			if (p_h264_pred_weights->luma_log2_weight_denom > 7)
  1140				return -EINVAL;
  1141			if (p_h264_pred_weights->chroma_log2_weight_denom > 7)
  1142				return -EINVAL;
  1143			break;
  1144	
  1145		case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
  1146			p_h264_slice_params = p;
  1147	
  1148			if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
  1149				p_h264_slice_params->flags &=
  1150					~V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED;
  1151	
  1152			if (p_h264_slice_params->colour_plane_id > 2)
  1153				return -EINVAL;
  1154			if (p_h264_slice_params->cabac_init_idc > 2)
  1155				return -EINVAL;
  1156			if (p_h264_slice_params->disable_deblocking_filter_idc > 2)
  1157				return -EINVAL;
  1158			if (p_h264_slice_params->slice_alpha_c0_offset_div2 < -6 ||
  1159			    p_h264_slice_params->slice_alpha_c0_offset_div2 > 6)
  1160				return -EINVAL;
  1161			if (p_h264_slice_params->slice_beta_offset_div2 < -6 ||
  1162			    p_h264_slice_params->slice_beta_offset_div2 > 6)
  1163				return -EINVAL;
  1164	
  1165			if (p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_I ||
  1166			    p_h264_slice_params->slice_type == V4L2_H264_SLICE_TYPE_SI)
  1167				p_h264_slice_params->num_ref_idx_l0_active_minus1 = 0;
  1168			if (p_h264_slice_params->slice_type != V4L2_H264_SLICE_TYPE_B)
  1169				p_h264_slice_params->num_ref_idx_l1_active_minus1 = 0;
  1170	
  1171			if (p_h264_slice_params->num_ref_idx_l0_active_minus1 >
  1172			    (V4L2_H264_REF_LIST_LEN - 1))
  1173				return -EINVAL;
  1174			if (p_h264_slice_params->num_ref_idx_l1_active_minus1 >
  1175			    (V4L2_H264_REF_LIST_LEN - 1))
  1176				return -EINVAL;
  1177			zero_reserved(*p_h264_slice_params);
  1178			break;
  1179	
  1180		case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
  1181			p_h264_dec_params = p;
  1182	
  1183			if (p_h264_dec_params->nal_ref_idc > 3)
  1184				return -EINVAL;
  1185			for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
  1186				struct v4l2_h264_dpb_entry *dpb_entry =
  1187					&p_h264_dec_params->dpb[i];
  1188	
  1189				zero_reserved(*dpb_entry);
  1190			}
  1191			zero_reserved(*p_h264_dec_params);
  1192			break;
  1193	
  1194		case V4L2_CTRL_TYPE_VP8_FRAME:
  1195			p_vp8_frame = p;
  1196	
  1197			switch (p_vp8_frame->num_dct_parts) {
  1198			case 1:
  1199			case 2:
  1200			case 4:
  1201			case 8:
  1202				break;
  1203			default:
  1204				return -EINVAL;
  1205			}
  1206			zero_padding(p_vp8_frame->segment);
  1207			zero_padding(p_vp8_frame->lf);
  1208			zero_padding(p_vp8_frame->quant);
  1209			zero_padding(p_vp8_frame->entropy);
  1210			zero_padding(p_vp8_frame->coder_state);
  1211			break;
  1212	
  1213		case V4L2_CTRL_TYPE_HEVC_SPS:
  1214			p_hevc_sps = p;
  1215	
  1216			if (!(p_hevc_sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED)) {
  1217				p_hevc_sps->pcm_sample_bit_depth_luma_minus1 = 0;
  1218				p_hevc_sps->pcm_sample_bit_depth_chroma_minus1 = 0;
  1219				p_hevc_sps->log2_min_pcm_luma_coding_block_size_minus3 = 0;
  1220				p_hevc_sps->log2_diff_max_min_pcm_luma_coding_block_size = 0;
  1221			}
  1222	
  1223			if (!(p_hevc_sps->flags &
  1224			      V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT))
  1225				p_hevc_sps->num_long_term_ref_pics_sps = 0;
  1226			break;
  1227	
  1228		case V4L2_CTRL_TYPE_HEVC_PPS:
  1229			p_hevc_pps = p;
  1230	
  1231			if (!(p_hevc_pps->flags &
  1232			      V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED))
  1233				p_hevc_pps->diff_cu_qp_delta_depth = 0;
  1234	
  1235			if (!(p_hevc_pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)) {
  1236				p_hevc_pps->num_tile_columns_minus1 = 0;
  1237				p_hevc_pps->num_tile_rows_minus1 = 0;
  1238				memset(&p_hevc_pps->column_width_minus1, 0,
  1239				       sizeof(p_hevc_pps->column_width_minus1));
  1240				memset(&p_hevc_pps->row_height_minus1, 0,
  1241				       sizeof(p_hevc_pps->row_height_minus1));
  1242	
  1243				p_hevc_pps->flags &=
  1244					~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
  1245			}
  1246	
  1247			if (p_hevc_pps->flags &
  1248			    V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER) {
  1249				p_hevc_pps->pps_beta_offset_div2 = 0;
  1250				p_hevc_pps->pps_tc_offset_div2 = 0;
  1251			}
  1252			break;
  1253	
  1254		case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
  1255			p_hevc_decode_params = p;
  1256	
  1257			if (p_hevc_decode_params->num_active_dpb_entries >
  1258			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
  1259				return -EINVAL;
  1260			break;
  1261	
  1262		case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> 1263			p_hevc_slice_params = p;
  1264	
  1265			if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=
  1266			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
  1267				return -EINVAL;
  1268	
  1269			for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l0_active_minus1;
  1270			     i++)
> 1271				if (p_hevc_slice_params->ref_idx_l0[i] >=
  1272				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
  1273					return -EINVAL;
  1274	
  1275			if (p_hevc_slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_B)
  1276				break;
  1277	
  1278			if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=
  1279			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
  1280				return -EINVAL;
  1281	
  1282			for (i = 0; i <= p_hevc_slice_params->num_ref_idx_l1_active_minus1;
  1283			     i++)
> 1284				if (p_hevc_slice_params->ref_idx_l1[i] >=
  1285				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
  1286					return -EINVAL;
  1287			break;
  1288	
  1289		case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
  1290			p_hevc_st_rps = p;
  1291	
  1292			if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED)
  1293				return -EINVAL;
  1294			break;
  1295	
  1296		case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
  1297			p_hevc_lt_rps = p;
  1298	
  1299			if (p_hevc_lt_rps->flags & ~V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT)
  1300				return -EINVAL;
  1301			break;
  1302	
  1303		case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
  1304			break;
  1305	
  1306		case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
  1307			p_hdr10_mastering = p;
  1308	
  1309			for (i = 0; i < 3; ++i) {
  1310				if (p_hdr10_mastering->display_primaries_x[i] <
  1311					V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
  1312				    p_hdr10_mastering->display_primaries_x[i] >
  1313					V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
  1314				    p_hdr10_mastering->display_primaries_y[i] <
  1315					V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
  1316				    p_hdr10_mastering->display_primaries_y[i] >
  1317					V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
  1318					return -EINVAL;
  1319			}
  1320	
  1321			if (p_hdr10_mastering->white_point_x <
  1322				V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
  1323			    p_hdr10_mastering->white_point_x >
  1324				V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
  1325			    p_hdr10_mastering->white_point_y <
  1326				V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
  1327			    p_hdr10_mastering->white_point_y >
  1328				V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
  1329				return -EINVAL;
  1330	
  1331			if (p_hdr10_mastering->max_display_mastering_luminance <
  1332				V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
  1333			    p_hdr10_mastering->max_display_mastering_luminance >
  1334				V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
  1335			    p_hdr10_mastering->min_display_mastering_luminance <
  1336				V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
  1337			    p_hdr10_mastering->min_display_mastering_luminance >
  1338				V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
  1339				return -EINVAL;
  1340	
  1341			/* The following restriction comes from ITU-T Rec. H.265 spec */
  1342			if (p_hdr10_mastering->max_display_mastering_luminance ==
  1343				V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
  1344			    p_hdr10_mastering->min_display_mastering_luminance ==
  1345				V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
  1346				return -EINVAL;
  1347	
  1348			break;
  1349	
  1350		case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
  1351			break;
  1352	
  1353		case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
  1354			return validate_vp9_compressed_hdr(p);
  1355	
  1356		case V4L2_CTRL_TYPE_VP9_FRAME:
  1357			return validate_vp9_frame(p);
  1358		case V4L2_CTRL_TYPE_AV1_FRAME:
  1359			return validate_av1_frame(p);
  1360		case V4L2_CTRL_TYPE_AV1_SEQUENCE:
  1361			return validate_av1_sequence(p);
  1362		case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
  1363			break;
  1364		case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
  1365			return validate_av1_film_grain(p);
  1366	
  1367		case V4L2_CTRL_TYPE_AREA:
  1368			area = p;
  1369			if (!area->width || !area->height)
  1370				return -EINVAL;
  1371			break;
  1372	
  1373		case V4L2_CTRL_TYPE_RECT:
  1374			rect = p;
  1375			if (!rect->width || !rect->height)
  1376				return -EINVAL;
  1377			break;
  1378	
  1379		default:
  1380			return -EINVAL;
  1381		}
  1382	
  1383		return 0;
  1384	}
  1385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

