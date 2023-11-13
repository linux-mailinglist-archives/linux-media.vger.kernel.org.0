Return-Path: <linux-media+bounces-174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8F7E957B
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 04:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DA161F21102
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 03:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B9BC8C2;
	Mon, 13 Nov 2023 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTvo8eer"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7C79D8;
	Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3829C433C9;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699845834;
	bh=T9GuBU6fhN6Mk0nmOnKVa20ANcbNsgJfnHQNCOAqe64=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uTvo8eermytZMYIvwjm6dcjtw/9fbTHBezlj/7S+pOV+/heiJmhacHUeLMR+lzTtk
	 6tS4vp+9Ygzrbeqe2hthvlmVD/7Jg9I8qjkl83PStFhGflOnqiz/KmMup/s9oEE23T
	 vXtwuCJMnya+Cv7xIYzgDfedhxpS8ztPW32vpWLSRivRZonvRkwNnHL0E/U3JR3che
	 +gIbCtNaEeaxrh9NW6BgDtypiFT2cjGXAu28HcsBmdVtY13/b2Bbf0p6BEQ09BSujc
	 zFd82wb4/qCtVoC/H6RnI1RGqiXpFbmj4FX0BVganRhD7lJuFw+ugbeWDqQJv74RBD
	 IsqY13Me/7BFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C14DEE21ECD;
	Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/9] media: cros-ec-cec: Add support for multiple ports
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169984583478.27851.15642181644607180001.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:54 +0000
References: <20230825024735.1443836-1-rekanorman@chromium.org>
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
To: Reka Norman <rekanorman@chromium.org>
Cc: hverkuil-cisco@xs4all.nl, dnojiri@chromium.org, narmstrong@baylibre.com,
 sadolfsson@google.com, bleung@chromium.org, groeck@chromium.org,
 mchehab@kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Hans Verkuil <hverkuil-cisco@xs4all.nl>:

On Fri, 25 Aug 2023 12:43:53 +1000 you wrote:
> The Google Dibbi chromebox will have two HDMI ports with CEC enabled via
> its EC. Currently, the cros-ec-cec driver and the host command interface
> to the EC assume there is only one port. E.g. the commands have no
> parameter to indicated which port to operate on.
> 
> This series adds support for multiple ports. The driver is modified to
> manage an array of ports, each with their own CEC adapter and notifier.
> The host command interface is modified to support multiple ports. All
> changes to interface are backwards compatible.
> 
> [...]

Here is the summary with links:
  - [v2,1/9] media: cros-ec-cec: Use cros_ec_cmd to send host commands
    https://git.kernel.org/chrome-platform/c/afca12e35e71
  - [v2,2/9] media: cros-ec-cec: Manage an array of ports
    https://git.kernel.org/chrome-platform/c/4d0e179a4287
  - [v2,3/9] media: cros-ec-cec: Support multiple ports in set/get host commands
    https://git.kernel.org/chrome-platform/c/e90bd1fe7cda
  - [v2,4/9] media: cros-ec-cec: Support multiple ports in write command
    https://git.kernel.org/chrome-platform/c/adbfc747ddfb
  - [v2,5/9] media: cros-ec-cec: Support multiple ports in MKBP cec_events
    https://git.kernel.org/chrome-platform/c/1cabf52639d1
  - [v2,6/9] media: cros-ec-cec: Support receiving messages from multiple ports
    https://git.kernel.org/chrome-platform/c/425d20518c54
  - [v2,7/9] media: cros-ec-cec: Allow specifying multiple HDMI connectors
    https://git.kernel.org/chrome-platform/c/e7885b9c6564
  - [v2,8/9] media: cros-ec-cec: Get number of CEC ports from EC
    https://git.kernel.org/chrome-platform/c/5d227f02ceb9
  - [v2,9/9] media: cros-ec-cec: Add Dibbi to the match table
    https://git.kernel.org/chrome-platform/c/8d3e6030e30f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



