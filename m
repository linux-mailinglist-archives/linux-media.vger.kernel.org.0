Return-Path: <linux-media+bounces-46120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AD1C28822
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 23:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03D7A3AA925
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 22:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65011258CDF;
	Sat,  1 Nov 2025 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="KA04CA0D"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7134D3A4
	for <linux-media@vger.kernel.org>; Sat,  1 Nov 2025 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762034870; cv=none; b=UHHMgvVHkBQhV0j2zB2bLb+YVhUFFaKHkGP73IGN6udX7QfyiW+yIt5GtGRN0xGELDVLYP+p3XyZgkQ/xhuQfEGRKSfa5S/+dOIjfSIK6Ub3KjND1GjRKWcKDHHftKYnNTAV9OhralOvSq6Ux6gSEtrGE6fSjYeSHMhJtgPL5a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762034870; c=relaxed/simple;
	bh=91qq99leoFhJWU64m+RS9iBgNWoSXK02snfPKvc00+Q=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=amRFHjn54gZueIkrpircb851/EmtHCL4exELHUBtiBO02HPZWs7JGwZ/LP0r5bovH4P7YLI2AxakSKH5Rw/nDs13YUsHq3RvlttcHTj3pr31LNvcRmxnLa3Eo+beLvAq+a733claabwVPX/XvLUNL/1FNU45A74+EKQYIdghxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=KA04CA0D; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CD1uA2N+9WHPxC6mD5ot1pleHX4AAaKAk5PYtbvLTV0=; b=KA04CA0DrinSfQObZhZyNiSB1F
	QAzaT9gzICdGG0aynED1UPS9YaDsEJz623CgaqqIzrrm86YGMHo0gFz9UpSDBU0Fqzhcn8Vchi1+7
	w/MK2eXSaDwxR/G6nS1mNPkfLYJFQfI2uEcL3ptlqoXmLJH5u/HGZU5GAICYznisn7ii0UksQjLAm
	ealrtOl77lmEGzyaxj5SU5ZDunrmZs2F+yu4k1ipd0yvl8NTd9+jnMRc8NfJ+zPiV7LzrwDn/64cj
	omFJO+WcjG5RYDPUVPGMApFR/gebOQ8qGqOCZz/c3AKsEWBDfPeIgcQOm07IYNl0XCrvaGW3guUxw
	4TuEj+Ew==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vFJlE-0004UQ-13;
	Sat, 01 Nov 2025 22:07:48 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vFJlE-001V2r-0l;
	Sat, 01 Nov 2025 22:07:48 +0000
Date: Sat, 1 Nov 2025 22:07:47 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <1662667723.2.1762034868237@builder.linuxtv.org>
In-Reply-To: <1807094057.2.1761948420855@builder.linuxtv.org>
References: <1807094057.2.1761948420855@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #443: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_2133533441.1762034867960"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_2133533441.1762034867960
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	FAIL: x86_64 allyesconfig
	FAIL: x86_64 allmodconfig
	PASS: arm64 allyesconfig
	FAIL: x86_64 no PM
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/443/
Project: media.git_drivers_build
Date of build: Sat, 1 Nov 2025 22:05:06 GMT
Build duration: 2 min 41 sec and counting


CHANGE SET

  	 Revision  by hverkuil: (media: MAINTAINERS: Assign ov08x40 driver to Jimmy)

	 change: edit MAINTAINERS

  	 Revision  by hverkuil: (media: ivsc: Release csi_dev reference early in mei_ace_setup_dev_link())

	 change: edit drivers/media/pci/intel/ivsc/mei_ace.c

  	 Revision  by hverkuil: (dt-bindings: media: i2c: Add DW9718S, DW9719 and DW9761 VCM)

	 change: add Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml

  	 Revision  by hverkuil: (media: i2c: dw9719: Deprecate dongwoon,vcm-freq)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Remove unused i2c device id table)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Add an of_match_table)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Add driver_data matching)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Add DW9718S support)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Update PM last busy time upon close)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (media: i2c: dw9719: Fix power on/off sequence)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (dt-bindings: media: i2c: dw9719: Document DW9800K)

	 change: edit Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml

  	 Revision  by hverkuil: (media: i2c: dw9719: Add DW9800K support)

	 change: edit drivers/media/i2c/dw9719.c

  	 Revision  by hverkuil: (dt-bindings: media: Convert ti,tvp5150.txt to yaml format.)

	 change: add Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml

	 change: delete Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt

  	 Revision  by hverkuil: (dt-bindings: media: convert nxp,tda1997x.txt to yaml format)

	 change: delete Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt

	 change: add Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml

  	 Revision  by hverkuil: (media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio)

	 change: edit drivers/media/i2c/imx219.c

  	 Revision  by hverkuil: (media: i2c: imx219: Simplify imx219_get_binning() function)

	 change: edit drivers/media/i2c/imx219.c

  	 Revision  by hverkuil: (media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop)

	 change: edit drivers/media/i2c/ov13b10.c

  	 Revision  by hverkuil: (media: dt-bindings: video-interfaces: add video-interfaces.h information)

	 change: edit Documentation/devicetree/bindings/media/video-interfaces.yaml

  	 Revision  by hverkuil: (media: dt-bindings: vd55g1: Add vd65g4 compatible)

	 change: edit Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml

  	 Revision  by hverkuil: (media: i2c: vd55g1: Add support for vd65g4 RGB variant)

	 change: edit drivers/media/i2c/vd55g1.c

  	 Revision  by hverkuil: (media: ov02c10: Fix default vertical flip)

	 change: edit drivers/media/i2c/ov02c10.c

  	 Revision  by hverkuil: (media: ov02c10: Support hflip and vflip)

	 change: edit drivers/media/i2c/ov02c10.c

  	 Revision  by hverkuil: (media: ipu3-imgu: Drop struct imgu_device v4l2_file_ops field)

	 change: edit drivers/staging/media/ipu3/ipu3.h

  	 Revision  by hverkuil: (media: staging: ipu7: isys: Drop video_open() function)

	 change: edit drivers/staging/media/ipu7/ipu7-isys-video.c

  	 Revision  by hverkuil: (media: i2c: Fix vendor name typo in OV2735 Kconfig help text)

	 change: edit drivers/media/i2c/Kconfig

  	 Revision  by hverkuil: (MAINTAINERS: Update Daniel Scally&#039;s email address)

	 change: edit MAINTAINERS
------=_Part_1_2133533441.1762034867960--

