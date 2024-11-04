Return-Path: <linux-media+bounces-20799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA59BB50D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7119281CF0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7E71B3F3D;
	Mon,  4 Nov 2024 12:50:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3406C79C8
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730724601; cv=none; b=p156b2CmPPE0RJPSb05WINGAeqPhdGYQdOtTvz3sow9zCDwjPcZ/TibakFvA8WktmHDZFB2lCDSjO+lUcLn8TBG8x4NcngYPtT8jn3YOQpOCzCA5ydiwJ330jbE0Un9VgRFa5OJCypkwQdtb5Z/tfwNOg/dVQEA4xLWEnsoIFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730724601; c=relaxed/simple;
	bh=czeqCJR+bsyKLiNR1MblVM5KEu3FztVIQBRSIKh10mw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mKZeUhEVEI3km8vc1veGvY2l9a7ZBL+qn3K6hWYjC36KYsL+LL38kbaaCPZAu9L6yc78Ni7JsjbFRs8RNJIvjNQOgYnWGkMrKX/OGFi+b6zg9FTKLCZYYgrwjJ1T3EOCuUXWdguBcgtRYmW9if2h0qsxewhOnmvrl4gol3dfHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t7wWr-0003b1-2O;
	Mon, 04 Nov 2024 12:49:57 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1t7wWq-002t4m-11;
	Mon, 04 Nov 2024 12:49:56 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.13-1 (#105106)
Date: Mon,  4 Nov 2024 12:49:54 +0000
Message-Id: <20241104124954.688359-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <51e5e1cf-8aff-44fc-b40c-a0074a770a69@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/51e5e1cf-8aff-44fc-b40c-a0074a770a69@redhat.com/
Build log: https://builder.linuxtv.org/job/patchwork/396408/
Build time: 00:30:29
Link: https://lore.kernel.org/linux-media/51e5e1cf-8aff-44fc-b40c-a0074a770a69@redhat.com

gpg: Signature made Mon 04 Nov 2024 12:08:36 PM UTC
gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
gpg:                issuer "hdegoede@redhat.com"
gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [marginal]
gpg:                 aka "Hans de Goede <hans@hansg.org>" [marginal]
gpg: hdegoede@redhat.com: Verified 2 signatures in the past 8 weeks.  Encrypted
     0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and user
     id, then this key might be a forgery!  Carefully examine the email address
     for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad A1EA0673EAD8B74F17D2B9E17C31E21A98D21E0D
     to mark it as being bad.
gpg: WARNING: This key is not certified with sufficiently trusted signatures!
gpg:          It is not certain that the signature belongs to the owner.
Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
     Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC

Summary: no issues. All 11 looked fine.

