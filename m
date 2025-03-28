Return-Path: <linux-media+bounces-28954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D35A750DB
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 20:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD4C3B22F2
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 19:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8090E1E3780;
	Fri, 28 Mar 2025 19:38:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD521E1DED;
	Fri, 28 Mar 2025 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.5.213.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190706; cv=none; b=n3W3pspZPAPe1oMtviMgK3AUrLfFp/qjetaX/7WHauIVjXhZUJ2O8Ae1fnAFOUeU2UrMUhTgmh9dBSmzcQG2b6B4qvuaSNFPhBvQG73sbwjk3W8SJlbssaCm3i2lYUWHWcx2RKSrTkrzu0W23vQiei/s92ea+3g3iIfb3LtItNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190706; c=relaxed/simple;
	bh=siqPYrz2788wZ7ex4lg7uV0feLA9b/0wjs+ncyIRvJY=;
	h=From:To:Subject:Date:Cc:MIME-Version:Content-Disposition:
	 Content-Type:Message-Id; b=EkFrPmAfs9ja6bgTi9GVCU+HIqXkqVwjfVHGuXFoOHxq14yHqZzGpwyyZMuwRciVUEyEi7IQ7pBI47H0Q+V9VU7rRU7EDuuqV7tmf0jRbs60s+JT5sCx+s+OuIY5RO3fgR6LBsn1076JXfraq1QHZZR2I3B+gDZztlmzJZuTTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zary.sk; spf=pass smtp.mailfrom=zary.sk; arc=none smtp.client-ip=212.5.213.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Received: from [192.168.0.2] (188-167-58-202.dynamic.chello.sk [188.167.58.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hosting.gsystem.sk (Postfix) with ESMTPSA id A597E7A010F;
	Fri, 28 Mar 2025 20:28:25 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: linux-media@vger.kernel.org
Subject: [ANNOUNCE] Firmware loader for Samsung TV cameras
Date: Fri, 28 Mar 2025 20:28:22 +0100
User-Agent: KMail/1.9.10
Cc: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Length: 760
X-UID: 13
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <202503282028.22292.linux@zary.sk>

Hello,
I'm announcing samsung-tvcam-fwloader - Firmware loader for Samsung TV cameras that allows Samsung TV cameras to be used in Linux (and possibly other OSs).

Samsung used to sell webcams for their smart TVs for the purpose of running Skype. Skype was discontinued on these TVs in 2016 and these cameras became useless.

Model list:
CY-STC1100 - 04e8:2058
VG-STC2000 - 04e8:2059
VG-STC3000 - 04e8:205c
VG-STC4000 - 04e8:2061
VG-STC5000 - 04e8:2065

When connected to a PC, the camera identifies as unknown device or as an UVC webcam but does not work. That's because it's missing firmware. Camera contains only a bootloader and TV uploads firmware to camera's RAM each time it's plugged in.

VG-STC2000, VG-STC4000 and VG-STC5000 are tested to work.
VG-STC3000 should work as it should use the same code as 4000 and 5000.
CY-STC1100 is completely different, probably not UVC compatible even with firmware loaded and thus would require a driver.

https://github.com/ondrej-zary/samsung-tvcam-fwloader/

-- 
Ondrej Zary

