Return-Path: <linux-media+bounces-262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C847E9FCE
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF3D1F21866
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBEC21379;
	Mon, 13 Nov 2023 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8E21355
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA888C433C7
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:21:54 +0000 (UTC)
Message-ID: <e2ee2108-148d-4541-bd8b-e28a4a3c6e60@xs4all.nl>
Date: Mon, 13 Nov 2023 16:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] cec: count low-drive, error and arb-lost
 conditions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

One small CEC patch, improving logging and debugging.

Regards,

	Hans

The following changes since commit 3e238417254bfdcc23fe207780b59cbb08656762:

  media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM (2023-10-27 11:44:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8a

for you to fetch changes up to 9ae1414961147c659335d392f6af7c97271fcbf6:

  media: cec: core: count low-drive, error and arb-lost conditions (2023-11-06 13:03:23 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: cec: core: count low-drive, error and arb-lost conditions

 drivers/media/cec/core/cec-adap.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++-----
 include/media/cec.h               | 22 ++++++++++++++++++++--
 2 files changed, 69 insertions(+), 7 deletions(-)

