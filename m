Return-Path: <linux-media+bounces-23779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9109F7AED
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A481667D8
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4051B223707;
	Thu, 19 Dec 2024 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo5Eb1Mq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64FE22145D
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734609950; cv=none; b=AmQKvjGVHPex2De5cooMjkmaqmwLCJeajjHIyeyCacB52C5k/NEo6Ft1xLhiwHbeuZZH7mHEYqg+/CqU3G3HLfG4l93lZ3uTp+AmdXJhQ3wRlUal9V5nvYk+lYXsSeRGhE2smpKnIxcfTxIDhOZ9M4l5wssrGqkuvfJCeeyDgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734609950; c=relaxed/simple;
	bh=6o+EZBmnMn1O9ta3JMsEDR7eQxoNn+YCdroSKeP1jWU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tj8DfRP2q5nm29d0Jx0E3+nfL7rp4V7kVJh6FVfTMecVXT3DewGV7K3pK3+28Vtk3ck9cYrzNgdvG7hVSOptufKm5tgweSle6ptKb/pGhi9FRcUbiijWGxlGxWumsDBhO3i2nS+Xe+oUdpg/Khc0zJX6kWEJNOXYcpmfYoucOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uo5Eb1Mq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734609949; x=1766145949;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=6o+EZBmnMn1O9ta3JMsEDR7eQxoNn+YCdroSKeP1jWU=;
  b=Uo5Eb1MqS2faTrfy/zXid9IG0O6iWLdBw3ieB6bnDdR8C3/ePyZb7Rbh
   Tvq4ZN+t8wzIlIAsOQ+DyCI5No1dZgLCOiM0S1QzLu5rWEhLZP8TtqXmw
   UYOiY0kA+MAlNGlP56PbcD2GzpCtGp25OO6YAVAVaMyHO8p2LZgi9kos+
   5wNkv4Pqp4BnkGoZ50+QfpOlnc81JceLQ4KYIVBc72McQoxJ/b5OWFBsh
   jtVVpfi/ArZgwEYCMDEnD+a+ff3+aLY9594n260/H4rl4+WnG7RMIgwwA
   bmovTSEtk8vGwsVYJT7P4pkV6BDqXo7o+Gt56FUQqpiYqZlzuR3VXSxzA
   A==;
X-CSE-ConnectionGUID: 9yfCh6oWTieXFl/Db7Cb3A==
X-CSE-MsgGUID: Xm8J17zPS4q5+K8sbIY/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35331468"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35331468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:05:48 -0800
X-CSE-ConnectionGUID: NuZMSZkETc61/Bqc8uy7aw==
X-CSE-MsgGUID: qovbgpeQSH65zG3zsFlxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102307407"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 04:05:47 -0800
Subject: Re: IPU6 Camera with ov08x40 (OVTI08F4 sensor) HP Spectre 16" Meteor
 Lake doesn't work
To: "duanek@chorus.net" <duanek@chorus.net>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 linux-media <linux-media@vger.kernel.org>,
 libcamera-devel <libcamera-devel@lists.libcamera.org>
References: <1594170563.10937137.1728935697496.JavaMail.zimbra@chorus.net>
 <1385342589.100511352.1734536762106.JavaMail.zimbra@chorus.net>
 <45xboahdow6gy7uanhrdsiln3zxcu4xdy7hew3usqtgurf7byj@wl7gvzgtzg5s>
 <1626527939.100593578.1734539132976.JavaMail.zimbra@chorus.net>
 <3csrwld4fbhg7fg7v4dm4fccvxkracxuwj6y7k5z7k7t5zpeha@qfgr6pmzyg6f>
 <698982370.100647689.1734540932591.JavaMail.zimbra@chorus.net>
 <4vlmoi3uto44j3cigzatkclqd5krybvihvkq77glwcblpdlrb5@yhdl6dvd2gmj>
 <06dcddff-84b3-8717-fa56-53d49abcaf5d@linux.intel.com>
 <578607689.101572908.1734571756163.JavaMail.zimbra@chorus.net>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <22f3bfe0-23ca-1ba9-95a7-5288bea5a723@linux.intel.com>
Date: Thu, 19 Dec 2024 20:03:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <578607689.101572908.1734571756163.JavaMail.zimbra@chorus.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Duane,

From the driver log, I see:
[  197.992581] intel_ipu6_isys.isys intel_ipu6.isys.40: stream on Intel IPU6 CSI2 0 failed with -5

The IPU6 isys driver will call the sensor driver .s_stream callback. The failure
here is either from isys or sensor driver.

Could you create /etc/modprobe.d/ipu.conf, add 2 lines below and reboot to
capture a new dmesg log?

options intel_ipu6_isys dyndbg=+pt
options ov08x40 dyndbg=+pt

On 12/19/24 9:29 AM, duanek@chorus.net wrote:
> Dear Bingbu Cao,
> 
> I appreciate your help.
> 
> Full disclosure: I rebooted to get you a 'clean' dmesg, but when I rebooted, I had to re-load the ov80x40 module
> 

<--snip-->

-- 
Best regards,
Bingbu Cao

