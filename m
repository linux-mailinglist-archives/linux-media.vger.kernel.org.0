Return-Path: <linux-media+bounces-23757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD039F7268
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 03:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5108189621B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9224078F4A;
	Thu, 19 Dec 2024 01:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="CanK3NFm"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210378F44
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 01:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734573482; cv=none; b=E6rkBI4WdeTnGQKd9P4jHsz8PPjTVVILQgFJ2vQ+bpkFeHPoOT+7a+iIGixM58UKWWX55BvcEEjxqUEOZRIWfsLevfxmlQeC2leO4UCUddmq/W6YuvqcEisp/i/XUFgEMhl+iAztljlTddJEWgH9zBb27baITMXzGGRPhOjaLr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734573482; c=relaxed/simple;
	bh=59YVI4m+Si78j/aEpxBthNiRZn7AaC+8WhGUCyuUGDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iloinBSm7ijGcgU/7vpnbKWjbzWnaS6+shls0N4xcko9/X5a3SvylRlc9ikLzf9DVydb9Oe88kHV984PqImaz+NbI5mip7l0CBe0Alm3yZJ1TqJOgXZ9UYsrd6j+krpc/SMAx8pOQP1zcE7rdZBAw29LAMb5s0cjrLlYYSLE20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=CanK3NFm; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BkQam7jTFoYwIGQDXcJKNz9oKFXW4Co7cD2gwOCh1HY=; b=CanK3NFmdurtHCjq3Hr1JOgTap
	fYhrqWFLPY8n3JpYsSO92CZJU1ft1wyO7ieJnm2776QJfnZPjFHKqYQBERnGeFffBNQCfK3XnA/S1
	b7p9mfFXUVC8aU9rDvlVXbQFezLsEq14xqEvTONouwstG+7V4JnsopSzrfY4ZO/L5gvDensrLVJhq
	qNQXsKU+jt9GRmwZLFhW+gwH3X/CEAtzRT5hM0PMku7E4xlJ0JXF/OEo4uotZGUOvhmc7n6FjRoFC
	mhzeDUOpDP2C2/q2zETzy/IVIBil0jH5BK7AGQE04nfKkkvFDT818E2Pm+clG+hPqycAe//3s1bs7
	WLbGqGXQ==;
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tO5nb-0000br-0J;
	Thu, 19 Dec 2024 01:58:00 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1tO5nZ-008VY1-2D;
	Thu, 19 Dec 2024 01:57:57 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.14] uvcvideo changes (#106200)
Date: Thu, 19 Dec 2024 01:57:57 +0000
Message-Id: <20241219015757.2027884-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219014132.GN5518@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20241219014132.GN5518@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/409084/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20241219014132.GN5518@pendragon.ideasonboard.com

gpg: Signature made Thu 19 Dec 2024 01:37:58 AM UTC
gpg:                using EDDSA key 7804022A38B7D13F41738C3685F1965061424BE1
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 7 signatures in the past
     5 months.  Encrypted 0 messages.


Build aborted due to a fatal error:
FAILED: patch patch patches/0004-media-uvcvideo-Fix-deadlock-during-uvc_probe.patch doesn't apply:
Applying patch patches/0004-media-uvcvideo-Fix-deadlock-during-uvc_probe.patch
patching file drivers/media/usb/uvc/uvc_status.c
Hunk #1 FAILED at 295.
1 out of 1 hunk FAILED -- rejects in file drivers/media/usb/uvc/uvc_status.c
Patch patches/0004-media-uvcvideo-Fix-deadlock-during-uvc_probe.patch does not apply (enforce with -f)


