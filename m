Return-Path: <linux-media+bounces-24740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F25CEA112F0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 22:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4691167542
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 21:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404420F07A;
	Tue, 14 Jan 2025 21:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b="mzplupav"
X-Original-To: linux-media@vger.kernel.org
Received: from frontend01-osl2.zimbra.h.bitbit.net (frontend01-osl2.zimbra.h.bitbit.net [87.238.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCF207A23
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.238.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736889771; cv=none; b=cSNkc/IeJgyk7HMc7wz0T7vKxq1i4yXyoKF1IQBbZ70GATWXxNekcW3yc1n2Aj0yQP6oc9MEqnmFFOjVyDtjwfFmBdm9f1gZwVpq70XkXmrYKrmIK2wYbCdJTHsGQfSvG8R9aOpRdgjSHXHYwzFFUuR83tLNwTZimD1kohS+CD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736889771; c=relaxed/simple;
	bh=wF6ULqDcVOeVy3PdewQuVstW5orbBeDVmEXs9QFpQF8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dTbY2HknOM3PBFsLWT7RFBzATv7ZRWwt3zDvxI1MUA8yC7gADotaQ2iaFMkvxhwA8LJHYpdbHft3bvLWXAlIx3OwkvqsuvoySQ1M3dOwHYyjYH0v+gXKimgsPcRehwHrviZvY4QlXP/nmLeMFDS7YIS4/0WcNXlHxLrWjeNAZ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com; spf=pass smtp.mailfrom=redpill-linpro.com; dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b=mzplupav; arc=none smtp.client-ip=87.238.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redpill-linpro.com
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 85B4C608F2;
	Tue, 14 Jan 2025 22:14:22 +0100 (CET)
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10032)
 with ESMTP id Dozap7v5WnyS; Tue, 14 Jan 2025 22:14:22 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 68694608FA;
	Tue, 14 Jan 2025 22:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 frontend01-osl2.zimbra.h.bitbit.net 68694608FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redpill-linpro.com;
	s=612BF5B6-589A-11E6-A0CB-300C70828C2A; t=1736889262;
	bh=wF6ULqDcVOeVy3PdewQuVstW5orbBeDVmEXs9QFpQF8=;
	h=Message-ID:From:To:Date:MIME-Version;
	b=mzplupavmCayko99HQlmaqOploenibcTSwiJoLCuHzip7aaYThyFTyX6KBCohZpgx
	 sZSn5OwsMSmy9Zco6uc9tKRISIxLzkAjhyy7WVAih0U0inyGFNvfPsC0IAr2NKeVpH
	 8wR60j1H13p9SYyLP+rp25YECBszVK2mPdlSQVeI=
X-Virus-Scanned: amavis at frontend01-osl2.zimbra.h.bitbit.net
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10026)
 with ESMTP id w3HFeJm-_nUw; Tue, 14 Jan 2025 22:14:22 +0100 (CET)
Received: from [IPv6:2a02:c0:2:7::7] (vpn.i.bitbit.net [IPv6:2a02:c0:2:6:18:59ff:fe38:da0d])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTPSA id 41CE1608F2;
	Tue, 14 Jan 2025 22:14:22 +0100 (CET)
Message-ID: <c0e73918cc402888b7e33427c61dfa1c88e96834.camel@redpill-linpro.com>
Subject: Re: [PATCH v6] media: i2c: Add Omnivision OV02C10 sensor driver
From: Ingvar Hagelund <ingvar@redpill-linpro.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com,
 joachim.reichel@posteo.de
Date: Tue, 14 Jan 2025 22:14:12 +0100
In-Reply-To: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
References: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com>

