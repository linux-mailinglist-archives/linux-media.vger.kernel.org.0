Return-Path: <linux-media+bounces-51148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLXrFSL8b2mUUgAAu9opvQ
	(envelope-from <linux-media+bounces-51148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:05:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED05B4CB3E
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 23:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9D18824F97
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5023B8D62;
	Tue, 20 Jan 2026 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azHCZRWM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2333B5311
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941415; cv=none; b=XdhhJznkl08kpuslR8b/+GPul0EutthZXWpU2dTZZ/A+VE7bd2jHFj3KSNJow2x66BYyjabiej3H/BMPzFQWbrUfTWc9Hvi29nZIvhaYpvdbjwCf8i5JxwrpM0t3Dqe25ydEi67DYZOAlUkg9sDOmlkp5T7JPjIzKBiyhazY46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941415; c=relaxed/simple;
	bh=EXTBXIRIC6sg9KddItGI515kgWbLiLzTEjP/PHBAUks=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NGKDjnETtJcBYX3VGPVBGRhaWq/xdJFtyzZDi7xnfNU4Wfx/2oXH8IQLz2xYHfXx6IhuZUxdyNugCtpPdWFlbMVn5m9DBcJnZ/ZDI5V7ZldQJdWohlvS11lij01muiApe8uD+6dQBbZbF4RUCfuFUzMsQ9QVsZUNSzOzv2tDAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azHCZRWM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768941414; x=1800477414;
  h=date:from:to:cc:subject:message-id;
  bh=EXTBXIRIC6sg9KddItGI515kgWbLiLzTEjP/PHBAUks=;
  b=azHCZRWMuHW5iqEvPmDdZ2609HAsmfHbtBmZOh/pV0/BlqJPyJHf0Vvp
   YN1/KWyvP1pRmlVXWVN3usIQRiu1Q+Rr1cc0iAPS0mDfpQ2wv8/W0hNsl
   M8pilhyGuoVgzs+ppnE2+sQENvIyvFEOnyzKXsUwYaSS632tHj3I64udm
   juUDvoHEwdx9sxWbE0xemDsRx/fjo6qTR22dsL51Ju0Wv427lvoqUTO0y
   AUwnMVXglWNj5BU4VR8YPn9uO+wTaNc4tR6u6YTAB56JqQphdr+bA8Oy5
   gb9ogLcuaObyoB7Y53f+hGrwHezb4qV5T5f5wIBu/1Je28kpd+Iw7/I7t
   w==;
X-CSE-ConnectionGUID: hY9ScxV2S7qqkSwonZcQcQ==
X-CSE-MsgGUID: odIBlr0VRSykyKuyRgsXKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70328337"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70328337"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 12:36:53 -0800
X-CSE-ConnectionGUID: z5HT/AKdS5+9D/f6KFiZ0Q==
X-CSE-MsgGUID: xa6ZhmudThWZT6MAUVHt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205359378"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jan 2026 12:36:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIT2-00000000PVF-0uvy;
	Tue, 20 Jan 2026 20:36:48 +0000
Date: Wed, 21 Jan 2026 04:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 111/113]
 drivers/media/pci/intel/ipu6/ipu6-isys.c:1181:3: error: cannot jump from this
 goto statement to its label
Message-ID: <202601210431.Je4aJ8yP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51148-lists,linux-media=lfdr.de];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,01.org:url,xs4all.nl:email]
X-Rspamd-Queue-Id: ED05B4CB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   55ba38aaeb6e07cbbbe550578fa4737b05de1d00
commit: afa135d9336f38ce80db9a03551b15b9522c3f06 [111/113] media: ipu6: Serialise access to stream pointers by isys stream_lock
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260121/202601210431.Je4aJ8yP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210431.Je4aJ8yP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210431.Je4aJ8yP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-isys.c:1181:3: error: cannot jump from this goto statement to its label
    1181 |                 goto leave;
         |                 ^
   drivers/media/pci/intel/ipu6/ipu6-isys.c:1184:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1184 |         guard(spinlock_irqsave)(&isys->streams_lock);
         |         ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:96:1: note: expanded from here
      96 | __UNIQUE_ID_guard_1414
         | ^
   1 error generated.


vim +1181 drivers/media/pci/intel/ipu6/ipu6-isys.c

f50c4ca0a82003b Bingbu Cao        2024-01-31  1143  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1144  static int isys_isr_one(struct ipu6_bus_device *adev)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1145  {
f50c4ca0a82003b Bingbu Cao        2024-01-31  1146  	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1147  	struct ipu6_fw_isys_resp_info_abi *resp;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1148  	struct ipu6_isys_stream *stream;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1149  	struct ipu6_isys_csi2 *csi2 = NULL;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1150  	u32 index;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1151  	u64 ts;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1152  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1153  	if (!isys->fwcom)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1154  		return 1;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1155  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1156  	resp = ipu6_fw_isys_get_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1157  	if (!resp)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1158  		return 1;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1159  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1160  	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
f50c4ca0a82003b Bingbu Cao        2024-01-31  1161  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1162  	index = resp_type_to_index(resp->type);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1163  	dev_dbg(&adev->auxdev.dev,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1164  		"FW resp %02d %s, stream %u, ts 0x%16.16llx, pin %d\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1165  		resp->type, fw_msg[index].msg, resp->stream_handle,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1166  		fw_msg[index].valid_ts ? ts : 0, resp->pin_id);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1167  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1168  	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1169  		/* Suspension is kind of special case: not enough buffers */
f50c4ca0a82003b Bingbu Cao        2024-01-31  1170  		dev_dbg(&adev->auxdev.dev,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1171  			"FW error resp SUSPENSION, details %d\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1172  			resp->error_info.error_details);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1173  	else if (resp->error_info.error)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1174  		dev_dbg(&adev->auxdev.dev,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1175  			"FW error resp error %d, details %d\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1176  			resp->error_info.error, resp->error_info.error_details);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1177  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1178  	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
f50c4ca0a82003b Bingbu Cao        2024-01-31  1179  		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1180  			resp->stream_handle);
f50c4ca0a82003b Bingbu Cao        2024-01-31 @1181  		goto leave;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1182  	}
f50c4ca0a82003b Bingbu Cao        2024-01-31  1183  
afa135d9336f38c Sakari Ailus      2025-12-18  1184  	guard(spinlock_irqsave)(&isys->streams_lock);
afa135d9336f38c Sakari Ailus      2025-12-18  1185  
45316ce8af169db Sakari Ailus      2025-12-01  1186  	stream = resp->stream_handle < IPU6_ISYS_MAX_STREAMS ?
45316ce8af169db Sakari Ailus      2025-12-01  1187  		isys->streams_by_handle[resp->stream_handle] : NULL;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1188  	if (!stream) {
f50c4ca0a82003b Bingbu Cao        2024-01-31  1189  		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1190  			resp->stream_handle);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1191  		goto leave;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1192  	}
f50c4ca0a82003b Bingbu Cao        2024-01-31  1193  	stream->error = resp->error_info.error;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1194  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1195  	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1196  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1197  	switch (resp->type) {
f50c4ca0a82003b Bingbu Cao        2024-01-31  1198  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1199  		complete(&stream->stream_open_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1200  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1201  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1202  		complete(&stream->stream_close_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1203  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1204  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1205  		complete(&stream->stream_start_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1206  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1207  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1208  		complete(&stream->stream_start_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1209  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1210  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1211  		complete(&stream->stream_stop_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1212  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1213  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1214  		complete(&stream->stream_stop_completion);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1215  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1216  	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1217  		/*
f50c4ca0a82003b Bingbu Cao        2024-01-31  1218  		 * firmware only release the capture msg until software
f50c4ca0a82003b Bingbu Cao        2024-01-31  1219  		 * get pin_data_ready event
f50c4ca0a82003b Bingbu Cao        2024-01-31  1220  		 */
f50c4ca0a82003b Bingbu Cao        2024-01-31  1221  		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1222  		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
c139c1ac06bea6e Stanislaw Gruszka 2025-05-02  1223  		    stream->output_pins_queue[resp->pin_id])
c139c1ac06bea6e Stanislaw Gruszka 2025-05-02  1224  			ipu6_isys_queue_buf_ready(stream, resp);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1225  		else
f50c4ca0a82003b Bingbu Cao        2024-01-31  1226  			dev_warn(&adev->auxdev.dev,
c139c1ac06bea6e Stanislaw Gruszka 2025-05-02  1227  				 "%d:No queue for pin id %d\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1228  				 resp->stream_handle, resp->pin_id);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1229  		if (csi2)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1230  			ipu6_isys_csi2_error(csi2);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1231  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1232  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1233  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1234  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1235  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1236  	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1237  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1238  	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1239  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1240  		ipu6_isys_csi2_sof_event_by_stream(stream);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1241  		stream->seq[stream->seq_index].sequence =
f50c4ca0a82003b Bingbu Cao        2024-01-31  1242  			atomic_read(&stream->sequence) - 1;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1243  		stream->seq[stream->seq_index].timestamp = ts;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1244  		dev_dbg(&adev->auxdev.dev,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1245  			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1246  			resp->stream_handle,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1247  			stream->seq[stream->seq_index].sequence, ts);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1248  		stream->seq_index = (stream->seq_index + 1)
f50c4ca0a82003b Bingbu Cao        2024-01-31  1249  			% IPU6_ISYS_MAX_PARALLEL_SOF;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1250  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1251  	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1252  		ipu6_isys_csi2_eof_event_by_stream(stream);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1253  		dev_dbg(&adev->auxdev.dev,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1254  			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1255  			resp->stream_handle,
f50c4ca0a82003b Bingbu Cao        2024-01-31  1256  			stream->seq[stream->seq_index].sequence, ts);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1257  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1258  	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1259  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1260  	default:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1261  		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
f50c4ca0a82003b Bingbu Cao        2024-01-31  1262  			resp->stream_handle, resp->type);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1263  		break;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1264  	}
f50c4ca0a82003b Bingbu Cao        2024-01-31  1265  
f50c4ca0a82003b Bingbu Cao        2024-01-31  1266  leave:
f50c4ca0a82003b Bingbu Cao        2024-01-31  1267  	ipu6_fw_isys_put_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
f50c4ca0a82003b Bingbu Cao        2024-01-31  1268  	return 0;
f50c4ca0a82003b Bingbu Cao        2024-01-31  1269  }
f50c4ca0a82003b Bingbu Cao        2024-01-31  1270  

:::::: The code at line 1181 was first introduced by commit
:::::: f50c4ca0a82003b8a542c3332fd292cf1bc355a2 media: intel/ipu6: add the main input system driver

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

