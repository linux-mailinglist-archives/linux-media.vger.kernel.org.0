Return-Path: <linux-media+bounces-11309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719C8C2223
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13C1CB22CE8
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCE37E0F3;
	Fri, 10 May 2024 10:30:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62464745C2
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337053; cv=none; b=MJ+rZudfclhluL9NckPbY0o/U78ZemZ5ssEZcCoacpcbdVzfn2A4P51Z3Q5S07ytdWhSOMPlpgfmEGZGCGKy2OaDow54nJ+4XHIDDb2UI7chTnkG570CxNkL3euU0lajgWwIcfxUY+gZ7HvqWxnzU4PHeHp1543a72cK2sVRxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337053; c=relaxed/simple;
	bh=Zxg/p3tMjMR3zN0A0HEfM8EkDCXfDIRGFstjtt2kCuQ=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=uJRnV2gEcfxZycYQsxW1SRL9DCZ0j8m2/p8s5PbbQ87PNmh90c8DvwrqMz/1ooitOCp47Iv3mzyt0cPm9TunnZv1fGLt4SniBy3sM5ksOKc8EMPf/fL2ErXWeoVpuNkEQlsm+9dy+NVX/9XEUA9WywRWwjjJMHeOBnpzLyp120A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5NWd-0001x2-2z;
	Fri, 10 May 2024 10:30:51 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1s5NWb-0080hc-22;
	Fri, 10 May 2024 10:30:50 +0000
Date: Fri, 10 May 2024 10:30:50 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1971762478.3.1715337050415@builder.linuxtv.org>
In-Reply-To: <606077562.2.1715336843353@builder.linuxtv.org>
References: <606077562.2.1715336843353@builder.linuxtv.org>
Subject: Jenkins build is back to normal : edid-decode #323
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: edid-decode
X-Jenkins-Result: SUCCESS
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/edid-decode/323/display/redirect>


