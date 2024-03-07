Return-Path: <linux-media+bounces-6656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8235875239
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 15:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC63283BB7
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 14:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5619F12BF12;
	Thu,  7 Mar 2024 14:46:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailproxy02.manitu.net (mailproxy02.manitu.net [217.11.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26B1EB41
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.11.48.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709822785; cv=none; b=MtCmhFnmtDRt1KGxzuxw284UF8R5iibpFeY42ooM1iHvWnNqPF9urMjcXhvxzhAcQLDbJlZuKAY2wJqnU8Na1blCro25ZM5RSMM6Lppk8suzFAiSrN0Q5fJNWJQgQgHOuO7d345IgGCmheiZ6Xd70Evu25ha3NvzL1Tje7kLac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709822785; c=relaxed/simple;
	bh=EGIiTLa23zBlwkezDGrbHwc3r2J2f0QzWNY2rnsclRs=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=QeeS+k0xCMpVjch5zRAPgusapNTergzwtj+UVskgSZX6bq4YK7yE5COK/kKHRYPK8f7O567EDqxCW/rw0JDbik8IsYf83w+ERcP8p+kIQctmJnSUM0SyEqgerVHF+pSpboKq2hE3dMGAHMHnrEhSc4eB+sZ7Yhkv9KHrE5FUgvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grandegger.com; spf=pass smtp.mailfrom=grandegger.com; arc=none smtp.client-ip=217.11.48.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grandegger.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grandegger.com
Message-ID: <4fd6a4bc-9ea2-4097-9fbe-3f9d0e97fa7b@grandegger.com>
Date: Thu, 7 Mar 2024 15:46:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-media@vger.kernel.org
Subject: drm/bridge/tc358767: i2c access failure via DisplayPort AUX channel
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'm using a TC9595 bridge device on a Renesas RZ/G2L custom board that
streams video from DSI to DisplayPort. The device is supported by
the TC358767 driver.

The problem I'm facing is, that the device cannot read the DPCD data
from the monitor in "tc_get_display_props()" [1]. Any I2C accesses via
AUX channel performed by the chip does fail with a timeout. If I ignore
that error and go ahead in that function with default values, the I2C
accesses start to work various accesses later. Any idea what could cause
that weird behavior? Either the monitor does wake-up for some reason and
responds to the accesses or the chip performs the accesses differently.

[1] https://elixir.bootlin.com/linux/v6.7.9/source/drivers/gpu/drm/bridge/tc358767.c#L727

Thanks for any help,

Wolfgang

