Return-Path: <linux-media+bounces-15011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C78930EB8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21781F212CD
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E637918411A;
	Mon, 15 Jul 2024 07:25:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AC18410C
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028338; cv=none; b=nBsgIbq8MnjKOWwoyC9+BEvoBeTktxYvXym7vZJeRtIdPRr8r/raMZkVuPsx171G4q7G487r7pbtlnKQJptj8CtfVzXUz7w8CcHV9jofXaFbr5NivJdUjEyRPt0IzZX/MjUc84irBcvK9f+HoXOxJbnV0gbg2vtSriaW1tfn8cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028338; c=relaxed/simple;
	bh=57ysYXTq6Nxenkax/GkKep9ZNl7QOkzlVgt+szAYrFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IxQOFHNLqtDwiW2W4MU0HRItoe/GvAD96eQ7B1hclFYT8mB7aj4a8IrBBh0tuUpTSUxCsP5pslWQcuzM5ICtX6XgGcNY85RNEksaX0V8hwy7lV/B3AeHw+MxTVBQvcCySzGkbTC/h6xY7/x8NSr7Ta09kblYxYcJRd4e59ARgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG5Y-0000ek-2U;
	Mon, 15 Jul 2024 07:25:36 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sTG5X-000aJ0-2O;
	Mon, 15 Jul 2024 07:25:36 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.11] uvcvideo fixes and improvements (#102519)
Date: Mon, 15 Jul 2024 07:25:35 +0000
Message-Id: <20240715072535.139499-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617184749.GB23867@pendragon.ideasonboard.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20240617184749.GB23867@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/376452/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20240617184749.GB23867@pendragon.ideasonboard.com

gpg: Signature made Mon 17 Jun 2024 06:22:35 PM UTC
gpg:                using EDDSA key C09EF871B3827B413F971CA9CC3F2D800327DE64
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Good signature from "Laurent Pinchart <laurent.pinchart@ideasonboard.com>" [full]
gpg: laurent.pinchart@ideasonboard.com: Verified 1 signatures in the past
     2 seconds.  Encrypted 0 messages.


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-uvcvideo-Support-timestamp-lists-of-any-size.patch doesn't apply:
Applying patch patches/0001-media-uvcvideo-Support-timestamp-lists-of-any-size.patch
patching file drivers/media/usb/uvc/uvc_video.c
Hunk #1 FAILED at 732.
1 out of 1 hunk FAILED -- rejects in file drivers/media/usb/uvc/uvc_video.c
Patch patches/0001-media-uvcvideo-Support-timestamp-lists-of-any-size.patch does not apply (enforce with -f)


