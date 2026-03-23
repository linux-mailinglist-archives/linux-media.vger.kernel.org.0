Return-Path: <linux-media+bounces-56688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BRAMAMUwWnkQQQAu9opvQ
	(envelope-from <linux-media+bounces-56688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:20:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F92EFE77
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 11:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA9DA3036ED5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A21E386C31;
	Mon, 23 Mar 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvtkTBV8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4C38A707;
	Mon, 23 Mar 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260665; cv=none; b=iuvT6dhPyAF+cxJHC/NsoFxp7KYUOVtL8n571Ox+ldn2MtcMUAyka0c4zt2gRC77DWGJ/sz1zOccDJpKfiSou6tWvpvTmRBbTVdEiEmKM8kgU+jt4i45QfpWWXjVM2L08U+BQoASzU1dHL5i5KupryQUKRkQagi8yl5iV4ARNCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260665; c=relaxed/simple;
	bh=coo3RN686+Cx+cmWDSQnvA02XWcEQdAcxO6zjLoOfdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hDFiB/hAt6dl0ScaYv4Wtei0GLhXsH9AgPv+tzIjLczFqmY7Eh9YarHTJhtGi/sn6amUL7DpeYnRKQ4lhBqDVLzk/28VSEXYXN0kudL5eA+JSNq1Yp2nqTCrLvKoJU7IBuZySukPNDmGgBW5yseuoEdTNwM8LjodsK6bd3KwIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvtkTBV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6E3C4CEF7;
	Mon, 23 Mar 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774260665;
	bh=coo3RN686+Cx+cmWDSQnvA02XWcEQdAcxO6zjLoOfdg=;
	h=Date:From:To:Cc:Subject:From;
	b=mvtkTBV8QpEy/gKgNyLEenhC5KudAtxGw5Ap6o9OBzXhfOjtJRt8JaTJeuL0jv4Ym
	 6guq4T2kPj6cROBuyMjB0qVtWfgj1f6z2l3r++Qr7bGxLDh06Rnl3eCKgZbDZxsM/A
	 lIuAzXTkEwU5/Af9KYUXQzQcWqYqtko9BCCELKsaBgqGAI9dyHv8RWFRG371VGbD3L
	 jfBkiip1v4w3rROJ0Izd6WpuH2wjRbC1LB+7ARSlE+N4niWLd9O10Vkautw57pKdAy
	 Ho7Edc7gjAMq3qzJvyt+b7VrcdS75oc1VGPCwFE6M5nbks6VIiHVin3mc55YWPP3Ly
	 pxlJe9aKvDvJw==
Date: Mon, 23 Mar 2026 11:11:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.0-rc6] media fixes
Message-ID: <20260323111101.098ba268@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56688-lists,linux-media=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foz.lan:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 254F92EFE77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-5

For:

- rkvdec: fix stack usage with clang and improve handling missing
          short/long term RPS;
- synopsys: fix a Kconfig issue and an out-of-bounds check;
- verisilicon: Fix kernel panic due to __initconst misuse;
- media core: serialize REINIT and REQBUFS with req_queue_mutex.

Regards,
Mauro

---

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.0-5

for you to fetch changes up to e8d97c270cb46a2a88739019d0f8547adc7d97da:

  media: verisilicon: Fix kernel panic due to __initconst misuse (2026-03-18 13:17:25 +0100)

----------------------------------------------------------------
[GIT PULL for v7.0-rc6] media fixes

----------------------------------------------------------------
Arnd Bergmann (2):
      media: rkvdec: reduce excessive stack usage in assemble_hw_pps()
      media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()

Detlev Casanova (1):
      media: rkvdec: Improve handling missing short/long term RPS

Michael Riesch (2):
      media: synopsys: csi2rx: fix out-of-bounds check for formats array
      media: synopsys: csi2rx: add missing kconfig dependency

Ming Qian (1):
      media: verisilicon: Fix kernel panic due to __initconst misuse

Yuchan Nam (1):
      media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex

 drivers/media/mc/mc-request.c                      |  5 +++
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  4 ++
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 50 ++++++++++++----------
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  3 +-
 drivers/media/platform/synopsys/Kconfig            |  1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |  2 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  5 ++-
 8 files changed, 44 insertions(+), 28 deletions(-)

