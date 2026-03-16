Return-Path: <linux-media+bounces-55872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM6gFELLt2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:20:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA4296DBB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E013050A03
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2076A386578;
	Mon, 16 Mar 2026 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VrhP2MHh"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0163385533;
	Mon, 16 Mar 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652641; cv=none; b=I1hzKEO8gmtcL/ylNNkwJ3Dm2TduNjHI5Z0kQjx4WO55fRw85Z9oYEC5aOHTaTsNhupXkrB3byguueAjZBDLhbIZC7+O6QLo74qsHBmKXOZblqI2VgtfCYkIyDZAE8B8qWeAwqHUmDX2t4bgPpVViMDT1bp6duzzB+UZXrqhBO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652641; c=relaxed/simple;
	bh=uQIJ202XBxAxpqXXcXXxc4SixhtNP55oRIo9Y6P51YQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJ6/BNEeX8cH0jYAYVKw3tzxmNI3+8nFf1s5LMCOXl6Y1Dxur/r27Nr2MWiv0HQZAzHUfVeSt80s03wMUakLmed1qLTDAqH53lEEVvd3WcXO6EnWYF+Z5xaRZBZyLcBOfCvCVBIiWoUcORKfTXC2mejYT+IWP7/q8zFdezaPGgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VrhP2MHh; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773652620; bh=bFDujX7oCwd6LKp6l10bJMrUGGSa8PRUtevgg4gPtIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VrhP2MHh7uu6s0wkxZ+K3nmpFFuDSb8hkqkbenXp30M5jMaarr3+TknI/8lLSmGvy
	 XHUJ6JmRB66Nbcv9YMYuV6WKp1B2Bqkx1SFuy6g734/immbeR8IZMEYiMyVZ3EtmD7
	 BtK1We44ZRCATusU0RFBdQT/W6sV5qjGnGeR5N8o=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 432AD2D1; Mon, 16 Mar 2026 17:16:50 +0800
X-QQ-mid: xmsmtpt1773652610tjfnoccyf
Message-ID: <tencent_01D6A0708B1F901A342061C8AD3A71502A08@qq.com>
X-QQ-XMAILINFO: MuMd8wcAiX0qZT2CI5vo+gVcYMYNcUzvahyFNXG4c9o+4Ub5RKU2s2MatcA1pQ
	 5DiSMBOO8s09uCg4im3+MXiRe/41lAAyKWxgpZu9TqjNxLnimz4pD30TPQD7R+QY2kPjCplYjc0M
	 Vz7YHHRkEKgpm5fZ+QgFpUH+6zk1OGQh/yNPtMUmJEBQmWQCko89xbVDgm2EII3h4uvNE/bflOwi
	 4NQORz22P6JSrzq6lwBkiLr8us9qGIOVv4eG3ZJl0klS3H+JJv54ScJwqQ+S8700Gu2LUieznefh
	 m7YQlk7fS+Bv56XYqmiUEsr/UYgeGX8mlrPhgdN34hUWKO2Ux1q/GFUK2d0jtkQrz/sWCl30Crey
	 M+w5DJiLCgCNzc28Yu01eRQyFCY6eQbatnUtltZNZrS8clq2zTIx4vhQGSncVKWiB9vcd4o/T3s/
	 OFPiJXbuM8DULJkJcMQqRO19svW6anAozog7u1FlO2Wy9QCzA3kAW8ga6INIiu/ohgELrOALCO79
	 56B24LIcDQ78gDqYqXj0iNgNywF2JeZpzB306yxOS0JU4hE9TDMVbDRZRZ3WIa0kksGjWanY11zG
	 lyXHxYbuvXUrbAMapVJa5h0QPUP4tQCvS3qydKvDf015AZ6XULYovwNzdBVUfIeRgM5V8UjdtLBU
	 a8Ah59x/qmzx2D5DpyR9JGi9u1lYmoNuKE4O3AOUVXUnE1hrBeNCmTIEnnA6dWdo9L3eaBvRezP1
	 HPg2EXRdc5+xdOIcnQnmzf6PXVDcN+toPyKrnEI1lBmGbw28bwbxP0lofFnr0Mmdwy6rR4TLK3O6
	 +0+dlMCRQMuQjz+GzSj1eNUtdQ3Oh9Gc1QI/a8CHIlUauf3Mzcq250/TxNEfSZFYXPOcBmKrSPug
	 80l3i9lF1eU86qtCjb/8yh5f9yD+42Ul1fG2rYFNJtZNF3m+NcPKOdvORS+VU+fBQaNG0C2dWEbA
	 WM87NrEdRBQbNxMuyWT+70hucjB7E4k/rCyfNiEH4Jo+P2FaFe21AuoiWYlBmKTrqZbZJPn+YiEN
	 wRHNXD6CHzzi4O5a1AVdVAgNJ4k5uKiSiA+3psZ0hb+fkP3md1K5jj5Jon5ovyo074nsuNJXb24h
	 U5Mxot
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH v6 0/1] media: saa7164: add ioremap return checks and cleanups
Date: Mon, 16 Mar 2026 17:16:47 +0800
X-OQ-MSGID: <20260316091649.14827-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55872-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[qq.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDDA4296DBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

This v4 addressed all your comments:
- Added `Cc: stable@vger.kernel.org` to 
ensure the fix reaches stable kernels.
- Refactored the duplicate ioremap error handling into a helper function 
to improve code clarity and reduce duplication.
- Replaced manual mutex lock/unlock with `scoped_guard()` for better 
safety and readability.

After submitting v4 (which became v5 in the patchwork series due to 
a version bump), the Media CI robot detected two issues:
- Build errors caused by incorrect struct member names 
(`immio` → `lmmio`, `pci_dev` → `pci`).
- Two checkpatch `CHECK` warnings about alignment of function call
 arguments (open parenthesis alignment).

This **v6** fixes those issues:
- Corrected the member names to match the actual struct definitions.
- Adjusted the code alignment in the `release_resources()` helper to
 satisfy `checkpatch.pl --strict`.

Regarding the `Fixes` tag: I've added a tag pointing to the 
commit that originally introduced the driver. 
At that time, the file
was located at drivers/media/video/saa7164/saa7164-core.c; the `Fixes` tag
correctly identifies the commit where the issue first appeared, regardless
of the later file move.

The patch adds missing error checks for two ioremap calls in
saa7164_dev_setup(). If either mapping fails, the function now properly
releases previously allocated PCI resources, removes the device from the
global list, and returns -ENODEV. This prevents potential null pointer
dereferences and ensures proper cleanup on failure.

Please review the updated patch. Thanks!

Wang Jun (1):
  media: saa7164: add ioremap return checks and cleanups

 drivers/media/pci/saa7164/saa7164-core.c | 47 ++++++++++++++++++------
 1 file changed, 35 insertions(+), 12 deletions(-)

-- 
2.43.0


