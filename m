Return-Path: <linux-media+bounces-25114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9736BA18E44
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3251616A0
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAB520FAAC;
	Wed, 22 Jan 2025 09:27:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD81F7569
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538066; cv=none; b=Pz96ZTPXiwW0npdq6OwrtHP4a9DDFqmfMUrMqx7tlOL2RFlmoFw3JYULzN+NJnXRcIYMS9EtBCtDCFBVNQXBKGutTSl6IK5lnDjsvZ9SN68A/C1oJi9QCsI4YJb1NnBYEsObFlVy+KpptRjVEkHP82TY/A/dyNQ+pUjU+rhEqAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538066; c=relaxed/simple;
	bh=2sEkTVYHhf+hPd99TINTcNujAQVqYyrNLbJ965Cykc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSTBXD/IRk8CIvpvTafQkOcPMNH/hP5oXJ6+M1pRs/qpLabI7Zxod7N72NXocNdW4bah5ZO7OhKTm20IONhOKS4cXhbj3gpAXw/0nUnncNOy5hyntv6j0/dwIjGXgx3/URV//EzUI0rUSfvy4n3WUqbInbCKReeH2/s4lAeZSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id B562D233ED;
	Wed, 22 Jan 2025 12:27:38 +0300 (MSK)
Date: Wed, 22 Jan 2025 12:27:33 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Manu Abraham <abraham.manu@gmail.com>,
	Luca Olivetti <luca@ventoso.org>, linux-media@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] AF9005: fix typo in the bitmask size
Message-ID: <20250122092733.GD12162@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Found by ALT Linux Team (altlinux.org) and Linux Verification Center
(linuxtesting.org)

Fixes: af4e067e1dcf ("V4L/DVB (5625): Add support for the AF9005 demodulator from Afatech")

Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

diff --git a/drivers/media/usb/dvb-usb/af9005-fe.c b/drivers/media/usb/dvb-usb/af9005-fe.c
index 404e56b32145f1e6..4621c1d24d578ede 100644
--- a/drivers/media/usb/dvb-usb/af9005-fe.c
+++ b/drivers/media/usb/dvb-usb/af9005-fe.c
@@ -453,7 +453,7 @@ static int af9005_fe_read_status(struct dvb_frontend *fe,
	ret = af9005_read_register_bits(state->d,
					xd_r_mp2if_sync_byte_locked,
					mp2if_sync_byte_locked_pos,
-					mp2if_sync_byte_locked_pos, &temp);
+					mp2if_sync_byte_locked_len, &temp);
	if (ret)
		return ret;
	if (temp)

-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

