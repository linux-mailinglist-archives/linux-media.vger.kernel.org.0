Return-Path: <linux-media+bounces-5617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A462685F5EE
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 11:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24D61B23504
	for <lists+linux-media@lfdr.de>; Thu, 22 Feb 2024 10:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C4E3F9EA;
	Thu, 22 Feb 2024 10:43:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail114-241.sinamail.sina.com.cn (mail114-241.sinamail.sina.com.cn [218.30.114.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55329CEA
	for <linux-media@vger.kernel.org>; Thu, 22 Feb 2024 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.114.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708598626; cv=none; b=JGMZ+j9TERRSZdC5FRG2QRJyxFXxi19ipDISGhoaoJGha5EU7P5E9Dfblh2G/31lpQAO4gl5aynlHwjGHb20uqbPN7CF4CJ8/3YPx1vUc4Zt9QD3uLSBgGN+4uTGD6hFutR80bnTosjoCK6gut2wfnQ0SOXv6F7pqenFGArCym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708598626; c=relaxed/simple;
	bh=D8stRfjDFDtGq0BLxT2aUs3rCsJ4kenl1icgW9FiIUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tby4emaKujkBTh+BsWSSEocSiK6DtUv6iWcKYzTQOAxZ6EF9b14ZLCGOI8K5r2a903HoVofNvWTdf5c/O61y3F9Gv26ejWRAXT27iKdyJ2r7Qf8zknwC7KnGyKLhvuOhZ218tc7jkF+Lp9A2RIH4qos5Db2pjSp/S57t67UtaiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.114.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.71.174])
	by sina.com (172.16.235.24) with ESMTP
	id 65D72550000063E8; Thu, 22 Feb 2024 18:43:30 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 89341145089281
X-SMAIL-UIID: D5DE81AAF69E4F36B1D97EC3AF5DB199-20240222-184330-1
From: Hillf Danton <hdanton@sina.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Edward Adam Davis <eadavis@qq.com>,
	syzbot+116b65a23bc791ae49a6@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/cec/core: fix task hung in cec_claim_log_addrs
Date: Thu, 22 Feb 2024 18:43:20 +0800
Message-Id: <20240222104320.236-1-hdanton@sina.com>
In-Reply-To: <4fa62e4f-9768-4434-8f7b-24aa3b2a3490@xs4all.nl>
References: <0000000000006d96200611de3986@google.com> <tencent_941B48254CBA00BB4933069E391B6E4B5408@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 21 Feb 2024 15:38:47 +0100 Hans Verkuil <hverkuil-cisco@xs4all.nl>
> On 21/02/2024 15:20, Edward Adam Davis wrote:
> > After unlocking adap->lock in cec_claim_log_addrs(), cec_claim_log_addrs() may
> > re-enter, causing this issue to occur.
> 
> But if it is called again, then it should hit this at the start of the function:
> 
>         if (WARN_ON(adap->is_configuring || adap->is_configured))
>                 return;
> 
> I'm still not sure what causes the KASAN hung task since I cannot seem to reproduce
> it, and because it is hard for me to find enough time to dig into this.

Likely because of the window for initializing completion more than once [1].

[1] https://lore.kernel.org/lkml/00000000000054a54e0611f1bc01@google.com/

