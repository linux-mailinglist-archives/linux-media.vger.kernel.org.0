Return-Path: <linux-media+bounces-43003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21412B97EC4
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 02:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C5519C170C
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 00:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E99B1B4231;
	Wed, 24 Sep 2025 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="Ja5XM2et"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF761A0BF1
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 00:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674621; cv=pass; b=EOoNpnHTVLXy0ZcK/2ttXUZOsgWuFU5QI5FJRWaVg9f5VDZH+d3+tb84dhc1EgVZu9X6cyiTiCdf1avCdnR7yeCu1YVZzYsqx8FJHzXoZyfcYgraxN66cM8nlXguInVAQsuDGgQSktKAzEBsgi251D6Zkk72dImPSd1mrFmGvkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674621; c=relaxed/simple;
	bh=CC/nvFYJrZ88GZpDJxvHMdihd3ayGX9jtT3ZQKWqM8A=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=AFsHDHO/dw/+0Q/7AtJ73IUIIOmAwS5K1hXaxrdV84EiwBIPQRMX+4gPOGWxg+hU9RhXXq+eign0QusG2bDKiddkLrvIeq9ulNnPCvJOt+Zyp5eeu26hSCgubSLEAVpPjQOMesMaesqKP1Xl/bTe0GJDKEfmOJa+f8oOi5KdiHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=Ja5XM2et; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674619; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=uQaoDFRqbmFTWDXyxYuPSJVmGjykqbah/MH0gDd78dsgw/KJt9cTA15H16sJMAp+vMaEW8PBw6i8kKJ6YDKJhDhfA64FpApkjsrVU/Gv7JnmPZlPDSBggho0g9dgOFOf8OMqaCScctOQ/QMgrntcCJyGOYtRom4Al6HKIUt+gFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674619; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=CC/nvFYJrZ88GZpDJxvHMdihd3ayGX9jtT3ZQKWqM8A=; 
	b=FVN0Q5AoQlUrKVxzfrXU19znlY8B5p0vbPfYBLyAsQX1ou2O8VBIS1+3wMX/pwgijbtWtOSi1z4XOi+xhXgsMpGN74gDP/4nXIHx8Xy2oKc4lLTmn1xVPM+Oug2XETs/ZOygdg+CKT/oUnCHixhEMUY13NoQa6ME688qVBC7W3Q=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a857200-98d8-11f0-ace3-525400721611_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653004892.4986751480716;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=Ja5XM2etF3xjuiU1wOhP4HQBH+jnDhcZ64a/1Wy+kWf+OI2VgiV1uc2lImJR0lDizjZ6Tl/lXGih9MvI1hMQ14Dsco1yrliyIWy6Cg+C+hh3La7afw+KoowJPQiQLI8kZzsCnAcP9SDi0uQMxFjCb0fLVI8DSzmGtb2Qzfa5NOI=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=CC/nvFYJrZ88GZpDJxvHMdihd3ayGX9jtT3ZQKWqM8A=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-media@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a857200-98d8-11f0-ace3-525400721611.19978ffc520@zeptomail.com>
X-ZohoMailClient: External

To: linux-media@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

