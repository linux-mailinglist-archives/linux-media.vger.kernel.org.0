Return-Path: <linux-media+bounces-47783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B54C8BC65
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 21:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D65CF4E88E5
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725CF335555;
	Wed, 26 Nov 2025 20:06:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from penti.org (penti.org [193.167.33.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376C313536
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.167.33.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187614; cv=none; b=X59cZsYE2CPjqgKIPQoiHoyDqnmedy43uFN4E9ioKpKqEgepdaVaq4P6ew7amTUR4AnQ+W1di+Ye7am5snjYoeX0f1OJbuj/NzmsbDPFhxbSSNsLGyXwdN8zuDis6c6gffwbso/99pQJLhG2eLbezC2NmeFcxvTTZqjbpmDpl6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187614; c=relaxed/simple;
	bh=kjv2iOAS0qt3dQSguEIx4j31sznp/4Av0JIcRdJcFdM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=FNLlgyxfIEax6Zr+xzQd5yBlYKxnYA/xiFk1QkEgalBIPGY2S6s4QuvVGslGaVObd/SJEMD2xtpxAKRlgtulnLxkXmwKB3iu0Sh7KhTRptdXDj7pz8AH+wGuhxukVJgVtM/JY4vaMpqmXLR2Z53+V/hMSQzSO3ioeNC7xTnQhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=penti.org; arc=none smtp.client-ip=193.167.33.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penti.org
DKIM-Filter: OpenDKIM Filter v2.11.0 penti.org 5AQK5RX62108221
Received: from penti.org (localhost [IPv6:0:0:0:0:0:0:0:1])
	by penti.org (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTPS id 5AQK5RX62108221
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 22:05:27 +0200
Received: (from harald@localhost)
	by penti.org (8.17.1.9/8.17.1.9/Submit) id 5AQK5R4F2108220;
	Wed, 26 Nov 2025 22:05:27 +0200
Date: Wed, 26 Nov 2025 22:05:27 +0200 (EET)
From: Harald Hannelius <harald@iki.fi>
To: linux-media@vger.kernel.org
Subject: Updated scanfile.dvb for fi-Espoo
Message-ID: <0e3fbe85-fcc6-6cba-3bfa-5258f68e489d@iki.fi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Virus-Scanned: clamav-milter 1.0.9 at penti
X-Virus-Status: Clean


We have moved to DVB-T2 and have no DVD-T channels anymore. This scanfile 
made my kaffeine able to find channels again;

[dvb-t/fi-Espoo]
T2 514000000 8MHz AUTO AUTO AUTO AUTO AUTO AUTO 0
T2 562000000 8MHz AUTO AUTO AUTO AUTO AUTO AUTO 0
T2 674000000 8MHz AUTO AUTO AUTO AUTO AUTO AUTO 0

Sorry, don't know how to convert to proper format.

-- 
Harald Hannelius | harald@iki.fi | +358505941020

