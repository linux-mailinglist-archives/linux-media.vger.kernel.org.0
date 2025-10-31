Return-Path: <linux-media+bounces-46110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFBC27195
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 23:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DD614E328A
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 22:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC76324B2B;
	Fri, 31 Oct 2025 22:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="AVa5M+1+"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A352EA48F
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761948423; cv=none; b=VxO/COKBGdcCqs7DpC2fdaLtLzcEMW7Y6sPzVhBvETY20Au2TaD+gskxLhAIysEq+rfLqYNxLS3Vz7Ap/3I5WzzA64wKLrrxV9uszfiJ5WwRVpud/OekWp1crXCs4mGwVDUw2Ku/XxjFkSygobz1v0R0+twA1w7pzWZpQ8HXnIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761948423; c=relaxed/simple;
	bh=oJXUoCwxkcxwGZL3cV17JPl/pQZVK7Sv1TDlUZZZ1Ws=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=by0LRIvlllltve1J36vKiQaA70U8T06gjP50dJKb0qf4Z3xqY2i8zYjU7bfVP/XEoeUHsChiM0xWLmLRDls4iBgSG1oUjYVJoEkYnzfmzMAW8vKe7sSUw1Y6hJrWkMkea7Fc4IFzkFPd3wHg4KKDHm/COJU6d3ZT5Vu70x8zbnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=AVa5M+1+; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QCkawIElEUNQBbtYh8iqY3v51LtzryI12E1hvaAm/ms=; b=AVa5M+1+vT3gN0l2llWxQl48co
	Z1nycv6YbJ3wz11QF1g3KTr+VuNlZAJj8FB4eDRdRiKCMg+xe/f6NejQBjDA3BfD+xn8bjCRg3ZVD
	AS6QSA/MUQG5ul7VvVlBij6S0BPrwe1ya7hZ4R81W1hgptayfn5tXV1Wgfdal64oUu14povp6Fex6
	5W2H1h6bJDGl0I8s5gPThuGbDIy+5yISB95BkW/JRKgdheAvqEkb+AACCtnihixTZMBuP+0NOQGRw
	2N27/y2zXhayHMQoUESGkw7PvauhI+JRDJ9l+BitTJqolBCpzfRYnqIpXpj0opgsw9veqpdwZ+SKL
	yQLG60hg==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vExGu-0005yN-2z;
	Fri, 31 Oct 2025 22:07:00 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vExGu-001MAk-2l;
	Fri, 31 Oct 2025 22:07:00 +0000
Date: Fri, 31 Oct 2025 22:07:00 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <1807094057.2.1761948420855@builder.linuxtv.org>
In-Reply-To: <2023706324.2.1761253726325@builder.linuxtv.org>
References: <2023706324.2.1761253726325@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #442: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_1581531433.1761948420619"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_1581531433.1761948420619
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	FAIL: x86_64 allyesconfig
	PASS: arm32 allyesconfig
	FAIL: x86_64 allmodconfig
	PASS: arm64 allyesconfig
	FAIL: x86_64 no PM
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/442/
Project: media.git_drivers_build
Date of build: Fri, 31 Oct 2025 22:05:10 GMT
Build duration: 1 min 49 sec and counting


CHANGE SET

  	 Revision  by hverkuil: (media: v4l2-ctrls: set AV1 sequence flags for testing)

	 change: edit drivers/media/v4l2-core/v4l2-ctrls-core.c
------=_Part_1_1581531433.1761948420619--

