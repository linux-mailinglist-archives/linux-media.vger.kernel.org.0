Return-Path: <linux-media+bounces-18324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D52097ACAA
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 10:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBEA9B238FC
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 08:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EAC15853D;
	Tue, 17 Sep 2024 08:12:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89AF148833
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726560770; cv=none; b=nZ4RzVR7FZS7KIHlgQ2wJlmJXoojcz5SRPtnmGeSfbltoCCLt68gdql9tmhwkI2GZutUF2isvU7Ct91WYX55XWMTQjk27NPSQbCSBrVTA885QfZeHsEASYdMcMUWUrsbm7J04AjEiCfmKzsESoHH/F4+to1wey5Opg7tNT9eAk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726560770; c=relaxed/simple;
	bh=aF4ULczo7GJ1peq213NchBZg/R58Sb0La7+6lYoOMDE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=M1jGpKj0v2Y1FCEtfdSakYvF2laANznCSN93sczHAT2FwX5GFHnO7GtvlA9cyDhdH7yeejfd6+7MSdCMzsK/JbL2BDV26SoTi2ZJLWdcsZC1vmqH1nUj7QJmotscZFVv6w2voY+iSydIi5s4+hq47hcUAQFjVYgYSFKTMJncYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space; spf=pass smtp.mailfrom=koyu.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=koyu.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koyu.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4X7DzX4MnHz9srj
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 10:12:40 +0200 (CEST)
Message-ID: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
Date: Tue, 17 Sep 2024 10:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Leonie Ain <me@koyu.space>
Subject: Add support for "Quanta Computer, Inc. ACER HD User Facing"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4X7DzX4MnHz9srj

Hi everyone,

the people in the company I work for are all using Ubuntu 24.04 on a 
specific model of Acer laptops. The only problem is that the webcam 
isn't working. A quick workaround on GitHub Gist 
<https://gist.github.com/FruitSnaxx5752/b6c82f8429e760049ad6f30e5d0dbea9> 
suggests that adding the Device and Vendor IDs to the UVC driver works 
just fine. Since I don't want to rely on that workaround and manually 
load in that patched kernel module all the time I'd like to share my 
Device and Vendor IDs with you so that support for that webcam can be 
added for everyone. They are 0408:4033.

Thanks for your help. If you have questions feel free to ask them, I 
have the device always with me so I can quickly debug any issues.

~Leonie


