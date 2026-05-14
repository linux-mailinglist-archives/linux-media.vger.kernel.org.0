Return-Path: <linux-media+bounces-61565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB/PMzxkBWqOVwIAu9opvQ
	(envelope-from <linux-media+bounces-61565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 07:57:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D9353E246
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 07:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B814F3044564
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077E339E9A0;
	Thu, 14 May 2026 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/+veXBz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BA4308F03;
	Thu, 14 May 2026 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738208; cv=none; b=OW+SryPkICvS8B3Tiz7EzUCRGrmxRMhccjpsPhamxJ1SbexjPc1UzjcQf/at2VR5XhQFq1eaBAZjcg/763CMil39wFz/GPND/Lr02qvp7t4GkKhEN2Zd2eRhkjEpH1gfOHlNXlP/NyS5sSr5RZKnA916PL1jFMEU2RuBwTHpgYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738208; c=relaxed/simple;
	bh=OjDlPKwiJjP7TEYEqcb/N5yApaw9XjPJbJxmxJFggxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L849MfT3bE8bs8USIKGZkfpHpXk+KuzEM43dpJhhxsNPqB0wVYEWyNWAVchb4tmjUn/QuovUMaCm7THMUXo1xqAGCIqL834HcMI9davfEeYErd4QqWe3Y3MRd8BsIDbRGebrO99IcAV2CQiYHhHvjEMYPlwhTesMx/7+GPQG+1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/+veXBz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778738206; x=1810274206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjDlPKwiJjP7TEYEqcb/N5yApaw9XjPJbJxmxJFggxk=;
  b=R/+veXBzrDrwLEi1e40OLeLv9fzVYb/23hixQpf7JlOOh+cjqR2CHKFz
   MKQZKuSN6jBKSWaetWAhG5pO23gNAgQX/klzB7DQ0n183mEUb2PBzkTP9
   AbO2IAY0qDAbCBG2iXCT4yJKVOZ13bvXDCw2uSX02tLlaHSAI6yotNL3i
   Gx5GteXQceRpHi1AA80z8ZZl5Dkb7UNZl2MqK06k9/nLLWfPnSgU7U/ou
   Nq9fG5o56lHa777NERIK86E7ygVmHVZqTA61b23vjsWi25+kqwnuQId+c
   r3cWdG4T41CE2qvf5IqNmGO3k33Szq1gmWtFpk/o/KAIRIpvKKoEZpPTS
   w==;
X-CSE-ConnectionGUID: VH/3j8WrTX6Q2aHhDlC60Q==
X-CSE-MsgGUID: YgcEpryoS1GFOwStD4qWrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97246777"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="97246777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 22:56:45 -0700
X-CSE-ConnectionGUID: MxI2H89OSt67Xxg+W6KC0Q==
X-CSE-MsgGUID: o9Ribi+9TkqJ0NZ9cla8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242292476"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2026 22:56:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNP3o-000000005up-0HbV;
	Thu, 14 May 2026 05:56:40 +0000
Date: Thu, 14 May 2026 13:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil+cisco@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] media: pci: add AVMatrix HWS capture driver
Message-ID: <202605141318.V8xxhJE4-lkp@intel.com>
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
X-Rspamd-Queue-Id: 24D9353E246
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61565-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Action: no action

Hi Ben,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 74fe02ce122a6103f207d29fafc8b3a53de6abaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Hoff/media-pci-add-AVMatrix-HWS-capture-driver/20260514-065339
base:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
patch link:    https://lore.kernel.org/r/20260506192618.35384-1-hoff.benjamin.k%40gmail.com
patch subject: [PATCH v6] media: pci: add AVMatrix HWS capture driver
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605141318.V8xxhJE4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141318.V8xxhJE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141318.V8xxhJE4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/hws/hws_pci.c: In function 'hws_probe':
>> drivers/media/pci/hws/hws_pci.c:357:41: warning: unused variable 'using_msi' [-Wunused-variable]
     357 |         bool has_msix_cap, has_msi_cap, using_msi;
         |                                         ^~~~~~~~~
>> drivers/media/pci/hws/hws_pci.c:357:28: warning: unused variable 'has_msi_cap' [-Wunused-variable]
     357 |         bool has_msix_cap, has_msi_cap, using_msi;
         |                            ^~~~~~~~~~~
>> drivers/media/pci/hws/hws_pci.c:357:14: warning: unused variable 'has_msix_cap' [-Wunused-variable]
     357 |         bool has_msix_cap, has_msi_cap, using_msi;
         |              ^~~~~~~~~~~~
>> drivers/media/pci/hws/hws_pci.c:355:21: warning: unused variable 'nvec' [-Wunused-variable]
     355 |         int i, ret, nvec, irq;
         |                     ^~~~
   drivers/media/pci/hws/hws_pci.c: At top level:
>> drivers/media/pci/hws/hws_pci.c:173:13: warning: 'hws_any_capture_active' defined but not used [-Wunused-function]
     173 | static bool hws_any_capture_active(const struct hws_pcie_dev *pdx)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/hws/hws_pci.c:168:13: warning: 'hws_free_irq_vectors_action' defined but not used [-Wunused-function]
     168 | static void hws_free_irq_vectors_action(void *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/media/pci/hws/hws_video.c: In function 'hws_video_init_channel':
>> drivers/media/pci/hws/hws_video.c:336:35: warning: unused variable 'hdl' [-Wunused-variable]
     336 |         struct v4l2_ctrl_handler *hdl;
         |                                   ^~~
--
   drivers/media/pci/hws/hws_v4l2_ioctl.c:280:5: warning: no previous prototype for 'hws_vidioc_query_dv_timings' [-Wmissing-prototypes]
     280 | int hws_vidioc_query_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c: In function 'hws_vidioc_query_dv_timings':
>> drivers/media/pci/hws/hws_v4l2_ioctl.c:286:25: warning: variable 'live_ok' set but not used [-Wunused-but-set-variable]
     286 |         bool interlace, live_ok;
         |                         ^~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c: At top level:
   drivers/media/pci/hws/hws_v4l2_ioctl.c:309:5: warning: no previous prototype for 'hws_vidioc_enum_dv_timings' [-Wmissing-prototypes]
     309 | int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:326:5: warning: no previous prototype for 'hws_vidioc_g_dv_timings' [-Wmissing-prototypes]
     326 | int hws_vidioc_g_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:352:5: warning: no previous prototype for 'hws_vidioc_s_dv_timings' [-Wmissing-prototypes]
     352 | int hws_vidioc_s_dv_timings(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:412:5: warning: no previous prototype for 'hws_vidioc_dv_timings_cap' [-Wmissing-prototypes]
     412 | int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:504:5: warning: no previous prototype for 'hws_vidioc_querycap' [-Wmissing-prototypes]
     504 | int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:520:5: warning: no previous prototype for 'hws_vidioc_enum_fmt_vid_cap' [-Wmissing-prototypes]
     520 | int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:529:5: warning: no previous prototype for 'hws_vidioc_g_fmt_vid_cap' [-Wmissing-prototypes]
     529 | int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:556:5: warning: no previous prototype for 'hws_vidioc_try_fmt_vid_cap' [-Wmissing-prototypes]
     556 | int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:633:5: warning: no previous prototype for 'hws_vidioc_s_fmt_vid_cap' [-Wmissing-prototypes]
     633 | int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:690:5: warning: no previous prototype for 'hws_vidioc_g_parm' [-Wmissing-prototypes]
     690 | int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
         |     ^~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:711:5: warning: no previous prototype for 'hws_vidioc_enum_input' [-Wmissing-prototypes]
     711 | int hws_vidioc_enum_input(struct file *file, void *priv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:724:5: warning: no previous prototype for 'hws_vidioc_g_input' [-Wmissing-prototypes]
     724 | int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *index)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:730:5: warning: no previous prototype for 'hws_vidioc_s_input' [-Wmissing-prototypes]
     730 | int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/media/pci/hws/hws_v4l2_ioctl.c:735:5: warning: no previous prototype for 'hws_vidioc_s_parm' [-Wmissing-prototypes]
     735 | int hws_vidioc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *param)
         |     ^~~~~~~~~~~~~~~~~


vim +/using_msi +357 drivers/media/pci/hws/hws_pci.c

   167	
 > 168	static void hws_free_irq_vectors_action(void *data)
   169	{
   170		pci_free_irq_vectors((struct pci_dev *)data);
   171	}
   172	
 > 173	static bool hws_any_capture_active(const struct hws_pcie_dev *pdx)
   174	{
   175		unsigned int ch, max;
   176	
   177		if (!pdx)
   178			return false;
   179	
   180		max = READ_ONCE(pdx->cur_max_video_ch);
   181		if (max > pdx->max_channels)
   182			max = pdx->max_channels;
   183	
   184		for (ch = 0; ch < max; ch++) {
   185			if (READ_ONCE(pdx->video[ch].cap_active))
   186				return true;
   187		}
   188	
   189		return false;
   190	}
   191	
   192	static int main_ks_thread_handle(void *data)
   193	{
   194		struct hws_pcie_dev *pdx = data;
   195	
   196		set_freezable();
   197	
   198		while (!kthread_should_stop()) {
   199			/* If we're suspending, don't touch hardware; just sleep/freeeze */
   200			if (READ_ONCE(pdx->suspended)) {
   201				try_to_freeze();
   202				schedule_timeout_interruptible(msecs_to_jiffies(1000));
   203				continue;
   204			}
   205	
   206			/* avoid MMIO when suspended (guarded above) */
   207			check_video_format(pdx);
   208	
   209			try_to_freeze(); /* cooperate with freezer each loop */
   210	
   211			/* Sleep 1s or until signaled to wake/stop */
   212			schedule_timeout_interruptible(msecs_to_jiffies(1000));
   213		}
   214	
   215		dev_dbg(&pdx->pdev->dev, "%s: exiting\n", __func__);
   216		return 0;
   217	}
   218	
   219	static void hws_stop_kthread_action(void *data)
   220	{
   221		struct hws_pcie_dev *hws = data;
   222		struct task_struct *t;
   223	
   224		if (!hws)
   225			return;
   226	
   227		t = READ_ONCE(hws->main_task);
   228		if (!IS_ERR_OR_NULL(t)) {
   229			WRITE_ONCE(hws->main_task, NULL);
   230			kthread_stop(t);
   231		}
   232	}
   233	
   234	static int hws_alloc_seed_buffers(struct hws_pcie_dev *hws)
   235	{
   236		int ch;
   237		/* 64 KiB is plenty for a safe dummy; align to 64 for your HW */
   238		const size_t need = ALIGN(64 * 1024, 64);
   239	
   240		for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
   241	#if defined(CONFIG_HAS_DMA) /* normal on PCIe platforms */
   242			void *cpu = dma_alloc_coherent(&hws->pdev->dev, need,
   243						       &hws->scratch_vid[ch].dma,
   244						       GFP_KERNEL);
   245	#else
   246			void *cpu = NULL;
   247	#endif
   248			if (!cpu) {
   249				dev_warn(&hws->pdev->dev,
   250					 "scratch: dma_alloc_coherent failed ch=%d\n", ch);
   251				/* not fatal: free earlier ones and continue without seeding */
   252				while (--ch >= 0) {
   253					if (hws->scratch_vid[ch].cpu)
   254						dma_free_coherent(&hws->pdev->dev,
   255								  hws->scratch_vid[ch].size,
   256								  hws->scratch_vid[ch].cpu,
   257								  hws->scratch_vid[ch].dma);
   258					hws->scratch_vid[ch].cpu = NULL;
   259					hws->scratch_vid[ch].size = 0;
   260				}
   261				return -ENOMEM;
   262			}
   263			hws->scratch_vid[ch].cpu  = cpu;
   264			hws->scratch_vid[ch].size = need;
   265		}
   266		return 0;
   267	}
   268	
   269	static void hws_free_seed_buffers(struct hws_pcie_dev *hws)
   270	{
   271		int ch;
   272	
   273		for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
   274			if (hws->scratch_vid[ch].cpu) {
   275				dma_free_coherent(&hws->pdev->dev,
   276						  hws->scratch_vid[ch].size,
   277						  hws->scratch_vid[ch].cpu,
   278						  hws->scratch_vid[ch].dma);
   279				hws->scratch_vid[ch].cpu = NULL;
   280				hws->scratch_vid[ch].size = 0;
   281			}
   282		}
   283	}
   284	
   285	static void hws_seed_channel(struct hws_pcie_dev *hws, int ch)
   286	{
   287		dma_addr_t paddr = hws->scratch_vid[ch].dma;
   288		u32 lo = lower_32_bits(paddr);
   289		u32 hi = upper_32_bits(paddr);
   290		u32 pci_addr = lo & PCI_E_BAR_ADD_LOWMASK;
   291	
   292		lo &= PCI_E_BAR_ADD_MASK;
   293	
   294		/* Program 64-bit BAR remap entry for this channel (table @ 0x208 + ch * 8) */
   295		writel_relaxed(hi, hws->bar0_base +
   296				    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8);
   297		writel_relaxed(lo, hws->bar0_base +
   298				    PCI_ADDR_TABLE_BASE + 0x208 + ch * 8 +
   299				    PCIE_BARADDROFSIZE);
   300	
   301		/* Program capture engine per-channel base/half */
   302		writel_relaxed((ch + 1) * PCIEBAR_AXI_BASE + pci_addr,
   303			       hws->bar0_base + CVBS_IN_BUF_BASE +
   304			       ch * PCIE_BARADDROFSIZE);
   305	
   306		/* half size: use either the current format's half or half of scratch */
   307		{
   308			u32 half = hws->video[ch].pix.half_size ?
   309				hws->video[ch].pix.half_size :
   310				(u32)(hws->scratch_vid[ch].size / 2);
   311	
   312			writel_relaxed(half / 16,
   313				       hws->bar0_base + CVBS_IN_BUF_BASE2 +
   314				       ch * PCIE_BARADDROFSIZE);
   315		}
   316	
   317		(void)readl(hws->bar0_base + HWS_REG_INT_STATUS); /* flush posted writes */
   318	}
   319	
   320	static void hws_seed_all_channels(struct hws_pcie_dev *hws)
   321	{
   322		int ch;
   323	
   324		for (ch = 0; ch < hws->cur_max_video_ch; ch++) {
   325			if (hws->scratch_vid[ch].cpu)
   326				hws_seed_channel(hws, ch);
   327		}
   328	}
   329	
   330	static void hws_irq_mask_gate(struct hws_pcie_dev *hws)
   331	{
   332		writel(0x00000000, hws->bar0_base + INT_EN_REG_BASE);
   333		(void)readl(hws->bar0_base + INT_EN_REG_BASE);
   334	}
   335	
   336	static void hws_irq_unmask_gate(struct hws_pcie_dev *hws)
   337	{
   338		writel(HWS_INT_EN_MASK, hws->bar0_base + INT_EN_REG_BASE);
   339		(void)readl(hws->bar0_base + INT_EN_REG_BASE);
   340	}
   341	
   342	static void hws_irq_clear_pending(struct hws_pcie_dev *hws)
   343	{
   344		u32 st = readl(hws->bar0_base + HWS_REG_INT_STATUS);
   345	
   346		if (st) {
   347			writel(st, hws->bar0_base + HWS_REG_INT_STATUS); /* W1C */
   348			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
   349		}
   350	}
   351	
   352	static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
   353	{
   354		struct hws_pcie_dev *hws;
 > 355		int i, ret, nvec, irq;
   356		unsigned long irqf = 0;
 > 357		bool has_msix_cap, has_msi_cap, using_msi;
   358		bool v4l2_registered = false;
   359	
   360		/* devres-backed device object */
   361		hws = devm_kzalloc(&pdev->dev, sizeof(*hws), GFP_KERNEL);
   362		if (!hws)
   363			return -ENOMEM;
   364	
   365		hws->pdev = pdev;
   366		hws->irq = -1;
   367		hws->suspended = false;
   368		pci_set_drvdata(pdev, hws);
   369	
   370		/* 1) Enable device + bus mastering (managed) */
   371		ret = pcim_enable_device(pdev);
   372		if (ret)
   373			return dev_err_probe(&pdev->dev, ret, "pcim_enable_device\n");
   374		pci_set_master(pdev);
   375	
   376		/* 2) Map BAR0 (managed) */
   377		ret = pcim_iomap_regions(pdev, BIT(0), KBUILD_MODNAME);
   378		if (ret)
   379			return dev_err_probe(&pdev->dev, ret, "pcim_iomap_regions BAR0\n");
   380		hws->bar0_base = pcim_iomap_table(pdev)[0];
   381	
   382		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
   383		if (ret) {
   384			dev_warn(&pdev->dev,
   385				 "64-bit DMA mask unavailable, falling back to 32-bit (%d)\n",
   386				 ret);
   387			ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
   388			if (ret)
   389				return dev_err_probe(&pdev->dev, ret,
   390						     "No suitable DMA configuration\n");
   391		} else {
   392			dev_dbg(&pdev->dev, "Using 64-bit DMA mask\n");
   393		}
   394	
   395		/* 3) Optional PCIe tuning (same as before) */
   396		enable_pcie_relaxed_ordering(pdev);
   397	#ifdef CONFIG_ARCH_TI816X
   398		pcie_set_readrq(pdev, 128);
   399	#endif
   400	
   401		/* 4) Identify chip & capabilities */
   402		read_chip_id(hws);
   403		dev_info(&pdev->dev, "Device VID=0x%04x DID=0x%04x\n",
   404			 pdev->vendor, pdev->device);
   405		hws_init_video_sys(hws, false);
   406	
   407		/* 5) Init channels (video state, locks, vb2, ctrls) */
   408		for (i = 0; i < hws->max_channels; i++) {
   409			ret = hws_video_init_channel(hws, i);
   410			if (ret) {
   411				dev_err(&pdev->dev, "video channel init failed (ch=%d)\n", i);
   412				goto err_unwind_channels;
   413			}
   414		}
   415	
   416		/* 6) Allocate scratch DMA and seed BAR table + channel base/half (legacy SetDMAAddress) */
   417		ret = hws_alloc_seed_buffers(hws);
   418		if (!ret)
   419			hws_seed_all_channels(hws);
   420	
   421		/* 7) Start-run sequence (like InitVideoSys) */
   422		hws_init_video_sys(hws, false);
   423	
   424		/* A) Force legacy INTx; legacy used request_irq(pdev->irq, ..., IRQF_SHARED) */
   425		pci_intx(pdev, 1);
   426		irqf = IRQF_SHARED;
   427		irq = pdev->irq;
   428		hws->irq = irq;
   429		dev_info(&pdev->dev, "IRQ mode: legacy INTx (shared), irq=%d\n", irq);
   430	
   431		/* B) Mask the device's global/bridge gate (INT_EN_REG_BASE) */
   432		hws_irq_mask_gate(hws);
   433	
   434		/* C) Clear any sticky pending interrupt status (W1C) before we arm the line */
   435		hws_irq_clear_pending(hws);
   436	
   437		/* D) Request the legacy shared interrupt line (no vectors/MSI/MSI-X) */
   438		ret = devm_request_irq(&pdev->dev, irq, hws_irq_handler, irqf,
   439				       dev_name(&pdev->dev), hws);
   440		if (ret) {
   441			dev_err(&pdev->dev, "request_irq(%d) failed: %d\n", irq, ret);
   442			goto err_unwind_channels;
   443		}
   444	
   445		/* E) Set the global interrupt enable bit in main control register */
   446		{
   447			u32 ctl_reg = readl(hws->bar0_base + HWS_REG_CTL);
   448	
   449			ctl_reg |= HWS_CTL_IRQ_ENABLE_BIT;
   450			writel(ctl_reg, hws->bar0_base + HWS_REG_CTL);
   451			(void)readl(hws->bar0_base + HWS_REG_CTL); /* flush write */
   452			dev_info(&pdev->dev, "Global IRQ enable bit set in control register\n");
   453		}
   454	
   455		/* F) Open the global gate just like legacy did */
   456		hws_irq_unmask_gate(hws);
   457		dev_info(&pdev->dev, "INT_EN_GATE readback=0x%08x\n",
   458			 readl(hws->bar0_base + INT_EN_REG_BASE));
   459	
   460		/* 11) Register V4L2 */
   461		ret = hws_video_register(hws);
   462		if (ret) {
   463			dev_err(&pdev->dev, "video_register: %d\n", ret);
   464			goto err_unwind_channels;
   465		}
   466		v4l2_registered = true;
   467	
   468		/* 12) Background monitor thread (managed) */
   469		hws->main_task = kthread_run(main_ks_thread_handle, hws, "hws-mon");
   470		if (IS_ERR(hws->main_task)) {
   471			ret = PTR_ERR(hws->main_task);
   472			hws->main_task = NULL;
   473			dev_err(&pdev->dev, "kthread_run: %d\n", ret);
   474			goto err_unregister_va;
   475		}
   476		ret = devm_add_action_or_reset(&pdev->dev, hws_stop_kthread_action, hws);
   477		if (ret) {
   478			dev_err(&pdev->dev, "devm_add_action kthread_stop: %d\n", ret);
   479			goto err_unregister_va; /* reset already stopped the thread */
   480		}
   481	
   482		/* 13) Final: show the line is armed */
   483		dev_info(&pdev->dev, "irq handler installed on irq=%d\n", irq);
   484		return 0;
   485	
   486	err_unregister_va:
   487		hws_stop_device(hws);
   488		hws_video_unregister(hws);
   489		hws_free_seed_buffers(hws);
   490		return ret;
   491	err_unwind_channels:
   492		hws_free_seed_buffers(hws);
   493		if (!v4l2_registered) {
   494			while (--i >= 0)
   495				hws_video_cleanup_channel(hws, i);
   496		}
   497		return ret;
   498	}
   499	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

