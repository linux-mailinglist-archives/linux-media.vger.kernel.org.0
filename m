Return-Path: <linux-media+bounces-18502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755D98460E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C750B284376
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 12:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B6C1A724E;
	Tue, 24 Sep 2024 12:40:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C91E492
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727181638; cv=none; b=r6Z+YlVwfptWT50hzVvQ4PC062n7yCcpyakvnmPjvgg5qbRKh2F+tVP3c1cJ6W+PK4Uw1fOTFMuzec8BNsQ+KYUitZhrXc8lINzlfyKQgKDyMQG0HbfrY5XhzWPXFYF9IPYQq2wWGSPhXS6nVY6GSfPRP6KWOtAFwi1KGbmXqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727181638; c=relaxed/simple;
	bh=9V9bN4vYbKgNav710YNazA7mQl5tcXiQRbidmHLXR0o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=OkN2Ck8q6+QyRzLqcZRXafZB6wrkwyU1ZK9TWj15i8bz0jakYhZIzFpidUN6UTveUA4YxA39PGCCs5xPxsoJ/mAKv3OLgnqp9+UCviNup26Gcgn/XhdPrWoG30OphR4fu1Ftws8WAjJJ3NqtFyoLyL2MKChhH2lmWXtLtZaTNfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space; spf=pass smtp.mailfrom=koyu.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koyu.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XCfQz1bHGz9tc6;
	Tue, 24 Sep 2024 14:33:15 +0200 (CEST)
Message-ID: <6572c5cd-f898-4551-bec3-268a5283341d@koyu.space>
Date: Tue, 24 Sep 2024 14:33:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Add support for "Quanta Computer, Inc. ACER HD User Facing"
From: Leonie Ain <me@koyu.space>
To: Ricardo Ribalda <ribalda@chromium.org>
References: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
 <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
 <5878053a-27c5-4b06-8675-e1a0236c9430@koyu.space>
Content-Language: en-US
Cc: linux-media@vger.kernel.org
In-Reply-To: <5878053a-27c5-4b06-8675-e1a0236c9430@koyu.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4XCfQz1bHGz9tc6

Hi Ricardo,

I wanted to check in and see how the progress on that change is. Since I 
haven't heard back from you I assume you're already working on it.

Thanks for your help!
~Leonie


