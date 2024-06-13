Return-Path: <linux-media+bounces-13195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA11907466
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D0B1F22850
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 13:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36E1465AC;
	Thu, 13 Jun 2024 13:52:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2214658C
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286736; cv=none; b=MpzsFtz6ukSKMt8XmOz/Ga5QQ3s7xVhOJHZ/LrlTf582hUs4dZ9j+aXxGfDHvhwZz4SPPTxYkNwEZ0/QUz+06nb1N24Lf2Hh08QFPuOb1XA1peJSWdcueEfdYGrnLOEVxNaSsb94o0x7KuOYiCwLGIFjGINqG48kYbRjWTbjRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286736; c=relaxed/simple;
	bh=4NwCMh4GwRhzrJ8jRwJ0tG3MCqDNgmxeyylFDGbQcx0=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PRK6hme+qa6lUXXmIjxXTSyXapMBKcv31XCxEcchXQoBkTWMU0AtnWRpC8ycDGLYJQG6NJPnUQEc/Nnb3lrXajDGfWoeIT9XULLINTw8Veh89cjO3sunG9JsUt6sFn+gUAVcpEZnUNT+ZqmXIB63WykXiBabnguIiDpVG6XG3bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sHksA-0001B5-1O;
	Thu, 13 Jun 2024 13:52:14 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sHks9-00CvBp-1q;
	Thu, 13 Jun 2024 13:52:14 +0000
Date: Thu, 13 Jun 2024 13:52:13 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <1416197571.2.1718286734360@builder.linuxtv.org>
In-Reply-To: <2097259186.2.1718013945200@builder.linuxtv.org>
References: <2097259186.2.1718013945200@builder.linuxtv.org>
Subject: [Jenkins] stage-drivers-build #205: build failed for clang15
 allmodconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_1108939097.1718286734038"
X-Jenkins-Job: stage-drivers-build

------=_Part_1_1108939097.1718286734038
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	PASS: arm32 allyesconfig
	PASS: x86_64 allyesconfig
	PASS: arm64 allyesconfig
	PASS: x86_64 allmodconfig
	PASS: x86_64 no PM
	PASS: arm64 allmodconfig
	FAIL: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/stage-drivers-build/205/
Project: stage-drivers-build
Date of build: Thu, 13 Jun 2024 13:45:06 GMT
Build duration: 7 min 7 sec and counting


CHANGE SET

  	 Revision  by hverkuil: (dt-bindings: media: convert Mediatek consumer IR to the json-schema)

	 change: add Documentation/devicetree/bindings/media/mediatek,mt7622-cir.yaml

	 change: delete Documentation/devicetree/bindings/media/mtk-cir.txt
------=_Part_1_1108939097.1718286734038--

