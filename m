Return-Path: <linux-media+bounces-38708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C385EB17A20
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 01:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E19D3AF6FB
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 23:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C64428934A;
	Thu, 31 Jul 2025 23:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="fmgTF3VD"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2A528002B
	for <linux-media@vger.kernel.org>; Thu, 31 Jul 2025 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005149; cv=none; b=h7EqI1A8T2tFAD80pO98Tsn9o2wTwpgr/o6OnnkBnmTmD96t8bYovvh/iuyjjO84aikVGjPAndyFXAZ07kp2tASktEoPy5ivPGAV8pQzaNW+XuUqtMQoksuqu+osFzKpOURXEc385RZMt7OE5dAkNVAuITNvxkWGepG0vRoSNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005149; c=relaxed/simple;
	bh=rbErkBqqzeTAoFy17KdKVi2adWg+UZYqBf2yulVsK6s=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Oxlhaw8R0SdmOZeRTyeIi6UeHivILvhWitwyvyb231IbtbOGXSQl2znb0qmjQN5q8Ke+iJYrUO4kdePTsL9cMx0C+BA0n/Dijh63Gwd0bPyGkIfuDd8p9Zstm1WgrvhEgJv6vhaj9qwn6UyUmu8M4UYCiPRvuMOLPziNCCRGVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=fmgTF3VD; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rbErkBqqzeTAoFy17KdKVi2adWg+UZYqBf2yulVsK6s=; b=fmgTF3VD924oOuNl2gqspwz90l
	UQBQo9Kz8k3gRpd0bgP8Lcj9emppaLDPS+wJjaFAikD5WKivZUOkrerJAjh+soJN9hkTnS0gWstWJ
	x3LlhAWl0p7E3HzW5RHI6hXRO2C26BT6UarOSv3siAgm7kwIE5lun5z2LEfAf0XxCCsphWgflANE7
	V3gLX4HO5wWvrGByJMrwzWgGr4muXhyV4zbhSM1FcpRTcFFgOeZt4Srxjhl/W642dSgVxRt4LOCjA
	cC2TA+9NRTQXVQ7jlujXxj4CvM99I8w1ymARelgK3aALIPXlH0vMK8w0SI0l1O5RbCJD347tKSroF
	QiMiSwxQ==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uhcrc-0003xG-0j;
	Thu, 31 Jul 2025 23:39:08 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1uhcrc-0054rW-0f;
	Thu, 31 Jul 2025 23:39:08 +0000
Date: Thu, 31 Jul 2025 23:39:08 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Message-ID: <2113410990.4.1754005148106@builder.linuxtv.org>
In-Reply-To: <109994885.3.1754004784349@builder.linuxtv.org>
References: <109994885.3.1754004784349@builder.linuxtv.org>
Subject: Jenkins build is back to normal : libcamera #1451
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: SUCCESS
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/libcamera/1451/display/redirect>


