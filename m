Return-Path: <linux-media+bounces-9646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349C8A79DC
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 02:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C621F220FF
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 00:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EFDEBE;
	Wed, 17 Apr 2024 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnKMxglC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA77FB
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 00:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713313943; cv=none; b=SaPZiCzZ1dyIisFLrd9DqJhql54j8TD2yTSXlfkucH0Nb27jJIcCgiUm7+ufm6zhvOmXDOpEjAirX1fK1JYhVNPlxf025V5bVOawu31fNxXla7bJcjK8GJqIgIraFqj4iguyCVjCtYXq6gtxttYLH1AieVGifnyanPmiSoWiq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713313943; c=relaxed/simple;
	bh=mFLloV+Si5lGuGmqUp+8UOZx58dXsg06o+p+Z5z8fpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLrrM4v8VC00hU8RGjd9U3OYP9G63oVqoOId9jNiN+QcI7ycL6ApRlmIRgpQ/QAHX4TvEzBRA2WW9oI7eh1BMLkDzDRoSDD715DDcD4PHNn8LlV7sSUeSNMLsNqGqJwcJTRlBoO9Wnj8xkg/5m6Mw6By5Kkg+xmG5/dhvKq++s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnKMxglC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713313941; x=1744849941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mFLloV+Si5lGuGmqUp+8UOZx58dXsg06o+p+Z5z8fpY=;
  b=NnKMxglChSMaWqcgh2fUjcV49Nc0/sbqIGoSEeBORpOlVcdjTaKDxdvU
   Q9hXssWwGQFo9CNRnNu1g7OOIBqtHm34mHGQktjAELMkYHl8jegVW3L8x
   4s9FwuxQAk45pY1kA+ixgjBF0mY5clL3vsyiofLbFIZAzmDaQ1fZ1jBSo
   NvdfMy3p8ZkFYeE5doJlw2NznhofdhbxGyo29hPwt0+rYeO29S38or17+
   Etr0yyAf2LTRQcFBSkWAYhAd05Chqat7EHZxMkGkKr68YfsqtnOjIPpdP
   2LbIt1OaO/R9xb4gYPqLBYj5TcLvpgLWcS/Mj+i95J4XC3tIys9Dkb4xj
   g==;
X-CSE-ConnectionGUID: 8jwS05a0Sga4iICTSlfe3A==
X-CSE-MsgGUID: cBvzu7/6SY6daJ72iIwZMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8667811"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8667811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 17:32:20 -0700
X-CSE-ConnectionGUID: 1UBKZgVISQagjmGl7bitcQ==
X-CSE-MsgGUID: PJooXBmiRIS91v5YEM9jTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="23032745"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2024 17:32:19 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwtDk-0005tU-1U;
	Wed, 17 Apr 2024 00:32:16 +0000
Date: Wed, 17 Apr 2024 08:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 47/49]
 drivers/media/v4l2-core/v4l2-ctrls-defs.c:1089:7: error: use of undeclared
 identifier 'V4L2_CID_BINNING'
Message-ID: <202404170801.BNK1NdXX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   69a69f706c36d57d978a3357e08d2254cf3d2000
commit: 50f7daffcf12adda6a9a1a23feeef0d9d81d2073 [47/49] media: uapi: Add controls for binning and sub-sampling
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240417/202404170801.BNK1NdXX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170801.BNK1NdXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170801.BNK1NdXX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:1089:7: error: use of undeclared identifier 'V4L2_CID_BINNING'
           case V4L2_CID_BINNING:                  return "Binning Factors";
                ^
>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:1090:7: error: use of undeclared identifier 'V4L2_CID_SUBSAMPLING_HORIZONTAL'
           case V4L2_CID_SUBSAMPLING_HORIZONTAL:   return "Subsampling factor, Horizontal";
                ^
>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:1091:7: error: use of undeclared identifier 'V4L2_CID_SUBSAMPLING_VERTICAL'
           case V4L2_CID_SUBSAMPLING_VERTICAL:     return "Subsampling factor, Vertical";
                ^
   drivers/media/v4l2-core/v4l2-ctrls-defs.c:1426:7: error: use of undeclared identifier 'V4L2_CID_BINNING'
           case V4L2_CID_BINNING:
                ^
   drivers/media/v4l2-core/v4l2-ctrls-defs.c:1429:7: error: use of undeclared identifier 'V4L2_CID_SUBSAMPLING_HORIZONTAL'
           case V4L2_CID_SUBSAMPLING_HORIZONTAL:
                ^
   drivers/media/v4l2-core/v4l2-ctrls-defs.c:1430:7: error: use of undeclared identifier 'V4L2_CID_SUBSAMPLING_VERTICAL'
           case V4L2_CID_SUBSAMPLING_VERTICAL:
                ^
   6 errors generated.


vim +/V4L2_CID_BINNING +1089 drivers/media/v4l2-core/v4l2-ctrls-defs.c

   785	
   786	/* Return the control name. */
   787	const char *v4l2_ctrl_get_name(u32 id)
   788	{
   789		switch (id) {
   790		/* USER controls */
   791		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
   792		case V4L2_CID_USER_CLASS:		return "User Controls";
   793		case V4L2_CID_BRIGHTNESS:		return "Brightness";
   794		case V4L2_CID_CONTRAST:			return "Contrast";
   795		case V4L2_CID_SATURATION:		return "Saturation";
   796		case V4L2_CID_HUE:			return "Hue";
   797		case V4L2_CID_AUDIO_VOLUME:		return "Volume";
   798		case V4L2_CID_AUDIO_BALANCE:		return "Balance";
   799		case V4L2_CID_AUDIO_BASS:		return "Bass";
   800		case V4L2_CID_AUDIO_TREBLE:		return "Treble";
   801		case V4L2_CID_AUDIO_MUTE:		return "Mute";
   802		case V4L2_CID_AUDIO_LOUDNESS:		return "Loudness";
   803		case V4L2_CID_BLACK_LEVEL:		return "Black Level";
   804		case V4L2_CID_AUTO_WHITE_BALANCE:	return "White Balance, Automatic";
   805		case V4L2_CID_DO_WHITE_BALANCE:		return "Do White Balance";
   806		case V4L2_CID_RED_BALANCE:		return "Red Balance";
   807		case V4L2_CID_BLUE_BALANCE:		return "Blue Balance";
   808		case V4L2_CID_GAMMA:			return "Gamma";
   809		case V4L2_CID_EXPOSURE:			return "Exposure";
   810		case V4L2_CID_AUTOGAIN:			return "Gain, Automatic";
   811		case V4L2_CID_GAIN:			return "Gain";
   812		case V4L2_CID_HFLIP:			return "Horizontal Flip";
   813		case V4L2_CID_VFLIP:			return "Vertical Flip";
   814		case V4L2_CID_POWER_LINE_FREQUENCY:	return "Power Line Frequency";
   815		case V4L2_CID_HUE_AUTO:			return "Hue, Automatic";
   816		case V4L2_CID_WHITE_BALANCE_TEMPERATURE: return "White Balance Temperature";
   817		case V4L2_CID_SHARPNESS:		return "Sharpness";
   818		case V4L2_CID_BACKLIGHT_COMPENSATION:	return "Backlight Compensation";
   819		case V4L2_CID_CHROMA_AGC:		return "Chroma AGC";
   820		case V4L2_CID_COLOR_KILLER:		return "Color Killer";
   821		case V4L2_CID_COLORFX:			return "Color Effects";
   822		case V4L2_CID_AUTOBRIGHTNESS:		return "Brightness, Automatic";
   823		case V4L2_CID_BAND_STOP_FILTER:		return "Band-Stop Filter";
   824		case V4L2_CID_ROTATE:			return "Rotate";
   825		case V4L2_CID_BG_COLOR:			return "Background Color";
   826		case V4L2_CID_CHROMA_GAIN:		return "Chroma Gain";
   827		case V4L2_CID_ILLUMINATORS_1:		return "Illuminator 1";
   828		case V4L2_CID_ILLUMINATORS_2:		return "Illuminator 2";
   829		case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:	return "Min Number of Capture Buffers";
   830		case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
   831		case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
   832		case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
   833		case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
   834	
   835		/*
   836		 * Codec controls
   837		 *
   838		 * The MPEG controls are applicable to all codec controls
   839		 * and the 'MPEG' part of the define is historical.
   840		 *
   841		 * Keep the order of the 'case's the same as in videodev2.h!
   842		 */
   843		case V4L2_CID_CODEC_CLASS:		return "Codec Controls";
   844		case V4L2_CID_MPEG_STREAM_TYPE:		return "Stream Type";
   845		case V4L2_CID_MPEG_STREAM_PID_PMT:	return "Stream PMT Program ID";
   846		case V4L2_CID_MPEG_STREAM_PID_AUDIO:	return "Stream Audio Program ID";
   847		case V4L2_CID_MPEG_STREAM_PID_VIDEO:	return "Stream Video Program ID";
   848		case V4L2_CID_MPEG_STREAM_PID_PCR:	return "Stream PCR Program ID";
   849		case V4L2_CID_MPEG_STREAM_PES_ID_AUDIO: return "Stream PES Audio ID";
   850		case V4L2_CID_MPEG_STREAM_PES_ID_VIDEO: return "Stream PES Video ID";
   851		case V4L2_CID_MPEG_STREAM_VBI_FMT:	return "Stream VBI Format";
   852		case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ: return "Audio Sampling Frequency";
   853		case V4L2_CID_MPEG_AUDIO_ENCODING:	return "Audio Encoding";
   854		case V4L2_CID_MPEG_AUDIO_L1_BITRATE:	return "Audio Layer I Bitrate";
   855		case V4L2_CID_MPEG_AUDIO_L2_BITRATE:	return "Audio Layer II Bitrate";
   856		case V4L2_CID_MPEG_AUDIO_L3_BITRATE:	return "Audio Layer III Bitrate";
   857		case V4L2_CID_MPEG_AUDIO_MODE:		return "Audio Stereo Mode";
   858		case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION: return "Audio Stereo Mode Extension";
   859		case V4L2_CID_MPEG_AUDIO_EMPHASIS:	return "Audio Emphasis";
   860		case V4L2_CID_MPEG_AUDIO_CRC:		return "Audio CRC";
   861		case V4L2_CID_MPEG_AUDIO_MUTE:		return "Audio Mute";
   862		case V4L2_CID_MPEG_AUDIO_AAC_BITRATE:	return "Audio AAC Bitrate";
   863		case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:	return "Audio AC-3 Bitrate";
   864		case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:	return "Audio Playback";
   865		case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK: return "Audio Multilingual Playback";
   866		case V4L2_CID_MPEG_VIDEO_ENCODING:	return "Video Encoding";
   867		case V4L2_CID_MPEG_VIDEO_ASPECT:	return "Video Aspect";
   868		case V4L2_CID_MPEG_VIDEO_B_FRAMES:	return "Video B Frames";
   869		case V4L2_CID_MPEG_VIDEO_GOP_SIZE:	return "Video GOP Size";
   870		case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
   871		case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
   872		case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
   873		case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
   874		case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
   875		case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
   876		case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
   877		case V4L2_CID_MPEG_VIDEO_MUTE:		return "Video Mute";
   878		case V4L2_CID_MPEG_VIDEO_MUTE_YUV:	return "Video Mute YUV";
   879		case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
   880		case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
   881		case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
   882		case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:	return "Intra Refresh Period Type";
   883		case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
   884		case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
   885		case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
   886		case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
   887		case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
   888		case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
   889		case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
   890		case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
   891		case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Generate Access Unit Delimiters";
   892		case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
   893		case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
   894		case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
   895		case V4L2_CID_MPEG_VIDEO_H263_MIN_QP:			return "H263 Minimum QP Value";
   896		case V4L2_CID_MPEG_VIDEO_H263_MAX_QP:			return "H263 Maximum QP Value";
   897		case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:		return "H264 I-Frame QP Value";
   898		case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:		return "H264 P-Frame QP Value";
   899		case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:		return "H264 B-Frame QP Value";
   900		case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:			return "H264 Maximum QP Value";
   901		case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:			return "H264 Minimum QP Value";
   902		case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:		return "H264 8x8 Transform Enable";
   903		case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:			return "H264 CPB Buffer Size";
   904		case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:		return "H264 Entropy Mode";
   905		case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:			return "H264 I-Frame Period";
   906		case V4L2_CID_MPEG_VIDEO_H264_LEVEL:			return "H264 Level";
   907		case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:	return "H264 Loop Filter Alpha Offset";
   908		case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:		return "H264 Loop Filter Beta Offset";
   909		case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:		return "H264 Loop Filter Mode";
   910		case V4L2_CID_MPEG_VIDEO_H264_PROFILE:			return "H264 Profile";
   911		case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:	return "Vertical Size of SAR";
   912		case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:	return "Horizontal Size of SAR";
   913		case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:		return "Aspect Ratio VUI Enable";
   914		case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:		return "VUI Aspect Ratio IDC";
   915		case V4L2_CID_MPEG_VIDEO_H264_SEI_FRAME_PACKING:	return "H264 Enable Frame Packing SEI";
   916		case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_CURRENT_FRAME_0:	return "H264 Set Curr. Frame as Frame0";
   917		case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:	return "H264 FP Arrangement Type";
   918		case V4L2_CID_MPEG_VIDEO_H264_FMO:			return "H264 Flexible MB Ordering";
   919		case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:		return "H264 Map Type for FMO";
   920		case V4L2_CID_MPEG_VIDEO_H264_FMO_SLICE_GROUP:		return "H264 FMO Number of Slice Groups";
   921		case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_DIRECTION:	return "H264 FMO Direction of Change";
   922		case V4L2_CID_MPEG_VIDEO_H264_FMO_CHANGE_RATE:		return "H264 FMO Size of 1st Slice Grp";
   923		case V4L2_CID_MPEG_VIDEO_H264_FMO_RUN_LENGTH:		return "H264 FMO No. of Consecutive MBs";
   924		case V4L2_CID_MPEG_VIDEO_H264_ASO:			return "H264 Arbitrary Slice Ordering";
   925		case V4L2_CID_MPEG_VIDEO_H264_ASO_SLICE_ORDER:		return "H264 ASO Slice Order";
   926		case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:	return "Enable H264 Hierarchical Coding";
   927		case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:	return "H264 Hierarchical Coding Type";
   928		case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:return "H264 Number of HC Layers";
   929		case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER_QP:
   930									return "H264 Set QP Value for HC Layers";
   931		case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
   932									return "H264 Constrained Intra Pred";
   933		case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:	return "H264 Chroma QP Index Offset";
   934		case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP:		return "H264 I-Frame Minimum QP Value";
   935		case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
   936		case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
   937		case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
   938		case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
   939		case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
   940		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
   941		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
   942		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
   943		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
   944		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
   945		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
   946		case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
   947		case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
   948		case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
   949		case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
   950		case V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP:		return "MPEG4 P-Frame QP Value";
   951		case V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP:		return "MPEG4 B-Frame QP Value";
   952		case V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP:			return "MPEG4 Minimum QP Value";
   953		case V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP:			return "MPEG4 Maximum QP Value";
   954		case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:			return "MPEG4 Level";
   955		case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:			return "MPEG4 Profile";
   956		case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:			return "Quarter Pixel Search Enable";
   957		case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES:		return "Maximum Bytes in a Slice";
   958		case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:		return "Number of MBs in a Slice";
   959		case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:		return "Slice Partitioning Method";
   960		case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
   961		case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
   962		case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
   963		case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
   964		case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
   965		case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
   966		case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
   967		case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
   968		case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
   969		case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
   970		case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
   971		case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
   972		case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
   973		case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
   974		case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
   975	
   976		/* VPX controls */
   977		case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
   978		case V4L2_CID_MPEG_VIDEO_VPX_IMD_DISABLE_4X4:		return "VPX Intra Mode Decision Disable";
   979		case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:		return "VPX No. of Refs for P Frame";
   980		case V4L2_CID_MPEG_VIDEO_VPX_FILTER_LEVEL:		return "VPX Loop Filter Level Range";
   981		case V4L2_CID_MPEG_VIDEO_VPX_FILTER_SHARPNESS:		return "VPX Deblocking Effect Control";
   982		case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_REF_PERIOD:	return "VPX Golden Frame Refresh Period";
   983		case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:		return "VPX Golden Frame Indicator";
   984		case V4L2_CID_MPEG_VIDEO_VPX_MIN_QP:			return "VPX Minimum QP Value";
   985		case V4L2_CID_MPEG_VIDEO_VPX_MAX_QP:			return "VPX Maximum QP Value";
   986		case V4L2_CID_MPEG_VIDEO_VPX_I_FRAME_QP:		return "VPX I-Frame QP Value";
   987		case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
   988		case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
   989		case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
   990		case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
   991	
   992		/* HEVC controls */
   993		case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:		return "HEVC I-Frame QP Value";
   994		case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:		return "HEVC P-Frame QP Value";
   995		case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
   996		case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
   997		case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
   998		case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
   999		case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
  1000		case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
  1001		case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
  1002		case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
  1003		case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
  1004		case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
  1005		case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
  1006		case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
  1007		case V4L2_CID_MPEG_VIDEO_HEVC_FRAME_RATE_RESOLUTION:	return "HEVC Frame Rate Resolution";
  1008		case V4L2_CID_MPEG_VIDEO_HEVC_MAX_PARTITION_DEPTH:	return "HEVC Maximum Coding Unit Depth";
  1009		case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:		return "HEVC Refresh Type";
  1010		case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:		return "HEVC Constant Intra Prediction";
  1011		case V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU:		return "HEVC Lossless Encoding";
  1012		case V4L2_CID_MPEG_VIDEO_HEVC_WAVEFRONT:		return "HEVC Wavefront";
  1013		case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:		return "HEVC Loop Filter";
  1014		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP:			return "HEVC QP Values";
  1015		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:		return "HEVC Hierarchical Coding Type";
  1016		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER:	return "HEVC Hierarchical Coding Layer";
  1017		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_QP:	return "HEVC Hierarchical Layer 0 QP";
  1018		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_QP:	return "HEVC Hierarchical Layer 1 QP";
  1019		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_QP:	return "HEVC Hierarchical Layer 2 QP";
  1020		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_QP:	return "HEVC Hierarchical Layer 3 QP";
  1021		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_QP:	return "HEVC Hierarchical Layer 4 QP";
  1022		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_QP:	return "HEVC Hierarchical Layer 5 QP";
  1023		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_QP:	return "HEVC Hierarchical Layer 6 QP";
  1024		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR:	return "HEVC Hierarchical Lay 0 BitRate";
  1025		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR:	return "HEVC Hierarchical Lay 1 BitRate";
  1026		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR:	return "HEVC Hierarchical Lay 2 BitRate";
  1027		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR:	return "HEVC Hierarchical Lay 3 BitRate";
  1028		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR:	return "HEVC Hierarchical Lay 4 BitRate";
  1029		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:	return "HEVC Hierarchical Lay 5 BitRate";
  1030		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR:	return "HEVC Hierarchical Lay 6 BitRate";
  1031		case V4L2_CID_MPEG_VIDEO_HEVC_GENERAL_PB:		return "HEVC General PB";
  1032		case V4L2_CID_MPEG_VIDEO_HEVC_TEMPORAL_ID:		return "HEVC Temporal ID";
  1033		case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:		return "HEVC Strong Intra Smoothing";
  1034		case V4L2_CID_MPEG_VIDEO_HEVC_INTRA_PU_SPLIT:		return "HEVC Intra PU Split";
  1035		case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:		return "HEVC TMV Prediction";
  1036		case V4L2_CID_MPEG_VIDEO_HEVC_MAX_NUM_MERGE_MV_MINUS1:	return "HEVC Max Num of Candidate MVs";
  1037		case V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE:	return "HEVC ENC Without Startcode";
  1038		case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:		return "HEVC Num of I-Frame b/w 2 IDR";
  1039		case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:	return "HEVC Loop Filter Beta Offset";
  1040		case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:	return "HEVC Loop Filter TC Offset";
  1041		case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
  1042		case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
  1043		case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
  1044	
  1045		/* AV1 controls */
  1046		case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:			return "AV1 Profile";
  1047		case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:			return "AV1 Level";
  1048	
  1049		/* CAMERA controls */
  1050		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1051		case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
  1052		case V4L2_CID_EXPOSURE_AUTO:		return "Auto Exposure";
  1053		case V4L2_CID_EXPOSURE_ABSOLUTE:	return "Exposure Time, Absolute";
  1054		case V4L2_CID_EXPOSURE_AUTO_PRIORITY:	return "Exposure, Dynamic Framerate";
  1055		case V4L2_CID_PAN_RELATIVE:		return "Pan, Relative";
  1056		case V4L2_CID_TILT_RELATIVE:		return "Tilt, Relative";
  1057		case V4L2_CID_PAN_RESET:		return "Pan, Reset";
  1058		case V4L2_CID_TILT_RESET:		return "Tilt, Reset";
  1059		case V4L2_CID_PAN_ABSOLUTE:		return "Pan, Absolute";
  1060		case V4L2_CID_TILT_ABSOLUTE:		return "Tilt, Absolute";
  1061		case V4L2_CID_FOCUS_ABSOLUTE:		return "Focus, Absolute";
  1062		case V4L2_CID_FOCUS_RELATIVE:		return "Focus, Relative";
  1063		case V4L2_CID_FOCUS_AUTO:		return "Focus, Automatic Continuous";
  1064		case V4L2_CID_ZOOM_ABSOLUTE:		return "Zoom, Absolute";
  1065		case V4L2_CID_ZOOM_RELATIVE:		return "Zoom, Relative";
  1066		case V4L2_CID_ZOOM_CONTINUOUS:		return "Zoom, Continuous";
  1067		case V4L2_CID_PRIVACY:			return "Privacy";
  1068		case V4L2_CID_IRIS_ABSOLUTE:		return "Iris, Absolute";
  1069		case V4L2_CID_IRIS_RELATIVE:		return "Iris, Relative";
  1070		case V4L2_CID_AUTO_EXPOSURE_BIAS:	return "Auto Exposure, Bias";
  1071		case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE: return "White Balance, Auto & Preset";
  1072		case V4L2_CID_WIDE_DYNAMIC_RANGE:	return "Wide Dynamic Range";
  1073		case V4L2_CID_IMAGE_STABILIZATION:	return "Image Stabilization";
  1074		case V4L2_CID_ISO_SENSITIVITY:		return "ISO Sensitivity";
  1075		case V4L2_CID_ISO_SENSITIVITY_AUTO:	return "ISO Sensitivity, Auto";
  1076		case V4L2_CID_EXPOSURE_METERING:	return "Exposure, Metering Mode";
  1077		case V4L2_CID_SCENE_MODE:		return "Scene Mode";
  1078		case V4L2_CID_3A_LOCK:			return "3A Lock";
  1079		case V4L2_CID_AUTO_FOCUS_START:		return "Auto Focus, Start";
  1080		case V4L2_CID_AUTO_FOCUS_STOP:		return "Auto Focus, Stop";
  1081		case V4L2_CID_AUTO_FOCUS_STATUS:	return "Auto Focus, Status";
  1082		case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
  1083		case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
  1084		case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
  1085		case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
  1086		case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
  1087		case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
  1088		case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> 1089		case V4L2_CID_BINNING:			return "Binning Factors";
> 1090		case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Subsampling factor, Horizontal";
> 1091		case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Subsampling factor, Vertical";
  1092	
  1093		/* FM Radio Modulator controls */
  1094		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1095		case V4L2_CID_FM_TX_CLASS:		return "FM Radio Modulator Controls";
  1096		case V4L2_CID_RDS_TX_DEVIATION:		return "RDS Signal Deviation";
  1097		case V4L2_CID_RDS_TX_PI:		return "RDS Program ID";
  1098		case V4L2_CID_RDS_TX_PTY:		return "RDS Program Type";
  1099		case V4L2_CID_RDS_TX_PS_NAME:		return "RDS PS Name";
  1100		case V4L2_CID_RDS_TX_RADIO_TEXT:	return "RDS Radio Text";
  1101		case V4L2_CID_RDS_TX_MONO_STEREO:	return "RDS Stereo";
  1102		case V4L2_CID_RDS_TX_ARTIFICIAL_HEAD:	return "RDS Artificial Head";
  1103		case V4L2_CID_RDS_TX_COMPRESSED:	return "RDS Compressed";
  1104		case V4L2_CID_RDS_TX_DYNAMIC_PTY:	return "RDS Dynamic PTY";
  1105		case V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
  1106		case V4L2_CID_RDS_TX_TRAFFIC_PROGRAM:	return "RDS Traffic Program";
  1107		case V4L2_CID_RDS_TX_MUSIC_SPEECH:	return "RDS Music";
  1108		case V4L2_CID_RDS_TX_ALT_FREQS_ENABLE:	return "RDS Enable Alt Frequencies";
  1109		case V4L2_CID_RDS_TX_ALT_FREQS:		return "RDS Alternate Frequencies";
  1110		case V4L2_CID_AUDIO_LIMITER_ENABLED:	return "Audio Limiter Feature Enabled";
  1111		case V4L2_CID_AUDIO_LIMITER_RELEASE_TIME: return "Audio Limiter Release Time";
  1112		case V4L2_CID_AUDIO_LIMITER_DEVIATION:	return "Audio Limiter Deviation";
  1113		case V4L2_CID_AUDIO_COMPRESSION_ENABLED: return "Audio Compression Enabled";
  1114		case V4L2_CID_AUDIO_COMPRESSION_GAIN:	return "Audio Compression Gain";
  1115		case V4L2_CID_AUDIO_COMPRESSION_THRESHOLD: return "Audio Compression Threshold";
  1116		case V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME: return "Audio Compression Attack Time";
  1117		case V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME: return "Audio Compression Release Time";
  1118		case V4L2_CID_PILOT_TONE_ENABLED:	return "Pilot Tone Feature Enabled";
  1119		case V4L2_CID_PILOT_TONE_DEVIATION:	return "Pilot Tone Deviation";
  1120		case V4L2_CID_PILOT_TONE_FREQUENCY:	return "Pilot Tone Frequency";
  1121		case V4L2_CID_TUNE_PREEMPHASIS:		return "Pre-Emphasis";
  1122		case V4L2_CID_TUNE_POWER_LEVEL:		return "Tune Power Level";
  1123		case V4L2_CID_TUNE_ANTENNA_CAPACITOR:	return "Tune Antenna Capacitor";
  1124	
  1125		/* Flash controls */
  1126		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1127		case V4L2_CID_FLASH_CLASS:		return "Flash Controls";
  1128		case V4L2_CID_FLASH_LED_MODE:		return "LED Mode";
  1129		case V4L2_CID_FLASH_STROBE_SOURCE:	return "Strobe Source";
  1130		case V4L2_CID_FLASH_STROBE:		return "Strobe";
  1131		case V4L2_CID_FLASH_STROBE_STOP:	return "Stop Strobe";
  1132		case V4L2_CID_FLASH_STROBE_STATUS:	return "Strobe Status";
  1133		case V4L2_CID_FLASH_TIMEOUT:		return "Strobe Timeout";
  1134		case V4L2_CID_FLASH_INTENSITY:		return "Intensity, Flash Mode";
  1135		case V4L2_CID_FLASH_TORCH_INTENSITY:	return "Intensity, Torch Mode";
  1136		case V4L2_CID_FLASH_INDICATOR_INTENSITY: return "Intensity, Indicator";
  1137		case V4L2_CID_FLASH_FAULT:		return "Faults";
  1138		case V4L2_CID_FLASH_CHARGE:		return "Charge";
  1139		case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
  1140	
  1141		/* JPEG encoder controls */
  1142		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1143		case V4L2_CID_JPEG_CLASS:		return "JPEG Compression Controls";
  1144		case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:	return "Chroma Subsampling";
  1145		case V4L2_CID_JPEG_RESTART_INTERVAL:	return "Restart Interval";
  1146		case V4L2_CID_JPEG_COMPRESSION_QUALITY:	return "Compression Quality";
  1147		case V4L2_CID_JPEG_ACTIVE_MARKER:	return "Active Markers";
  1148	
  1149		/* Image source controls */
  1150		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1151		case V4L2_CID_IMAGE_SOURCE_CLASS:	return "Image Source Controls";
  1152		case V4L2_CID_VBLANK:			return "Vertical Blanking";
  1153		case V4L2_CID_HBLANK:			return "Horizontal Blanking";
  1154		case V4L2_CID_ANALOGUE_GAIN:		return "Analogue Gain";
  1155		case V4L2_CID_TEST_PATTERN_RED:		return "Red Pixel Value";
  1156		case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
  1157		case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
  1158		case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
  1159		case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
  1160	
  1161		/* Image processing controls */
  1162		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1163		case V4L2_CID_IMAGE_PROC_CLASS:		return "Image Processing Controls";
  1164		case V4L2_CID_LINK_FREQ:		return "Link Frequency";
  1165		case V4L2_CID_PIXEL_RATE:		return "Pixel Rate";
  1166		case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
  1167		case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
  1168		case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
  1169	
  1170		/* DV controls */
  1171		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1172		case V4L2_CID_DV_CLASS:			return "Digital Video Controls";
  1173		case V4L2_CID_DV_TX_HOTPLUG:		return "Hotplug Present";
  1174		case V4L2_CID_DV_TX_RXSENSE:		return "RxSense Present";
  1175		case V4L2_CID_DV_TX_EDID_PRESENT:	return "EDID Present";
  1176		case V4L2_CID_DV_TX_MODE:		return "Transmit Mode";
  1177		case V4L2_CID_DV_TX_RGB_RANGE:		return "Tx RGB Quantization Range";
  1178		case V4L2_CID_DV_TX_IT_CONTENT_TYPE:	return "Tx IT Content Type";
  1179		case V4L2_CID_DV_RX_POWER_PRESENT:	return "Power Present";
  1180		case V4L2_CID_DV_RX_RGB_RANGE:		return "Rx RGB Quantization Range";
  1181		case V4L2_CID_DV_RX_IT_CONTENT_TYPE:	return "Rx IT Content Type";
  1182	
  1183		case V4L2_CID_FM_RX_CLASS:		return "FM Radio Receiver Controls";
  1184		case V4L2_CID_TUNE_DEEMPHASIS:		return "De-Emphasis";
  1185		case V4L2_CID_RDS_RECEPTION:		return "RDS Reception";
  1186		case V4L2_CID_RF_TUNER_CLASS:		return "RF Tuner Controls";
  1187		case V4L2_CID_RF_TUNER_RF_GAIN:		return "RF Gain";
  1188		case V4L2_CID_RF_TUNER_LNA_GAIN_AUTO:	return "LNA Gain, Auto";
  1189		case V4L2_CID_RF_TUNER_LNA_GAIN:	return "LNA Gain";
  1190		case V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO:	return "Mixer Gain, Auto";
  1191		case V4L2_CID_RF_TUNER_MIXER_GAIN:	return "Mixer Gain";
  1192		case V4L2_CID_RF_TUNER_IF_GAIN_AUTO:	return "IF Gain, Auto";
  1193		case V4L2_CID_RF_TUNER_IF_GAIN:		return "IF Gain";
  1194		case V4L2_CID_RF_TUNER_BANDWIDTH_AUTO:	return "Bandwidth, Auto";
  1195		case V4L2_CID_RF_TUNER_BANDWIDTH:	return "Bandwidth";
  1196		case V4L2_CID_RF_TUNER_PLL_LOCK:	return "PLL Lock";
  1197		case V4L2_CID_RDS_RX_PTY:		return "RDS Program Type";
  1198		case V4L2_CID_RDS_RX_PS_NAME:		return "RDS PS Name";
  1199		case V4L2_CID_RDS_RX_RADIO_TEXT:	return "RDS Radio Text";
  1200		case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT: return "RDS Traffic Announcement";
  1201		case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:	return "RDS Traffic Program";
  1202		case V4L2_CID_RDS_RX_MUSIC_SPEECH:	return "RDS Music";
  1203	
  1204		/* Detection controls */
  1205		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1206		case V4L2_CID_DETECT_CLASS:		return "Detection Controls";
  1207		case V4L2_CID_DETECT_MD_MODE:		return "Motion Detection Mode";
  1208		case V4L2_CID_DETECT_MD_GLOBAL_THRESHOLD: return "MD Global Threshold";
  1209		case V4L2_CID_DETECT_MD_THRESHOLD_GRID:	return "MD Threshold Grid";
  1210		case V4L2_CID_DETECT_MD_REGION_GRID:	return "MD Region Grid";
  1211	
  1212		/* Stateless Codec controls */
  1213		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1214		case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
  1215		case V4L2_CID_STATELESS_H264_DECODE_MODE:		return "H264 Decode Mode";
  1216		case V4L2_CID_STATELESS_H264_START_CODE:		return "H264 Start Code";
  1217		case V4L2_CID_STATELESS_H264_SPS:			return "H264 Sequence Parameter Set";
  1218		case V4L2_CID_STATELESS_H264_PPS:			return "H264 Picture Parameter Set";
  1219		case V4L2_CID_STATELESS_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
  1220		case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
  1221		case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
  1222		case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
  1223		case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
  1224		case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
  1225		case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
  1226		case V4L2_CID_STATELESS_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
  1227		case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
  1228		case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
  1229		case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
  1230		case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
  1231		case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
  1232		case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
  1233		case V4L2_CID_STATELESS_HEVC_SCALING_MATRIX:		return "HEVC Scaling Matrix";
  1234		case V4L2_CID_STATELESS_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
  1235		case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
  1236		case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
  1237		case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
  1238		case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Parameters";
  1239		case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Group Entry";
  1240		case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters";
  1241		case V4L2_CID_STATELESS_AV1_FILM_GRAIN:			return "AV1 Film Grain";
  1242	
  1243		/* Colorimetry controls */
  1244		/* Keep the order of the 'case's the same as in v4l2-controls.h! */
  1245		case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
  1246		case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
  1247		case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
  1248		default:
  1249			return NULL;
  1250		}
  1251	}
  1252	EXPORT_SYMBOL(v4l2_ctrl_get_name);
  1253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

