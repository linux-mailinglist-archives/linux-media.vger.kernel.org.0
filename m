Return-Path: <linux-media+bounces-34738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D0AD88E9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3C4C16E6F8
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47E62D1925;
	Fri, 13 Jun 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synargyequipment.com header.i=@synargyequipment.com header.b="LxytFADc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.synargyequipment.com (mail.synargyequipment.com [198.46.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679D2C158B
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.46.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809422; cv=none; b=bXroqR8Wpo2ODF4FpAn4vq4ybs6AqeLM90aIPHN2s0PVoJdAilgfwsMvNAIOAQkq2MjYk3PYvEPeqhdhqhvkG6Z+oXw2QFRq+XXqNuXOePgInZEX2pEg1ZAVAElIg/ZxlspMZUKQ09bCbsrJtf9kc/lgE/iuXC9fDOkAJomfLHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809422; c=relaxed/simple;
	bh=YI8TL0CCqZKhaem0QzINWbtPNH/88dvLwEWyLZQ/Z1E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rfEjM4ylbvke38cyxc2gXAwxDsbaBKncz5fCTjFlVP5vYqZz43t20DTnkAqQHXc0Qau2MbLnqYwKxidV1t0sFL7uAbPbjHAmmd3Z9xFugUAhpqTCDmPGDyw5MuR2UY8rH5pFQE7dmsbK9aKlKs/3iNsXJ5iy2kk2kkzNBPNIHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synargyequipment.com; spf=pass smtp.mailfrom=synargyequipment.com; dkim=pass (2048-bit key) header.d=synargyequipment.com header.i=@synargyequipment.com header.b=LxytFADc; arc=none smtp.client-ip=198.46.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synargyequipment.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synargyequipment.com
Received: from error-no-valid-domain.com (unknown [185.20.187.34])
	by mail.synargyequipment.com (Postfix) with ESMTPA id 842BD6B6CE
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 11:07:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=synargyequipment.com;
	s=202503; t=1749809255;
	bh=YI8TL0CCqZKhaem0QzINWbtPNH/88dvLwEWyLZQ/Z1E=;
	h=Reply-To:From:To:Subject:Date:From;
	b=LxytFADcFW3KICW2sroAj/UKtAQFKmZ4Y0qrpnFvl+ADr6THi1BG3th/zQJguj29V
	 zjt1FJcq2UhU6vUjZw6doyrOLVJrY+V3cgrxhnrcZ7qDvtWSp4vTtE08Ml0iZYvFKa
	 n+STz5m4LwPIYLzq6ln0mvBY7cX3nUXrcN25PYuXj70RgsiKgtUJBbK7p/I6lh+RQJ
	 Dr3YNE3f92O+uoYZUVdDRuoYG7vh8lLThsGVGsSbKmGvjGAxaPFSJIqxMWivZCfM49
	 4lrrlwhHj1J5toGbrStnkpI8v3fRFjonpUMZ0uExvtyDuj7BNXNkWp5Ab6TjZ/7y+x
	 PdtfHHSUFyKZQ==
Reply-To: procurement@mhtimportlondon.co.uk
From: MHT Import <support@synargyequipment.com>
To: linux-media@vger.kernel.org
Subject: Procurement Inquiryy
Date: 13 Jun 2025 03:07:34 -0700
Message-ID: <20250613030734.C3F793E6834011D4@synargyequipment.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Good Morning,

I hope this email finds you well.

Could you please confirm if your company exports its products?

I=E2=80=99m following up on our previous message regarding our interest=20
in your product. Could you kindly confirm if you received it?=20


Additionally, we would appreciate it if you could share your=20
catalog or a link to your website for our review.

Looking forward to your response to my email=20
procurement@mhtimportlondon.co.uk.

Thank you in advance for your cooperation.


Tim Howard
MHT Export & Import Consultancy
284 Chase Road Blok A second
floor, Southgate N146HF,
London UK


Cell : 062=C2=A0167 4202


Email: procurement@mhtimportlondon.co.uk

