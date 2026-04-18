Return-Path: <linux-media+bounces-59075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MuYOMa5d42nQFwEAu9opvQ
	(envelope-from <linux-media+bounces-59075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:32:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10616420AB7
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 12:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 147F4301A920
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6219342C80;
	Sat, 18 Apr 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="NfzXOqi2";
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="NfzXOqi2"
X-Original-To: linux-media@vger.kernel.org
Received: from out12-169.antispamcloud.com (out12-169.antispamcloud.com [185.201.16.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7140DFBD;
	Sat, 18 Apr 2026 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.16.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776508323; cv=none; b=ulf5Ts2RZPPnh4/FP5XhfqRGz4drjy64cAR72Kww8TS4OtT7rhHw9O1K1fpseMJpKdzkSsJnrbvJADSjbG+0qbXIhviaHTliTLdgo5fVoaKM64Hha0P8oDT5Oq2pwcwvjF6eTZGKIB5M28z+vl4roEIlJIYOmpythvuYwB9evYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776508323; c=relaxed/simple;
	bh=Z+OU9zEjf3W3VNfr/Cbmlx4qJPXNwiZcbb4UfY9d3AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYqt2oogidJTy7otOjWQNSL6VjIoN1oz/ViShAXFgMccC9tfotMaoJXkodddKGHlMXwyQBX0HIVZKfS0WidKV2Ik9a/T9z99ChO2x/AaCcG2bZ7x94MG3S3rDtIg7m3X4DtAymC8ZtpEp5P3dCNA2kkf+18XN1TYDd4KE1IfSdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl; spf=pass smtp.mailfrom=zonnet.nl; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=NfzXOqi2; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=NfzXOqi2; arc=none smtp.client-ip=185.201.16.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonnet.nl
Received: from mailout1.c3.isp-net.nl ([77.95.250.13])
	by mx298.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rn.mast@zonnet.nl>)
	id 1wE38T-00AR14-TE; Sat, 18 Apr 2026 12:31:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout1; t=1776508305;
	bh=U4zH4HMSIUawEQdKjXijuUdEn9RrBwENw18iF03t3Nc=;
	h=From:To:Cc:Subject:Date:From;
	b=NfzXOqi2WCepxRUcf7FtPzmpB4Ohm1vjynGlnYTD26mFtmuAEk8OkOLAkOel/+5uZ
	 S/xQoxx23IS+ZR7Qq5uKCKX69zMjb6cFBf9qkSPIPXPYsGQ1Z8Sd6fn3hIQemLu8jd
	 vZXomO4Zpq4Z/ewrG0YOeovWt87tHhqbiOcT9JoRfNF5KdZijDdcTFgJGRq7+n2Dhv
	 /6hWLfyshzCgncxg+v7gdc4M6vKs9gSwtwxIoUXp/wtCjHvzsdX8ur+zvConuRKVUs
	 9/xFRgbYe/1USlU4c4oXYo1DjOTqZcUQB9dR/fTTRmiKHuVVM+/9d+AC9JaomOodnn
	 oDAcKISZJlt9A==
Received: from localhost (localhost [127.0.0.1])
	by mailout1.c3.isp-net.nl (Postfix) with ESMTP id CAFDA84D0E;
	Sat, 18 Apr 2026 12:31:45 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mailout1.c3.isp-net.nl
Received: from mailout1.c3.isp-net.nl ([127.0.0.1])
 by localhost (mailout1.c3.isp-net.nl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id AvZMoXDqgxq5; Sat, 18 Apr 2026 12:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout1; t=1776508305;
	bh=U4zH4HMSIUawEQdKjXijuUdEn9RrBwENw18iF03t3Nc=;
	h=From:To:Cc:Subject:Date:From;
	b=NfzXOqi2WCepxRUcf7FtPzmpB4Ohm1vjynGlnYTD26mFtmuAEk8OkOLAkOel/+5uZ
	 S/xQoxx23IS+ZR7Qq5uKCKX69zMjb6cFBf9qkSPIPXPYsGQ1Z8Sd6fn3hIQemLu8jd
	 vZXomO4Zpq4Z/ewrG0YOeovWt87tHhqbiOcT9JoRfNF5KdZijDdcTFgJGRq7+n2Dhv
	 /6hWLfyshzCgncxg+v7gdc4M6vKs9gSwtwxIoUXp/wtCjHvzsdX8ur+zvConuRKVUs
	 9/xFRgbYe/1USlU4c4oXYo1DjOTqZcUQB9dR/fTTRmiKHuVVM+/9d+AC9JaomOodnn
	 oDAcKISZJlt9A==
Received: from 2001-1c04-390f-9300-d19d-7a59-d56b-16f7.dynamic.ziggo.nl (unknown [10.120.0.246])
	(Authenticated sender: rn.mast@zonnet.nl)
	by mailout1.c3.isp-net.nl (Postfix) with ESMTPSA id 3BB9384D1C;
	Sat, 18 Apr 2026 12:31:45 +0200 (CEST)
From: Robert Mast <rn.mast@zonnet.nl>
To: hdegoede@redhat.com
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Robert Mast <rn.mast@zonnet.nl>
Subject: [PATCH 0/1] media: atomisp: mt9m114: Graceful teardown atomisp 
Date: Sat, 18 Apr 2026 12:31:08 +0200
Message-ID: <20260418103136.6911-1-rn.mast@zonnet.nl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Domain: zonnet.nl
X-Spampanel-Username: 77.95.250.13
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=77.95.250.13@zonnet.nl
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuVzkKdCtcsyq2M+fj6t3NdnVaPuWW65IIT8
 lIUNtU+PTCu2SmbhJN1U9FKs8X3+Nt2LTcqLh1fYYSBrpo52T+cL08LSf6AHMaTqrYEKhfhw6/wu
 jpmsE9WelXeoOJJHAK5wGYjbvhzWX8Co+5c+eruaCtmoQhY2xrBb8C+tWUvqrqBKsSdhvd/J5sX5
 daZjkYvf97og0NB52/5kO+HLq4D+zthz0vNkOX8Em4cj6D/wdZLN8EqOrj2jEKT+woaXpsWWSPpc
 XGZyIXbjKlxA1QmXB6mHSb/tl+iz4DGx+nERWImLb10M3gdB4OsqltIBjR9LCxe/kHASpASB4Jqm
 OHLQ7yqeeI5+Rl7EMeeJ/dab4KYkKPorzaj90qQygCBize+Vjxz+gARbgmnGRdC/MLl+z0G6NyzM
 pr9q/TEXF7MaiciKl07WT7s9OXetZcPJ+iEZIDb+tWwVtfEkTd1DmWEMx4cxclVLGJ5zG2OKuuiu
 LBW3wDcLkxizMm6cIsmgKgHdc2FzsiphQiBWCBo+Rdog0Ienw6D2na211delpluLBnJeaTquL51B
 C5DECL7dg10Z0FtiGnvQOxRcjF6FhN0WyZgbhy6Ip7cFP895tjTrYQ4Nl1BGP00hqeAFGSL1ksCR
 sOAwREay+ZbLIzOOWZBJYCTwuapYHJC4Tg2AsI28yoeXNrrVyBtC5I1nothjYzCsOWmMjy5OSW4H
 aGfGbwIDxKvUvGoLajyIi3DrHv79bQa/u/XCVlUjcdBRrxeZtV7YZSNhbMMlDNWAeKW+jYoc1REC
 Q9JNzSdwcSO4yVjAaF4QP20RMWbzq20f4j3dniZ3IT05PNbdeIwvWH1Xotnf70YJErPnNw3QCUIp
 PK+QzX3JlnOAYOwvgs4sv7ykOBxKEjX2P24wm2Xm0Zxro1P7++DuIQUs/5JJj4C/n4CILgn/bD1i
 7OhepwtWymW4DoHkEpEmo0S5uVYZW6T+ceMHk0ImIUcS4cADh+N7TLJd4EePvQ0/7v2qfc1UQPc+
 C2zV4rjA/Vhhr0MzH1Bfz+1J2dUbdQ8r53594kv5g5OTqxpM1nGaoFB/2lGWVjjlbHdiFIIbv3ha
 A51i9XHJpdLvp1sjvYPrIIOVZtFxoHYAcWA0rKLM7BXlLbH2QKwudBdpntbQvPsNyZwbKH7gUjAt
 eVhmF1cMhbEpzHBIpTccGgqlrPmEc7B5uvCtKd0pU+z1H/aAwarQpYDOYx/6JtUOkWW83bHBQtiN
 S8BuPRz11Mzsab7lLXStHIUdYBdzUu8+huzH7ZLs859XvDQMpYrd/2rAztFeklLxGNN3KHaPkHxK
 6VnhOL94oH1nyW8221oOCdHg5s01jdS5V3lDWyVevAGqLFSPqwviG+Y3ykMCdQ==
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[zonnet.nl,none];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[zonnet.nl:s=mailout1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59075-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,linuxfoundation.org,ideasonboard.com,zonnet.nl];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rn.mast@zonnet.nl,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[zonnet.nl:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zonnet.nl:dkim,zonnet.nl:mid];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[zonnet.nl];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10616420AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During the many iterations on mt9m114 and atomisp on my T100ta baytrail
I was annoyed by having to reboot each time, as modprobe -r/modprobe
wasn't able to fully reinitialize mt9m114 and atomisp, resulting in cpu
core hang ups. I asked Github Copilot Enterprise to fix it for me, and
the fix looks quite good and has served me well since. I'm not able to
distinguish any structural flaw, so please review.


Robert Mast (1):
  media: atomisp: mt9m114: Graceful teardown atomisp and mt9m114

 drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
 3 files changed, 110 insertions(+), 12 deletions(-)

-- 
2.53.0


