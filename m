Return-Path: <linux-media+bounces-26883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E3A43039
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 23:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAEE817361E
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 22:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC9D1DF73D;
	Mon, 24 Feb 2025 22:47:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-2.orcon.net.nz (smtp-2.orcon.net.nz [60.234.4.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743D15B10D
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740437277; cv=none; b=gh6gvfD7oSurcLoMccZ7AconZo2fGUraLUnuYdGrlUaLCe0S5INKf4LRrc8Uta+w/L6KSNB6pzWnA85cT1mFrknWrFAmMRTb/F1c3txdOH3xFlkFgEsU75if6FBYWCYcWcnbMZ7IGm4V6xaJY8yrKtWvffsCetfom/5w938M/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740437277; c=relaxed/simple;
	bh=wm7g35SbefiFzVlEOu2hTjfp391G8ZuyBMym8Cf76OQ=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=Tx366wBEWMw1VGaR3SriWXQVYI0GioN7ct0l7WfFURzqbjJ5GGKoZDaG8/uK2jCank69OkXJC5efssCTtSQTJm34A24ekMtxoFGo29a0zTZcc89YV4rKUbjGr/uNrh7A9OuodqEqF/5DbRiHkdXY2GyeVXXnJH2A8v157lwB/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openmedia.co.nz; spf=pass smtp.mailfrom=openmedia.co.nz; arc=none smtp.client-ip=60.234.4.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openmedia.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openmedia.co.nz
Received: from [121.99.241.3] (port=41319 helo=newserver.home.stevencherie.net)
	by smtp-2.orcon.net.nz with esmtp (Exim 4.90_1)
	(envelope-from <steven@openmedia.co.nz>)
	id 1tmhEs-0005kd-J2
	for linux-media@vger.kernel.org; Tue, 25 Feb 2025 11:47:51 +1300
Received: from localhost (localhost [127.0.0.1])
	by newserver.home.stevencherie.net (Postfix) with ESMTP id AD12A100DB93
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 11:47:46 +1300 (NZDT)
X-Virus-Scanned: amavisd-new at stevencherie.net
Received: from newserver.home.stevencherie.net ([127.0.0.1])
 by localhost (newserver.home.stevencherie.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0o1opq6xkZv for <linux-media@vger.kernel.org>;
 Tue, 25 Feb 2025 11:47:42 +1300 (NZDT)
Received: from webmail.stevencherie.net (truenas.home.stevencherie.net [192.168.0.3])
	by newserver.home.stevencherie.net (Postfix) with ESMTPSA id 90F0A1097B67
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 11:47:42 +1300 (NZDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 11:47:46 +1300
From: Steven Ellis <steven@openmedia.co.nz>
To: linux-media@vger.kernel.org
Subject: Incorrect LNB settings for 10750 LNBs used in AU/NZ
Message-ID: <3f7e5c82f1c3b747d14b30df9f766f37@openmedia.co.nz>
X-Sender: steven@openmedia.co.nz
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GeoIP: NZ
X-Spam_score: -1.2
X-Spam_score_int: -11
X-Spam_bar: -

Tried submitting this as a patch but I'm not used to the process these 
days so I'll just send this as an email. If someone can send me a good 
guide on providing patches correctly that would be a great help.

Meanwhile the issue is if you're performing a dvbv5-scan or dvbv5-tune 
it produces errors if you use the LNB type L10750 as the upper frequency 
range is too low. Common LNBs used for SkyTV NZ and similar services in 
Australia have an upper range of 12750.

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

