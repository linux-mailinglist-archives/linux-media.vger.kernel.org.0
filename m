Return-Path: <linux-media+bounces-44943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD6BEBCB1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 23:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AE9D1AA7904
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 21:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BAD2FB0AD;
	Fri, 17 Oct 2025 21:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="oXTApJEO"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF9F354AC2
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 21:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760735978; cv=none; b=sgEPmT5qfDLjyv/TIDyDQNaGeKqSZIIuD4KZwwZBTHaHaUEWQXtxwjCdfehqX6NzL53Llf9hz6Y+yGxjo+F4L4SufGa553n+bfCrKiKj+QwavSitkPDIsLycsGviPn51cwuXTu5nVubKmiDs8ywssjh3c6qr3+hnBqU8kz0N41Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760735978; c=relaxed/simple;
	bh=lZMPNSf/pu+o88SbKteOk8f4CkPUG0285dQSnqMwmeQ=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=BqO5AL/WSngkiEkozrvkJCGy3M3Yvk+ljQUO/TA7PjUEgpWQfdQEJ95Fvf51B7KlN7aQWVrYgGn0D8LPeKf+1rFpStqHooNJxcvfyzCMsL16J47Md3aZWuEqLWaomPsZmsBYROucn547slTd7DmpFIzI1cP/G7BycJtm1qrrpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=oXTApJEO; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LMBsL4CBsLTUQOthznQRsmmxh3qNjCz5U9H/yDqpidI=; b=oXTApJEOONrTJ8l0PV20wTXNya
	s8nZAwZZI8yxzpY9rcZ0TGz2XJoX0zf3vp3FL/mmSZnoDQRfIIqzoRr/ie9cyKp1BQMP0hzhnaV4q
	K8iIzvwY63e6c82cIv80joGrR3OdGA2GGLkGpJhLf5xwGCYE8hCDoE7MSQnhdejc38Zemrdlmhfmq
	yg1jOlxq1ltuT1e8iBz83UdmFSYk4wML+LocLKR+uRcJUGnCTtJ8q1gDM2SgsPaFCKW54TmsvxwKE
	3I1vNeedb2vSMb0d5wsI+YW5L2sfrGmqtT0nb9ZRwoGsiguPuROSFQppEySo8eoy6ew03hCGBS53S
	zS1kCWvg==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v9rrL-0006tB-1D;
	Fri, 17 Oct 2025 21:19:35 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1v9rrL-00H2zl-0v;
	Fri, 17 Oct 2025 21:19:35 +0000
Date: Fri, 17 Oct 2025 21:19:34 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <128102591.2.1760735975289@builder.linuxtv.org>
In-Reply-To: <1848929797.2.1760343666807@builder.linuxtv.org>
References: <1848929797.2.1760343666807@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #439: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_2072890267.1760735975074"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_2072890267.1760735975074
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	FAIL: x86_64 allyesconfig
	FAIL: x86_64 allmodconfig
	FAIL: x86_64 no PM
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	PASS: arm64 allyesconfig
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/439/
Project: media.git_drivers_build
Date of build: Fri, 17 Oct 2025 21:05:06 GMT
Build duration: 14 min and counting


CHANGE SET

  	 Revision  by hverkuil: (media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg())

	 change: edit drivers/media/usb/dvb-usb/dtv5100.c

  	 Revision  by hverkuil: (media: dvb-core: dvb_ringbuffer: Fix various coding style issues)

	 change: edit drivers/media/dvb-core/dvb_ringbuffer.c

  	 Revision  by hverkuil: (media: dvb-core: dvb_demux: Fix assignments in if conditions)

	 change: edit drivers/media/dvb-core/dvb_demux.c

  	 Revision  by hverkuil: (media: av7110: Fix warning &#039;unsigned&#039; -&gt; &#039;unsigned int&#039;)

	 change: edit drivers/staging/media/av7110/av7110_ca.c

  	 Revision  by hverkuil: (Revert &quot;media: xc2028: avoid use-after-free in load_firmware_cb()&quot;)

	 change: edit drivers/media/tuners/xc2028.c

  	 Revision  by hverkuil: (media: dvb-core: use vmalloc_array to simplify code)

	 change: edit drivers/media/dvb-core/dvb_demux.c

	 change: edit drivers/media/dvb-core/dmxdev.c

  	 Revision  by hverkuil: (media: pt1: use vmalloc_array to simplify code)

	 change: edit drivers/media/pci/pt1/pt1.c

  	 Revision  by hverkuil: (media: vivid: use vmalloc_array and vcalloc to simplify code)

	 change: edit drivers/media/test-drivers/vivid/vivid-core.c

  	 Revision  by hverkuil: (staging: media: tegra-video: Remove the use of dev_err_probe())

	 change: edit drivers/staging/media/tegra-video/tegra20.c

  	 Revision  by hverkuil: (MAINTAINERS: Update Synopsys HDMI RX driver entry)

	 change: edit MAINTAINERS

  	 Revision  by hverkuil: (media: dt-bindings: snps,dw-hdmi-rx.yaml: Updated maintainers entry)

	 change: edit Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml

  	 Revision  by hverkuil: (media: synopsys: hdmirx: media: Remove redundant ternary operators)

	 change: edit drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

  	 Revision  by hverkuil: (media: dvb-frontends: Remove redundant ternary operators)

	 change: edit drivers/media/dvb-frontends/drx39xyj/drxj.c

	 change: edit drivers/media/dvb-frontends/drxk_hard.c

  	 Revision  by hverkuil: (media: dvb: Use int type to store negative error codes)

	 change: edit drivers/media/dvb-frontends/cxd2841er.c

	 change: edit drivers/media/dvb-frontends/lgdt330x.c

  	 Revision  by hverkuil: (media: TDA1997x: Remove redundant cancel_delayed_work in probe)

	 change: edit drivers/media/i2c/tda1997x.c

  	 Revision  by hverkuil: (media: i2c: adv7842: Remove redundant cancel_delayed_work in probe)

	 change: edit drivers/media/i2c/adv7842.c

  	 Revision  by hverkuil: (media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe)

	 change: edit drivers/media/i2c/adv7604.c

  	 Revision  by hverkuil: (media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status())

	 change: edit drivers/media/i2c/adv7842.c

  	 Revision  by hverkuil: (media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread())

	 change: edit drivers/media/i2c/msp3400-kthreads.c

  	 Revision  by hverkuil: (media: pvrusb2: Fix incorrect variable used in trace message)

	 change: edit drivers/media/usb/pvrusb2/pvrusb2-hdw.c

  	 Revision  by hverkuil: (media: vidtv: initialize local pointers upon transfer of memory ownership)

	 change: edit drivers/media/test-drivers/vidtv/vidtv_channel.c

  	 Revision  by hverkuil: (media: pci: mg4b: use aligned_s64)

	 change: edit drivers/media/pci/mgb4/mgb4_trigger.c

  	 Revision  by hverkuil: (media: pci: mg4b: use iio_push_to_buffers_with_ts())

	 change: edit drivers/media/pci/mgb4/mgb4_trigger.c

  	 Revision  by hverkuil: (media: c8sectpfe: remove support of STi c8sectpfe driver)

	 change: edit drivers/media/platform/st/sti/Makefile

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.c

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.c

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.c

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-debugfs.h

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-common.h

	 change: delete drivers/media/platform/st/sti/c8sectpfe/Makefile

	 change: edit drivers/media/platform/st/sti/Kconfig

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c

	 change: delete drivers/media/platform/st/sti/c8sectpfe/Kconfig

	 change: delete drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-dvb.h

	 change: edit MAINTAINERS

	 change: edit drivers/media/platform/st/Makefile

  	 Revision  by hverkuil: (media: include: remove c8sectpfe header)

	 change: delete include/dt-bindings/media/c8sectpfe.h

  	 Revision  by hverkuil: (media: doc/dt-bindings: remove support of stih407-c8sectpfe)

	 change: edit Documentation/admin-guide/media/platform-cardlist.rst

	 change: delete Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt

  	 Revision  by hverkuil: (media: cec: Fix debugfs leak on bus_register() failure)

	 change: edit drivers/media/cec/core/cec-core.c

  	 Revision  by hverkuil: (media: v4l2-mem2mem: Fix outdated documentation)

	 change: edit include/media/v4l2-mem2mem.h
------=_Part_1_2072890267.1760735975074--

