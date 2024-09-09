Return-Path: <linux-media+bounces-18035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC49723EA
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 22:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1B91F23768
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 20:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B769618A6B9;
	Mon,  9 Sep 2024 20:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PbSzeXv9"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A3320B
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914784; cv=none; b=R5qO2mLXoQVfKwp7fGul/miUZPUsVO3UzCmD8JQVWq0fUkf7Ieih3d+OsYn1R+6QKe/DVYzADvXrnhc8ToBK77Xisvkv/Ps4z/rXyG8RXojYlCIxOZdAi3CwxQEx5d7MRT8cxf3zeYgBq0SXA+lAeukF4SQKEdcpfQ6KW6+xhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914784; c=relaxed/simple;
	bh=Mzw8mXsfCkqtVnRkcJNCS0XTkGqo9Pm2fNi2in4F1NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cbS9+0ilV1s8JiBo3Iin88g/iQdP4TGb1tDg5jho1fyaRgoeDrqPGNzpgm5BjNo1v7XjjT3scOcVTXY7uoiWAv7tRkvyC1gI91Sp4ZMC+rqWJm7ajFCvbnAzWJZpV3cm27/pCmaOJefvf2I3wtJf+3vEV9SD+nlC4XNuW6mbT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PbSzeXv9; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/NXvwMO/eaYaUWYlxzW3tfe5HqtUMGVV8jPT5/Ub8Pc=; b=PbSzeXv9NsQrmmTMczFi05QVtw
	OWJg0b1YKSSejMQ3r/cBsJAlDYVVACI5kS+62xmCU1rzldZsrMJsWebnTkAiCsgOiGG+0AgME9TB3
	BO2/l9u3TWJ3tPkamrPfT23joQTeCVwUcgEr54KQJjyCWwGN9dWB8A8O0Yr+TSQ3rpnWTbHSMLOvv
	rWubea7B1WZiibSUvWAVSBFBKdMCD9/00GqtpNJ2iPHAhpAEi8rIL3oI+boyecx5ylV/11aOELOTo
	0Om156zNxcRGZydka9vqMawuz5hBT06zksffyQeOg1jNSEUyyfBGupmhaKkEx7FPEdCbp6v5sI8mE
	nOjoyxnQ==;
Received: from 179-125-79-204-dinamico.pombonet.net.br ([179.125.79.204] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1snlH7-00BkAA-4p; Mon, 09 Sep 2024 22:46:17 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH 0/2] uvcvideo: require spec compliance to avoid bugs
Date: Mon,  9 Sep 2024 17:46:03 -0300
Message-Id: <20240909204605.1870265-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some syzkaller reproducers have triggered cases where the devices would not
comply with the UVC specification and warnings would result.

These cases can be simply fixed by preventing the allocation of entities
with duplicate IDs or zero IDs.

Thadeu Lima de Souza Cascardo (2):
  media: uvcvideo: require entities to have a unique ID
  media: uvcvideo: require entities to have a non-zero ID

 drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.34.1


