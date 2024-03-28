Return-Path: <linux-media+bounces-8044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5A88F512
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 03:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234591C29E08
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 02:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8FD25776;
	Thu, 28 Mar 2024 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="g/sALXx5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFD52374E
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591574; cv=none; b=fXx3Yahdczcm2CyhkbVC+TQkDusGTbPPzbyNyWIFm9kwr+NxtL1v2QJrOsLgcGnVzSb1Wmiqv+40GnXFacYSdLOco6qNMIDIs/fqMt4LOUsMyzY5cEJzQPzYR+H0CJIpnT2w3AMzLk/tv8nBCZkxeyU5uvdCSev1BxOq1q/JkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591574; c=relaxed/simple;
	bh=I+rKYl2Bq9fn8ehsNHWpCpyvCqY7vKwIMBaX20RwTMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b4xfyZ7vTiPvJH/OfJHXq/+BjVfJWU4nxtUtHJeUiO64t6iSs5odzTsoWyABE19v3S655WnVqJjUWe3KIV1ws1D7fHJrI5eNMjvOSlaw54nujq30V3uyCGh7duH5ZCbljdLtUmndQM2M+p3MfFsRX5ecKq2lWIZtj8t64pYs240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=g/sALXx5; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1711591566; x=1712196366; i=herdler@nurfuerspam.de;
	bh=VVUB82WiwsXX8uzcbiIR+VtkCioRyo0Gyua+h54qwFM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=g/sALXx5ElHi285sXjW4vWBKOEQPQ5F5G1WgbryaSlaRigewQ1Lzzp9czudS1A0h
	 YGaKWfm7xCYYTsfunmXSjO2o+Jv68enz3i0ElSJwtpfJxAsVwZNFTRzYmBeDLBCjP
	 kIEj83atVmr20adEwrHd1RFh6osQWyXF5yKRB23FnULmPsj+BE/3yaBSdt1+8om9X
	 CS92Dyg/JhoE9VNWT70EQsckImiuAomk21k2KniOMLzNUyFXUEC5NZgKUCDN4QaP/
	 wnPguugzJSWW6fJ9vYBKmuBurZVeLr9b8Z05ycNyeq5J6azliUY3tfLph4EfylqbN
	 kOOvJx3fZEyTq5P+kQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.190.197]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1shuxk2h4w-00uoNQ; Thu, 28
 Mar 2024 03:06:06 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH 00/11] media: ttpci: make checkpatch happy
Date: Thu, 28 Mar 2024 03:05:11 +0100
Message-Id: <20240328020522.50995-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OtOibX63tdK3FFAXVlxUZhRYENA0yPSQoLeRsELYcjAQL83Cj12
 SEYZHksr1fqqjegwVeKFd7qHTKNb1eLYeB7DAGx4d+tQqONxEwtT2k3w135knguck+/heyB
 hIeIkGJW6B+hQLgqW1w0ISNkwlXTPOg9e8o+RPwH6u8Pn1ANEOx5GVDYgaiYl6vXNVVaf/g
 2L20GOhK2oPdf12wZnl8g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hBK0X9DXBqE=;J50tinedbYrFVrhWNkBXaaezpCb
 kyV5CQKtqhOTV0w/YEOjaZ/AmjZoyAvPE8RjIrU7bSNTl0LZELPLyAlYgGLI+1u05gR2Xzhvb
 Rv2uB3snp/fQObGiMr2pP4Ffb6nravGusQ6Xfyx8cne+M9Yz3Eo0TIxNREKmXvtaPOEsElzBb
 gag3+5BbG7uXsMgpoNL95Xlss+1A9WFg5rhZBUPV/aCrqhbjm3rue52DHZuVSHGaR56+CqvYK
 nY9IJmxH0mI6qR4S4twyYil1hzfPBsk/xPrau7HvqRQeAiHh/WbUn5iB8MvLB33oJ99NmZRbP
 3b2tcfvCIhuB1fnh6f2flDf9+xkrq0YWtQRcVEHtpBxd1Cdk72EPE5EasLzHF3itXkyImrE+q
 bzh+q3AUrjOdV5XxHYdMqul2d35fiChMmCO+yankTQPgIGUMuHcYsmVkBWsaM5rLjEL991W4X
 j16EEI/VE4M4ttViiPbrCCHFiUuztO2mTDqszZbwpU4UYX9I9qlD1qKtSOAAZEh2JqV88RxXU
 jSsRl9lJjdg4FuM9DwM6dhBrlAyGF1ucvlqAFIDYHkU1CYbv0ab2D+hFl9R1qJfKAYIK6m8zM
 eIHwh4o9IHsrgEvcLpLIWirzDhE72HgpJRB9jPCETikblHvBXj6iHmqk94XkB68NoCzn6Htis
 beo7dtaurFCjfn3/5yzTaX2HgZODjSM3Ndhxg4xpQq7i9EeqG6iKTafFVVQIiSTg/po5RBoWA
 nUQjrcERvMVlqkKprIReuLG88OOhIDopohnfZw3ZowcgPRneMqHH6BM43i7vI/d/2mii50MbQ
 33HAigjZtULzGZyk3mF1wNTpO4Hr2HJ16yvlHNYzN3feA=

Hi Hans,

last year I promised to take a look at the chackpatch warnings.
Well, it took a little longer then expected but here is the first result.

This patchset should remove all chackpatch warnings and errors in the
ttpci budget driver(s) if applied completely.

This is the first in a series of similar fixes for the SAA7146 related
drivers (at least that is my plan).
This first patchset is also a test for my whole tool chain. Please give
me some feedback if there is something, that could be improved next time.

Initially I had planned to start with the AV7110 driver, but then decided
to start with this one, because it was the easiest one to fix. It didn't
had any complicated issues and the list of warnings was one of the
shortest among the SAA7146 drivers.

Regards
Stefan


Stefan Herdler (11):
  media: ttpci: checkpatch fixes: whitespace and newlines
  media: ttpci: checkpatch fixes: whitespace
  media: ttpci: checkpatch fixes: comments
  media: ttpci: checkpatch fixes: braces
  media: ttpci: checkpatch fixes: export_symbol
  media: ttpci: checkpatch fixes: assign_in_if
  media: ttpci: checkpatch fixes: trailing_statements
  media: ttpci: checkpatch fixes: constant_comparsation
  media: ttpci: checkpatch fixes: miscellaneous
  media: ttpci: checkpatch fixes: logging
  media: ttpci: checkpatch fixes: msleep

 drivers/media/pci/ttpci/budget-av.c   | 574 +++++++++++++-------------
 drivers/media/pci/ttpci/budget-ci.c   | 501 +++++++++++-----------
 drivers/media/pci/ttpci/budget-core.c |  38 +-
 drivers/media/pci/ttpci/budget.c      | 170 ++++----
 drivers/media/pci/ttpci/budget.h      |  19 +-
 5 files changed, 658 insertions(+), 644 deletions(-)

=2D-
2.34.0


