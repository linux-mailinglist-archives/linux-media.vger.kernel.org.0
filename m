Return-Path: <linux-media+bounces-51918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH5RHZlKf2kNnQIAu9opvQ
	(envelope-from <linux-media+bounces-51918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 13:44:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F55EC5EB2
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 13:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ADF3300405A
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 12:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539D033BBC8;
	Sun,  1 Feb 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="HqeWWP++"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8303E1A254E;
	Sun,  1 Feb 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769949844; cv=none; b=VlCMiDTAYwGfuqzJf9uji0gv5xC1VXWUzoKrd22Cl2G5tyIjsGhhiTF0YGVHn2+wkujxgSywV4px8eL1GLPgg9o3LivPfOueadtGBPQZpnr7ALUOunOxJ3qeXpoux2YqyT+OtJ06rbWLeKcLpd/HTixBBPu02pPs//oHUR1oBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769949844; c=relaxed/simple;
	bh=WrO0ylJqbgI/DJRKwt76tPD+3Z6g+oduD8IVBAhPIx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ojjAoJbIXSRM4Z1aXz8MlybU0J4g+Q7NUJQaVcpQ9Ewu49Cpe5remgvTiFnSYyKZBO3nl3ntzGfApKbTTfMNPskPDnW8JZGDzMP3PIZV9KLUyxrt1FKZmcUbjFT3qNtQtNsbMYahOdnRVKhweFLWf6YZlCRvjSS2pF1gNMNw6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=HqeWWP++; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Received: from LAPTOP-N070L597.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32b1f4eb3;
	Sun, 1 Feb 2026 20:43:54 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	hverkuil@kernel.org,
	jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
Date: Sun,  1 Feb 2026 12:43:52 +0000
Message-Id: <20260201124352.2003313-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026020156-carry-progeny-168c@gregkh>
References: <2026020156-carry-progeny-168c@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c193b2b4f03a1kunm896b8e731b916c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSkgdVhhMS0lPQx4eGksZT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HqeWWP++LJxvp4/MIy4C/HWi/tFjXQPlrBlqvie18G4KHIojxxlYSt6BEqPG1/qgfzW/s+8Tl9/78AxwAxFp+hJzMFyBFzNHmBM6rncChdg3U+C+YVA7t/1lmpKYe2zug35rOjovPXSGfmg+pysUv3XEGrAaIeLxA+1qdhAnf5A=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=z+Ksi1oqV5CFNRyDJ2AS3ue2A9LqgtMK61xYAi12Vt4=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51918-lists,linux-media=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zilin@seu.edu.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F55EC5EB2
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 09:10:12AM +0100, Greg KH wrote:
> On Sun, Feb 01, 2026 at 07:21:07AM +0000, Zilin Guan wrote:
> > atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> > raw_black_frame, which must be released via ia_css_frame_free().
> > However, if sh_css_set_black_frame() fails, the function returns
> > immediately without performing this cleanup, leading to a memory leak.
> > 
> > Fix this by assigning the error code to ret and allowing the code to
> > fall through to the ia_css_frame_free() call.
> > 
> > Compile tested only. Issue found using a prototype static analysis tool
> > and code review.
> 
> Please properly document this as per the rules we have for using tools
> like this.
> 
> thanks,
> 
> greg k-h

My apologies for the overly brief description regarding the tool and 
testing. I will follow the rules and provide a V2 patch with a properly 
documented commit message.

Best regards,
Zilin Guan

