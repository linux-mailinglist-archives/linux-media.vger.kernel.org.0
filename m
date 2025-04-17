Return-Path: <linux-media+bounces-30425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538B0A914A9
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E307AE480
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DC021A431;
	Thu, 17 Apr 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3tExCs4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6412185BE
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873313; cv=none; b=pIjRfLxkm/i+nEbE3CGIot5HoT23RomnXUrrJ/fzfiDoRp06IQOQoF9SO/NZSTqO8wRGDZ1bIuIpYVURE8cvtKLWvjYyw7kD9qGIl/ROoy0+ETziEZrz+h3XDmJZTtpqo16rK9GYuLDFRGAy2GQ7M/ItQCnUj1XIEwlsejERvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873313; c=relaxed/simple;
	bh=uV9xtJ5sBM40CU/YXcWZBk7jQdhenEQ4GHd3+QbypWA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lRmx9/UYlgwzUhFpFFjhfSV6UkoqQyenfb7YNg/uLqwEL3YgSGvMiqRuqkGDUsszsGAkfa49aQrwAI7EcSs/jUq2h57KfnjTsqa3hE827qvZjl7ofZ0FmQerDd3KEaliXoQMqFKLGB+fktKENMFajtDbWpchWhtE5sjhZyBPNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3tExCs4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873312; x=1776409312;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uV9xtJ5sBM40CU/YXcWZBk7jQdhenEQ4GHd3+QbypWA=;
  b=j3tExCs4lIGvbLpp1Y8ZecmZ0B3IzNUAzT/s5arjY03onfNscBQfPLFG
   93v6J27wuihO0Ca+VhBCjrGUI8Atvx125XcyEXV1LgUDV4twQxbW7T8lf
   g9irc9CnA2hb7T68szKRKbpIMWgZqeTU2hot2gZETbkI4lxD3E9+bqAus
   5ZYda/uDMvOzmBSnXMQ6FD3n4v0GDPup28wQPK/EcR4d+gY4qteNFY0hx
   NnpeSVoarHrDEnzyH99U9k6Zul3ClqzWX7Y1V7r+rO3yWBsDojr6XNUER
   ILrbM0FAxI7kF15q9bTN/cWLkQJHArDW08SIztqhvK+N2wvewAT+cqj7D
   Q==;
X-CSE-ConnectionGUID: HDiBFJ+eTD6A3AbbE863ew==
X-CSE-MsgGUID: M4OF7I5IRC+fQGN8H1+BTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580985"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:51 -0700
X-CSE-ConnectionGUID: 8uJXmOKjRc27tuZBulYxwA==
X-CSE-MsgGUID: vvr1FnYaRL2DlZfZ/y7ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883749"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:50 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9862C1203F8
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:47 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 4/5] =?UTF-8?q?media:=20ccs:=20Remove=20I=C2=B2C=20write?= =?UTF-8?q?=20retry=20hack?=
Date: Thu, 17 Apr 2025 10:01:43 +0300
Message-Id: <20250417070144.130199-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
References: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The I²C retry hack has been there in order to address transient I²C
register write access issues on a few very old sensors and possibly it has
addressed also first I²C access problems (device not responding until a
certain amount of time has passed) but that is now separately handled. The
retry hack has a good potential for introducing hard to debug problems in
updating sensor settings while streaming. Remove it and instead pass those
rare errors to the user space -- which is also what virtually all other
drivers do.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-reg-access.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index a696a0ec8ff5..fd36889ccc1d 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -210,7 +210,6 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
  */
 int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
-	unsigned int retries = 10;
 	int rval;
 
 	rval = ccs_call_quirk(sensor, reg_access, true, &reg, &val);
@@ -219,13 +218,7 @@ int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 	if (rval < 0)
 		return rval;
 
-	rval = 0;
-	do {
-		if (cci_write(sensor->regmap, reg, val, &rval))
-			fsleep(1000);
-	} while (rval && --retries);
-
-	return rval;
+	return cci_write(sensor->regmap, reg, val, NULL);
 }
 
 #define MAX_WRITE_LEN	32U
-- 
2.39.5


