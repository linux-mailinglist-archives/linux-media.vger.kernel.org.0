Return-Path: <linux-media+bounces-33368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27660AC3E6C
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2332216AB81
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369F31F91D6;
	Mon, 26 May 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0FHW8vI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C011DF26B;
	Mon, 26 May 2025 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258261; cv=none; b=NqpCgI8+Hj6alCFlF0hl9OCoUOUachxUGUtTkTgvRvnV6JHWp0DLJXqADAPxcHYn2xnx4HRurKVmuD0HwVBsk8oK3NfcYXZayKDi+uAp3YWHP2EbsZvf4BOwZdGjLF/UEkRuRPB8i3iKqL/BtFAz2OqaZjfcHKdWIPybp2zc/rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258261; c=relaxed/simple;
	bh=kCChXdcNhNNPk3GCnN7qlQQVTqcDW8bmk78IzTynL50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EcQGqU8C/jPv5XbLFrgNPYLIdWNrO3nrEbBnimEJEMErj+KKMR1e6KL0J28E8ipKgxTBbieEHJ8DsUoKnXyM3l6drgPWaUi6PFUF6vARVoJTiYyCH4r5CByUjuVlecaChPEtLR177D3Df+gjGir9yCgya98z1TLpCOIT5g/Gs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0FHW8vI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748258260; x=1779794260;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kCChXdcNhNNPk3GCnN7qlQQVTqcDW8bmk78IzTynL50=;
  b=W0FHW8vILL28XLOPoz8ZydYKLn3zeJeUxYRSNGrUSaUpoYEyf5bmfm07
   LRe1VQUt3ZwKWpVnUi2Cu9vgkP1fbgx0vcjBeH93Kfmi+01A/gzvw3jPO
   bq5kxfWpbUa/V0+Y10TQFiJCxavY8GxAfQcNb3gXSFWyUn/n4qDbsO753
   EW1iAdBNaPXwvk3hIEIcYaYN09pcVtKgL+wsqgOM5yYLED6ms5GGRA8gR
   /FYX0QoTHwQFr+g3WCPpwi171Np90++E8Zg8+OlcjXQGJywU6zr+zPKk5
   JKIAzNVwxWEr6r0jtmkqRxVv2Y/04fPL2jFtAaaZjYuX64IKr54CrPAkT
   w==;
X-CSE-ConnectionGUID: wFwNyaQ5RHaB7e86Mzjp+A==
X-CSE-MsgGUID: 73NDAWGZSi2FLghZl7qNDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49935345"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="49935345"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:39 -0700
X-CSE-ConnectionGUID: 8A2kWhQFS6KhFf8BMcqFsQ==
X-CSE-MsgGUID: aufz7FY+QhWwRkuJ2Mvc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142273286"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:17:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C171C11F732;
	Mon, 26 May 2025 14:17:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJVpk-0022kn-2B;
	Mon, 26 May 2025 14:17:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 0/2] Document Media Controller IOCTL number assignments
Date: Mon, 26 May 2025 14:17:30 +0300
Message-Id: <20250526111732.487229-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

The Media Controller uses IOCTL numbers with '|' type up to 0x81 but the
range from 0x80 upwards is documented to belong to samples. The samples,
however, are not currently using these values. Solve the problem by
bumping the top of the MC range and the samples allocation by 0x10.

Some sample code in samples/rust/rust_misc_device.rs also uses MC IOCTL
numbers below the current limit 0x80, it'd be nice to address that as well
as align with the changes in this patch.

Sakari Ailus (2):
  Documentation: Bump media IOCTL reserved numbers
  media: uapi: Document IOCTL number assignment

 Documentation/userspace-api/ioctl/ioctl-number.rst | 4 ++--
 include/uapi/linux/media.h                         | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.5


