Return-Path: <linux-media+bounces-27208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2EA49613
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30DDF188BAB3
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 09:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A3025BACB;
	Fri, 28 Feb 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="Udi6vq9T"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3525BAAA
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740736568; cv=none; b=jfGBtHY32kBQsXZWZRMbTM5HnQIJcj35tNJinPyBbYNfm5EBPLfjG2OjnLa/7z//1hTqfrt8wG6Lg1ZvJzLp8EBc3sGgecqE9mBk+usmbDH97ijPHj2FRasYz7t8f+eQ+pcMor9y1u28z37hzEe69A5i46QkuMJbHAzMZJiNPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740736568; c=relaxed/simple;
	bh=a/EESJAmfjBic3in5wKWeUSynE7rHP+eAJILCZl1ESw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ngMUWCNapiVvFLfCBYMv3O3xcpYJhw67DOdH0ZfF9IGIsGsHbNi1SKUXQEr5m5NKR4zCVYwl88otgP39/H224FFD39WtG3SWJQw/MGrZ8syu/UiO8r6xhKPjsbKFHljdPZmTJ9T7pnGkjsaswqsBkr3nKo3S5o4iU4Rg8SyFqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=Udi6vq9T; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a/EESJAmfjBic3in5wKWeUSynE7rHP+eAJILCZl1ESw=; b=Udi6vq9TBMcEJaePtpAW+VVuwg
	oTrKRAQuo9xgcfTsNVeCUidEO/FD8c3qP5OxMvLB57sJefAMR3AUzkmgkAjt+kV4GYMp4uixq2VPn
	2QdfVVjAjl5xa5rh4TKUgdMfQnty5d0uYltJPczkQVlatP4ms7aEhSmpNnQuHh7qKw4TI9dMyX0pr
	5dqnmMJXCZ6dqr9mGkV8mKk4Yka4LxFF3f3pA2/WQPHatAWvXcEv5UGLwvvEYyLtGQpkiJup+mMuI
	MGRheK0f7WOqgs0zcAGtg/c0rofoALbD57PBibkPpzFS8EsDG+8Yi/2MqsC5Nify9xub5Orf+KZKb
	CFSVn3QA==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tnx6D-0001Lz-34;
	Fri, 28 Feb 2025 09:56:05 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tnx6D-0000qp-2x;
	Fri, 28 Feb 2025 09:56:05 +0000
Date: Fri, 28 Feb 2025 09:56:05 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <919478556.1.1740736565669@builder.linuxtv.org>
In-Reply-To: <1460048367.1.1740734303217@builder.linuxtv.org>
References: <1460048367.1.1740734303217@builder.linuxtv.org>
Subject: Jenkins build is back to normal : libcamera #1321
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: SUCCESS
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1321/display/redirect?page=changes>


