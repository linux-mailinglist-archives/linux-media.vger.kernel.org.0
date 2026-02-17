Return-Path: <linux-media+bounces-52992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG3uOjnhlGlqIgIAu9opvQ
	(envelope-from <linux-media+bounces-52992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 22:44:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE6150D52
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 22:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FA063007A4B
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 21:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D35B2F5A22;
	Tue, 17 Feb 2026 21:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9uNxYhe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A84E28CF6F
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771364656; cv=none; b=uUD0yte8/atSp9RY9RYQ2aVvotA0HhbRheJ7+cGQ3YHQJ2ljJNSFvf9AzPylnTxKtCcAOA5RsPM+487M46dVrAW/vRclCIRDlMauSaNHwTSsG6QJw5zgfuXO4eaf/lVgmxeLdb1Dodo9dBoZSFcWT/3MgiFq66VCBd0I4psuL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771364656; c=relaxed/simple;
	bh=wxFPJizjfiYTJKvUV7ZvFmLa1zfgLqmrwZtoLEwqlaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3TjyHmXCgnilv+3yXMWOoWUzII9hCwsKbr89z3DaFywPToL3y4lqnPOU1kTQQUOqEA1BvSiIoc64xHdWivcYpN1ciCSnDPoAneB3v5uhID2IXmjb4Xl0zlT7yZGsmTIclZhqdidp4BRiEfBADdmaKoyo9aUHdLGrHRYQYQX7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9uNxYhe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771364656; x=1802900656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wxFPJizjfiYTJKvUV7ZvFmLa1zfgLqmrwZtoLEwqlaM=;
  b=R9uNxYhexH03TrLa1/FrsLqHvjDmvyW+3jVban1nMjgSJTiGRf5zuuiv
   CCmdx+zfk/P74WzjhUwcOK8fhgQHDs/SQWBlbUUd3O4/dGr35Yt8PHMd+
   fz2vZkmkarCzdN+PMd9aXYOjEJB7KuE8PodcjWsDwpeQZdM74FZM1mcMV
   0Frz4tGNJuDrBAbk8icV/dj6vmupqV0pY4CaL57uZtnxU/gtdi+iOxYJ5
   Izpj73F+VGRmmfG+GsJFMcEIDemlzPXBg5tdJQ/3wngDIX+18xZAeMRL0
   lStKUHVMs7X9TmT3lX0ORmwsrK4CdG/lJH5+CVNn4sMxVdyydiXTOFH9e
   Q==;
X-CSE-ConnectionGUID: EzLSJGj/TOqsCdNUppxkMw==
X-CSE-MsgGUID: DnKnaqL1QMC3a0j4ofCxkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76061966"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="76061966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 13:44:15 -0800
X-CSE-ConnectionGUID: uRXpHDQ8Q/uyDnQ5JJW5NQ==
X-CSE-MsgGUID: V5L0P2TJQpm8dT5RPY9O+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="212172503"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 13:44:13 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D3CA4121D37;
	Tue, 17 Feb 2026 23:44:35 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vsSrz-0000000ACds-2k2v;
	Tue, 17 Feb 2026 23:44:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH 0/2] 10-bit packed raw support
Date: Tue, 17 Feb 2026 23:44:33 +0200
Message-ID: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-52992-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3BE6150D52
X-Rspamd-Action: no action

Hi all,

These patches add support for 10-bit packed raw formats. Adding support
for more bit depths would be trivial (at least up to 16 bits) but I only
needed 10. :-)

The code could be prettier.

Sakari Ailus (2):
  Add compiler options to avoid warnings
  Add 10-bit CSI-2 packed format support

 Makefile     |  2 +-
 raw2rgbpnm.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.47.3


