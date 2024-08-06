Return-Path: <linux-media+bounces-15867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19E949AFC
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 00:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7351C213BA
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 22:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6B216DEB6;
	Tue,  6 Aug 2024 22:10:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from one.hybridchill.com (one.hybridchill.com [94.76.216.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA4214C59A
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 22:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.76.216.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722982256; cv=none; b=aXP48iRRfjTttrsC0+Kfs+q5ErOTHV4teQ4RmOv7xwYheQwAAYZKdbU6QvK9MD1tBoqzO9aMRJAjsdl3/C5YYeEgrn8BbOpRkFGMInRZbtCrUbzyy/EtjENKyzUrepUZUrH6mXGaJgfzN1d+1Gw/KJ99scEDDa8STpnzWqw+ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722982256; c=relaxed/simple;
	bh=yIIiwZcj0Hbn5Y7i1pI9xLCN5ZHuzbIOnYPWjdmnFw0=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cfojGRpIsOpu5e6U1wtlu8KfaE1woVL4z5kHOlzX4izXGBmo0Ev5kCq9hWjcQQttHs9qDmKeuGz0gERSF0UkTgHxGU836z0lz/7b4js8hZU9m8R0owuk/P0KvJdNDym0yJqQY0RAncXRvzkJbGgSKskntDH0a4QRMVazNQDtwv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sorcerersisle.com; spf=pass smtp.mailfrom=sorcerersisle.com; arc=none smtp.client-ip=94.76.216.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sorcerersisle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sorcerersisle.com
Received: from 92.40.175.87.threembb.co.uk ([92.40.175.87]:42016 helo=[192.168.43.112])
	by one.hybridchill.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <peter@sorcerersisle.com>)
	id 1sbR8x-0007xc-2N
	for linux-media@vger.kernel.org;
	Tue, 06 Aug 2024 21:50:54 +0100
Subject: Re: Status clarification for 0c45:6353 uvc slide scanners
From: Peter Boughton <peter@sorcerersisle.com>
To: linux-media@vger.kernel.org
References: <687d087b-ae4c-6242-2991-800876d74cc4@sorcerersisle.com>
Message-ID: <251db6be-c1e4-b861-c679-dd76759f1fd2@sorcerersisle.com>
Date: Tue, 6 Aug 2024 21:50:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <687d087b-ae4c-6242-2991-800876d74cc4@sorcerersisle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - one.hybridchill.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sorcerersisle.com
X-Get-Message-Sender-Via: one.hybridchill.com: authenticated_id: peter@sorcerersisle.com
X-Authenticated-Sender: one.hybridchill.com: peter@sorcerersisle.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Can anyone confirm whether this is a valid list for such queries?

The page at https://www.ideasonboard.org/uvc/ seems to suggests it is, 
but that same page is mentioning Linux 2.6 and has various broken links, 
so maybe it's out of date...?

If this list is solely for development-related messages, is there an 
alternative place to ask?

Thanks,

Peter

