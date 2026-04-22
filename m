Return-Path: <linux-media+bounces-59347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBi/Jzch6Wn2UgIAu9opvQ
	(envelope-from <linux-media+bounces-59347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 21:27:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9744A22C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 21:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66CEF30A37BE
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 19:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85ED3F0ABF;
	Wed, 22 Apr 2026 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzGB6weG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AE3A4F47
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886017; cv=none; b=lt2QJUKfzIZShs3mDp6WO1tKdePXbge6HS4PjuoM1t7I6s1tLm0vUxmnpQ1+wYcMDHXBLswrhU/TG2UWNyVsw/H605ghlT6NO+98JYC1LEHh4und6oomfDGuS3NryHIYHslJiG9a+haPoMDQvP25qxmsvLf3oVJdKiEebDR8j04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886017; c=relaxed/simple;
	bh=3QNT4GtoWoe9YYPRDe0bNI8SgGn8/6YlXSrTUSXdqbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXojCO7zRTdw9bq8a8GT9p79Xp1+/BvkoPz/mhVd4B8LqMWy+onq02nI2DJ3E5cgTRkLPDOWMw0IzoIugkSEBouQsSofxn2bulRYgg8D2csQi257AL+tMfYxdbSXfU5yjlBgrn0AoptFjWAN5mv2qsAk+eXpgmhEX4QTLKR/XE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzGB6weG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so76337215e9.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776886011; x=1777490811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ut+C0Rvh/d3ODSq9Cnl+DGJx0SKKPy5AmVVcXQ524b4=;
        b=jzGB6weGPzF+wdDYMbabzG5dPAnURl7Cj+b4s+c2qk/4XMFUdoDmEYcDbbgrrQo5VX
         wCX4mqFbuy1xZFruGB15aEN3jtA99e0erPtcykwuy/iZY84gVXDvlJcKNtNTmmYFkZV1
         XlAEY5AzCz7P+wFG5yZ56Jf+33daA1G07ivJhfGhECUuVctmuoBVHqQ4vCXEnb36FUAV
         rrPK3sC8RfV8gWM+mHDv5/Y20QVDG1E8O3kQ66fO96Rg2ycdSeeabQXUdiPocZ66IMZR
         Zq7KXLI7ROE9OqQBTf2Uo2NM5KmQ5ROkrMpY5DStfPsES/7OY8NBkeJKJo+WRqguzzrY
         hjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886011; x=1777490811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut+C0Rvh/d3ODSq9Cnl+DGJx0SKKPy5AmVVcXQ524b4=;
        b=U3Z3UxztCHLWxhAq4d/dh4CPqTKRVDugdWTgH9IxRox2n/MYde/LzwGDSj7hEtlW7k
         ucYErzHAmV6WnNJWA100RBQW+cyCfd4ki8yJ+U45zqSUYgwBQD/CMqyD4dZWbULXSwYT
         EfiZK9CZQJpp/wGt0gOM9RZSalGoJ8rrCBHpT1F4Mn8MPYmUkhtAInV3dLVbbYawaieT
         yEOYB5yG025phR847/KdQwkFNB3+bCzyv3uTQUbpRAvZjZnfig927L/EO18fa1DC9PnH
         7LeR0W2+S9Jf8SQtPIWu4EGH+/7kaPvWPyeJgCfmxxzxmrF9wglKQ/AaLkn17OKwf2Ft
         vIgQ==
X-Gm-Message-State: AOJu0YxOX7xdGW5Nv6mI0+nWlsUGGGJeCa6TQc2wfA8hdx4yjOHyRblO
	rcolqFJHl4IKQryh7FovHZLwB8mYe+cFfWpxbhPnR9KMXt9X7bX+ygs3ktjhrss=
X-Gm-Gg: AeBDiev6KE9uLwQOGs6CcbOGmIkQHvPX2BG8zkkhX9NCUXprjEld9yCIcRWZsOimUXu
	VfeSjWIODEiJD90VMyQYJGqnGt9+0utFoJvH31gq5IX696drl2OlBIjVcvpvMBrroYxbQ8sZq4S
	qrkWB0v44zQBF7MVm6YMP5+HpD7ICFoRLXFBAoXL7CNpuyZ83xzEntBmYYVP7x+Ny76l9lct1+i
	42KY3dx9B/znplyE1JCWuCi/wL3/isl6fd2s9hr6EVeKrYyUjgRGOtiBwOP4KDRuv1Lg65oc/q8
	s1T6ZbuYLLTeIicq1Gq69u7EAVh4r9GLzeU3o5M7jB6zuYHOdGluM1mKYYaunBb4PJfH6YoXgw1
	f/RFhkl9KEIZCRnzh9ClELu6PGXhYWc3izCGQDM2VEtoPYlu8H+hZKbEmJSsbIO6Vk1sgfthmQK
	00L4eJ6kwtxZUgym0k4ghSfWIHjvfGQV7oU+qK+eGiGQyjqsi8YyNFtuGLUR22lfaBuP9f06xEE
	6iqV71FJcGCf/35w5/pIFCtDTzI0U0spAm0RVcWmTN3c/2uZijJsMskvyWmol3VphSBX6VWyw8=
X-Received: by 2002:a05:6000:22c5:b0:43b:3d4f:e17a with SMTP id ffacd0b85a97d-43fe3e13f82mr35925660f8f.37.1776886011389;
        Wed, 22 Apr 2026 12:26:51 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-17.broadband.mtnet.hr. [92.242.248.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm50429463f8f.7.2026.04.22.12.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:26:51 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH 0/1] media: dvb-usb-v2: ce6230: fix syzkaller bug
Date: Wed, 22 Apr 2026 21:26:43 +0200
Message-ID: <20260422192644.21814-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,iki.fi,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-59347-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jakovnovak30@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18A9744A22C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch fixes a syzkaller bug which was reported in the usb core
after sending a urb_control_msg. The main problem that caused this was
the ce6230_ctrl_msg function trying to send a read control message of
size 0, which then caused the system to panic after. The solution was to
add a check in this function to check if the message has a greater than
zero size before sending it, otherwise we log the error and return.

Jakov Novak (1):
  media: dvb-usb-v2: ce6230: fix bug when sending usb_control_msg of
    size 0

 drivers/media/usb/dvb-usb-v2/ce6230.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.53.0


