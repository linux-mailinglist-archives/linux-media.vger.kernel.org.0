Return-Path: <linux-media+bounces-19409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF410999F7D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2181F22076
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 08:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E75A20C471;
	Fri, 11 Oct 2024 08:58:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233819413B
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637094; cv=none; b=D3gm4DXyAxR0jKqvwTVjVRp8G1pFy6voNDxTETVxd39d9ISbsf2y8cWTBXxGnnF+QW8ZNMZb+toWZSoE3QS4l9n7mL8iz/jnpO6aJHLvZLssacd22YlZrxPVZQEsTY2S+Et+UlM6mraLIS8mrMtmdYcUGRK3Z7SxfcWpimpMH7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637094; c=relaxed/simple;
	bh=TQ6Y4FdEW99Apm0OWtVBNMVQzb+8MoNkdRFOsjQgulU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LqgUdLG7lC2Bw4/2P1JpR2KsFAfOl4P03MVsRpJtF8JTyxnOmINV6U9+sfy3Rlio3qb8FJNtB/W5UYnsEgKPJWiu7mI4MypWrNvEykoOGyClJlGaosihmTiDD3h9A4NO0YrCTh55MQ6YsNlpHJ7Spi959fncIGkw4jHsu6KwUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szBTO-00074O-1q;
	Fri, 11 Oct 2024 08:58:10 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
	by slave0 with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1szBTN-004OK5-2l;
	Fri, 11 Oct 2024 08:58:10 +0000
From: Jenkins <jenkins@linuxtv.org>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.13] media: various wait_prepare/finish fixes (#104580)
Date: Fri, 11 Oct 2024 08:58:09 +0000
Message-Id: <20241011085809.1046800-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <386df6b4-f213-4b7f-b9e7-94672c5287d4@xs4all.nl>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/386df6b4-f213-4b7f-b9e7-94672c5287d4@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/389543/
Build time: 00:13:03
Link: https://lore.kernel.org/linux-media/386df6b4-f213-4b7f-b9e7-94672c5287d4@xs4all.nl

gpg: Signature made Tue 08 Oct 2024 08:58:36 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [expired]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [expired]
gpg: hverkuil@xs4all.nl: Verified 5 signatures in the past 2 months.  Encrypted
     0 messages.
gpg: hverkuil-cisco@xs4all.nl: Verified 5 signatures in the past 2 months.
     Encrypted 0 messages.
gpg: Warning: you have yet to encrypt a message to this key!
gpg: Warning: if you think you've seen more signatures by this key and these
     user ids, then this key might be a forgery!  Carefully examine the email
     addresses for small variations.  If the key is suspect, then use
       gpg --tofu-policy bad 052CDE7BC215053B689F1BCABD2D614866143B4C
     to mark it as being bad.
gpg: Note: This key has expired!
Primary key fingerprint: 052C DE7B C215 053B 689F  1BCA BD2D 6148 6614 3B4C
     Subkey fingerprint: 52AD CAAE 8A4F 70B9 9ACD  8D72 6B42 5DF7 9B1C 1E76

Summary: no issues. All 11 looked fine.

