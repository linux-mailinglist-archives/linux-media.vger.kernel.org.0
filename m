Return-Path: <linux-media+bounces-41465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CFCB3EB69
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4875D484CC9
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3AFE2D5951;
	Mon,  1 Sep 2025 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="YXrUhYHR"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4152D593E;
	Mon,  1 Sep 2025 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741442; cv=none; b=IdFGgM+OlNaIQG4TAsw6vjdUM0ePUXB5xfJW7jQvy+aNpWJy52nfyW/FL7mJ/frgQSC/dECpO1EOQVhaLhPCKXys0gX0OqjrFCV2pA8XXk/UMeR4kJGPH15LBeqmSW0sq62Vq1871QT4eTuFFxhsarLjO6RgSR3EjMQV+DU+5kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741442; c=relaxed/simple;
	bh=LXIBSIO6pDV8V3QkWU7mtWXQrCEg3CtRlBkkoG63Jt0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JHpByGX4xe/A+IGNNLnkTqi6aBHWj7iHiOHIJ/9Oq8zq9edGQ5n6g4eX2C9RJEY5Kmoh3XbkJ1+pz6YvyczlwLlBkFKapkkwmu9fY5triEfPxkW++pjRzcg7EueAfe6ol2uL/xegpYaevc/E1bHJyPGnnTr0iM7h7Nbmo6xr8l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=YXrUhYHR; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FQJhfrqZwWX8BoGnnRMx78+JY5x+yi7uSulwN+BYSvg=; b=YXrUhYHRaQOpycNyZ4QcKwVhwz
	EPcVBdbtmUsdFPyu/8qCCcsd9A6bFkyVZERMOacLysQo6VbHG0AfjHezVzUbb5PXqRMGcDg4qB0JO
	ZBmSvEkxWnChbsQ6abe9m51Bz89akqaLPZwll5Q8rEueFWtDbhqV+uz1En+Y92tK9KnI=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61156 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1ut6E2-009YyN-Ca; Mon, 01 Sep 2025 17:13:42 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/3] media: allegro: fixes and improvements
Date: Mon, 01 Sep 2025 17:13:35 +0200
Message-Id: <20250901-allegro-dvt-fixes-v1-0-4e4d493836ef@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+4tWgC/x3LQQqAIBBA0avErBswpcKuEi0kRxsQC40IxLsnL
 R+fXyBTYsqwdAUSPZz5jA1D38F+mOgJ2TaDFHIUWgxoQiCfTrTPjY5fyqiVdHLXs5gUQfuuRH9
 o27rV+gE5x2K9YwAAAA==
X-Change-ID: 20250901-allegro-dvt-fixes-932f2c97063e
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Several fixes and improvements for the Allegro DVT video IP encoder.
These relate to race conditions that occur when multiple streams are used
simultaneously.
The problems could be reproduced on a ZCU-104 eval board with VCU firmware
version 2019.2 on various kernel versions (6.4, 6.12 and 6.16).
It is highly likely that these problems can also occur with other firmware
versions.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (3):
      media: allegro: print warning if channel creation timeout occurs
      media: allegro: process all pending status mbox messages
      media: allegro: fix race conditions in channel handling

 drivers/media/platform/allegro-dvt/allegro-core.c | 114 +++++++++++++++++-----
 1 file changed, 91 insertions(+), 23 deletions(-)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250901-allegro-dvt-fixes-932f2c97063e

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


