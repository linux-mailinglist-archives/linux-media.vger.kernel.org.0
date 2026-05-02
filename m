Return-Path: <linux-media+bounces-60177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEN3CQjf9WljQAIAu9opvQ
	(envelope-from <linux-media+bounces-60177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 13:24:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952ED4B1C69
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 13:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40C413064675
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2026 11:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114FE3382E5;
	Sat,  2 May 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OJWgz/dx"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D33290AF;
	Sat,  2 May 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720848; cv=none; b=Y9beD4QLpMYObkXFwPW+FgtFdHZTAkuEZkWtXZoJlunM9bqZXiIoDs52AQjLab2AzZWrvInDUvTFSVOrVKukEs0BCwe9dAMzWfEzcV5i5H2e9ZYkZoxrZQYmfcyEpiPXsIRfwcjLH2DsoHhk5tjhkPhyOISm1iNNe1gfi2lQuxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720848; c=relaxed/simple;
	bh=kroM3dHiwX8iXnLTgoNK2Ui7tiIdu/xn7VeGYjqdHck=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=lE3tumE/L3VW1QD5P/nsqgzV7yuGtPph7M29HArPbEbBJe9a9LpTaA5AkGSvUJrDrsJ2yzMk8xAlGgbs29dPlDhZRfpnwjbSKWM+0t8N3YgD0cxC5aeTHRzOAold+5XZD6uykJs7NGsBuQEWwEvtur/HASyH2zA4OTpUwMdmDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OJWgz/dx; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777720835; bh=/P2+h0oopeGcJLkWbR2iUk4xU6TlOScWeXXKUXMCSiQ=;
	h=From:To:Cc:Subject:Date;
	b=OJWgz/dxOfeyt77d99bE1qNa2dc/l/iwMH6HV8d0yp//W5/rdaTYFQ5NH2cjex/H2
	 b4w5MA+vTwoFg7sbCSHZOeBc4FuSwd4LUkwuIGAnmDapFYOQ5ooqD2H6GdtH5QgHim
	 aFxBu9CocLhqnPVu2m35VLcC5qLMMP7IpM2C6pL4=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 4D013C04; Sat, 02 May 2026 19:19:16 +0800
X-QQ-mid: xmsmtpt1777720756thcvqggum
Message-ID: <tencent_B1D6CBBF95486E31D04C2E1B92F5E605A307@qq.com>
X-QQ-XMAILINFO: MLMEjb5zWVcNZZuUZyxHibZ1w+zisKptqYUhi/n6boR51UmP7NHS8C4/S4TwPE
	 sGhHegepQweJhOWf0lnRWad3ibJaI33gTpKd4J2h8wubBIvPvYqgeYEJ1rA6dVNXCVNaY0UEECeZ
	 PIxOLhUlSxTboDw78cjaEmSdfcyf3Meqzkh0gyCB1y5zWNS9fYuG4qGawMYElyJRGuuVqRx8Zf4N
	 QCdXAa6S/8nRI10lTNwpLAoQA0DM9FOy0m4bVyvv3o7zThEk6V0zKMfnDPm/MhJT0LC6h8j7/2Xc
	 ULiJO1ju+7+REB9UH/FhWoYAgD2+4BYQY4nnR3jrMIKV64+I+bjBVwtWpIreuUnNNuQCGkRONe/l
	 HtxGCswDbacj6VJ+K9w33mujR7GZVReAtMqbgdwjfTUqPqtBTgKSTaPmzzkZjaOzjOuXtS1VZLDY
	 0qWZQDd1+KQT153BCfbWRXaJi1uFBddsj/UC70CnMxJCFdOWlCgNHZKxuCvSh1MSvn9i40U0o+8O
	 IJOIG5GdhXoxpv2P8asYMgp/hKKwEFpgurcH8lHeN31PqBgOmMiqJQhaG2paGFdOepXHyUE6Wd6L
	 R95zAvxRCk8nC02tP9N38FaW+KksyO5WFk/8Y2WyWv2RW6a0z2h6Wlc1YaxRCNTTh88XLs5H71qa
	 x3VWqnrgno1zRl/vYAsD+OVyqJjdhZtRQrSisa234FcWBPGivpN6K+yZiGAd1LCH8sQkrqOyKt9q
	 PA83pciw39FMxZzNWNpqmwbXBhVR8lHHbuHwndqk8gNExKhD8nvJzDL//+HSTz8gc+l0V/uuX/IF
	 sVwVU0AKPkFQaqFtO62JdWCxvB/g4wI/f1yaGNhUk+zEdWNyua5riNlkJ3TQ9qGiePSEu5KmM61a
	 1G8HkXwZZPHMOUlmYpEJkjAMBfIvSSW41+t7iqqDHTFr7rGjr32burNA1aRKJad/5Fg7yJ82qd1j
	 ypFYj/bE19aaGqh+D7EsozLIsR2tIh9BhaCj2a9PemF3/CwbkJJ+GBmu8O3+cHzFRAEWMqd3JG2e
	 y8Lk7UDixe7j5mR0mquA+eP3cGKFzG8VJUzs0NBfRdjJnHjCCNswTZhvhTwhw3h3+aKJyjatx0iX
	 9ENtrI+dKX4kUkDnMvAD+jFINbRpP1d9qbZCDp
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Wang Zihan <3772548978@qq.com>
To: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	mchehab@kernel.org,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [PATCH] Documentation: Fix duplicated words
Date: Sat,  2 May 2026 19:19:16 +0800
X-OQ-MSGID: <20260502111916.145238-1-3772548978@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 952ED4B1C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60177-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,nod.at,cambridgegreys.com,sipsolutions.net,vger.kernel.org,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[3772548978@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:email,qq.com:dkim,qq.com:mid]

Remove duplicated words in three documentation files:
- "in in" -> "in" (switchdev.rst)
- "The the" -> "The" (dmx-reqbufs.rst)
- "on on" -> "on" (user_mode_linux_howto_v2.rst)

Signed-off-by: Wang Zihan <3772548978@qq.com>
---
 Documentation/networking/switchdev.rst                | 2 +-
 Documentation/userspace-api/media/dvb/dmx-reqbufs.rst | 2 +-
 Documentation/virt/uml/user_mode_linux_howto_v2.rst   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
index 2966b7122..948bce44c 100644
--- a/Documentation/networking/switchdev.rst
+++ b/Documentation/networking/switchdev.rst
@@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
 monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
 bond will see its upper master change.  If that bond is moved into a bridge,
 the bond's upper master will change.  And so on.  The driver will track such
-movements to know what position a port is in in the overall topology by
+movements to know what position a port is in the overall topology by
 registering for netdevice events and acting on NETDEV_CHANGEUPPER.
 
 L2 Forwarding Offload
diff --git a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
index d2bb1909e..18810f0bb 100644
--- a/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
+++ b/Documentation/userspace-api/media/dvb/dmx-reqbufs.rst
@@ -72,4 +72,4 @@ appropriately. The generic error codes are described at the
 :ref:`Generic Error Codes <gen-errors>` chapter.
 
 EOPNOTSUPP
-    The  the requested I/O method is not supported.
+    The requested I/O method is not supported.
diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index c37e8e594..7b08738c3 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -1092,7 +1092,7 @@ be formatted as plain text.
 
 Developing always goes hand in hand with debugging. First of all,
 you can always run UML under gdb and there will be a whole section
-later on on how to do that. That, however, is not the only way to
+later on how to do that. That, however, is not the only way to
 debug a Linux kernel. Quite often adding tracing statements and/or
 using UML specific approaches such as ptracing the UML kernel process
 are significantly more informative.
-- 
2.54.0


