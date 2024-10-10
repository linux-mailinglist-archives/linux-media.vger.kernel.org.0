Return-Path: <linux-media+bounces-19334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A31997C86
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 07:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD6A1F219F2
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 05:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A6519DF52;
	Thu, 10 Oct 2024 05:40:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CAE3D66
	for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728538813; cv=none; b=sLRbBZRb7+NusJwlSzuvGtK96lAlqwAld5i58bmOh8uS499x0aYI+2AQNb2qALOrXiN+yDOWi2r2UvKn5ghd0T5A47ADKMgfQBQKmhaGiZxiWl0e1Fw2Q8cTGaHgLHOo/qIFYd29NVwjnwixdtMOJ4X215JN9+EKeueJmCF+i2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728538813; c=relaxed/simple;
	bh=+nv7cnR/aKtWaCmyDJjDx4AuSy/jZhAZXTA+Uz4KqEg=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=P1A4w4faqSxpVGoapvOH25GhFipxVT/oYpsAnhgf2yl3STyak+macTARgfcdVfcF3zhNQQk+U3F+9d/kAiDY2h71W/sEf7QIx1+jqYE/4ozeRUfZqVwuP56ABrYABAyFs1cQx+xUD3XNXZmuGjkUZZ0pg50PRotRapmOUUPOmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1syluA-0004h7-0H;
	Thu, 10 Oct 2024 05:40:07 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sylu4-00149t-2n;
	Thu, 10 Oct 2024 05:40:01 +0000
Date: Thu, 10 Oct 2024 05:40:00 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
Message-ID: <1451921207.2.1728538800866@builder.linuxtv.org>
Subject: [Jenkins] media.git drivers build #389: build failed for x86_64
 allyesconfig arm32 allmodconfig arm32 allyesconfig x86_64 allmodconfig
 x86_64 no PM arm64 allyesconfig arm64 allmodconfig clang15 allmodconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_674836210.1728538800830"
X-Jenkins-Job: media.git drivers build

------=_Part_1_674836210.1728538800830
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	FAIL: x86_64 allyesconfig
	FAIL: arm32 allmodconfig
	FAIL: arm32 allyesconfig
	FAIL: x86_64 allmodconfig
	FAIL: x86_64 no PM
	FAIL: arm64 allyesconfig
	FAIL: arm64 allmodconfig
	FAIL: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git%20drivers%20build/389/
Project: media.git drivers build
Date of build: Thu, 10 Oct 2024 05:39:20 GMT
Build duration: 39 sec and counting


CHANGE SET

  No changes
------=_Part_1_674836210.1728538800830--

