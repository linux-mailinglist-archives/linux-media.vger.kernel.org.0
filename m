Return-Path: <linux-media+bounces-57173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHJqGy2AxWkk+wQAu9opvQ
	(envelope-from <linux-media+bounces-57173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:51:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA333A6AA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A480030172ED
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A173A1A50;
	Thu, 26 Mar 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLXzqBbQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC456472
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551057; cv=none; b=La69S1huswU4EC8ENMupanEZ1VYP1V3vXy+bwp2qYMWmVofilyYA4HK0FQcpUzTsQGZ/AV7UjBv1uvMmCSfPPHDamzSAbvmzUZXyyloNbUSrABIPpa4ANK1LRUBADvKldFU9GSuRottb8NursZ4RNzOM+cFhOAK+vz/0jKbyorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551057; c=relaxed/simple;
	bh=hwytOT5AHQkhNuXB7Dk7q9CVQJ+sv6oWC8s4nFu+akg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7E7ACBBhQHk9p0EXLun4ykXRVyga4SeoBnO5csN0WV6a+YDbO5mu/vQ2kFHISjOr5kzv0yGtGw8PT8hoW/kh1WNyrA/kxu2CfbhEftrTeCV0X/UV0puowiMxNFoyv2+P9l29FqakLpO9r035iJUjk6J5aRDw1ZgYbuwC3g5nmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLXzqBbQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774551056; x=1806087056;
  h=date:from:to:cc:subject:message-id;
  bh=hwytOT5AHQkhNuXB7Dk7q9CVQJ+sv6oWC8s4nFu+akg=;
  b=jLXzqBbQcJ0zksqhnOoYA8qcGQucu9jOy90Seib56d4uwkyB9VlU/wmx
   fVydqZYAdlXclglE7PwQwP9pnaAqSzbLZb/JHOzoKONtlavKuOjfcHsT6
   KWkhpz/EqyHcUs5v9HvBPHdcRbMOBZmnVJEa9cTv/RZwQ3k0O4xF9QQDe
   b5t+pyZ1HUwQTQD9X/GhKnnKoBJwTVccyMUYPsvNmjbNeFzGO6Ri0upqU
   X4IuDRB3CCKf4ZiMzgqqCRK/wRF4Wz8Wy8XLDRjvm45cezoI2zjF1nIkR
   /RxAn10B27sbuY6muHQt1Oxy6DBGq10SMj9cwwp3qs08iM+qkozOVifhI
   A==;
X-CSE-ConnectionGUID: 59sTOjz7QAiAucbEGBHmtw==
X-CSE-MsgGUID: CdAXGsbxSdmcTHh3vxpV9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75689966"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75689966"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:50:55 -0700
X-CSE-ConnectionGUID: 7gIzdKNuQzy1e9PNu2krnw==
X-CSE-MsgGUID: eXT5pWAYTFiVF9o6PemF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224271191"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2026 11:50:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5pn8-000000009Dv-3kJ0;
	Thu, 26 Mar 2026 18:50:50 +0000
Date: Fri, 27 Mar 2026 02:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bradford Love <brad@nextdimension.cc>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>
Subject: [linuxtv-media-pending:next 144/157]
 drivers/media/usb/em28xx/em28xx-cards.c:3889:2-3: Unneeded semicolon
Message-ID: <202603270214.pyo7p8m7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57173-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 18CA333A6AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   ebeec2b000a90cd8aae86d1931ff5ef23af8284e
commit: 8e53399c63c3152fd572596acedcdaea4cabbc45 [144/157] media: em28xx: Add support for Empia em2828X bridge
config: riscv-randconfig-r064-20260326 (https://download.01.org/0day-ci/archive/20260327/202603270214.pyo7p8m7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270214.pyo7p8m7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/usb/em28xx/em28xx-cards.c:3889:2-3: Unneeded semicolon
--
>> drivers/media/usb/em28xx/em28xx-core.c:635:2-3: Unneeded semicolon

vim +3889 drivers/media/usb/em28xx/em28xx-cards.c

  3771	
  3772	static void em28xx_check_usb_descriptor(struct em28xx *dev,
  3773						struct usb_device *udev,
  3774						struct usb_interface *intf,
  3775						int alt, int ep,
  3776						bool *has_vendor_audio,
  3777						bool *has_video,
  3778						bool *has_dvb)
  3779	{
  3780		const struct usb_endpoint_descriptor *e;
  3781		int sizedescr, size;
  3782	
  3783		/*
  3784		 * NOTE:
  3785		 *
  3786		 * Old logic with support for isoc transfers only was:
  3787		 *  0x82	isoc		=> analog
  3788		 *  0x83	isoc		=> audio
  3789		 *  0x84	isoc		=> digital
  3790		 *
  3791		 * New logic with support for bulk transfers
  3792		 *  0x82	isoc		=> analog
  3793		 *  0x82	bulk		=> analog
  3794		 *  0x83	isoc*		=> audio
  3795		 *  0x84	isoc		=> digital
  3796		 *  0x84	bulk		=> analog or digital**
  3797		 *  0x85	isoc		=> digital TS2
  3798		 *  0x85	bulk		=> digital TS2
  3799		 *  0x8a	isoc		=> digital video
  3800		 * (*: audio should always be isoc)
  3801		 * (**: analog, if ep 0x82 is isoc, otherwise digital)
  3802		 *
  3803		 * The new logic preserves backwards compatibility and
  3804		 * reflects the endpoint configurations we have seen
  3805		 * so far. But there might be devices for which this
  3806		 * logic is not sufficient...
  3807		 */
  3808	
  3809		e = &intf->altsetting[alt].endpoint[ep].desc;
  3810	
  3811		if (!usb_endpoint_dir_in(e))
  3812			return;
  3813	
  3814		sizedescr = le16_to_cpu(e->wMaxPacketSize);
  3815		size = sizedescr & 0x7ff;
  3816	
  3817		if (udev->speed == USB_SPEED_HIGH)
  3818			size = size * hb_mult(sizedescr);
  3819	
  3820		/* Only inspect input endpoints */
  3821	
  3822		switch (e->bEndpointAddress) {
  3823		case 0x81:	/* unknown function */
  3824			return;
  3825		case 0x82:
  3826			*has_video = true;
  3827			if (usb_endpoint_xfer_isoc(e)) {
  3828				dev->analog_ep_isoc = e->bEndpointAddress;
  3829				dev->alt_max_pkt_size_isoc[alt] = size;
  3830			} else if (usb_endpoint_xfer_bulk(e)) {
  3831				dev->analog_ep_bulk = e->bEndpointAddress;
  3832			}
  3833			return;
  3834		case 0x83:
  3835			if (usb_endpoint_xfer_isoc(e))
  3836				*has_vendor_audio = true;
  3837			else
  3838				dev_err(&intf->dev,
  3839					"error: skipping audio endpoint 0x83, because it uses bulk transfers !\n");
  3840			return;
  3841		case 0x84:
  3842			if (*has_dvb && (usb_endpoint_xfer_bulk(e))) {
  3843				*has_dvb = true;
  3844				dev->dvb_ep_bulk = e->bEndpointAddress;
  3845			} else if (*has_video && (usb_endpoint_xfer_bulk(e))) {
  3846				dev->analog_ep_bulk = e->bEndpointAddress;
  3847			} else {
  3848				if (usb_endpoint_xfer_isoc(e)) {
  3849					if (size > dev->dvb_max_pkt_size_isoc) {
  3850						/*
  3851						 * 2) some manufacturers (e.g. Terratec)
  3852						 * disable endpoints by setting
  3853						 * wMaxPacketSize to 0 bytes for all
  3854						 * alt settings. So far, we've seen
  3855						 * this for DVB isoc endpoints only.
  3856						 */
  3857						*has_dvb = true;
  3858						dev->dvb_ep_isoc = e->bEndpointAddress;
  3859						dev->dvb_max_pkt_size_isoc = size;
  3860						dev->dvb_alt_isoc = alt;
  3861					}
  3862				} else {
  3863					*has_dvb = true;
  3864					dev->dvb_ep_bulk = e->bEndpointAddress;
  3865				}
  3866			}
  3867			return;
  3868		case 0x85:
  3869			if (usb_endpoint_xfer_isoc(e)) {
  3870				if (size > dev->dvb_max_pkt_size_isoc_ts2) {
  3871					dev->dvb_ep_isoc_ts2 = e->bEndpointAddress;
  3872					dev->dvb_max_pkt_size_isoc_ts2 = size;
  3873					dev->dvb_alt_isoc = alt;
  3874				}
  3875			} else {
  3876				dev->dvb_ep_bulk_ts2 = e->bEndpointAddress;
  3877			}
  3878			return;
  3879		case 0x8a:
  3880			*has_video = true;
  3881			*has_dvb = true;
  3882			if (usb_endpoint_xfer_isoc(e)) {
  3883				dev->analog_ep_isoc = e->bEndpointAddress;
  3884				dev->alt_max_pkt_size_isoc[alt] = size;
  3885			} else if (usb_endpoint_xfer_bulk(e)) {
  3886				dev->analog_ep_bulk = e->bEndpointAddress;
  3887			}
  3888			return;
> 3889		};
  3890	}
  3891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

