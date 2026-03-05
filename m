Return-Path: <linux-media+bounces-54612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALIAAnJdqWkL6AAAu9opvQ
	(envelope-from <linux-media+bounces-54612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:39:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B222620FCE6
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5927302A555
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ABC38423F;
	Thu,  5 Mar 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFA7gU0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC523822BC;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707169; cv=none; b=fIHzngiDjhF3B4x89sFTfIewAyTkA9FEtX4z9v2+W0sMAcIjNaZgOiSMO6hrBeStv+ajVq8QyPhJL6uGS/YpPkxqzdroz41kiqx4hNVMtOWs2xDZXN9vbYdL+qJobJt2NNb7umla83LlKp/oQJW1tFfUIxVIHLeSy1rZBdepkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707169; c=relaxed/simple;
	bh=jyTp85a5aEaHbY7OXrD6Xw/iriSe9M7IayD8vzJEaS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdbdAEIZRir8iupqDrBFXitf29e2nbAPTyMiEa8eHCTMmYkR9uzDUjw5BIiIh3SbfQTkpnUmqZu8nZ9fzH+iOP/2Pf07lKcISwqPCp6MLMZWckMBxGuzePztAmaY85LS5WJMVKaZHEjmDOcI2YPHzmN5PCWkqHmZR4Tca3nRnXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFA7gU0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0923AC19423;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707169;
	bh=jyTp85a5aEaHbY7OXrD6Xw/iriSe9M7IayD8vzJEaS4=;
	h=From:To:Cc:Subject:Date:From;
	b=UFA7gU0QY3KJnbf+nfBO6Yw77xdfRovSLIzOq46DumctP3nHj6h37hzKWNTVt2Puk
	 702S4ugcBpQW/U7dyh0rw6I01UPrFQEhnrNVYKGarAxmrKIJqk5Zb+M7mxEQS7kAx8
	 xjtfgah8J+mrwF7mIcwZ4mrsCiTtHLwgkbdgReNdf9OsP6CWFrgEILQZE6/iGrJiZL
	 9+4qP8aPhg+eVLrd80Uss3jvKGW49173+2AeJC5NS4Y9LW9Z6icyxGIwwTtZ71rZvp
	 BJrISJN0LvMyvb+1IsbqgOE1+09Yr7FrUknX8lOAyyfoe/9R4uBbothKGXL86yOUGD
	 nNi95DXgpDUQg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy674-0000000043O-3XeQ;
	Thu, 05 Mar 2026 11:39:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] media: drop redundant device references
Date: Thu,  5 Mar 2026 11:39:15 +0100
Message-ID: <20260305103919.15560-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B222620FCE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54612-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop redundant device references to reduce cargo culting, make it easier
to spot drivers where extra references are needed, and reduce the risk
of memory leaks when drivers fail to release them.

Johan


Johan Hovold (4):
  media: imon: drop redundant device references
  media: mceusb: drop redundant device reference
  media: go7007-loader: drop redundant device reference
  media: usbtv: drop redundant device reference

 drivers/media/rc/imon.c                  | 13 +++----------
 drivers/media/rc/mceusb.c                |  4 +---
 drivers/media/usb/go7007/go7007-loader.c |  6 +-----
 drivers/media/usb/usbtv/usbtv-core.c     |  4 +---
 4 files changed, 6 insertions(+), 21 deletions(-)

-- 
2.52.0


