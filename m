Return-Path: <linux-media+bounces-28097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2AA5E43C
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42BC3B3B5E
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADAE24DFE4;
	Wed, 12 Mar 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WE2c7OHE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jyloEB+x"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A12D600
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807077; cv=none; b=Bq7dcMW3WqffrB7tC8FK86cqNQYvpPM5Xhee5FF1Xx3iUcC1Z/e3RAyoRE+yqZjcFDrEEVj1v3+ZJZcFTSRp7SkkEOG5mBV8NFXg4MSyUAJWFg15XJ5FnWU4PnTc4Eo1jRzJJmGyOKrJx0ZTACiPc0uG5RAsjlMiu4UhHGf4Z04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807077; c=relaxed/simple;
	bh=Ixmh6n3uFiCc76SyvULm+7b9w7VCjZ2M0XqJjdVZcaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rVdcPFKrQojEbRs34bgomR51XpndAZ5MNNUiSgqpDjeYLt5asF62joluufoKNSbX5D5J9HLfbAJ6IchKK2QeaqcS1Uj11xsdXU7a/Ri63mJ4pruhjtGpiERr6Weblk5eoHil0RpzlhgAIs9fIQjpH4gm/qs8qr9hNiXZoFCTof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WE2c7OHE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jyloEB+x; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 036B11140165;
	Wed, 12 Mar 2025 15:17:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 12 Mar 2025 15:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1741807072; x=1741893472; bh=3j
	+/b7a0AOW/X4+GnLoEAfzihNbadWYNueirL1cPN+k=; b=WE2c7OHEyBWg5BwZ7z
	BTqYlIYPY/CflrNXkPHIGkFiEnTBczPHO4FxFeCicwjb486/+UUVJsQ01ZAA8iYk
	HXcGQ+GYs24uj4gUbaTrm/VeCHKoDKhSV1nD9TR5DfAzD4q5ZRvwqUgMBTm60K13
	LGYjrj31cv87ZkJH6UH8KYFYM3I+xrF9ecLg92Uog6Qaas0SLJ1oabaMp/vYt40F
	ATC13SngsrNmKv96zDzb7XA3i2fTdkJ1TR77wO1AdSuN/w4n1a8c8dHQqp50fJRr
	1aJk75tchU2Ua4eCw+4q4ZA7G+AdjMHWlotF6LNJvT9aRoTX5iDIvVIjaaWpcJEB
	T/Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1741807072; x=1741893472; bh=3j+/b7a0AOW/X4+GnLoEAfzihNba
	dWYNueirL1cPN+k=; b=jyloEB+xX1SY3GKyJm8l+G1KkTWQuBjfKHK1jZjfc56f
	dlNSeS8o2zefrvA7EfeuokuXYmyBTZpbqQ4JQfc0d4Ak6SgIbgsjDmw/Gk6pSJBW
	9NYlvv/cnfkx5+glCcrftF3okTuEsK25e+OLTiwxBYx+d7BEWeRTsL3R6oCJV7Kg
	LUUAPq1vM0dgMNxV0gqFyWimAR4sVaKvIYwSA4W9bOMFu26HZzAKtKaIh4TNAIsQ
	l3PaV46FFK3D+rJd2Ht/0CGSwGQPYGAIDMvzhikQETEj7VyK5ug09Gxdb+iYOTNu
	MUBZ18du8akfFzr6LAH5P+8D5oZFU546nNYiIFJb0A==
X-ME-Sender: <xms:4N3RZ1d6phwkfCyzt-XDY1qA_uhjLCBQRIqfkRWrAklkL8NkTfCWTw>
    <xme:4N3RZzNd9kYUxnmTKceK-0yNzqO7kM8wgKO6296zetTpg-_YRHpOeB7hC7xk1SapX
    aPZeJ06z896VxYNTiE>
X-ME-Received: <xmr:4N3RZ-jYBaugbPFRgU7pyOillLF2upR2L1rX9MMQqE5cXuP3oYi8pllAJuKqRhk4XbKALvS7R1POxD6LYhff3PX-OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedttdfh
    geffveevgeekteegleegtdeltefhgfeuveffffeigefggfejfeehjeevkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:4N3RZ-82IX2fBUIhOfj2maVJexwOURIPHEbDvaRoEtHiaJNLLzVH1g>
    <xmx:4N3RZxviFkGSEf8vsYeSuaDe9tkryThY5vu7CzUCQNwqXo5WyU2geA>
    <xmx:4N3RZ9EjraHHII9He3VlbnzaTxWV61Vzd_IXUhWGX2NuHrwMbLxqxA>
    <xmx:4N3RZ4OXLxo1KL4u31yjOyPKaStPmxnzZGbvRCSuYUQbMeB3v3q9dg>
    <xmx:4N3RZ7JzHYfv2ARJyl_vU3ITGE4H8yEwSazLBZprqYugFsT1pssodwWa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Mar 2025 15:17:51 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [raw2rgbpnm 0/3] Add support for multi plane formats with strides
Date: Wed, 12 Mar 2025 20:17:07 +0100
Message-ID: <20250312191710.1823147-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

This series extends raw2rgbpnm to correctly handle NV16 (and friends) 
source frames where the image stride do not exactly match the source 
width. Without this fix the utility process the source frame into a 
output frame that is corrupted without printing any warnings. This could 
lead to someone (not me obviously...) spending time debugging issues 
around this and slowly go mad ;-)

The first two patches prepare for adding support for handling multi 
planer formats by removing odd features which would be hard to rework to 
support it. Once the cleanup is done the new feature is straight 
forward.

Patch 1/3 remove support for reading multiple frames from a single file.  
This feature might have been useful at some point. But in 2012 a type in 
refactoring lead to it being disabled and impossible to use. I recently 
fixed this as I noticed the typo in while exploring another area of the 
tool. I think we can assume if nobody noticed the feature was gone for 
13+ years there are few users of it?

Patch 2/3 removes support from guessing from a small list of sizes if no 
size was given as a CLI argument. This too might have been useful at 
some point, but the list of resolutions to guess are not kept 
up-to-date. Few modern standard resolution are part of the list, while 
really odd ones are. Anyone remember the standard resolution 2592x1968 
commented as '5 MP + a bit extra' ? ;-) As guessing stuff is dangerous 
remove this feature. This feature could possibly be reworked to be kept 
around if there truly is a user of it.

I have done good tests of this centered around NV16 and rudamentary 
tests around NV12. Apart from the removed features I have not spotted 
any regressions and after this multi planer formats with stride > width 
works as expected.

Niklas Söderlund (3):
  Remove support for reading multiple frames from single file
  Remove guessing of source image size
  Add support for multi plane formats with stride

 raw2rgbpnm.c | 345 +++++++++++++++++++++++----------------------------
 1 file changed, 156 insertions(+), 189 deletions(-)

-- 
2.48.1


