Return-Path: <linux-media+bounces-61905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LMRKQrECmoI7gQAu9opvQ
	(envelope-from <linux-media+bounces-61905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:47:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301B568101
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52502301D686
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8845381C4;
	Mon, 18 May 2026 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1TfjL0f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5A3AF666;
	Mon, 18 May 2026 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090117; cv=none; b=b+eTNz3P3cCG5h9COamGWtrho5R/bLG87hOZ6xBAI/Xear0wlsIMszkmIkpLq9EhVqYQ9A121XFIq5MTnqTCv76vfclJ04041ScpX+cC2YAcYgjFbS5FGsurSVZubYkUeZukzoGmIfaYL/wCZ/vGBA0y4VRYx8CdN2HS1cybIHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090117; c=relaxed/simple;
	bh=l/pqn4ukFk3B90+Wr3gJ/nyIiHYr6rvxJMOzFdEuJTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GxfUniF/p9HW439XWC7fQrxcdqo04nfLmw7wzFkDk9byt1UfCGCH3+Hh1fpcH1/PiED/qONZRRz9W9BTWSw1cibfUIhfkOd9DaCpyW9kOU1qveazL3M1xweywlpO/aLoa8E3pF1Pp14PrTT6/LwNLczxWJaffmdEidMWG5ZzveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1TfjL0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E3FC2BCC6;
	Mon, 18 May 2026 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779090116;
	bh=l/pqn4ukFk3B90+Wr3gJ/nyIiHYr6rvxJMOzFdEuJTk=;
	h=Date:From:To:Cc:Subject:From;
	b=I1TfjL0fIZ5LuZuycK1K+WimTwL3aLpQP5A5ftlKen3KAUIoS+doa/K5ogSVeTDSo
	 rCbhXCHeUXfNo1HbFn0xb1QJj71OhKTa8lXH8j4xIHWJadIKwkbwvQFozpN57Rilnq
	 oa61nZzrGahwibTcq7SawfojvGmWsJ7+gWYzMd/zi1McrKLmLv9qsu0F6TFTMZN1Ee
	 kALbSZSLYn1Eoamo6oHK26ybaFo7/Tk/3QY24lQyqiAONOywH3aHiWV+NmAEod9wBV
	 nKQhrrJFiQ3n8nJcOwEZYpKgj4UjgVdpbO+UcuwCXjyTV3mSZCGVpYz0lr33GaXQDg
	 cqH4WV8yHxF5Q==
Date: Mon, 18 May 2026 09:41:52 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Jan Kiszka <jan.kiszka@web.de>
Subject: [GIT PULL for v7.1-rc5] media fixes
Message-ID: <20260518094152.581e5e41@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1301B568101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61905-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux-foundation.org,vger.kernel.org,web.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Action: no action

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-3

For:

ttusbir: fix inverted error logic (2026-05-04 08:33:39 +0200)

Regards,
Mauro

---

The following changes since commit 23c39cb598977f10909a2387c5e5f34afc1d6933:

  media: qcom: camss: avoid format string warning (2026-04-27 08:41:22 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.1-3

for you to fetch changes up to 646ebdd3105809d84ed04aa9e92e47e89cc44502:

  media: rc: ttusbir: fix inverted error logic (2026-05-04 08:33:39 +0200)

----------------------------------------------------------------
[GIT PULL for v7.1-rc5] media fixes

----------------------------------------------------------------
Oliver Neukum (1):
      media: rc: ttusbir: fix inverted error logic

 drivers/media/rc/ttusbir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

