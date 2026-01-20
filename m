Return-Path: <linux-media+bounces-51086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24ED3BD6E
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 03:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 772AD301E900
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 02:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166D027144B;
	Tue, 20 Jan 2026 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=firemail.cc header.i=@firemail.cc header.b="mXgydKy7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B772634
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768875014; cv=none; b=HHGjx5cv/zwY2BTSUS0xb/WVAm+qpaWD+nhcVJzM7FOzsb37KOGx0H1iTEoj0vo0nka08vy7CjS5u08e1Sr8TtIBN0aN40+nSNW2RihQ5LEIBGAvRqqhOZSZ686QAxZEGuf9vUjYn+UL3p3pUV1n1s6HR8wCSo8ds664/DH37YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768875014; c=relaxed/simple;
	bh=6M7oPAZxQVNNPMeKyvo4uzuRTBxoSgbwZvwoXKF9aLQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jpLkrIcoPoxDpWaZBuku1mTaIBuOC/VNqZOJCljZW7dbuwWmWMalQBwy13RuLeJNX3T8pA/t0aX55N8uBvYALmO2cXrpQG7mx4AOAR0JQXxz/Yuje+LDyZoGPNvr5vu1N9ZZEb46cIOUyPOm/jJY8bFh9es1mpUd1dswlKOSeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=firemail.cc; spf=pass smtp.mailfrom=firemail.cc; dkim=pass (2048-bit key) header.d=firemail.cc header.i=@firemail.cc header.b=mXgydKy7; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=firemail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firemail.cc
Date: Tue, 20 Jan 2026 04:09:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firemail.cc; s=mail;
	t=1768875006; bh=6M7oPAZxQVNNPMeKyvo4uzuRTBxoSgbwZvwoXKF9aLQ=;
	h=Date:From:To:Subject:From;
	b=mXgydKy7vioQBbqJy5atLFIwkzeKS6UphUrZba86SPIdma8WyGhP58Ye4Fd8iomxV
	 1pDsrjeGUkjFaFJC6+tG4BtSQlUki9vE0/WnDONGCCSk9lmi14jh7JTK1S+2JpJhsI
	 LEAlmuF1845h+7Et54aCHzhrnf+suzIjMVjoQUz43rpcI/6UNX+LzKp0nqnb4t6ppg
	 7O2NjDksbc1fJ9T3sIQQ0PAvbEeZkkicfQP8gm5Y4hw6jINjPkrHLEQCXufbZfgyua
	 UiP5Tn0hlPKV1cBGzX/CHgwn057NLCN/bwaaLQ/xOT9nik3fy69evne1HavMJC7UYA
	 DrjDkRwFCkNFg==
From: miyagi <mrmiyagi@firemail.cc>
To: linux-media@vger.kernel.org
Subject: dtv-scan-tables: update dvb-c/fi-sonera
Message-ID: <aW7j9mfpdZDtDZT6@firemail.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vTLUw37TVFofzvHi"
Content-Disposition: inline


--vTLUw37TVFofzvHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I updated the scan table for dvb-c/fi-sonera and renamed it from "fi-sonera" to
"fi-Telia". New table is attached.

Thanks

--vTLUw37TVFofzvHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fi-Telia.conf"

# Telia Kaapeli-TV (Finland)
# Updated 2026-01-20
# https://www.telia.fi/asiakastuki/tv-ja-viihde/kanavapaikat#kaapeli-tv-radiokanavataajuudet
[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 266000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 274000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 282000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 290000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 298000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 306000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO


[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 314000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 322000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 330000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 338000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 346000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 354000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 362000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 370000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 378000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 386000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 394000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 402000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 410000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 418000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 426000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

[CHANNEL]
        DELIVERY_SYSTEM = DVBC/ANNEX_A
        FREQUENCY = 434000000
        SYMBOL_RATE = 6900000
        INNER_FEC = NONE
        MODULATION = QAM/256
        INVERSION = AUTO

--vTLUw37TVFofzvHi--

