Return-Path: <linux-media+bounces-35841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F65AE744C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 03:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97449189D3B8
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 01:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA74814A4F9;
	Wed, 25 Jun 2025 01:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amountary.cfd header.i=@amountary.cfd header.b="T9y0gZEE"
X-Original-To: linux-media@vger.kernel.org
Received: from amountary.cfd (ip44.ip-51-81-76.us [51.81.76.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6052C1A2
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 01:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.76.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814789; cv=none; b=A9bIeymdAX1iS1dAwPBuVB/j8c0xJh8Mpfnyu8HFbhXe3ka0rmZ7JGEsHXwaFO2VSnVpjPmPUgI0eEZVpKZveYovhumbO6VdB9Y5GilSIHC62vZsP2pfbeok9FjOyn6sVK+1meupzRUp+qoBBwgWJcDRkfQ2MK9PFXdBMiz7+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814789; c=relaxed/simple;
	bh=obGNXWf44oXLYnASYRdowmMvwCIVBYpJ6rOCp3DpTpQ=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=ngrGmtj/UwRk+9GF8wcQdGyz+ZgxXNdL8gXrFVe/7Qv2hjHUHMK+kXupBsu4UKz/PEHtSviWy9W9FOuxbGqGsnVW/5tqu07pBi9WxwImsgj8FDco8C5o6akflZl46vJTBVTznjJgX/7oPq7XT12v4yBcN5/1+RncGKiZbtKBuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amountary.cfd; spf=pass smtp.mailfrom=amountary.cfd; dkim=pass (1024-bit key) header.d=amountary.cfd header.i=@amountary.cfd header.b=T9y0gZEE; arc=none smtp.client-ip=51.81.76.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amountary.cfd
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amountary.cfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=amountary.cfd; s=mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=61nQyG14VHXx6Zo1vprLNcd395mcViGyzKp3Sxl4oMc=; b=T9y0gZEE5e6057bRizx3WsJ2jK
	Hfy+TZ3GeabaMEGVtZNVEkUfZeuDjbtvN61bF9AAnOw5hqjnstc0IBCxoDdRpkAk2AGuNdyM9+arO
	2D9NfO8owSwNOwkXsGDJzxbsgEkxUJvij1/8R6bOIAtjjYj2IRLJPXSbjP5osb3TrhzU=;
Received: from admin by amountary.cfd with local (Exim 4.90_1)
	(envelope-from <support@amountary.cfd>)
	id 1uUArt-000DET-Vm
	for linux-media@vger.kernel.org; Wed, 25 Jun 2025 04:07:49 +0700
To: linux-media@vger.kernel.org
Subject: For sale
Date: Tue, 24 Jun 2025 21:07:49 +0000
From: Exceptional One PC <support@amountary.cfd>
Reply-To: info@exceptionalonepc.com
Message-ID: <8a58503f7b7324687f943f52316ed229@amountary.cfd>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

 These are available for sale. If you’re interested in purchasing these, please email me

005052112 _ 7.68TB HDD -$200 PER w/ caddies refurbished
Quantity 76, price $100

 960GB SSD SATA 600 pcs/18 USD

S/N MTFDDAK960TDS-1AW1ZABDB

Brand New C9200L-48T-4X-E  $1,200 EAC

Brand New ST8000NM017B  $70 EA

Brand New ST20000NM007D
QTY 86  $100 EACH

Brand New ST4000NM000A   $30 EA

Brand New WD80EFPX   $60 EA

 Brand New WD101PURZ    $70 EA

Intel Xeon Gold 5418Y Processors

QTY $70 each

CPU  4416    200pcs/$500

CPU  5418Y    222pcs/$700

8TB 7.2K RPM SATA
6Gbps 512   2500pcs/$70


960GB SSD SATA   600pcs/$30
serial number MTFDDAK960TDS-1AW1ZABDB


SK Hynix 48GB 2RX8 PC5 56008 REO_1010-XT
PH HMCGY8MG8RB227N AA
QTY 239 $50 EACH


SAMSUNG 64GB 4DRX4 PC4-2666V-LD2-12-MAO
M386A8K40BM2-CTD60 S
QTY 320 $42 each


Ipad pro 129 2021 MI 5th Gen 256 WiFi   Cellular
quantity 24 $200 EACH


Ipad pro 12.9 2022 m2 6th Gen 128 WiFi   Cellular
quantity - 44 $250 EAC

 

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

 

 Brand New ASUS TUF Gaming GeForce RTX 4090 OC
 24GB GDDR6X Graphics Card
 QTY87 $1000 each
 
brand new and original
Brand New ST8000NM017B  $70 EA
Brand New ST20000NM007D   $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA


 

Refurbished Apple iPhone 14 Pro Max - 256 GB
quantity-10 $35O EACH

Refurbished Apple iPhone 13 Pro Max has
quantity-22 $300 EACH


Apple MacBook Pro 14-inch with M3 Pro chip, 512GB SSD (Space Black)[2023
QTY50
USD 280


Apple MacBook Air 15" (2023) MQKR3LL/A M2 8GB 256GB
QTY25
USD 300 EACH


HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 237 USD 100 each




Charles Lawson
Exceptional One PC
3645 Central Ave, Riverside
CA 92506, United States
www.exceptionalonepc.com
info@exceptionalonepc.com
Office: (951)-556-3104


