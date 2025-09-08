Return-Path: <linux-media+bounces-41955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F919B484A5
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 09:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8313E174B59
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 07:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982AF2E5427;
	Mon,  8 Sep 2025 07:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4EkJjut"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3678F54
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314864; cv=none; b=Lkb2m2mvOxwSXaN8rWW5BxeZ4Vggw5r77V+Ck1PthO2a6IPNiFIoBlL//XXye8vW5vmsPgP3r1iUb2Uk8oTmCg8r+RlaNk0FXfYZEp/K0imurfsQ9RQFEzEUe4ufGLY7hCjfSkb1r2+TX8O0Td0noyvXWqWoq9HpS+TuUsPKl50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314864; c=relaxed/simple;
	bh=fWSF1pjUgyOzH5rR3Skh8RA4q6vVoh2FG2OTGDtKDrI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=t4R0RC6Frep2phv07VgX2iNxywXnJ01NpSQUIstAtkMEyvHPEvBjhT67f0fN9TB6KpBpryb7rOZ8aupXdO34L4aFaowtgmRYG/3GJksuIHClWT3C0MhT8+hH3QGDUI8SwRN9coufpvhff36HZXgSE6C1Q2rQ77EDlWDQuRh/Z6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4EkJjut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A766C4CEF5;
	Mon,  8 Sep 2025 07:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757314863;
	bh=fWSF1pjUgyOzH5rR3Skh8RA4q6vVoh2FG2OTGDtKDrI=;
	h=Date:From:Subject:To:Cc:From;
	b=D4EkJjutLlclh6Hw06jx4dbg1lV2Qhveod9fKnzZqhXX4/pjM77e1kDZVOm+WbcDe
	 iATCAbcDs7bN544zRyfOha+GGLB6i0BkwV4QH0sFlIuWUdMO8vEF0FXt9lQQ4ZQWjn
	 kXH/w1EE3CC9PxXpfYhpDNmQTCMabVlVLK6znBs+HHEEWYG4b3uGj3fM4CmTEmHadZ
	 lzBZprdSiMgyOWAjjbBkVlqXoGm+WIfzEpUH3ggLV807l0GtG5DK0zO3QYTaRcKcve
	 5uFapFbfzDRr97bZELJ8MisChUOhG3rx90qQIOyy+ga0dcYxczjVo3W4j9cHU0W4bD
	 xOwlmOdll9lCg==
Message-ID: <945ec0fc-c884-4de4-b690-8316435b7e7e@kernel.org>
Date: Mon, 8 Sep 2025 09:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [GIT PULL FOR v6.18] vivid: fix disappearing <Vendor Command With ID>
 messages
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This fixes a small but annoying regression bug in the CEC implementation of vivid.

Because of this change, the cec-compliance utility also needs to be changed.

The patch for that is here:

https://patchwork.linuxtv.org/project/linux-media/patch/25d4b492-7ea1-4a92-887c-ddd7c64dc0c3@kernel.org/

So once this vivid patch is merged, I will push that patch for v4l-utils, otherwise
the virtme tests will fail in CI.

The CI pipeline for this vivid patch is here:

https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1505397

It was run using the fixed cec-compliance which is found in this v4l-utils branch:

https://git.linuxtv.org/hverkuil/v4l-utils.git/log/?h=cec-fix

Just to show that it passes.

Regards,

	Hans

The following changes since commit 34837c444cd42236b2b43ce871f30d83776a3431:

media: uapi: v4l2-controls: Cleanup codec definitions (2025-09-04 10:37:05 +0200)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-vivid-cec-fix

for you to fetch changes up to fb72ad5b4793cae4ad0078017221cc44c9b4f2f9:

media: vivid: fix disappearing <Vendor Command With ID> messages (2025-09-08 08:47:02 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
media: vivid: fix disappearing <Vendor Command With ID> messages

drivers/media/test-drivers/vivid/vivid-cec.c | 12 +++++-------
1 file changed, 5 insertions(+), 7 deletions(-)

