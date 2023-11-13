Return-Path: <linux-media+bounces-176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA647E957F
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 04:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7207D1F21196
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 03:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7168C0A;
	Mon, 13 Nov 2023 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFUY/bO5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B548F8C11;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CBB7C43391;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845835;
	bh=ZRhc4pGsIcVlF0RZvM6/zP+FLARr6revVhQosQsdLmk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KFUY/bO53MzQZmEzikh74JD508bZ+G7v7sdOmPHPXjJ91wjb82U+oOI7mH5NThw6a
	 5ESZP9jkBwFPsPzaxh2L5TZAkfIb2FsuW4ivW+vYLIMtBs7f6P1bMMM3NAjE0uz0Bk
	 YtGKozilBwRGXyP+C24RRJYqjozWsL6Tf+4OBvb0D4dNoX4IN9U5FV1DS7aU5p8NbQ
	 3fPkpOE7ia7d6SqWwfaG0ftGMc/GSoJyHsnLazs7lU+uUHdmd6pIfLqqXcm6n9qHqL
	 yLzGiJ6K6lHbOqTyDQK9LsmUPsvNhoB9WeH6lUU/NUI/zRaZnjjXufjpcw4ZM9LPge
	 8xUmVNLrzZagQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16D07E21ECC;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] media: cros-ec-cec: Add Constitution to the match table
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583508.27851.9553509450262125302.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:55 +0000
References: <20230911081921.3515928-1-sadolfsson@google.com>
In-Reply-To: <20230911081921.3515928-1-sadolfsson@google.com>
To: Stefan Adolfsson <sadolfsson@chromium.org>
Cc: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, bleung@chromium.org,
 groeck@chromium.org, rekanorman@chromium.org, linux-media@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Hans Verkuil <hverkuil-cisco@xs4all.nl>:

On Mon, 11 Sep 2023 10:19:21 +0200 you wrote:
> From: Stefan Adolfsson <sadolfsson@chromium.org>
> 
> Constitution has two HDMI ports which support CEC:
>     Port B is EC port 0
>     Port A is EC port 1
> 
> This patch depends on "media: cros-ec-cec: Add Dibbi to the match
> table".
> 
> [...]

Here is the summary with links:
  - [v2] media: cros-ec-cec: Add Constitution to the match table
    https://git.kernel.org/chrome-platform/c/5bc2de5f517d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



