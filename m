Return-Path: <linux-media+bounces-17862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF796FFF3
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 06:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75827B2369C
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 04:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6263AC36;
	Sat,  7 Sep 2024 04:17:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF14437F
	for <linux-media@vger.kernel.org>; Sat,  7 Sep 2024 04:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725682635; cv=none; b=UwvZvo6Jrf0g2tn9farzQWazxloT3VsxTxzLDMsbSNWNkEHjxPOa4CDh6b+rnE/IuQGVfb7Pr60kPIt6F0FI+6t499wwQdb49jXrAiepw8nC/FBKrhfFZ7n+eJKwytH02teUQoxFVqwuOL2cfr9eSR1WONRsXKGtYW5nX6F/1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725682635; c=relaxed/simple;
	bh=UP//niK0G23L/kn0dzIVoPxgUmPix8KRkQb17VPmiZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o3Phz4wznnAHrVZUXc+8PVjamv5KC+D0qXxw8BzC0ZiyYp8erff/Y+u7lv8kd2Ky8yNvDbXDsP56AaLyH6uJuaErO2sT4xwmke+iFLKcwZgCtVRvtstuuk5jQKcyQlRD4ARkCZb6xhEYK6RI09lAQpV2j470HAiJqSyz98Yctvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1smmsq-0005qt-1b;
	Sat, 07 Sep 2024 04:17:12 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1smmso-001JWm-2l;
	Sat, 07 Sep 2024 04:17:11 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.12-1 (#103933)
Date: Sat,  7 Sep 2024 04:17:09 +0000
Message-Id: <20240907041709.313383-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <44e7e455-754b-4b2e-9b06-11562e3ad3ec@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/44e7e455-754b-4b2e-9b06-11562e3ad3ec@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/384357/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/44e7e455-754b-4b2e-9b06-11562e3ad3ec@redhat.com

gpg: Signature made Tue 03 Sep 2024 11:37:50 AM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hans@hansg.org>" [expired]
gpg:                 aka "Hans de Goede <hdegoede@redhat.com>" [expired]
gpg: hdegoede@redhat.com: Verified 1 signatures in the past 1 second.  Encrypted
     0 messages.
gpg: Warning: we've only seen one message signed using this key and user id!
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and user
     id, then this key might be a forgery!  Carefully examine the email address
     for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad A1EA0673EAD8B74F17D2B9E17C31E21A98D21E0D
     to mark it as being bad.
gpg: Note: This key has expired!
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-atomisp-Fix-spelling-mistake-in-csi_rx_public..patch doesn't apply:
Applying patch patches/0001-media-atomisp-Fix-spelling-mistake-in-csi_rx_public..patch
patching file drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
Hunk #1 FAILED at 94.
Hunk #2 FAILED at 119.
2 out of 2 hunks FAILED -- rejects in file drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
Patch patches/0001-media-atomisp-Fix-spelling-mistake-in-csi_rx_public..patch can be reverse-applied


