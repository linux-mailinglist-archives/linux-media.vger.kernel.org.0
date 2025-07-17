Return-Path: <linux-media+bounces-37923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724BB0823D
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 03:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 546944A3EEC
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 01:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6358A1DB127;
	Thu, 17 Jul 2025 01:26:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C281D130E;
	Thu, 17 Jul 2025 01:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752715577; cv=none; b=VTGzA4sAf5SmT2/oKkPV9K5Sw+RyzKTk8YpFsnMTdu0ZxMnkHyvds8NAuU8DDzTfZSk4D0pymUBGp63kQbayj0kU4FOvf/heLCv7S1BkApnMGzx/+9EmlYrNpXy7/+siM+wEHf5y/fpyfnoucTTqLj/Ya4wOenOQqLLC+CLyURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752715577; c=relaxed/simple;
	bh=gxAUpE8VBN7v0rV0nMnestBQ5EL+ueS4F4ZJIgcrVHA=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=B5SsRRQIsjwGU3YFbT2k6sID7BBt+I+yyrE/7nBNmcS0utxhQR+T9kXTG4J9BrH2G/O2va3s41WUnbgB2Kl1YifwH3y8lrgCAJ9Q0dYAiqdRPikbJdSNkNytuEA4drbrGMX2LRzRaZGOf8eeLVRc+TUQOK6T76/O1XXR5MXvLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bjFcX5h0Vz8Xs6x;
	Thu, 17 Jul 2025 09:26:04 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 56H1PoN0037389;
	Thu, 17 Jul 2025 09:25:50 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 17 Jul 2025 09:25:51 +0800 (CST)
Date: Thu, 17 Jul 2025 09:25:51 +0800 (CST)
X-Zmail-TransId: 2af96878511fffffffffe78-dc0f4
X-Mailer: Zmail v1.0
Message-ID: <20250717092551456yMDDlrv0yFKFOsnqotOlG@zte.com.cn>
In-Reply-To: <20250716095046-mutt-send-email-mst@kernel.org>
References: 20250705105803198ff11jYCkg1TxntcCEb00R@zte.com.cn,20250716095046-mutt-send-email-mst@kernel.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <mst@redhat.com>
Cc: <jasowang@redhat.com>, <krzk@kernel.org>, <xuanzhuo@linux.alibaba.com>,
        <eperezma@redhat.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <virtualization@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <xu.xin16@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2Ml0gdmlydGlvOiBVcGRhdGUga2VybmVsZG9jIGluIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19kbWFfYnVmLmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 56H1PoN0037389
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: jiang.peng9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 17 Jul 2025 09:26:04 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6878512C.000/4bjFcX5h0Vz8Xs6x

> The extra documentation unfortunately just mechanically repeats what the
> code does. Code comments should explain the reasoning behind the code,
> instead.

Thanks for the helpful feedback - I appreciate you taking the time to review this.

In v3 I'll:

1.Remove the parentheses from function names to match virtio conventions;

2.Simplify all descriptions to focus on purpose rather than repeating code mechanics;

3.Consolidate return value documentation to essential information only.

The revised patch will maintain W=1 warning fixes while aligning with the kernel's documentation philosophy. I'll send the update shortly.

Best regards,
Peng Jiang

