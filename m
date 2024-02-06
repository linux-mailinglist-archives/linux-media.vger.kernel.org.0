Return-Path: <linux-media+bounces-4759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D059484B48B
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 13:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF9A1F27350
	for <lists+linux-media@lfdr.de>; Tue,  6 Feb 2024 12:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE7812EBE3;
	Tue,  6 Feb 2024 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZKiAhhYq"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2C12E1DD
	for <linux-media@vger.kernel.org>; Tue,  6 Feb 2024 12:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221239; cv=pass; b=LmKLZECkewzIPPoplQO2TS7oAM216vh+y7nYirKkYFcl8VTFoSMWo7UUMWxBbn04b4mTbl5396KI8hXoediRjvh8cVaampGBhg9CUCxu5ESx6Klta9B3nsJqCM4yd9TPRlGxjbCfWkHCOEmN43vB7MjywVJYGYWT8k/+hMrMdn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221239; c=relaxed/simple;
	bh=cSZQpi4phW9N5BHjaAANwA0pMdN/By2Im/lCBCCqJys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMRb8ZQ4QMRAg4jm8b+wPdsU9Oy6CVOqrgzB29lrARs1AhRsLQ5JxqbS1XXatlsSGAavYPcfnJrp7uXCtU6hOa2kqlqkCDfdZKFuPowIr2mx/dX6IVkspEKSoyiV45SOZSlKVgoQEZgPOl7NDJj0AtGCT8CNxf8wyx0xF/KLcp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZKiAhhYq; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TThnR2QLkzyQX;
	Tue,  6 Feb 2024 14:07:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1707221229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+0PxPRNts8vqBexkH9PheE/W/zX+1j22x1WWi4YIfLM=;
	b=ZKiAhhYq3FZaODaCAw24dxpZHWqPrXvLlnLtZHi+jSTKOynJNGRAiu/K95CejzAhSdKghy
	nLmKX+8M7Vu8RIg2605eglKLImSFVzw51bh1Q+KBXg/t2SMK6vwH5UW7gIDiknMkD2anOV
	kWQOiOFjNwudLmLMS1cjNTf01hLnwW0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1707221229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+0PxPRNts8vqBexkH9PheE/W/zX+1j22x1WWi4YIfLM=;
	b=qJ7sZBiWFfOr4606sLiBv7JOrxJZA5c+vtnDa4ez2OZGbyO9IOGn7jYV8VtdhR8BYB5G/Z
	7Ct/vYwENuMYolwZ+5BZ79ApiK+pYUJD9snC0McSgxC71iHT7XAzhMZTUHy5vt7RfjjkLu
	Z4MDXRhxA9k8EP8oP5p0UdqUjWfmDmA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1707221229; a=rsa-sha256; cv=none;
	b=AsIrl8GjDzg3PQ2qH9Y+wXV2L1Cq4KnuMDH0UVlyMN6dlmy2lpkEtvEj1G63acr6YXNvPL
	yePdXrGAyuZXke3HUPIEDF+vP+wVCElMB2fCVKYbFLatH1xV88ax3uvyyMVi+P5HRsHOof
	+7LUoG8kI5T7UgmTJ3TW51QfWdMFTRs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 57E65634C93;
	Tue,  6 Feb 2024 14:07:05 +0200 (EET)
Date: Tue, 6 Feb 2024 12:07:05 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: [GIT PULL FOR 6.9] Revert a faulty ov08x40 patch and re-apply a good
 one
Message-ID: <ZcIg6YsKuLph6KV7@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro, Hans,

This PR reverts a faulty ov08x40 patch and re-applies the same with the bad
DT binding and source changes removed.

Note that this HAS TO be merged before sending the current media stage tree
further to Linus.

Thanks to Laurent for spotting the bad changes.

Please pull.


The following changes since commit ee171dc5050212ea8677ed5cb777746cf00d72d9:

  media: nxp: imx8-isi: Factor out a variable (2024-02-05 14:29:35 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.9-3-signed

for you to fetch changes up to 4aeb29537d77d85bc7cb8c81b746b64e2c152763:

  media: ov08x40: Reduce start streaming time (2024-02-06 14:02:08 +0200)

----------------------------------------------------------------
Revert a bad ov08x40 patch and re-apply a good one

----------------------------------------------------------------
Jason Chen (1):
      media: ov08x40: Reduce start streaming time

Sakari Ailus (1):
      Revert "media: ov08x40: Reduce start streaming time"

 Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Sakari Ailus

