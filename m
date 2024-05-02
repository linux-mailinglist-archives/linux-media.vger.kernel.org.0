Return-Path: <linux-media+bounces-10606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F548B9A26
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF55B2849C5
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1867A64CEC;
	Thu,  2 May 2024 11:40:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FE442044
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650006; cv=none; b=Wy1Tdp4zoZ7Uq/YWKJWPS/ENfhMRW5Jf+QQRtjp9eUKt5xWo7ywfQuWmmpjebI1Id4YwSD7EOXFADf4SMwbTIr2Lsh2/HuTKQEyqu0VsGw5rE8xWis6ovaOaOQEJPMRMqjrI9ZKzjfwHhTrHb5J4h1HCgubGwr2HH/J+MMUT2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650006; c=relaxed/simple;
	bh=iYCeeKLYCKGh/77HiqdOjMFIqxLocw6S1IqnlLsB2Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4rK5OTcaNmr0hvvb7SUPVlp4OmEntGLbYjtYbJIjIeitCVd2OySRI4X2I5O/f+LbTjW2RMSiKI60z/Ze67yyB3U5y1T24O6g9VcrJHqO0rJYxXmIxltjvPt5bIONaPUz+LVR0fthVQu9frn7xrBBTL+o7vf6+dVUoion+mwpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E98DC113CC;
	Thu,  2 May 2024 11:40:05 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Yang@web.codeaurora.org, Chenyuan <cy54@illinois.edu>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH for v6.10 0/4] media: cec: syzkaller fixes
Date: Thu,  2 May 2024 13:38:40 +0200
Message-ID: <cover.1714649924.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chenyuan Yang found a bunch of syzkall issues:

https://lore.kernel.org/linux-media/PH7PR11MB57688E64ADE4FE82E658D86DA09EA@PH7PR11MB5768.namprd11.prod.outlook.com/

The patches in this series fix the various issues, and with these
in place, it passed the syzkaller tests.

Many thanks to Chenyuan for reporting this and doing all the testing,
since I had a hard timing reproducing them. It took a few months to
track it all down because of that.

Regards,

        Hans

Hans Verkuil (4):
  media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
  media: cec: cec-api: add locking in cec_release()
  media: cec: core: avoid recursive cec_claim_log_addrs
  media: cec: core: avoid confusing "transmit timed out" message

 drivers/media/cec/core/cec-adap.c | 24 ++++++++++++++++++++----
 drivers/media/cec/core/cec-api.c  |  5 ++++-
 include/media/cec.h               |  1 +
 3 files changed, 25 insertions(+), 5 deletions(-)

-- 
2.43.0


