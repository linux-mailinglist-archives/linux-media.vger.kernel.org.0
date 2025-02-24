Return-Path: <linux-media+bounces-26790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C487A41A5C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 241B91887B69
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ABF24A04A;
	Mon, 24 Feb 2025 10:09:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-2.orcon.net.nz (smtp-2.orcon.net.nz [60.234.4.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE02288DA
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391764; cv=none; b=YQBwjtIrDd5OkoZfFVHXnqz7zAfluCpD0t8M3pHBJL0vMZcIOZ+cVwTvypwOd+HJZvAOYoTl4LKEl+pYsY3/ID2D86xRve+oTG0jwmRQ3iBuF/6u0ghIyYn/S7kjtmnyLIcHX2WJuj65Gt3A6yqFyASXgQKml6JEOPXP/V55rv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391764; c=relaxed/simple;
	bh=Dy5e9oNLkO9VtwAS4xjl4VAyYvS0RnRRxmd13YYdhXM=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=Rb7Q7ZAm8300UfmBvyXTry4iRvz/fQmBFxLoyhlHglTLb84to135vOdysDXbO7En0rTrOa7OTwTsxQNjY+mgXARwpSnOazMgoJQ4nIvnbUaeNJ5+i8VTX7cOMivhERWD0T7J0aumPCMsh3knUOH1vzFw5J1m2BaGKcKnuA5NI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openmedia.co.nz; spf=pass smtp.mailfrom=openmedia.co.nz; arc=none smtp.client-ip=60.234.4.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openmedia.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openmedia.co.nz
Received: from [121.99.241.3] (port=51074 helo=newserver.home.stevencherie.net)
	by smtp-2.orcon.net.nz with esmtp (Exim 4.90_1)
	(envelope-from <steven@openmedia.co.nz>)
	id 1tmVOm-00018k-Ax
	for linux-media@vger.kernel.org; Mon, 24 Feb 2025 23:09:16 +1300
Received: from localhost (localhost [127.0.0.1])
	by newserver.home.stevencherie.net (Postfix) with ESMTP id 439FF1097B74
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 23:09:13 +1300 (NZDT)
X-Virus-Scanned: amavisd-new at stevencherie.net
Received: from newserver.home.stevencherie.net ([127.0.0.1])
 by localhost (newserver.home.stevencherie.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40b0bn-hsn76 for <linux-media@vger.kernel.org>;
 Mon, 24 Feb 2025 23:09:11 +1300 (NZDT)
Received: from webmail.stevencherie.net (truenas.home.stevencherie.net [192.168.0.3])
	by newserver.home.stevencherie.net (Postfix) with ESMTPSA id 4A9D31097B67
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 23:09:11 +1300 (NZDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 23:09:14 +1300
From: Steven Ellis <steven@openmedia.co.nz>
To: linux-media@vger.kernel.org
Subject: [PATCH] libdvbv5: Correction to LNB range for 10750 LNBs in common
 use in Australia and New Zealand
Message-ID: <013d5d5d54a0f1ac517d05c857513c8a@openmedia.co.nz>
X-Sender: steven@openmedia.co.nz
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GeoIP: NZ
X-Spam_score: -1.2
X-Spam_score_int: -11
X-Spam_bar: -

Currently performing a dvbv5-scan or dvbv5-tune produces errors if you 
use the LNB type L10750 as the upper frequency range is too low. Common 
LNBs used for SkyTV NZ and similar services in Australia have an upper 
range of 12750.

Example
  - https://www.dishtv.co.nz/LNB107KU

Here is a patch against the current git tree.

Steven


diff --git a/lib/libdvbv5/dvb-sat.c b/lib/libdvbv5/dvb-sat.c
index 36a42344..817a82e7 100644
--- a/lib/libdvbv5/dvb-sat.c
+++ b/lib/libdvbv5/dvb-sat.c
@@ -129,11 +129,11 @@ static const struct dvb_sat_lnb_priv lnb_array[] = 
{
                         // Legacy fields - kept just to avoid API/ABI 
breakages
                         .lowfreq = 10750,
                         .freqrange = {
-                               { 11700, 12200 }
+                               { 11700, 12750 }
                         },
                 },
                 .freqrange = {
-                      { 11700, 12200, 10750, 0 }
+                      { 11700, 12750, 10750, 0 }
                 },
         }, {
                 .desc = {

