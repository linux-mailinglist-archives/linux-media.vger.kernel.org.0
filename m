Return-Path: <linux-media+bounces-38588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD7B13F37
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385A6163653
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E70915B0FE;
	Mon, 28 Jul 2025 15:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJR42MXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054321E4AE
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753717860; cv=none; b=WuZP5jG/vaC2H6fHIV+Jcfelbvnc8Q70rvT0epztsKS1ezOHvLyF6M5rhrMHYFGS/YKpoTeYukSDN+z+bPO4JMOKwuiNDWRVBUzhG/rWcZAmTn18j7n3ZCw3mywKqnmFksVA+vatJ3GMcUdaIb7yfcbgQ6aopXDHH1uf33jdL/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753717860; c=relaxed/simple;
	bh=miuM53jh6DMogwKUKIzr9v/SWcW7WZDKPGgyT60hKxg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TPPDsLvpHSt/DU6+C9Q0Ccl55O/Ud3zo11fP4S4yANH7k1Bl26ggNCX0HVvcEGzTsqEij57rqr4iu8gyiFENnQxvLYBTNwE2+6RQoZdK9yQDLepijZ2TfqtgyU/f7mpuFE5fchHKbbNN63Z50+LadvDusQsSF637/k5xMJD8b3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJR42MXZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753717858; x=1785253858;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=miuM53jh6DMogwKUKIzr9v/SWcW7WZDKPGgyT60hKxg=;
  b=ZJR42MXZssNoZDVe6KsdqbkUMbk9UJ1osWTQn5HqS/JAKJMFWRRC9q5f
   JRG3AB0Ph6Ciyd7NSgyUXSG50bpz3buq7KASVuPtdyyP0VmP5EWFLpshz
   r0FNXJDtryXqEHJAvE/ETJSia5yllh0v4smthGxvPoC/Is+Cvirv86W34
   6PIXsD/BUFdC+Jc/drs30AmxX/FSKb5k+JVj5KJaxYrM/09BYgXO8xsOx
   7EviUhsXBA+nIwz9FBkwtEWwMdv0xdPx44oN5JHGzM34zbyz3dmwtldAe
   Lau8cdDC4OTClnpfdqzrGxExXoyZDYmoBlg4XHMDUlKC0DaFiI1R39oUJ
   w==;
X-CSE-ConnectionGUID: br8uLF4iT4KBllGyk2z5UQ==
X-CSE-MsgGUID: 7ltTUnLsScGDNHrNhEiFKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55176746"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55176746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 08:50:18 -0700
X-CSE-ConnectionGUID: 7XTw0JskRwWOU1IHm5dwvQ==
X-CSE-MsgGUID: e5sxNui4Q9mEDUjRpR+XtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162029551"
Received: from gnrd17.igk.intel.com ([10.123.232.231])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2025 08:50:17 -0700
From: "Maziarz, Kamil" <kamil.maziarz@intel.com>
To: linux-media@vger.kernel.org
Subject: Seeking Guidance on Upstreaming Intel(R) Media Transcode Accelerator Driver
Date: Mon, 28 Jul 2025 15:50:06 +0000
Message-ID: <20250728155016.44220-1-kamil.maziarz@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear Linux Media Kernel group, 

I hope this message finds you well. 

I am reaching out to seek your guidance regarding the upstreaming of our driver for the Intel(R) Media Transcode Accelerator.
The Intel® Media Transcode Accelerator provides video encoding and decoding hardware acceleration, significantly improving efficiency and performance by offloading operations from the CPU to the Media Transcode Accelerator. This transition results in substantial savings in CPU core usage.

We initially planned to upstream our driver to the drivers/media/intel/platform tree. However, we are seeking clarification on whether this is the appropriate path and would appreciate any insights or recommendations you might have. Additionally, we understand that the kernel community generally expects KMD and UMD to be upstreamed together due to their tight coupling. Our challenge is that the UMD includes third-party or proprietary code that cannot be upstreamed, which may pose a challenge for acceptance.

Could you please advise on whether the media tree can host our kernel driver and who would be the appropriate maintainers to contact?
Thank you for your time and assistance. I look forward to your guidance on how best to proceed.

Best regards,
Kamil Maziarz
Intel Technology Poland


