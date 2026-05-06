Return-Path: <linux-media+bounces-60575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGv2GmEc+2nSWgMAu9opvQ
	(envelope-from <linux-media+bounces-60575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:48:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C637C4D9797
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 12:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B38443037893
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 10:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E972410D24;
	Wed,  6 May 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gdiLGp9e"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD943EC2D1;
	Wed,  6 May 2026 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064396; cv=pass; b=EdQTNSM2QOzM+DZOptFxH0jJu2HSTCInmg+MP0Y0/BQwZOqEjQTc+/iug4axNB7IKCd2IF/k3Y2jB1imxQ1bDCgReyzxnj+URgL6/2KsU0r7vuEKxEBxNiioRKfQM7FEp9SnlvwoV9WYMw10oFlNBzqyCgNwjGd2XzLq9Dvx95c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064396; c=relaxed/simple;
	bh=IXS8AagFB5uEUzgfkUufkI8CieTT0tZ3O4YpKaIG7+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPPhImYu2keqI+qHL/W1UXbbVUhOG78Nkhf8XMaXt4aanLRQgE2+IfOItgWYwWbh4YwUCMgfQVegYnYg0dfssPygsnLWHgtx6+uxUhOoarRv8yjvW6wtv/P40zU36MpFWQ45YhNXHIwR2pbFjoNLmcXVi2X0gJXEMorEEHXb6rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=gdiLGp9e; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778064381; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dpvv8pdSOOd1BjbNj8a4iqQWdomPGUC4xTqFODGC2E7FGH8MRh7hSdQS5INXbg2+O1UTOOmmqLXVL0t8JG0p28bCMqcvspm8AEQaS5JDFFEaK/pNClkj3+0fWBMwGS2rCKUWN1sCN44hQKNzctjcL+UmAPw1Sf8IM4L7EZpG5aQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778064381; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Qn58wMHVc3ob5XjE31HftB0EDXlEBgCVeJ0UOumM8HU=; 
	b=n7QPLgsn2WeCRCkVXyrlhhLZhZp8mM/5z1PxsF/KEZEzytmQ89csPEdoLg1k8h1ISeY5m6k2+XEaMoSqGmwzYIaYVI1Pkk0UU+SHQ0Nvj820d6OtGU3GMJosVenAkbDD3PnCQszzyUYeWdIumGAk3a5fYaMIZocSvPOxSkaMqtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778064381;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Qn58wMHVc3ob5XjE31HftB0EDXlEBgCVeJ0UOumM8HU=;
	b=gdiLGp9eCzBgfAbWVMNpFc4oxolD/ywraicOuolhFGvm0QcC+HCV0HEFIoe+ls87
	/beKPkLAb+hhUBmeC0x+P98guSH/cyFhd4VW+NECVer32x2jwxr4KPMUO+UnHcS+myG
	pUs+Kc+yA2qZGVvIGHSD2UYnnsMnCKUuaE5TCWAo=
Received: by mx.zohomail.com with SMTPS id 1778064380452287.4553281654578;
	Wed, 6 May 2026 03:46:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 06 May 2026 12:45:57 +0200
Subject: [PATCH 2/4] MAINTAINERS: Add sysfs ABI docs to list of panthor
 files
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-explicit-reclaim-v1-2-44f82ac147ce@collabora.com>
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
In-Reply-To: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: C637C4D9797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60575-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.freedesktop.org:email,gitlab.freedesktop.org:url,collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

While the ABI documentation in Documentation/ABI/ does include a contact
person for each bit of ABI, this contact is not necessarily the same as
the maintainers for the driver it touches.

Add panthor-specific sysfs ABI as tracked files to MAINTAINERS for
panthor, to ensure that any changes to these files also go through the
panthor maintainers.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b897e9f4c73..f006ea21d99c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2205,6 +2205,7 @@ M:	Liviu Dudau <liviu.dudau@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/ABI/*/sysfs-driver-panthor-*
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 F:	drivers/gpu/drm/ci/xfails/panthor*
 F:	drivers/gpu/drm/panthor/

-- 
2.54.0


