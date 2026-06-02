Return-Path: <linux-media+bounces-63452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id knWpEZNkH2pMlgAAu9opvQ
	(envelope-from <linux-media+bounces-63452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:17:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA11632D84
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:17:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aHIbnYWP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63452-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63452-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDC04304F999
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780CD3D0BE5;
	Tue,  2 Jun 2026 23:15:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2893B894B;
	Tue,  2 Jun 2026 23:15:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442146; cv=none; b=Ik0nzeNdw7u+5kFn41dHRwTvqYFbLynfwR+uvScW6e2YyUd/BdqculgSLM4p25AruLjDrLm0BOx6BqecdwtMTzre4trzpFjRRcdDFyls4n4FUOKqqmLVpYbkMeUNHVIW1AZIREzalWZ02tN5M91fpbxTB8y9H8DvFuxgL97qQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442146; c=relaxed/simple;
	bh=vJJFDTiSHAv708yD6EgV0weWA4E9RtiJRvnFwQ19enM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=EltgT5guT8AQtY04H4qR9C0BJCN5FW9V4O/Xng6fyKAdE9Srep+941RauEq3cTgNjTZZ7W0PvRc7MKqXAKb7zZTSQmjBBnok+CpCzTku36Z2kJafGejwa7UINu7iTy8vM6H80JSxJcR0w5kJYnpithJM/N/tAW2OPNwuLAoQkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHIbnYWP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C581F00893;
	Tue,  2 Jun 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780442144;
	bh=W5eeAqo+ncoCUltUWNoFkR7to+u2jZlimchJREQGm9o=;
	h=From:Subject:Date:To;
	b=aHIbnYWPgoftcWvcuRF2kl+qUXHW565jQ+Isej73Doj1E0oWAR1AyFBhy3Fjcr5My
	 1SNBlR6mjTU9NHUbNUveEzPJ7+B+4E9jSgAzB6y9Z7ADRC98DMUuMPqUYHT+B8PN5u
	 iywbqDqrCmWsUSOzhMJM/sHJing25TGYfpKvAfAQaYubY4egUKhsYlUJhFQmJbcsp0
	 1irJBiWGbLsjCofALbmur0JTGRCRnXsAeqCzUCJhgIbCEIgiXbwt+yQWc9WwEJpXkE
	 Z6ZoyKOnDPnwKYKfX9SnEwzo1Zavo2eYOEGeSUCzYP+qMcPyqnAn8iU86tCiKuTw91
	 qDVvnKVHHYCxA==
From: Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH 0/2] Add myself to two additional linux-media drivers as
 reviewer
Date: Wed, 03 Jun 2026 00:15:39 +0100
Message-Id: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQqDMBAFf0X27EK0qNBfKR6iealbaBqyKhbx3
 43tcWBmdlIkgdK92ClhFZVPyFCVBY2TDU+wuMxUm7o1rbmxi9OXo032rYxtRrgKrjoP3/guS45
 yGxO8bL/vo/+zLsML43zN6DhOxKNFP3kAAAA=
X-Change-ID: 20260603-dphy-params-extension-17fef5f7260d
To: linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
 hverkuil+cisco@kernel.org, Frank.Li@nxp.com, michael.riesch@collabora.com, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=bod@kernel.org;
 h=from:subject:message-id; bh=vJJFDTiSHAv708yD6EgV0weWA4E9RtiJRvnFwQ19enM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqH2Qd77XDUl+a92LsjncoKdOBuUiFzTgG/SFPg
 3aPJjlegEyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCah9kHQAKCRAicTuzoY3I
 Oqa0EACqrbHYvfWF5wh7IlZ+CYGimY+IBaCBZ4uzVzh0iQOvW3CO6+4N9usG2LNAu3bfgf1HW+U
 7N1R5GkLgez5dOWociJ6KnKR9Q20npSFicHj7NJtOyS84VfxKbKd3iAmzmlUQay73u/aO3Lx6RU
 uHR6pnQRc0AstxQgb01jQfapb01XJqjkuARtWGcbc8yQroMgOjjLgYGakYB1e11SDX/ey1ybdXW
 jZqHOcEnn3xAtIBg/PpCM26KcMrplpNppZ8fmKzHtmPe12aNIKWUq9I1c8NlQ2i0YEHSgVLr7sR
 iVBTo3Ax7tgggQ7TD9NGg4dqyq2UFps3uNr+lhypqkVHQqs/1b1P1WdzbDNOWtLVFewqujnpM6G
 pC/wnNfuQ71ofU5s9nm704H94hA1bL1vG5E30Y7Q1Mjac5QmYLyJOrflx0NxFVy8I4bF6Kt4oWw
 u/RJ+6nO7cJRB+mf2YsCQcU8pNEe2UlpWrKQFBYcAY0CZopQasGozxXGiLVWvdlq7VKSWzUA6VI
 1vbERD8IfsfDmedNxA5HuChzOcKtWuSb76aD5SiXLbPZO50uSH4bNIrRAFWVLnTRv1yG5fetUx+
 h7T/Ve85vcYddcAaUKFGDwggz3EDiQPZmYerZLcgdBVNqD4fGPSHAlXW6ykWv8Gi66lUy12dz2q
 XaZpUQ94vYdg0jw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63452-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAA11632D84

We discussed in Nice adding reviewers to help get other's code reviewed and
to help the reviewers get more relevant knowledge by formally inspecting
the work of their peers. NXP and Qcom were mentioned.

Laurent suggested I can help out with these two drivers and so, I'm happy
to do so.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (2):
      media: imx: imx8mq-mipi-csi2: Add myself as reviewer to imx8mq-mipi-csi2
      media: rockchip: dw-mipi-csi2rx: Add myself to the reviewers list

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 65c06d2edded3b1e1633bf75f0f7a26b609ed5ac
change-id: 20260603-dphy-params-extension-17fef5f7260d

Best regards,
--  
Bryan O'Donoghue <bod@kernel.org>


