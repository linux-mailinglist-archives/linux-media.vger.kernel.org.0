Return-Path: <linux-media+bounces-61038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ajkGAyctAWpsRgEAu9opvQ
	(envelope-from <linux-media+bounces-61038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 03:13:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB5506F4B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 03:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 487043003621
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 01:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C345C1E834E;
	Mon, 11 May 2026 01:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O23Q4+Jn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4A2032D;
	Mon, 11 May 2026 01:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778461984; cv=none; b=nXCFhq/WbeAIswRIEcwkvKU6GBlOfEAKkAAj8ahqeLBD8LY4mADkLd8qJL12WaoX3gwJuDVOAOzYiSV+Jv20dF4vvGaQmQXqI8C1ROykVlup4vvNz5SsLwgMXIrkxVq64c4jgvTXHaodXQgSi+sHvCoxOu0yFFODG+c1uiF2gms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778461984; c=relaxed/simple;
	bh=8a7VpMh58wv5nQrfJzU52FbQ1t6Y3A8ge63+Ug+4QX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdOHwDV78ydGD6ynj2Fxjlc23m0YLSFXyFgF1xOtA678zRXVJOXfl0/KnPTjxerVOLM9rlfwds6XYs+h6dJVM4265lMs99gFHITpRFtlxpiCxlk+M2pKIKFV/UJjIgA+mSgiyhNX8sN0Orl+HZiiaX6qh0P+RlhKyykHiPNbfac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O23Q4+Jn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778461980; x=1809997980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8a7VpMh58wv5nQrfJzU52FbQ1t6Y3A8ge63+Ug+4QX4=;
  b=O23Q4+JnbR28Oo5daL6TB6MxvkpdjOdyM7o4YZbQTzPVYJpTlQzq8TNm
   5CpOuUSQfYeRbO8nKUtT8aNJYv2rIdODUPDOrLHuk7M4fvuteE21nUxXU
   BGuBgBpmysUbPdqRQ1csDAHd1Iol+EQs8bZT1wjh5DleD0+HmY7/4HEh7
   L4igxHHkSuU5MchBgc5UU3JKhwT6lotMPMsw2s4sD261Z/sDpurtu/QXn
   Sn/Gy+xarKZ2VY6P+6UjwAV9wPEtaQzqqnpL3b6FMR7lwSJmUGn5SBYyc
   S1H1uwjh9XtKmu9uBNlzCei5Exo8NPYwvItr1yhy2/iTBSw8t+I2++4NK
   g==;
X-CSE-ConnectionGUID: LfITz3zMQ6CujDaQvILaZQ==
X-CSE-MsgGUID: YgFE7V4iSGOZeeKZfBtvqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="66879143"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="66879143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 18:12:59 -0700
X-CSE-ConnectionGUID: WtWc4diRSyGT+55IuEMuUw==
X-CSE-MsgGUID: RQCIBGdZRBuPXBz8g5ANPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="236336829"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 May 2026 18:12:56 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMFCQ-000000002nB-2FF1;
	Mon, 11 May 2026 01:12:49 +0000
Date: Mon, 11 May 2026 09:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Everton Colombo <e.rcolombo2@gmail.com>, andy@kernel.org,
	hansg@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	koike@igalia.com, ~lkcamp/patches@lists.sr.ht,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Everton Colombo <e.rcolombo2@gmail.com>
Subject: Re: [PATCH v2] media: atomisp: remove returns from void functions
Message-ID: <202605110909.yaoxzCej-lkp@intel.com>
References: <20260506173028.24417-1-e.rcolombo2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506173028.24417-1-e.rcolombo2@gmail.com>
X-Rspamd-Queue-Id: 15CB5506F4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,linux.intel.com,linuxfoundation.org,igalia.com,lists.sr.ht,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-61038-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,01.org:url]
X-Rspamd-Action: no action

Hi Everton,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Everton-Colombo/media-atomisp-remove-returns-from-void-functions/20260510-154432
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260506173028.24417-1-e.rcolombo2%40gmail.com
patch subject: [PATCH v2] media: atomisp: remove returns from void functions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260511/202605110909.yaoxzCej-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110909.yaoxzCej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110909.yaoxzCej-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function 'ia_css_debug_binary_print':
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:853:1: error: invalid storage class for function 'findf_dmem_params'
     853 | findf_dmem_params(struct ia_css_stream *stream, short idx)
         | ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1049:28: error: invalid storage class for function 'dtrace_dot'
    1049 | static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
         |                            ^~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1063:1: error: invalid storage class for function 'ia_css_debug_pipe_graph_dump_frame'
    1063 | ia_css_debug_pipe_graph_dump_frame(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1875:1: error: expected declaration or statement at end of input
    1875 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: At top level:
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1862:6: warning: 'ia_css_debug_pc_dump' defined but not used [-Wunused-function]
    1862 | void ia_css_debug_pc_dump(sp_ID_t id, unsigned int num_of_dumps)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1848:6: warning: 'ia_css_debug_dump_trace' defined but not used [-Wunused-function]
    1848 | void ia_css_debug_dump_trace(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1575:1: warning: 'ia_css_debug_dump_stream_config' defined but not used [-Wunused-function]
    1575 | ia_css_debug_dump_stream_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1475:1: warning: 'ia_css_debug_dump_pipe_config' defined but not used [-Wunused-function]
    1475 | ia_css_debug_dump_pipe_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1447:1: warning: 'ia_css_debug_dump_pipe_extra_config' defined but not used [-Wunused-function]
    1447 | ia_css_debug_dump_pipe_extra_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1399:1: warning: 'ia_css_debug_pipe_graph_dump_stream_config' defined but not used [-Wunused-function]
    1399 | ia_css_debug_pipe_graph_dump_stream_config(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1368:1: warning: 'ia_css_debug_pipe_graph_dump_sp_raw_copy' defined but not used [-Wunused-function]
    1368 | ia_css_debug_pipe_graph_dump_sp_raw_copy(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1157:1: warning: 'ia_css_debug_pipe_graph_dump_stage' defined but not used [-Wunused-function]
    1157 | ia_css_debug_pipe_graph_dump_stage(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1114:6: warning: 'ia_css_debug_pipe_graph_dump_epilogue' defined but not used [-Wunused-function]
    1114 | void ia_css_debug_pipe_graph_dump_epilogue(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1039:1: warning: 'ia_css_debug_mode_enable_dma_channel' defined but not used [-Wunused-function]
    1039 | ia_css_debug_mode_enable_dma_channel(int dma_id,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1024:1: warning: 'ia_css_debug_mode_disable_dma_channel' defined but not used [-Wunused-function]
    1024 | ia_css_debug_mode_disable_dma_channel(int dma_id,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1011:6: warning: 'ia_css_debug_mode_init' defined but not used [-Wunused-function]
    1011 | bool ia_css_debug_mode_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:976:6: warning: 'ia_css_debug_dump_isp_binary' defined but not used [-Wunused-function]
     976 | void ia_css_debug_dump_isp_binary(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:946:6: warning: 'sh_css_dump_sp_raw_copy_linecount' defined but not used [-Wunused-function]
     946 | void sh_css_dump_sp_raw_copy_linecount(bool reduced)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:877:6: warning: 'ia_css_debug_dump_isp_params' defined but not used [-Wunused-function]
     877 | void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:839:6: warning: 'ia_css_debug_wake_up_sp' defined but not used [-Wunused-function]
     839 | void ia_css_debug_wake_up_sp(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:824:6: warning: 'ia_css_debug_enable_sp_sleep_mode' defined but not used [-Wunused-function]
     824 | void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:807:6: warning: 'ia_css_debug_dump_sp_sw_debug_info' defined but not used [-Wunused-function]
     807 | void ia_css_debug_dump_sp_sw_debug_info(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:441:6: warning: 'ia_css_debug_frame_print' defined but not used [-Wunused-function]
     441 | void ia_css_debug_frame_print(const struct ia_css_frame *frame,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c: In function 'inputfifo_send_data_b':
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:110:13: error: invalid storage class for function 'inputfifo_send_data'
     110 | static void inputfifo_send_data(
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:122:13: error: invalid storage class for function 'inputfifo_send_sol'
     122 | static void inputfifo_send_sol(void)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:131:13: error: invalid storage class for function 'inputfifo_send_eol'
     131 | static void inputfifo_send_eol(void)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:139:13: error: invalid storage class for function 'inputfifo_send_sof'
     139 | static void inputfifo_send_sof(void)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:148:13: error: invalid storage class for function 'inputfifo_send_eof'
     148 | static void inputfifo_send_eof(void)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:156:13: error: invalid storage class for function 'inputfifo_send_ch_id_and_fmt_type'
     156 | static void inputfifo_send_ch_id_and_fmt_type(
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:173:13: error: invalid storage class for function 'inputfifo_send_empty_token'
     173 | static void inputfifo_send_empty_token(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:181:13: error: invalid storage class for function 'inputfifo_start_frame'
     181 | static void inputfifo_start_frame(
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:190:13: error: invalid storage class for function 'inputfifo_end_frame'
     190 | static void inputfifo_end_frame(
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:200:13: error: invalid storage class for function 'inputfifo_send_line2'
     200 | static void inputfifo_send_line2(
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:290:1: error: invalid storage class for function 'inputfifo_send_line'
     290 | inputfifo_send_line(const unsigned short *data,
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:333:13: error: invalid storage class for function 'inputfifo_send_frame'
     333 | static void inputfifo_send_frame(
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:368:38: error: invalid storage class for function 'inputfifo_determine_type'
     368 | static enum inputfifo_mipi_data_type inputfifo_determine_type(
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:390:35: error: invalid storage class for function 'inputfifo_get_inst'
     390 | static struct inputfifo_instance *inputfifo_get_inst(
         |                                   ^~~~~~~~~~~~~~~~~~
>> drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:503:1: error: expected declaration or statement at end of input
     503 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c: At top level:
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:488:6: warning: 'ia_css_inputfifo_end_frame' defined but not used [-Wunused-function]
     488 | void ia_css_inputfifo_end_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:467:6: warning: 'ia_css_inputfifo_send_embedded_line' defined but not used [-Wunused-function]
     467 | void ia_css_inputfifo_send_embedded_line(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:443:6: warning: 'ia_css_inputfifo_send_line' defined but not used [-Wunused-function]
     443 | void ia_css_inputfifo_send_line(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:421:6: warning: 'ia_css_inputfifo_start_frame' defined but not used [-Wunused-function]
     421 | void ia_css_inputfifo_start_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c:396:6: warning: 'ia_css_inputfifo_send_input_frame' defined but not used [-Wunused-function]
     396 | void ia_css_inputfifo_send_input_frame(
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: In function 'ia_css_isys_rx_configure':
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:646:1: error: expected declaration or statement at end of input
     646 | }
         | ^
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: At top level:
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:637:6: warning: 'ia_css_isys_rx_disable' defined but not used [-Wunused-function]
     637 | void ia_css_isys_rx_disable(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/findf_dmem_params +853 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   850  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   851  /* Find a stage that support the kernel and return the parameters for that kernel */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   852  static char *
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  @853  findf_dmem_params(struct ia_css_stream *stream, short idx)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   854  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   855  	int i;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   856  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   857  	for (i = 0; i < stream->num_pipes; i++) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   858  		struct ia_css_pipe *pipe = stream->pipes[i];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   859  		struct ia_css_pipeline *pipeline = ia_css_pipe_get_pipeline(pipe);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   860  		struct ia_css_pipeline_stage *stage;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   861  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   862  		for (stage = pipeline->stages; stage; stage = stage->next) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   863  			struct ia_css_binary *binary = stage->binary;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   864  			short *offsets = (short *)&binary->info->mem_offsets.offsets.param->dmem;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   865  			short dmem_offset = offsets[idx];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   866  			const struct ia_css_host_data *isp_data =
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   867  			    ia_css_isp_param_get_mem_init(&binary->mem_params,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   868  							  IA_CSS_PARAM_CLASS_PARAM, IA_CSS_ISP_DMEM0);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   869  			if (dmem_offset < 0)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   870  				continue;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   871  			return &isp_data->address[dmem_offset];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   872  		}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   873  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   874  	return NULL;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   875  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   876  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   877  void ia_css_debug_dump_isp_params(struct ia_css_stream *stream,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   878  				  unsigned int enable)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   879  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   880  	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "ISP PARAMETERS:\n");
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   881  
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   882  	assert(stream);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   883  	if ((enable & IA_CSS_DEBUG_DUMP_FPN)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   884  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   885  		ia_css_fpn_dump(FIND_DMEM_PARAMS(stream, fpn), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   886  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   887  	if ((enable & IA_CSS_DEBUG_DUMP_OB)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   888  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   889  		ia_css_ob_dump(FIND_DMEM_PARAMS(stream, ob), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   890  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   891  	if ((enable & IA_CSS_DEBUG_DUMP_SC)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   892  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   893  		ia_css_sc_dump(FIND_DMEM_PARAMS(stream, sc), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   894  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   895  	if ((enable & IA_CSS_DEBUG_DUMP_WB)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   896  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   897  		ia_css_wb_dump(FIND_DMEM_PARAMS(stream, wb), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   898  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   899  	if ((enable & IA_CSS_DEBUG_DUMP_DP)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   900  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   901  		ia_css_dp_dump(FIND_DMEM_PARAMS(stream, dp), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   902  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   903  	if ((enable & IA_CSS_DEBUG_DUMP_BNR)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   904  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   905  		ia_css_bnr_dump(FIND_DMEM_PARAMS(stream, bnr), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   906  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   907  	if ((enable & IA_CSS_DEBUG_DUMP_S3A)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   908  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   909  		ia_css_s3a_dump(FIND_DMEM_PARAMS(stream, s3a), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   910  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   911  	if ((enable & IA_CSS_DEBUG_DUMP_DE)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   912  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   913  		ia_css_de_dump(FIND_DMEM_PARAMS(stream, de), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   914  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   915  	if ((enable & IA_CSS_DEBUG_DUMP_YNR)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   916  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   917  		ia_css_nr_dump(FIND_DMEM_PARAMS_TYPE(stream, nr, ynr),  IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   918  		ia_css_yee_dump(FIND_DMEM_PARAMS(stream, yee), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   919  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   920  	if ((enable & IA_CSS_DEBUG_DUMP_CSC)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   921  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   922  		ia_css_csc_dump(FIND_DMEM_PARAMS(stream, csc), IA_CSS_DEBUG_VERBOSE);
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   923  		ia_css_yuv2rgb_dump(FIND_DMEM_PARAMS_TYPE(stream, yuv2rgb, csc),
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   924  				    IA_CSS_DEBUG_VERBOSE);
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   925  		ia_css_rgb2yuv_dump(FIND_DMEM_PARAMS_TYPE(stream, rgb2yuv, csc),
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   926  				    IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   927  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   928  	if ((enable & IA_CSS_DEBUG_DUMP_GC)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   929  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   930  		ia_css_gc_dump(FIND_DMEM_PARAMS(stream, gc), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   931  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   932  	if ((enable & IA_CSS_DEBUG_DUMP_TNR)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   933  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   934  		ia_css_tnr_dump(FIND_DMEM_PARAMS(stream, tnr), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   935  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   936  	if ((enable & IA_CSS_DEBUG_DUMP_ANR)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   937  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   938  		ia_css_anr_dump(FIND_DMEM_PARAMS(stream, anr), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   939  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   940  	if ((enable & IA_CSS_DEBUG_DUMP_CE)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   941  	    || (enable & IA_CSS_DEBUG_DUMP_ALL)) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   942  		ia_css_ce_dump(FIND_DMEM_PARAMS(stream, ce), IA_CSS_DEBUG_VERBOSE);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   943  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   944  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   945  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   946  void sh_css_dump_sp_raw_copy_linecount(bool reduced)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   947  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   948  	const struct ia_css_fw_info *fw;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   949  	unsigned int HIVE_ADDR_raw_copy_line_count;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   950  	s32 raw_copy_line_count;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   951  	static s32 prev_raw_copy_line_count = -1;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   952  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   953  	fw = &sh_css_sp_fw;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   954  	HIVE_ADDR_raw_copy_line_count =
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   955  	    fw->info.sp.raw_copy_line_count;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   956  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   957  	(void)HIVE_ADDR_raw_copy_line_count;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   958  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   959  	sp_dmem_load(SP0_ID,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   960  		     (unsigned int)sp_address_of(raw_copy_line_count),
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   961  		     &raw_copy_line_count,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   962  		     sizeof(raw_copy_line_count));
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   963  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   964  	/* only indicate if copy loop is active */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   965  	if (reduced)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   966  		raw_copy_line_count = (raw_copy_line_count < 0) ? raw_copy_line_count : 1;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   967  	/* do the handling */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   968  	if (prev_raw_copy_line_count != raw_copy_line_count) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   969  		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   970  				    "sh_css_dump_sp_raw_copy_linecount() line_count=%d\n",
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   971  				    raw_copy_line_count);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   972  		prev_raw_copy_line_count = raw_copy_line_count;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   973  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   974  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   975  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   976  void ia_css_debug_dump_isp_binary(void)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   977  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   978  	const struct ia_css_fw_info *fw;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   979  	unsigned int HIVE_ADDR_pipeline_sp_curr_binary_id;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   980  	u32 curr_binary_id;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   981  	static u32 prev_binary_id = 0xFFFFFFFF;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   982  	static u32 sample_count;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   983  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   984  	fw = &sh_css_sp_fw;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   985  	HIVE_ADDR_pipeline_sp_curr_binary_id = fw->info.sp.curr_binary_id;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   986  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   987  	(void)HIVE_ADDR_pipeline_sp_curr_binary_id;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   988  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   989  	sp_dmem_load(SP0_ID,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   990  		     (unsigned int)sp_address_of(pipeline_sp_curr_binary_id),
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   991  		     &curr_binary_id,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   992  		     sizeof(curr_binary_id));
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   993  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   994  	/* do the handling */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   995  	sample_count++;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   996  	if (prev_binary_id != curr_binary_id) {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   997  		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   998  				    "sh_css_dump_isp_binary() pipe_id=%d, binary_id=%d, sample_count=%d\n",
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19   999  				    (curr_binary_id >> 16),
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1000  				    (curr_binary_id & 0x0ffff),
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1001  				    sample_count);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1002  		sample_count = 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1003  		prev_binary_id = curr_binary_id;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1004  	}
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1005  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1006  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1007  /*
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1008   * @brief Initialize the debug mode.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1009   * Refer to "ia_css_debug.h" for more details.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1010   */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1011  bool ia_css_debug_mode_init(void)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1012  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1013  	bool rc;
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1014  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1015  	rc = sh_css_sp_init_dma_sw_reg(0);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1016  	return rc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1017  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1018  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1019  /*
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1020   * @brief Disable the DMA channel.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1021   * Refer to "ia_css_debug.h" for more details.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1022   */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1023  bool
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1024  ia_css_debug_mode_disable_dma_channel(int dma_id,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1025  				      int channel_id, int request_type)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1026  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1027  	bool rc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1028  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1029  	rc = sh_css_sp_set_dma_sw_reg(dma_id, channel_id, request_type, false);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1030  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1031  	return rc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1032  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1033  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1034  /*
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1035   * @brief Enable the DMA channel.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1036   * Refer to "ia_css_debug.h" for more details.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1037   */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1038  bool
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1039  ia_css_debug_mode_enable_dma_channel(int dma_id,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1040  				     int channel_id, int request_type)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1041  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1042  	bool rc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1043  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1044  	rc = sh_css_sp_set_dma_sw_reg(dma_id, channel_id, request_type, true);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1045  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1046  	return rc;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1047  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1048  
01cc2ec6ea04473 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c                  Mauro Carvalho Chehab 2020-09-23 @1049  static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1050  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1051  	va_list ap;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1052  
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1053  	assert(fmt);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1054  	va_start(ap, fmt);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1055  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1056  	ia_css_debug_dtrace(IA_CSS_DEBUG_INFO, "%s", DPG_START);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1057  	ia_css_debug_vdtrace(IA_CSS_DEBUG_INFO, fmt, ap);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1058  	ia_css_debug_dtrace(IA_CSS_DEBUG_INFO, "%s", DPG_END);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1059  	va_end(ap);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1060  }
bdfe0beb95eebc8 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/debug/src/ia_css_debug.c Mauro Carvalho Chehab 2020-04-19  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

