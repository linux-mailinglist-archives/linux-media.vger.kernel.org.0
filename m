Return-Path: <linux-media+bounces-45368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCDC006FC
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 12:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B1494FF339
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EEB30AD1E;
	Thu, 23 Oct 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="not an e-mail key" (0-bit key) header.d=floofy.city header.i=@floofy.city header.b="T5fytIfW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.automatia.nl (mail.automatia.nl [178.251.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9E33019DA
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214795; cv=none; b=pWlez0OHOW+RRhZa74lKpM7MIpz4Gt2lhLh+p1Bom5PxEGsB4IUpNrhbI2c2WPg1kV1rWMfL7xOMlI1KikuEV7oY/RoYgl22Tcd+UaEhRVpIS8Z0t+U/CiJXLkEYWAmyShHI90xR4bJuFRMFzKZBHonsN41h5zO5Z5AdS6VQ5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214795; c=relaxed/simple;
	bh=rYpq5CIoRppf3gr2KfBKmmIzaLdYUA2ZqOUf+mTRYBk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=u1YPe/5SXb210S+cpMREmNvGqN/6KDSWtgsYEMVZUwz8Br1LgRAhCW0ZHau8cMMT9oeR8PjYz8G1CJp7TpauHOO5qRuHOC8NdvdBM+ps2+wT0jHBqmX06s3uvHWXfJFUA+F6+SS0qV5KbXraJ/UE+H8N/R6bUWCqCNEKJ8WFfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=floofy.city; spf=pass smtp.mailfrom=floofy.city; dkim=fail (0-bit key) header.d=floofy.city header.i=@floofy.city header.b=T5fytIfW reason="not an e-mail key"; arc=none smtp.client-ip=178.251.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=floofy.city
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=floofy.city
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAD0D9FADF;
	Thu, 23 Oct 2025 12:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=floofy.city; s=mail;
	t=1761214349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=jvPXd8Rs5eSyGX46xz+Bd3GAjD38htcqi1A7wPNfbzc=;
	b=T5fytIfWahIDpZPO2UzP88aJaMquLEyy7xXFjrcwjYXWAb28vDuQ6214ymqI0D1yxZLZie
	YvsBbm5crBlvzSjRYHXBW7xKM89CuSgPL/OiNGQXK/KBLyaTTOOSUcCf5vZcK/cdEUdx6/
	ag5JQNgIniTo8c+Oj2hW4nb7u7ZakOagpSI/Dd0usMbebaq7MN9WKKDOlHYjkXwRfvLJaa
	xrJb6IHIHG+0v53Bz6InpR7WDICbInn2X8ZoxhaNC6LaxRg1nqdT23xG1+xf3c66BTyF3F
	OsYNjVG+EcW166L037rj04EL19Z0Jhc4tP+1yJBPPThhHrgh6HQSx3gCoJRdfw==
Message-ID: <dd1c8e46-5616-4395-baac-56fdc4a67be2@floofy.city>
Date: Thu, 23 Oct 2025 12:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
From: Lili Orosz <lily@floofy.city>
Subject: PROBLEM: regression in commit 0e2ee70291e64 breaks non-spec-compliant
 webcams
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello,

The change in commit 0e2ee70291e64 reintroduces an issue that was 
reverted once before. It prevents webcams that do not follow the spec 
and have non-unique unit IDs from being usable. This issue is present 
both in 6.12.54 (LTS) as well as mainline.

The camera I tested with and can confirm is affected: LSK Meeting Eye 
for Business & Home. It's very likely that this is not the only 
non-compliant webcam out there.

If I build the kernel with that commit reverted, my webcam begins to 
function as intended again.

Kind regards,
Lily


